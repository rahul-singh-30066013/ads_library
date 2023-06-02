/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/travellers.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_reschedule_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/cancel_booking/api_request_model/cancel_booking_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/pranaam_flights.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_packages/api_request_model/get_packages_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_packages/api_response_model/get_packages_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/service_booking_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/service_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/travel_sector_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/cancellation_data.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/view/pranaam_order_cancel_pop_up.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/view/booked_to_capacity_error_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_order_status.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/utils/stand_alone_service_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///Options view which will have options to download invoice, reschedule and cancel
class OptionsView extends StatefulWidget {
  final String? bookingID;
  final String? tripBookingID;
  final List<int>? passengersList;
  final bool isCancelled;
  final bool isFromBottomSheet;
  final CommonOrderDetailBaseResponse bookingDetailsResponseModel;
  final SiteCoreStateManagement? siteCoreStateManagement;

  const OptionsView({
    Key? key,
    this.bookingID,
    this.tripBookingID,
    this.passengersList,
    this.isCancelled = false,
    this.isFromBottomSheet = false,
    required this.bookingDetailsResponseModel,
    required this.siteCoreStateManagement,
  }) : super(key: key);

  @override
  State<OptionsView> createState() => _OptionsViewState();
}

class _OptionsViewState extends State<OptionsView> {
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  bool isCancelShown = true;

  @override
  Widget build(BuildContext context) {
    if (widget.bookingDetailsResponseModel.cancelType != null &&
            widget.bookingDetailsResponseModel.cancelType == 'Partial' ||
        widget.bookingDetailsResponseModel.cancelType == 'Full' ||
        isStandAloneService(
          widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail
                  ?.pranaamBookingType ??
              '',
        )) {
      isCancelShown = false;
    }

    final CancellationData cancellationData = CancellationData()
      ..bookingId = widget.bookingID ?? '0'
      ..passengersList = widget.passengersList ?? [];

    adLog('CancellationData ${cancellationData.passengersList.length}');

    final bool isRescheduleAvailable = widget
            .bookingDetailsResponseModel
            .orderDetail
            ?.pranaamDetail
            ?.packageDetail
            ?.rescheduleCharges
            .isReschedule ??
        false;

    final bool upgradeAvailable = widget.bookingDetailsResponseModel.orderDetail
            ?.pranaamDetail?.isUpgradable ==
        true;

    final bool fulfilled = PranaamOrderStatus.getStatus(
          widget.bookingDetailsResponseModel.status,
        ) ==
        PranaamOrderStatus.COMPLETED;

    return Visibility(
      visible: !widget.isCancelled,
      child: Column(
        children: [
          Divider(
            height: 1,
            color: context.adColors.tileBorderColor,
          ),
          InkWell(
            onTap: () =>
                context.read<BookingAndCancellationState>().downloadInvoice(
                      context,
                      widget.bookingID,
                      widget.tripBookingID,
                    ),
            child: Container(
              color: Colors.transparent,
              margin: EdgeInsets.symmetric(vertical: context.k_16),
              child: Row(
                children: [
                  SvgPicture.asset(
                    SvgAssets.bottomBarMyOrder,
                    color: context.adColors.greyChartTextColor,
                    height: context.k_16,
                    width: context.k_16,
                  ).paddingBySide(left: context.k_2),
                  ADSizedBox(
                    width: context.k_12,
                  ),
                  Text(
                    'downloadInvoice'.localize(context),
                    style: ADTextStyle500.size16.setTextColor(
                      context.adColors.black,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: context.k_18,
                  ),
                ],
              ),
            ),
          ),
          if (Platform.isIOS)
            Column(
              children: [
                Divider(
                  height: 1,
                  color: context.adColors.tileBorderColor,
                ),
                InkWell(
                  onTap: () => addToWallet(
                    context,
                    widget.bookingID.toString(),
                    widget.tripBookingID.toString(),
                  ),
                  child: Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.symmetric(vertical: context.k_16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          size: context.k_20,
                        ),
                        ADSizedBox(
                          width: context.k_12,
                        ),
                        Text(
                          'add_to_wallet'.localize(context),
                          style: ADTextStyle500.size16.setTextColor(
                            context.adColors.black,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: context.k_18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          Divider(
            height: 1,
            color: context.adColors.tileBorderColor,
          ),
          Column(
            children: [
              if (isRescheduleAvailable && !fulfilled)
                InkWell(
                  onTap: () => {
                    createServiceBookingModel(),
                    navigateToScreenUsingNamedRouteWithArguments(
                      context,
                      pranaamReschedulePage,
                      argumentObject: widget.bookingDetailsResponseModel,
                    ),
                    PranaamRescheduleGaAnalytics().rescheduleEvent(
                      ClickEvents.book_pranaam_reschedule_start,
                      context.read<BookingAndCancellationState>(),
                    ),
                  },
                  child: Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.symmetric(vertical: context.k_16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.refresh_outlined,
                          size: context.k_20,
                        ),
                        ADSizedBox(
                          width: context.k_12,
                        ),
                        Text(
                          'reschedule'.localize(context),
                          style: ADTextStyle500.size16.setTextColor(
                            context.adColors.black,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: context.k_16,
                        ),
                      ],
                    ),
                  ),
                ),
              if (isRescheduleAvailable && !fulfilled)
                Divider(
                  height: 1,
                  color: context.adColors.tileBorderColor,
                ),
              //upgrade
              if (upgradeAvailable && !fulfilled)
                InkWell(
                  onTap: () => _onTapUpgrade(),
                  child: Row(
                    children: [
                      Icon(
                        Icons.upgrade_sharp,
                        size: context.k_20,
                      ),
                      ADSizedBox(
                        width: context.k_12,
                      ),
                      Text(
                        'upgrade'.localize(context),
                        style: ADTextStyle500.size16.setTextColor(
                          context.adColors.black,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: context.k_16,
                      ),
                    ],
                  ).paddingBySide(top: context.k_16, bottom: context.k_16),
                ),
              if (upgradeAvailable && !fulfilled)
                Divider(
                  height: 1,
                  color: context.adColors.tileBorderColor,
                ),
              if (isCancelShown && !fulfilled)
                InkWell(
                  onTap: () => {
                    if (!isPastBooking())
                      {
                        navigateToScreenUsingNamedRouteWithArguments(
                          context,
                          cancellationDetails,
                          argumentObject: [
                            widget.bookingDetailsResponseModel,
                            widget.siteCoreStateManagement,
                            cancellationData,
                            widget.bookingID,
                          ],
                        ),
                      }
                    else
                      {
                        SnackBarUtil.showSnackBar(
                          context,
                          'pranaam_back_date_cancellation_error'
                              .localize(context),
                        ),
                      },
                    PranaamBookingGaAnalytics().pranaamCancelBeginGaAnalytics(
                      context.read<BookingAndCancellationState>(),
                      ClickEvents.book_pranaam_cancel_order_begin,
                    ),
                  },
                  child: Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.symmetric(vertical: context.k_16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.cancel_outlined,
                          size: context.k_20,
                        ),
                        ADSizedBox(
                          width: context.k_12,
                        ),
                        Text(
                          'cancel'.localize(context),
                          style: ADTextStyle500.size16.setTextColor(
                            context.adColors.black,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: context.k_16,
                        ),
                      ],
                    ),
                  ),
                ),
              if (isCancelShown && !fulfilled)
                Divider(
                  height: 1,
                  color: context.adColors.tileBorderColor,
                ),
            ],
          ),
        ],
      ).paddingBySide(left: context.k_16, right: context.k_16),
    );
  }

  void navigate(
    ADResponseState response,
    BuildContext context,
    CancellationData cancellationData,
  ) {
    if (response.viewStatus == Status.complete) {
      navigateUsingPopAndPushNamed(
        context,
        pranaamOrderCancellation,
        argumentsData: [
          cancellationData,
          widget.bookingID,
          widget.isFromBottomSheet,
        ],
      );
    } else if (response.viewStatus == Status.error) {
      adLog(cancellationData.toString());
      Navigator.pop(context);
      SnackBarUtil.showSnackBar(
        context,
        response.message ?? '',
      );
    }
  }

  void showCancelSheet(
    BuildContext context,
    BookingAndCancellationState bookingAndCancellationState,
    CancellationData cancellationData,
  ) {
    // GaEvent.getInstance().cancelOrderBeginEvent();
    // PranaamClickEvents.cancel_order_begin
    //     .logEvent(parameters: GaEvent.getInstance().parameterMap);
    final BookingAndCancellationState getBookingDetailsState =
        context.read<BookingAndCancellationState>();
    final String serviceDateTime = getBookingDetailsState.bookingDetailsResponse
            ?.orderDetail?.pranaamDetail?.tripDetails?.serviceDateTime
            .toString() ??
        '';
    adLog(
      'ServiceDatetimee $serviceDateTime',
    );

    final Duration? duration = getDurationBetweenDateTimes(
      laterDateTime: DateFormat('MM/dd/yyyy hh:mm:ss a').parse(serviceDateTime),
      earlierDateTime: DateTime.now(),
    );

    adLog('Duration in minutes ${duration?.inMinutes}');

    if ((duration?.inMinutes ?? 0) > 0) {
      final bottomSheet = showModalBottomSheet(
        useRootNavigator: true,
        backgroundColor: context.adColors.whiteTextColor,
        elevation: context.k_8,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(context.k_22),
          ),
        ),
        context: context,
        builder: (dialogContext) {
          return ValueListenableBuilder(
            valueListenable: isLoading,
            builder: (context, bool value, child) {
              return PranaamOrderCancelPopUp(
                detailString: 'Are you sure you want to cancel your booking?',
                titleString: 'confirm_cancellation'.localize(context),
                buttonTitle: 'Confirm',
                isLoading: value,

                ///TODO Handle Code Error
                yesCallBack: () async => callCancelAndBookingDetailsAPi(
                  context,
                  bookingAndCancellationState,
                  cancellationData,
                  dialogContext,
                ),
              );
            },
          );
        },
      );
      adLog('$bottomSheet.this');
    } else {
      adLog('in else ');
      SnackBarUtil.showSnackBar(
        context,
        'pranaam_back_date_cancellation_error'.localize(context),
      );
    }
  }

  Future<void> callCancelAndBookingDetailsAPi(
    BuildContext context,
    BookingAndCancellationState bookingAndCancellationState,
    CancellationData cancellationData,
    BuildContext dialogContext,
  ) async {
    updateLoading(value: true);
    final ADResponseState responseState =
        await bookingAndCancellationState.cancelBookingDetails(
      CancelBookingRequestModel(
        orderReferenceId: cancellationData.bookingId,
        // countryDialCode: '91',
        passengerIdList: cancellationData.passengersList,
      ),
    );
    context.read<AppSessionState>().getUpcomingBookings();
    if (responseState.viewStatus == Status.complete) {
      PranaamBookingGaAnalytics().pranaamCancelBeginGaAnalytics(
        bookingAndCancellationState,
        ClickEvents.book_pranaam_cancel_order_complete,
      );
      final ADResponseState getBookingState =
          await bookingAndCancellationState.getBookingDetails(
        fromInit: true,
        orderId: '',
      );
      navigatorPopScreen(dialogContext);
      context.read<AppSessionState>().updateValueOfBooking(updateValue: true);
      if (getBookingState.viewStatus == Status.complete) {
        updateLoading(value: false);
      }
    } else {
      updateLoading(value: false);
      navigatorPopScreen(dialogContext);
      SnackBarUtil.showSnackBar(
        context,
        responseState.message ?? '',
      );
    }
  }

  void updateLoading({required bool value}) {
    adLog('update Loading');
    isLoading.value = value;
  }

  void _onTapUpgrade() {
    // upgrade start GA event
    PranaamRescheduleGaAnalytics().pranaamUpgradeEvent(
      ClickEvents.book_pranaam_upgrade_start,
      context.read<BookingAndCancellationState>(),
    );

    final PranaamAppDataStateManagement bookingServiceState =
        context.read<PranaamAppDataStateManagement>();
    final GetPackagesRequestModel getPackagesRequestModel =
        createPackageRequestModel();
    createServiceBookingModel();
    bookingServiceState
      ..isAnimationLoading = true
      ..notifyListeners();

    adLog(' upgrade request ${getPackagesRequestModel.toJson()}');
    bookingServiceState.getPackages(getPackagesRequestModel).then((value) {
      adLog('value is $value');
      switch (value.viewStatus) {
        case Status.complete:
          final Data data = bookingServiceState.packagesResponse.data;
          if (data.packageDetails.isNotEmpty) {
            // if (bookingServiceState
            //         .srpPackagesElement.componentName.isNotEmpty &&
            //     bookingServiceState.srpPackagesElement.fields.data.isNotEmpty) {
            createServiceBookingModel();
            // bookingServiceState.isFormFilled = true;
            adLog('Book Now clicked from Dashboard');

            ///GA event book now pranaam
            GaEvent.getInstance().pranaamBookNowEvent(
              context.read<PranaamAppDataStateManagement>(),
            );
            // ClickEvents.book_pranaam_start
            //     .logEvent(parameters: GaEvent.getInstance().parameterMap);
            final res =
                Navigator.of(context).pushNamed(selectPackage, arguments: true);
            adLog('$res');
            Future.delayed(const Duration(seconds: 1)).then((value) {
              bookingServiceState
                ..isAnimationLoading = false
                ..notifyListeners();
              if (value != null) {
                adLog(
                  'pop $value ',
                );
              }
            });
            // } else {
            //   SnackBarUtil.showSnackBar(
            //     context,
            //     'somethingWentWrong'.localize(context),
            //   );
            // }
          } else {
            PranaamBookingGaAnalytics().serviceUnavailableGaAnalytics(
              context.read<PranaamAppDataStateManagement>(),
            );
            adShowBottomSheet(
              context: context,
              childWidget: BookedToCapacityErrorScreen(
                textOne: 'pranaam_booked_to_capacity_msg_one'.localize(context),
                textTwo: 'pranaam_booked_to_capacity_msg_two'.localize(context),
                textThree:
                    'pranaam_booked_to_capacity_msg_three'.localize(context),
                textFour:
                    'pranaam_booked_to_capacity_msg_four'.localize(context),
              ),
              headerTitle: 'pranaam_booked_to_capacity_title'.localize(context),
            );
            bookingServiceState
              ..isAnimationLoading = false
              ..notifyListeners();
          }
          break;
        case Status.error:
          bookingServiceState.isAnimationLoading = false;
          bookingServiceState.notifyListeners();
          SnackBarUtil.showSnackBar(
            context,
            value.message ?? 'Something went wrong',
          );
          break;
        case Status.none:
          break;
        case Status.loading:
          break;
        default:
          break;
      }
    });
  }

  GetPackagesRequestModel createPackageRequestModel() {
    final GetPackagesRequestModel getPackagesRequestModel =
        GetPackagesRequestModel(
      ///todo: serviceTypeId
      serviceTypeId: widget.bookingDetailsResponseModel.orderDetail
              ?.pranaamDetail?.tripDetails?.serviceTypeId
              .toString() ??
          '',
      serviceType: widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail
              ?.tripDetails?.serviceType ??
          '',
      travelSector: widget.bookingDetailsResponseModel.orderDetail
              ?.pranaamDetail?.tripDetails?.travelSector ??
          '',
      originAirport: widget.bookingDetailsResponseModel.orderDetail
              ?.pranaamDetail?.tripDetails?.originAirport ??
          '',
      destinationAirport: widget.bookingDetailsResponseModel.orderDetail
              ?.pranaamDetail?.tripDetails?.destinationAirport ??
          '',
      serviceDate: formatServiceTimeForUpgrade(
        widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail
                ?.tripDetails?.serviceDateTime
                .toString() ??
            '',
      ),

      serviceTime: formatTimeForUpgrade(
        widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail
                ?.tripDetails?.serviceDateTime
                .toString() ??
            '',
      ),
      adultCount: widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail
              ?.packageDetail?.adultCount ??
          0,
      childCount: widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail
              ?.packageDetail?.childCount ??
          0,
      infantCount: widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail
              ?.packageDetail?.infantCount ??
          0,
      oldBookingReferenceId: widget.bookingID ?? '0',
      oldBookingId: widget.bookingDetailsResponseModel.orderDetail
              ?.pranaamDetail?.bookingId ??
          0,
      serviceAirportId: widget.bookingDetailsResponseModel.orderDetail
          ?.pranaamDetail?.tripDetails?.serviceAirportId,
      roundTransitServiceDate: widget.bookingDetailsResponseModel.orderDetail
                      ?.pranaamDetail?.tripDetails?.serviceTypeId ==
                  roundTripServiceId ||
              widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail
                      ?.tripDetails?.serviceTypeId ==
                  transitServiceId
          ? universalDateFormatter(
              requiredFormat: 'dd-MM-yyyy',
              dateTimeObject: widget.bookingDetailsResponseModel.orderDetail
                          ?.pranaamDetail?.tripDetails?.serviceTypeId ==
                      roundTripServiceId
                  ? widget.bookingDetailsResponseModel.orderDetail
                      ?.pranaamDetail?.roundTripDetail?.serviceDateTime
                  : widget.bookingDetailsResponseModel.orderDetail
                      ?.pranaamDetail?.tripDetails?.serviceDateTime,
            )
          : null,
      roundTransitServiceTime: widget.bookingDetailsResponseModel.orderDetail
                      ?.pranaamDetail?.tripDetails?.serviceTypeId ==
                  roundTripServiceId ||
              widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail
                      ?.tripDetails?.serviceTypeId ==
                  transitServiceId
          ? universalDateFormatter(
              requiredFormat: 'hh:MM:ss',
              dateTimeObject: widget.bookingDetailsResponseModel.orderDetail
                          ?.pranaamDetail?.tripDetails?.serviceTypeId ==
                      roundTripServiceId
                  ? widget.bookingDetailsResponseModel.orderDetail
                      ?.pranaamDetail?.roundTripDetail?.serviceDateTime
                  : widget.bookingDetailsResponseModel.orderDetail
                      ?.pranaamDetail?.tripDetails?.serviceDateTime,
              inCommingFormat: 'dd/MM/yyyy hh:mm:ss a',
            )
          : null,
    );
    return getPackagesRequestModel;
  }

  void createServiceBookingModel() {
    final PranaamAppDataStateManagement bookingServiceState =
        context.read<PranaamAppDataStateManagement>();
    final ServiceBookingModel serviceBookingModel = ServiceBookingModel()
      ..selectedService = ServiceModel(
        serviceId: widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail
                ?.tripDetails?.serviceTypeId ??
            0,
        serviceTitle: getServiceNameFromServiceTypeId(
          widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail
                  ?.tripDetails?.serviceTypeId ??
              0,
        ),
      )
      ..selectedTravelSector = TravelSectorModel(
        travelSectorId: widget.bookingDetailsResponseModel.orderDetail
                ?.pranaamDetail?.tripDetails?.travelSectorId ??
            0,
        travelSectorTitle: widget.bookingDetailsResponseModel.orderDetail
                ?.pranaamDetail?.tripDetails?.travelSector ??
            '',
      )
      ..travellers = Travellers(
        adults: widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail
                ?.packageDetail?.adultCount ??
            0,
        infants: widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail
                ?.packageDetail?.infantCount ??
            0,
        children: widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail
                ?.packageDetail?.childCount ??
            0,
      )
      ..serviceAirport = widget.bookingDetailsResponseModel.orderDetail
              ?.pranaamDetail?.tripDetails?.serviceAirportName ??
          ''
      ..selectedFlightDetailModel = PranaamFlights(
        flightFinalNumber: widget.bookingDetailsResponseModel.orderDetail
                ?.pranaamDetail?.tripDetails?.flightNumber ??
            '',
        serviceDateTime: widget.bookingDetailsResponseModel.orderDetail
                ?.pranaamDetail?.tripDetails?.serviceDateTime
                .toString() ??
            '',
      )
      ..roundTripTransitFlights = PranaamFlights(
        flightFinalNumber: widget.bookingDetailsResponseModel.orderDetail
                ?.pranaamDetail?.roundTripDetail?.flightNumber ??
            '',
        flightNo: widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail
                ?.roundTripDetail?.flightNumber ??
            '',
        serviceDateTime: widget.bookingDetailsResponseModel.orderDetail
                ?.pranaamDetail?.roundTripDetail?.serviceDateTime
                .toString() ??
            '',
      );
    bookingServiceState
      ..serviceAirport = getCityName(
        widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail
                ?.tripDetails?.serviceAirport ??
            '',
        context.read<SiteCoreStateManagement>(),
      )
      ..editForm(value: false)
      ..updateServiceBookingData(serviceBookingModel)
      ..editForm(value: true);

    adLog(
      'createServiceBookingModel ${serviceBookingModel.toString()}',
    );
  }

  bool isPastBooking() {
    final BookingAndCancellationState getBookingDetailsState =
        context.read<BookingAndCancellationState>();
    final String serviceDateTime = getBookingDetailsState.bookingDetailsResponse
            ?.orderDetail?.pranaamDetail?.tripDetails?.serviceDateTime
            .toString() ??
        '';
    final Duration? duration = getDurationBetweenDateTimes(
      laterDateTime: DateFormat('yyyy-MM-dd hh:mm:ss').parse(serviceDateTime),
      earlierDateTime: DateTime.now(),
    );

    adLog('Duration in minutes ${duration?.inMinutes}');
    return !((duration?.inMinutes ?? 0) > 0);
  }
}
