/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_order_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/filtered_vendor_data_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_cancellation_screen/view/cab_booking_select_reason.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_cancellation_screen/view/cancellation_screen_shimmer.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/important_information_bottom_sheet_view.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/error_page/ad_error_page.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// TODO aad to styleguide
const Color lightBlueColor = Color(0xfff4f9ff);

class CabBookingCancellationScreen extends StatefulWidget {
  final String orderReferenceId;
  final InfoDetails? infoDetails;
  final ADTapCallback successCallBack;
  final CabOrderDetailResponseModel? cabOrderDetailResponseModel;
  final String? currencyCode;

  const CabBookingCancellationScreen({
    Key? key,
    required this.orderReferenceId,
    required this.infoDetails,
    required this.successCallBack,
    required this.cabOrderDetailResponseModel,
    required this.currencyCode,
  }) : super(key: key);

  @override
  State<CabBookingCancellationScreen> createState() =>
      _CabBookingCancellationScreenState();
}

class _CabBookingCancellationScreenState
    extends State<CabBookingCancellationScreen> {
  CabBookingCancellationState cabBookingCancellationState =
      CabBookingCancellationState();

  @override
  void initState() {
    cabBookingCancellationState
      ..orderReferenceId = widget.orderReferenceId
      ..isContinueCancelOrderButtonActive.value = false
      ..getPreCancellationApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ADSelectorStateLessWidget<CabBookingCancellationState>(
        viewModel: cabBookingCancellationState,
        child: Consumer<CabBookingCancellationState>(
          builder: (
            context,
            _cabBookingCancellationState,
            child,
          ) {
            switch (
                _cabBookingCancellationState.cancelReasonState?.viewStatus) {
              case Status.complete:
                return Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    title: Text(
                      _cabBookingCancellationState
                              .cancelReasonResponseModel?.headerTitle ??
                          '',
                      style: ADTextStyle700.size22.setTextColor(
                        context.adColors.neutralInfoMsg,
                      ),
                    ),
                  ),
                  body: GestureDetector(
                    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                    child: SafeArea(
                      child: SingleChildScrollView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        child: AbsorbPointer(
                          absorbing: _cabBookingCancellationState
                                  .orderCancelState?.viewStatus ==
                              Status.loading,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _cabBookingCancellationState
                                        .cancelReasonResponseModel
                                        ?.headerDescription ??
                                    '',
                                style: ADTextStyle400.size16.setTextColor(
                                  context.adColors.neutralInfoMsg,
                                ),
                              ),
                              SizedBox(
                                height: context.k_30,
                              ),
                              Text(
                                _cabBookingCancellationState
                                        .cancelReasonResponseModel?.title ??
                                    '',
                                style: ADTextStyle700.size18.setTextColor(
                                  context.adColors.neutralInfoMsg,
                                ),
                              ),
                              SizedBox(
                                height: context.k_8,
                              ),
                              CabBookingSelectReason(
                                cabOrderDetailResponseModel:
                                    widget.cabOrderDetailResponseModel,
                                cabBookingCancellationState:
                                    cabBookingCancellationState,
                              ),
                              SizedBox(
                                height: context.k_30,
                              ),
                              Container(
                                color: lightBlueColor,
                                child: Column(
                                  children: [
                                    // Theme(
                                    //   data: ThemeData().copyWith(
                                    //     dividerColor:
                                    //         context.adColors.transparentColor,
                                    //   ),
                                    //   child: ListTileTheme(
                                    //     iconColor:
                                    //         context.adColors.blackTextColor,
                                    //     dense: true,
                                    //     horizontalTitleGap: 0,
                                    //     minLeadingWidth: 0,
                                    //     child: ExpansionTile(
                                    //       iconColor:
                                    //           context.adColors.blackTextColor,
                                    //       collapsedIconColor:
                                    //           context.adColors.blackTextColor,
                                    //       onExpansionChanged: (value) => {},
                                    //       title: Row(
                                    //         children: [
                                    //           Text(
                                    //             'total_refund_amount'
                                    //                 .localize(context),
                                    //             style: ADTextStyle700.size18
                                    //                 .setTextColor(
                                    //               context
                                    //                   .adColors.blackTextColor,
                                    //             ),
                                    //           ),
                                    //           const Spacer(),
                                    //           Text(
                                    //             FlightUtils
                                    //                 .getAmountWithTwoDecimalPoint(
                                    //               _cabBookingCancellationState
                                    //                       .preCancelResponseModel
                                    //                       ?.totalRefund
                                    //                       ?.toDouble() ??
                                    //                   0.0,
                                    //             ),
                                    //             style: ADTextStyle700.size18
                                    //                 .setTextColor(
                                    //               context
                                    //                   .adColors.blackTextColor,
                                    //             ),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //       children: [
                                    //         if ((_cabBookingCancellationState
                                    //                     .preCancelResponseModel
                                    //                     ?.totalPaid ??
                                    //                 0) >
                                    //             0)
                                    //           Column(
                                    //             children: [
                                    //               Row(
                                    //                 crossAxisAlignment:
                                    //                     CrossAxisAlignment
                                    //                         .start,
                                    //                 children: [
                                    //                   Expanded(
                                    //                     child: Text(
                                    //                       'amount_paid'
                                    //                           .localize(
                                    //                         context,
                                    //                       ),
                                    //                       style: ADTextStyle400
                                    //                           .size16
                                    //                           .setTextColor(
                                    //                         context.adColors
                                    //                             .blackTextColor,
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                   SizedBox(
                                    //                     width: context.k_8,
                                    //                   ),
                                    //                   Text(
                                    //                     FlightUtils
                                    //                         .getAmountWithTwoDecimalPoint(
                                    //                       (_cabBookingCancellationState
                                    //                                   .preCancelResponseModel
                                    //                                   ?.totalPaid ??
                                    //                               0)
                                    //                           .toDouble(),
                                    //                     ),
                                    //                     style: ADTextStyle400
                                    //                         .size16
                                    //                         .setTextColor(
                                    //                       context.adColors
                                    //                           .blackTextColor,
                                    //                     ),
                                    //                   ),
                                    //                 ],
                                    //               ).paddingBySide(
                                    //                 left: context.k_14,
                                    //                 right: context.k_14,
                                    //               ),
                                    //               SizedBox(
                                    //                 height: context.k_10,
                                    //               ),
                                    //             ],
                                    //           ),
                                    //         if ((_cabBookingCancellationState
                                    //                     .preCancelResponseModel
                                    //                     ?.cancelationCharges ??
                                    //                 0) >
                                    //             0)
                                    //           Column(
                                    //             children: [
                                    //               Row(
                                    //                 crossAxisAlignment:
                                    //                     CrossAxisAlignment
                                    //                         .start,
                                    //                 children: [
                                    //                   Expanded(
                                    //                     child: Text(
                                    //                       'cancellation_charge'
                                    //                           .localize(
                                    //                         context,
                                    //                       ),
                                    //                       style: ADTextStyle400
                                    //                           .size16
                                    //                           .setTextColor(
                                    //                         context.adColors
                                    //                             .blackTextColor,
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                   SizedBox(
                                    //                     width: context.k_8,
                                    //                   ),
                                    //                   Text(
                                    //                     '-${FlightUtils.getAmountWithTwoDecimalPoint(
                                    //                       (_cabBookingCancellationState
                                    //                                   .preCancelResponseModel
                                    //                                   ?.cancelationCharges ??
                                    //                               0)
                                    //                           .toDouble(),
                                    //                     )}',
                                    //                     style: ADTextStyle400
                                    //                         .size16
                                    //                         .setTextColor(
                                    //                       context.adColors
                                    //                           .blackTextColor,
                                    //                     ),
                                    //                   ),
                                    //                 ],
                                    //               ).paddingBySide(
                                    //                 left: context.k_14,
                                    //                 right: context.k_14,
                                    //               ),
                                    //               SizedBox(
                                    //                 height: context.k_10,
                                    //               ),
                                    //             ],
                                    //           ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                    Row(
                                      children: [
                                        Text(
                                          'total_refund_amount'
                                              .localize(context),
                                          style: ADTextStyle700.size18
                                              .setTextColor(
                                            context.adColors.blackTextColor,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          FlightUtils
                                              .getAmountWithTwoDecimalPoint(
                                            _cabBookingCancellationState
                                                    .preCancelResponseModel
                                                    ?.totalRefund
                                                    ?.toDouble() ??
                                                0.0,
                                          ),
                                          style: ADTextStyle700.size18
                                              .setTextColor(
                                            context.adColors.blackTextColor,
                                          ),
                                        ),
                                      ],
                                    ).paddingBySide(
                                      left: context.k_14,
                                      right: context.k_14,
                                      top: context.k_20,
                                    ),
                                    Divider(
                                      color: context.adColors.tileBorderColor,
                                      height: 1.sp,
                                      thickness: 1.sp,
                                      indent: context.k_14,
                                      endIndent: context.k_14,
                                    ).paddingBySide(
                                      top: context.k_20,
                                      bottom: context.k_20,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: '',
                                        style:
                                            ADTextStyle400.size14.setTextColor(
                                          context.adColors.blackTextColor,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                'for_details_on_cancellation_charge_please_check_our'
                                                    .localize(context),
                                            style: ADTextStyle400.size14
                                                .setTextColor(
                                              context.adColors.blackTextColor,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'cab_cancellation_policy'
                                                .localize(context),
                                            style: ADTextStyle400.size14
                                                .setTextColor(
                                                  context
                                                      .adColors.blackTextColor,
                                                )
                                                .copyWith(
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                adShowBottomSheet(
                                                  context: context,
                                                  childWidget:
                                                      ImportantInformationBottomSheetView(
                                                    carInfoDetail:
                                                        widget.infoDetails,
                                                    initialIndex: 1,
                                                  ),
                                                  headerTitle:
                                                      'cab_cancellation_policy'
                                                          .localize(context),
                                                );
                                              },
                                          ),
                                        ],
                                      ),
                                    ).paddingBySide(
                                      left: context.k_14,
                                      right: context.k_14,
                                      bottom: context.k_20,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: context.k_48,
                              ),

                              /// Submit button
                              ValueListenableBuilder(
                                valueListenable: cabBookingCancellationState
                                    .isContinueCancelOrderButtonActive,
                                child: Container(),
                                builder: (context, bool value, child) =>
                                    ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: context.adColors.blueColor,
                                    // elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(context.k_28),
                                    ),
                                    minimumSize: Size(
                                      double.infinity,
                                      context.k_56,
                                    ), //////// HERE
                                  ),
                                  onPressed:
                                      value ? () => cancelConfirmation() : null,
                                  child: cabBookingCancellationState
                                              .orderCancelState?.viewStatus ==
                                          Status.loading
                                      ? ADDotProgressView(
                                          color:
                                              context.adColors.whiteTextColor,
                                        )
                                      : Text(
                                          _cabBookingCancellationState
                                                  .cancelReasonResponseModel
                                                  ?.buttonText ??
                                              'continue'.localize(context),
                                          style: ADTextStyle700.size16
                                              .setTextColor(
                                            context.adColors.whiteTextColor,
                                          ),
                                        ),
                                ),
                              ),
                              SizedBox(
                                height: context.k_48,
                              ),
                            ],
                          ).paddingBySide(
                            top: context.k_20,
                            left: context.k_16,
                            right: context.k_16,
                            bottom: context.k_16,
                          ),
                        ),
                      ),
                    ),
                  ),
                );

              case Status.loading:
                return const CancellationScreenShimmer();
              case Status.error:
                return ADErrorPage(
                  message:
                      _cabBookingCancellationState.cancelReasonState?.message,
                  onPress: () =>
                      cabBookingCancellationState.getPreCancellationApi(),
                );

              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  void cancelConfirmation() {
    CabGoogleAnalytics().sendGAParametersCabBookingCancellationReasonText(
      cabBookingCancellationState,
      widget.cabOrderDetailResponseModel,
      widget.currencyCode,
    );
    cabBookingCancellationState
      ..cabBookingCancellationRequest =
          cabBookingCancellationState.cabBookingCancellationRequest.copyWith(
        orderReferenceId: cabBookingCancellationState.orderReferenceId,
      )
      ..hitCancelAPI(
        context: context,
        yesCallBack: () => widget.successCallBack.call(),
      );
  }
}
