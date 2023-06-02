/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_booking_cancel_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/cancel_reason.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/cancellation_reason_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_booking_cancel_state.dart';
import 'package:adani_airport_mobile/utils/internet_connection/no_internet_view.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this class is use for cancel reason
class FlightCancelReasonScreen extends StatefulWidget {
  final SelectedPaxTripToCancel selectedPaxTripToCancel;

  const FlightCancelReasonScreen({
    Key? key,
    required this.selectedPaxTripToCancel,
  }) : super(key: key);

  @override
  _FlightCancelReasonScreenState createState() =>
      _FlightCancelReasonScreenState();
}

class _FlightCancelReasonScreenState extends State<FlightCancelReasonScreen> {
  final int index = 0;
  final FlightBookingCancelState flightBookingCancelState =
      FlightBookingCancelState();
  List<CancelReason>? cancelReasonList;
  int _selectedIndex = -1;
  bool _isReasonSelected = false;

  @override
  void initState() {
    super.initState();
    flightBookingCancelState
        .getCancellationReasons(widget.selectedPaxTripToCancel.orderReferenceId);
  }

  final double _heightOfSubmitButton = 54.sp;
  final double _vSpacingOfSubmitButton = 50.sp;
  // final double _fontHeight = 1.1.sp;

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<FlightBookingCancelState>(
      key: const Key('FlightCancelReason'),
      viewModel: flightBookingCancelState,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.adColors.whiteTextColor,
          elevation: 0,
          title: Text(
            'cancellation_reason_title'.localize(context),
            style: ADTextStyle700.size22.setTextColor(context.adColors.black),
          ),
        ),
        body: Selector<FlightBookingCancelState, ADResponseState>(
          selector: (context, viewModel) => viewModel.flightFairInfo,
          builder: (context, value, Widget? child) {
            switch (value.viewStatus) {
              case Status.loading:
                return const Center(
                  child: ADDotProgressView(),
                );
              case Status.error:
                return NoInternetView(
                  statusCode: value.errorCode.toString(),
                  pageMainDesc: value.errorCode.isNullOrEmpty
                      ? 'oops_something_went_wrong'.localize(context)
                      : value.errorCode.toString() == '51'
                          ? 'cant_find_you'.localize(context)
                          : value.errorCode.toString().localize(context),
                  pageSubDesc: value.errorCode.isNullOrEmpty
                      ? ''
                      : value.errorCode.toString() == '51'
                          ? 'please_check_your_internet'.localize(context)
                          : '',
                );
              case Status.complete:
                final CancellationReasonResponseModel
                    cancellationReasonResponseModel =
                    value.data ?? CancellationReasonResponseModel();
                cancelReasonList =
                    cancellationReasonResponseModel.cancelReason ?? [];
                if (cancelReasonList != null &&
                    (cancelReasonList?.length.toInt() ?? 0) > 0) {
                  return ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ADSizedBox(
                        height: context.k_20,
                      ),
                      Text(
                        'select_reason'.localize(context),
                        style: ADTextStyle600.size18,
                      ).paddingBySide(
                        left: context.k_18,
                        right: context.k_18,
                      ),
                      ADSizedBox(
                        height: context.k_14,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: cancelReasonList?.length,
                        itemBuilder: (BuildContext context, int index) {
                          ///InkWell that will be used to handle the click event in Right List
                          return InkWell(
                            onTap: () => checkBoxAction(index),
                            child: Row(
                              children: [
                                Radio(
                                  value: index,
                                  groupValue: _selectedIndex,
                                  activeColor: context.adColors.black,
                                  onChanged: (ind) =>
                                      checkBoxAction(ind as int),
                                ),
                                InkWell(
                                  // onTap: () => checkBoxAction(index),
                                  child: Text(
                                    cancelReasonList?[index].name ?? '',
                                    style: ADTextStyle400.size16.setTextColor(
                                      context.adColors.blackTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ).paddingBySide(
                              right: context.k_18,
                              top: context.k_2,
                              bottom: context.k_2,
                            ),
                          );
                        },
                      ),
                      ElevatedButton(
                        onPressed: _isReasonSelected ? btnClick : null,
                        style: ElevatedButton.styleFrom(
                          primary: context.adColors.blueColor,
                          // elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(context.k_28),
                          ),
                          minimumSize: Size(
                            double.infinity,
                            _heightOfSubmitButton,
                          ), //////// HERE
                        ),
                        child: Text(
                          'continue'.localize(context),
                          style: ADTextStyle700.size18
                              .setTextColor(context.adColors.whiteTextColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ).paddingBySide(
                        top: _vSpacingOfSubmitButton,
                        bottom: context.k_36,
                        left: context.k_16,
                        right: context.k_16,
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              case Status.none:
                return const SizedBox.shrink();
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  void checkBoxAction(int index) {
    setState(() {
      _selectedIndex = index;
      _isReasonSelected = true;
    });
  }

  void btnClick() {
    if (cancelReasonList != null &&
        (cancelReasonList?.length.toInt() ?? 0) > 0 &&
        _isReasonSelected) {
      final CancelReason cancelReasonObj =
          cancelReasonList?[_selectedIndex] ?? CancelReason();
      widget.selectedPaxTripToCancel.cancelReason = cancelReasonObj;

      FlightBookingGaAnalytics().bookingCancelAnalyticsData(
        ClickEvents.book_flight_cancellation_reason,
        cancelReasonObj.name,
      );

      navigateToScreenUsingNamedRouteWithArguments(
        context,
        flightBookingReviewDetailScreen,
        argumentObject: widget.selectedPaxTripToCancel,
      );
    }
  }
}
