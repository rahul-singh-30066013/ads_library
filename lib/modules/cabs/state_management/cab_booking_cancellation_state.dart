/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/cabs/models/request_models/cab_booking_cancellation_request.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cancel_reason_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/pre_cancel_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cabs_booking_repository.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_response_model.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

class CabBookingCancellationState extends ADBaseViewModel {
  final CabsBookingRepository _cabsBookingRepository = CabsBookingRepository();
  String orderReferenceId = '';
  PreCancelResponseModel? preCancelResponseModel;

  final ValueNotifier<bool> isContinueCancelOrderButtonActive =
      ValueNotifier(false);
  CabBookingCancellationRequest cabBookingCancellationRequest =
      const CabBookingCancellationRequest();
  CancelReasonResponseModel? cancelReasonResponseModel;
  Status orderCancellationState = Status.complete;
  ADResponseState? _cancelReasonState = ADResponseState.completed('data');

  ADResponseState? get cancelReasonState => _cancelReasonState;

  void updateCancelReasonState(ADResponseState? response) {
    _cancelReasonState = response;
    notifyListeners();
  }

  Future<void> getPreCancellationApi({
    bool isOnlyPreCancellation = false,
  }) async {
    if (!isOnlyPreCancellation) {
      updateCancelReasonState(ADResponseState.loading());
    }
    final response = await _cabsBookingRepository
        .cabBookingPreCancellationApiCall(orderReferenceId: orderReferenceId);
    if (response.viewStatus == Status.complete) {
      preCancelResponseModel = PreCancelResponseModel.fromJson(response.data);
      if (!isOnlyPreCancellation) {
        await getCabBookingCancelReason();
      } else {
        updateCancelReasonState(response);
      }
    } else {
      updateCancelReasonState(response);
    }
  }

  Future<void> getCabBookingCancelReason() async {
    updateCancelReasonState(ADResponseState.loading());
    final response =
        await _cabsBookingRepository.fetchCabBookingCancelReasonData(
      queryParams: {
        'item': SiteCoreApiUrls.siteCoreCabBookingCancelReasons,
        'sc_lang': 'en',
        'sc_apikey': SiteCoreApiUrls.siteCoreApiKey,
        'application': 'app',
      },
    );
    if (response.viewStatus == Status.complete) {
      cancelReasonResponseModel = response.data as CancelReasonResponseModel;
      adLog(cancelReasonResponseModel.toString());
    }
    updateCancelReasonState(response);
  }

  ADResponseState? orderCancelState = ADResponseState.completed('');

  void updateOrderCancelStatus(ADResponseState? response) {
    orderCancelState = response;
    notifyListeners();
  }

  void hitCancelAPI({
    required BuildContext context,
    required ADTapCallback yesCallBack,
  }) {
    updateOrderCancelStatus(ADResponseState.loading());
    _cabsBookingRepository
        .cabBookingPreCancellationApiCall(orderReferenceId: orderReferenceId)
        .then((response) {
      if (response.viewStatus == Status.complete) {
        final preCancelModel = PreCancelResponseModel.fromJson(response.data);
        if (preCancelModel.totalRefund == preCancelResponseModel?.totalRefund) {
          _cabsBookingRepository
              .cabBookingCancellationApiCall(
            request: cabBookingCancellationRequest.copyWith(),
          )
              .then((value) async {
            if (value.viewStatus == Status.complete) {
              try {
                if (ProfileSingleton.profileSingleton.secureToken.isNotEmpty) {
                  await context
                      .read<AppSessionState>()
                      .getBookings(
                        bookType: context.read<AppSessionState>().mainTabType,
                      )
                      .then((_bookingResponse) {
                    if (_bookingResponse.viewStatus == Status.complete) {
                      final MyBookingResponseModel? bookingDetails =
                          _bookingResponse.data;
                      context.read<AppSessionState>().allOrders?.history =
                          bookingDetails?.all;
                      context.read<AppSessionState>().allOrders?.totalRecords =
                          bookingDetails?.totalRecord;
                      context.read<AppSessionState>().allOrders?.pageIndex = 1;
                      context
                          .read<AppSessionState>()
                          .allOrders
                          ?.setValueForReload(value: true);
                    }
                    context.read<AppSessionState>().getUpcomingBookings();
                    context
                        .read<AppSessionState>()
                        .updateValueOfBooking(updateValue: true);
                    updateOrderCancelStatus(value);
                    navigatorPopScreen(context);
                    yesCallBack.call();
                  });
                } else {
                  updateOrderCancelStatus(value);
                  navigatorPopScreen(context);
                  yesCallBack.call();
                }
              } catch (e) {
                showToast(
                  context,
                  'ADLEX01'.localize(context),
                );
                updateOrderCancelStatus(value);
              }
            } else {
              showToast(
                context,
                value.message ?? 'ADLEX01'.localize(context),
              );
              updateOrderCancelStatus(value);
            }
          });
        } else {
          showToast(
            context,
            'sorry_refund_amount_has_been_changed'.localize(context),
          );
          updateCancelReasonState(response);
          updateOrderCancelStatus(response);
        }
      } else {
        showToast(
          context,
          response.message ?? 'ADLEX01'.localize(context),
        );
        updateOrderCancelStatus(response);
      }
    });
  }

  // void hitCancelAPI({
  //   required BuildContext context,
  //   required ADTapCallback yesCallBack,
  // }) {
  //   updateOrderCancelStatus(ADResponseState.loading());
  //   _cabsBookingRepository
  //       .cabBookingCancellationApiCall(
  //     request: cabBookingCancellationRequest.copyWith(),
  //   )
  //       .then(
  //     (value) async {
  //       adLog(value.toString());
  //       if (value.viewStatus == Status.complete) {
  //         try {
  //           Future.delayed(
  //             const Duration(seconds: 2),
  //             () => {
  //               if (value.successCode == 'CABB02')
  //                 {
  //                   getPreCancellationApi(isOnlyPreCancellation: true),
  //                   showToast(
  //                     context,
  //                     'sorry_refund_amount_has_been_changed'.localize(context),
  //                   ),
  //                   updateOrderCancelStatus(value),
  //                 }
  //               else
  //                 {
  //                   if (ProfileSingleton
  //                       .profileSingleton.secureToken.isNotEmpty)
  //                     {
  //                       context.read<AppSessionState>().getUpcomingBookings(),
  //                       context
  //                           .read<AppSessionState>()
  //                           .updateValueOfBooking(updateValue: true),
  //                     },
  //                   updateOrderCancelStatus(value),
  //                   navigatorPopScreen(context),
  //                   yesCallBack.call(),
  //                 },
  //             },
  //           );
  //         } catch (e) {
  //           showToast(
  //             context,
  //             'ADLEX01'.localize(context),
  //           );
  //           updateOrderCancelStatus(value);
  //         }
  //       } else {
  //         showToast(
  //           context,
  //           value.message ?? 'ADLEX01'.localize(context),
  //         );
  //         updateOrderCancelStatus(value);
  //       }
  //     },
  //   );
  // }

  void showToast(BuildContext context, String message) {
    const int duration = 3000;
    SnackBarUtil.showSnackBar(
      context,
      message,
      duration,
      EdgeInsets.symmetric(
        horizontal: context.k_16,
        vertical: context.k_64 + context.k_30,
      ),
    );
  }
}
