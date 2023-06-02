/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/cabs/models/request_models/cab_booking_cancellation_request.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/pre_cancel_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cabs_booking_repository.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_response_model.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

class CabBookingCancellationPopUpState extends ADBaseViewModel {
  final CabsBookingRepository _cabsBookingRepository = CabsBookingRepository();
  CabBookingCancellationRequest? cabBookingCancellationRequest;
  final ValueNotifier<Status> orderCancellationState = ValueNotifier(
    Status.complete,
  );

  void updateOrderStatus(Status status) {
    orderCancellationState.value = status;
    notifyListeners();
  }

  // void cancelApiCall({
  //   required BuildContext context,
  //   required ADTapCallback yesCallBack,
  //   required String bookingId,
  // }) {
  //   adLog(
  //     '$cabBookingCancellationRequest',
  //   );
  //   bookingCancellation(
  //     cabBookingCancellationRequest,
  //     context: context,
  //     yesCallBack: yesCallBack,
  //     bookingId: bookingId,
  //   );
  // }

  // void bookingCancellation(
  //   CabBookingCancellationRequest? request, {
  //   required BuildContext context,
  //   required ADTapCallback yesCallBack,
  //   required String bookingId,
  // }) {
  //   hitCancelAPI(
  //     request,
  //     context: context,
  //     yesCallBack: yesCallBack,
  //     bookingId: bookingId,
  //   );
  // }

  void hitCancelAPI({
    required BuildContext context,
    required ADTapCallback yesCallBack,
  }) {
    updateOrderStatus(Status.loading);
    _cabsBookingRepository
        .cabBookingPreCancellationApiCall(
      orderReferenceId: cabBookingCancellationRequest?.orderReferenceId ?? '',
    )
        .then((response) {
      if (response.viewStatus == Status.complete) {
        final preCancelModel = PreCancelResponseModel.fromJson(response.data);
        if (preCancelModel.isFullRefund ?? false) {
          _cabsBookingRepository
              .cabBookingCancellationApiCall(
            request: cabBookingCancellationRequest,
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
                    updateOrderStatus(Status.complete);
                    navigatorPopScreen(context);
                    yesCallBack.call();
                  });
                } else {
                  updateOrderStatus(Status.complete);
                  navigatorPopScreen(context);
                  yesCallBack.call();
                }
              } catch (e) {
                showToast(
                  context,
                  'ADLEX01'.localize(context),
                );
                updateOrderStatus(Status.complete);
                navigatorPopScreen(context);
              }
            } else {
              showToast(
                context,
                value.message ?? 'ADLEX01'.localize(context),
              );
              updateOrderStatus(Status.complete);
              navigatorPopScreen(context);
            }
          });
        } else {
          showToast(
            context,
            'sorry_refund_amount_has_been_changed'.localize(context),
          );
          updateOrderStatus(Status.complete);
          navigatorPopScreen(context);
        }
      } else {
        showToast(
          context,
          response.message ?? 'ADLEX01'.localize(context),
        );
        updateOrderStatus(Status.complete);
        navigatorPopScreen(context);
      }
    });
  }

  // void hitCancelAPI(
  //   CabBookingCancellationRequest? request, {
  //   required BuildContext context,
  //   required ADTapCallback yesCallBack,
  // }) {
  //   updateOrderStatus(Status.loading);
  //   _cabsBookingRepository
  //       .cabBookingCancellationApiCall(
  //     request: request,
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
  //                   showToast(
  //                     context,
  //                     'sorry_refund_amount_has_been_changed'.localize(context),
  //                   ),
  //                   updateOrderStatus(Status.complete),
  //                   navigatorPopScreen(context),
  //                 }
  //               else
  //                 {
  //                   if (ProfileSingleton
  //                       .profileSingleton.secureToken.isNotEmpty)
  //                     {
  //                       context.read<AppSessionState>().getUpcomingBookings(),
  //                       context.read<AppSessionState>().updateValueOfBooking(
  //                             updateValue: true,
  //                           ),
  //                     },
  //                   updateOrderStatus(Status.complete),
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
  //           updateOrderStatus(Status.complete);
  //           navigatorPopScreen(context);
  //         }
  //       } else {
  //         showToast(
  //           context,
  //           value.message ?? 'ADLEX01'.localize(context),
  //         );
  //         updateOrderStatus(Status.complete);
  //         navigatorPopScreen(context);
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
