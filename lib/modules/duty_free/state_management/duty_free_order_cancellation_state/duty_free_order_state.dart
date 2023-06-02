/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/earning.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/potential_earning_response_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/cancellation/duty_free_order_cancellation_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/reschedule_order_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/duty_free_cancel_order/duty_free_cancel_order_sku_details.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/duty_free_important_policies_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/order_cancellation/duty_free_order_cancellation_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/reschedule/reschedule_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/repository/duty_free_order_repository.dart';
import 'package:adani_airport_mobile/modules/duty_free/repository/duty_free_repository.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_event_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/flight_list_isolate_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/repositories/flight_booking_repository.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/flight_status_model.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_alerts.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class DutyFreeOrderState extends BaseViewModel {
  String? transactionId;
  DutyFreeEventState dutyFreeEventState = DutyFreeEventState();

  DutyFreeOrderState() {
    dutyFreeEventState.dutyFreeOrderState = this;
  }

  ///
  // DutyFreeCancelOrderDetailsResponse? dutyFreeCancelOrderDetailsResponseModel;
  CommonOrderDetailBaseResponse? dutyFreeCancelOrderDetailsResponseModel;
  List<DutyFreeCancelOrderSKUDetails> dutyFreeCancelOrderSKUDetails = [];
  bool isEarnPointsLoading = false;
  final FlightBookingRepository _flightBookingRepository =
      FlightBookingRepository();
  String bookingID = '';
  ADResponseState cancelOrderDetailsState = ADResponseState.loading();
  final ScrollController scrollController = ScrollController()
    ..addListener(() {
      adLog('');
    });

  ///
  final DutyFreeOrderRepository _repository = DutyFreeOrderRepository();

  Status orderCancellationState = Status.complete;
  Status importantInformationStatus = Status.loading;
  final List<DutyFreeImportantPoliciesResponse> cancellationPolicyList =
      List.empty(growable: true);
  final List<DutyFreeImportantPoliciesResponse> importantInformationPolicyList =
      List.empty(growable: true);
  DutyFreeOrderCancellationResponse? dutyFreeOrderCancellationResponse;

  DutyFreeOrderCancellationRequest dutyFreeCancellationRequest =
      const DutyFreeOrderCancellationRequest();
  final ValueNotifier<bool> isContinueCancelOrderlButtonActive =
      ValueNotifier(false);

  DateTime? pickUpDate;

  FlightStatusSegment? flightStatusSegment;

  RescheduleResponse? rescheduleResponse;

  bool orderCancelled = false;
  bool orderRescheduled = false;
  bool orderFailed = false;

  String? paymentMode;

  void orderCancellation(
    DutyFreeOrderCancellationRequest request,
    BuildContext context,
    BuildContext dialogContext,
  ) {
    updateStatus(Status.loading);
    notifyListeners();
    _repository
        .orderCancellationApiCall(
      request: request,
    )
        .then(
      (value) async {
        getDutyCancelOrderDetailsData(
          request.orderReferenceId.validateWithDefaultValue(),
          context.read<SiteCoreStateManagement>(),
        );
        if (value.data != null) {
          dutyFreeOrderCancellationResponse =
              DutyFreeOrderCancellationResponse.fromJson(value.data);

          context
              .read<DutyFreeOrderState>()
              .dutyFreeEventState
              .cancellationSuccessEvent();
          try {
            if (ProfileSingleton.profileSingleton.secureToken.isNotEmpty) {
              context.read<AppSessionState>().getUpcomingBookings();
              context
                  .read<AppSessionState>()
                  .updateValueOfBooking(updateValue: true);
              navigatorPopScreen(context);
              navigatorPopScreen(dialogContext);
              updateStatus(Status.complete);
              // await context
              //     .read<AppSessionState>()
              //     .getBookings(
              //       bookType:
              //           BookingHistory().bookingType(BookingTabType.shopping),
              //     )
              //     .then(
              //   (value) {
              //     updateStatus(Status.complete);
              //     navigatorPopScreen(context);
              //     navigatorPopScreen(dialogContext);
              //   },
              // );
            }
          } catch (e) {
            adLog(e.toString());
          }
        } else {
          navigatorPopScreen(dialogContext);
          getView(
            context: context,
            dialogEnm: DialogTypeEnm.toast,
            message: dutyFreeOrderCancellationResponse?.message ??
                'Something went wrong please try after some time',
            backgroundColor: context.adColors.blackTextColor,
          );
        }
        updateStatus(Status.complete);

        ///  navigatorPopScreen(context);
        // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        //   if (scrollController.hasClients)
        //     scrollController.animateTo(
        //       0,
        //       duration: const Duration(seconds: 1),
        //       curve: Curves.linear,
        //     );
        // });
        notifyListeners();
      },
    );
  }

  void updateStatus(Status status) {
    orderCancellationState = status;
    notifyListeners();
  }

  String pickupDate = '';
  String pickupTime = '';
  String pickupTimeSlot = '';
  String flightNumber = '';
  ADResponseState rescheduleStatus = ADResponseState.init();

  void rescheduleOrder(
    BuildContext context,
    BuildContext previousPageContext,
    RescheduleOrderRequest request,
  ) {
    dutyFreeEventState.rescheduleSubmitEvent(this);
    rescheduleStatus.viewStatus = Status.loading;
    notifyListeners();
    _repository
        .rescheduleOrder(
      request: request,
    )
        .then(
      (value) async {
        if (value.data != null) {
          dutyFreeEventState.rescheduleSuccessEvent(this);
          rescheduleResponse = RescheduleResponse.fromJson(value.data);
          getDutyCancelOrderDetailsData(
            orderId ?? '',
            context.read<SiteCoreStateManagement>(),
          );

          getView(
            context: context,
            dialogEnm: DialogTypeEnm.snackBar,
            message: rescheduleResponse?.description ?? '',
            backgroundColor: context.adColors.black,
          );
          try {
            if (ProfileSingleton.profileSingleton.secureToken.isNotEmpty) {
              context.read<AppSessionState>().getUpcomingBookings();
              context
                  .read<AppSessionState>()
                  .updateValueOfBooking(updateValue: true);

              navigatorPopScreen(context);
              navigatorPopScreen(previousPageContext);
              rescheduleStatus.viewStatus = Status.complete;
              // await context
              //     .read<AppSessionState>()
              //     .getBookings(
              //       bookType:
              //           BookingHistory().bookingType(BookingTabType.shopping),
              //     )
              //     .then(
              //   (value) {
              //     // updateStatus(Status.complete);
              //     rescheduleStatus.viewStatus = Status.complete;
              //
              //     navigatorPopScreen(context);
              //     navigatorPopScreen(previousPageContext);
              //   },
              // );
            }
          } catch (e) {
            rescheduleStatus.viewStatus = Status.complete;
            adLog(e.toString());
          }
        } else {
          dutyFreeEventState
            ..rescheduleFail(value)
            ..rescheduleSubmitFail(value);

          rescheduleStatus.viewStatus = Status.complete;
          getView(
            context: context,
            dialogEnm: DialogTypeEnm.snackBar,
            message: value.message ?? '',
            backgroundColor: context.adColors.black,
          );
        }
        notifyListeners();
      },
    );
  }

  String? orderId;

  /// Duty Free cancel Order Details
  /// cancel Order Details Data
  void getDutyCancelOrderDetailsData(
    String orderId,
    SiteCoreStateManagement siteCoreStateManagement,
  ) {
    this.orderId = orderId;
    updateCancelOrderDetailsListStatus(Status.loading);
    _repository
        .getDutyFreeOrderDetailsByOrderId(
      orderId: orderId,
    )
        .then(
      (value) {
        if (value.data != null) {
          try {
            final FlightListIsolateModel isolateModel = FlightListIsolateModel(
              jsonData: value.data,
              airlineInfo: FlightUtils.airlineInfo,
              departureFlightCountMap: FlightUtils.departureFlightCountMap,
              arrivalFlightCountMap: FlightUtils.arrivalFlightCountMap,
              internationalAirportMap: FlightUtils.internationalAirportMap,
            );
            dutyFreeCancelOrderDetailsResponseModel =
                CommonOrderDetailBaseResponse.fromJson(isolateModel);
          } catch (e) {
            adLog(e.toString());
          }
          dutyFreeCancelOrderSKUDetails =
              dutyFreeCancelOrderDetailsResponseModel
                      ?.orderDetail?.dutyfreeDetail?.itemDetails ??
                  [];
          bookingID =
              dutyFreeCancelOrderDetailsResponseModel?.orderReferenceId ?? '';
          orderCancelled = false;
          orderRescheduled = false;
          orderFailed = false;
          for (final StatusHistory statusHistory
              in dutyFreeCancelOrderDetailsResponseModel?.statusHistory ?? []) {
            if ((statusHistory.orderStatus
                        ?.toLowerCase()
                        .contains('cancelled') ??
                    false) ||
                (statusHistory.orderStatus
                        ?.toLowerCase()
                        .contains('cancellation_initiated') ??
                    false)) {
              orderCancelled = true;
            }
            if (statusHistory.orderStatus
                    ?.toLowerCase()
                    .contains('rescheduled') ??
                false) {
              orderRescheduled = true;
            }
            if (statusHistory.orderStatus?.toLowerCase().contains('failed') ??
                false) {
              orderFailed = true;
            }
          }
          // paymentMode = dutyFreeCancelOrderDetailsResponseModel?.pa
          //     .where(
          //       (element) =>
          //           element.transactionCode.toLowerCase() != 'promo' &&
          //           element.transactionCode.toLowerCase() != 'reward' &&
          //           element.transactionCode.toLowerCase() != 'waiveoff',
          //     )
          //     .map((e) {
          //       return e.transactionMode;
          //     })
          //     .toList()
          //     .join(' + ');
          // After getting data for the order, Hitting Important information Api...
          getPotentialEarning(
            dutyFreeCancelOrderDetailsResponseModel,
          );
          final String cityName = Utils.getCityName(
            airportCode: dutyFreeCancelOrderDetailsResponseModel
                    ?.orderDetail?.dutyfreeDetail?.airportCode ??
                '',
            adaniAirportsList: siteCoreStateManagement.adaniAirportsList,
          );
          importantInfoApi(
            airportCode: dutyFreeCancelOrderDetailsResponseModel
                    ?.orderDetail?.dutyfreeDetail?.airportCode ??
                '',
            cityName: cityName,
          );

          siteCoreStateManagement.getDutyFreeTermsCondition(cityName);
          cancelOrderDetailsState.viewStatus = Status.complete;
          // updateCancelOrderDetailsListStatus(Status.complete);
        } else {
          cancelOrderDetailsState.viewStatus = Status.error;

          adLog(
            'product count ${dutyFreeCancelOrderDetailsResponseModel?.orderDetail?.dutyfreeDetail?.itemDetails.length ?? 0}',
          );
        }

        // dutyFreeEventState.purchase();
        updateCancelOrderDetailsListStatus(value.viewStatus ?? Status.error);
        // notifyListeners();
      },
    );
  }

  void importantInfoApi({
    String? storeType,
    String? airportCode,
    String? cityName,
  }) {
    // DutyFreeOrderState dutyFreeOrderState = context.read<DutyFreeOrderState>();
    _importantInformationCancellationPolicyApi(
      storeType: storeType ??
          dutyFreeCancelOrderDetailsResponseModel
              ?.orderDetail?.dutyfreeDetail?.itemDetails.firstOrNull?.storeType,
      airportCode: airportCode ?? '',
      cityName: cityName,
    );
  }

  void updateCancelOrderDetailsListStatus(Status status) {
    cancelOrderDetailsState.viewStatus = status;
    WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
    // notifyListeners();
  }

  Future<DutyFreeDashboardItem?> getDutyFreeOtherServices(String cityName) {
    return _repository.getDutyFreeOtherServices(cityName);
  }

  Future<void> _importantInformationCancellationPolicyApi({
    String? storeType,
    String? airportCode,
    String? cityName,
  }) async {
    final dutyFreeState = DutyFreeState();
    final currentStoreType =
        storeType ?? dutyFreeState.terminalModel.value.code;

    // if (importantInformationStatus == Status.complete) {
    //   return;
    // }
    // print('Statussssss2 $currentStoreType');

    importantInformationPolicyList.clear();
    cancellationPolicyList.clear();
    final ADResponseState? value = await DutyFreeRepository()
        .dutyFreeImportantInformationAndCancellationPolicy(
      storeType: currentStoreType,
      airportCode: airportCode ?? '',
      cityName: cityName ?? '',
    );

    if (value?.viewStatus == Status.complete &&
        value?.data != null &&
        value?.data is List) {
      for (final Map element in value?.data) {
        if (element['fields'] != null) {
          final Map<String, dynamic> fields =
              element['fields'] as Map<String, dynamic>;
          if (fields['contentList'] != null) {
            final List<dynamic> contentItemsList =
                fields['contentList'] as List<dynamic>;
            for (final Map item in contentItemsList) {
              final String title = item['title'] as String;
              final List<dynamic> linesList = item['lines'] as List<dynamic>;
              for (final Map lineItem in linesList) {
                final DutyFreeImportantPoliciesResponse policiesResponse =
                    DutyFreeImportantPoliciesResponse(
                  line: '',
                  title: title,
                  linkText: '',
                  linkURL: '',
                );

                if (lineItem['line'] != null) {
                  final String line = lineItem['line'] as String;
                  policiesResponse.line = line;
                }
                final List<dynamic> linkList =
                    lineItem['links'] as List<dynamic>;
                if (linkList.isNotEmpty) {
                  for (final Map element in linkList) {
                    if (element['linkURL'] != null) {
                      final String? linkUrl = element['linkURL'] as String?;
                      final String? linkText = element['linkText'] as String?;
                      final String link = element['link'] as String;
                      final String textToBeReplaced2 = '\$$link\$';
                      final String textToBeReplaced = '\$$link\$.';
                      policiesResponse.line = policiesResponse.line
                          .replaceAll(textToBeReplaced, '')
                          .replaceAll(textToBeReplaced2, '');
                      if (linkUrl?.isNotEmpty ?? false) {
                        policiesResponse.linkURL = linkUrl ?? '';
                      }
                      if (linkText?.isNotEmpty ?? false) {
                        policiesResponse.linkText = linkText ?? '';
                      }

                      // print('sdvfdsfcds ${policiesResponse.linkURL}');
                      // print('sdvfdsfcds ${policiesResponse.line}');
                      // print('sdvfdsfcds ${policiesResponse.linkText}');
                    }
                  }
                }

                if (title == 'Important Information') {
                  importantInformationPolicyList.add(policiesResponse);
                } else {
                  cancellationPolicyList.add(policiesResponse);
                }
              }
            }
          }
        }
      }
    }
    importantInformationStatus = Status.complete;
    notifyListeners();
  }

  Future<void> getPotentialEarning(CommonOrderDetailBaseResponse? item) async {
    dutyFreeCancelOrderDetailsResponseModel = item;
    isEarnPointsLoading = true;
    if (dutyFreeCancelOrderDetailsResponseModel?.earning == null) {
      final potentialEarningResponse =
          await _flightBookingRepository.getPotentialEarning(
        dutyFreeCancelOrderDetailsResponseModel?.orderReferenceId ?? '',
      );
      if (potentialEarningResponse.viewStatus == Status.complete) {
        final PotentialEarningResponseModel potentialEarningResponseModel =
            potentialEarningResponse.data as PotentialEarningResponseModel;
        dutyFreeCancelOrderDetailsResponseModel?.earning = Earning(
          total: potentialEarningResponseModel.totalPotentialEarning,
          reward: potentialEarningResponseModel.rewardPotentialEarning,
          order: potentialEarningResponseModel.orderPotentialEarning,
        );
      }
    }
    isEarnPointsLoading = false;
    notifyListeners();
  }
}
