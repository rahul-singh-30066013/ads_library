/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/build_guests_list.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/cancellation_data.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/package_service/package_details.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/pranaam_traveller_screen_widget_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CancellationDetails extends StatefulWidget {
  final CommonOrderDetailBaseResponse bookingDetailsResponseModel;
  final SiteCoreStateManagement? siteCoreStateManagement;
  final CancellationData cancellationData;
  final String bookingId;

  const CancellationDetails({
    Key? key,
    required this.bookingDetailsResponseModel,
    required this.siteCoreStateManagement,
    required this.cancellationData,
    required this.bookingId,
  }) : super(key: key);

  @override
  State<CancellationDetails> createState() => _CancellationDetailsState();
}

class _CancellationDetailsState extends State<CancellationDetails> {
  List<bool> guestsSelected = [true, true, true];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final BookingAndCancellationState bookingAndCancellationState =
        context.read<BookingAndCancellationState>();
    bookingAndCancellationState.guestsSelected.clear();
    bookingAndCancellationState.guestsSelected.addAll(
      widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail
              ?.travelers ??
          [],
    );
    bookingAndCancellationState.resetNonCancellationCount();
  }

  @override
  Widget build(BuildContext context) {
    const double bottomMargin = 35;
    final double _footerHeight = 60.sp;
    final detail =
        widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Cancel',
          style: ADTextStyle700.size22,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: context.k_16),
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: context.k_16,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.k_24,
              vertical: context.k_28,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.k_8),
              color: const Color(0xfff4f9ff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getCityName(
                    detail?.tripDetails?.serviceAirport ?? '',
                    context.read<SiteCoreStateManagement>(),
                  ),
                  style: ADTextStyle700.size22,
                ).paddingBySide(bottom: context.k_10),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: context.k_8,
                  children: [
                    Text(
                      detail?.tripDetails?.serviceTypeId == id_3
                          ? 'Departure (${ServiceBookingDetails.getInstance().getTravelSectorName(detail?.tripDetails?.travelSectorId ?? 0)})'
                          : '${ServiceBookingDetails.getInstance().getServiceName(detail?.tripDetails?.serviceTypeId ?? 0)} (${ServiceBookingDetails.getInstance().getTravelSectorName(detail?.tripDetails?.travelSectorId ?? 0)})',
                      style: ADTextStyle400.size18
                          .setTextColor(context.adColors.blackTextColor),
                    ).paddingBySide(right: context.k_12),
                    Icon(
                      Icons.circle,
                      size: circleRadius,
                      color: iconColor,
                    ).paddingBySide(right: context.k_12),
                    Text(
                      detail?.tripDetails?.flightName ?? '',
                      style: ADTextStyle400.size16
                          .setTextColor(context.adColors.blackTextColor),
                    ),
                  ],
                ).paddingBySide(bottom: context.k_10),
                Text(
                  '${formatDateTimeFlightServiceDate(
                    detail?.tripDetails?.serviceDateTime,
                  )} , ${formatDateTimeFlightService12Time(
                    detail?.tripDetails?.serviceDateTime,
                  )}',
                  style: ADTextStyle400.size16
                      .setTextColor(context.adColors.blackTextColor),
                ),
                if (detail?.tripDetails?.serviceTypeId == id_3)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runSpacing: context.k_8,
                        children: [
                          Text(
                            'Arrival (${ServiceBookingDetails.getInstance().getTravelSectorName(detail?.tripDetails?.travelSectorId ?? 0)})',
                            style: ADTextStyle400.size18.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                          ).paddingBySide(right: context.k_12),
                          Icon(
                            Icons.circle,
                            size: circleRadius,
                            color: iconColor,
                          ).paddingBySide(right: context.k_12),
                          Text(
                            detail?.roundTripDetail?.flightName ?? '',
                            style: ADTextStyle400.size16.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                          ),
                        ],
                      ).paddingBySide(bottom: context.k_10),
                      Text(
                        '${formatDateTimeFlightServiceDate(
                          detail?.roundTripDetail?.serviceDateTime,
                        )} , ${formatDateTimeFlightService12Time(
                          detail?.roundTripDetail?.serviceDateTime,
                        )}',
                        style: ADTextStyle400.size16
                            .setTextColor(context.adColors.blackTextColor),
                      ),
                    ],
                  ).paddingBySide(top: context.k_10)
                else
                  const SizedBox.shrink(),
              ],
            ),
          ),
          Text(
            'Please select guest details and submit',
            style: ADTextStyle700.size18,
          ).paddingBySide(bottom: context.k_30, top: context.k_14),
          BuildGuestsList(
            pranaamDetail: detail ?? const PranaamDetail(),
            isRoundTrip: false,
            siteCoreStateManagement: widget.siteCoreStateManagement,
          ),
          if (detail?.tripDetails?.serviceTypeId == id_3)
            Container(
              height: context.k_2,
              color: context.adColors.greyTextColor2,
            ).paddingBySide(top: context.k_28, bottom: context.k_30),
          if (detail?.tripDetails?.serviceTypeId == id_3)
            BuildGuestsList(
              pranaamDetail: detail ?? const PranaamDetail(),
              isRoundTrip: true,
              siteCoreStateManagement: widget.siteCoreStateManagement,
            ),
          ADSizedBox(
            height: context.k_38,
          ),
          Consumer<BookingAndCancellationState>(
            builder: (_, value, __) {
              return ElevatedButton(
                onPressed: value.guestsSelected.isEmpty
                    ? null
                    : () => navigateToScreenUsingNamedRouteWithArguments(
                          context,
                          pranaamCancelReviewDetails,
                          argumentObject: [
                            widget.bookingDetailsResponseModel,
                            context
                                .read<BookingAndCancellationState>()
                                .guestsSelected,
                            widget.bookingId,
                          ],
                        ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: context.adColors.blueColor,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(
                    horizontal: context.k_20,
                    vertical: context.k_16,
                  ),
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  'submit'.localize(context),
                  style: ADTextStyle700.size18.setTextColor(
                    context.adColors.whiteTextColor,
                  ),
                ),
              );
            },
          ),
          InkWell(
            onTap: () => {
              if (!DeBounce.isRedundantClick())
                {
                  initCancellationPoliciesApi(context),
                },
            },
            child: Text(
              'View Cancellation Policy',
              textAlign: TextAlign.center,
              style: ADTextStyle400.size16
                  .setTextColor(context.adColors.blackTextColor)
                  .copyWith(
                    decoration: TextDecoration.underline,
                  ),
            ).paddingBySide(
              top: context.k_20,
            ),
          ),
          const ADSizedBox(
            height: bottomMargin,
          ),
          Container(
            alignment: Alignment.center,
            height: _footerHeight,
            child: Text(
              'Note: Cancellation (full/partial) can only be done once.',
              textAlign: TextAlign.center,
              style: ADTextStyle400.size12
                  .setTextColor(context.adColors.greyTextColor),
            ),
          ),
        ],
      ),
    );
  }
}
