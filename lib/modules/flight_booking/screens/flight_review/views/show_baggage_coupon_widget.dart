/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_view_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/mini_rule_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/apply_coupon/flight_booking_apply_coupon.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/apply_coupon/flight_booking_coupon_list.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/baggage_and_cancellation_policies_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/review/views/baggage_and_policy_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/review_flight_details_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///this class will used to show baggage/coupon widget
class ShowBaggageCouponWidget extends StatelessWidget {
  const ShowBaggageCouponWidget({
    Key? key,
    required this.reviewScreenType,
    required this.miniRuleDisplayModel,
    required this.isFromFlightList,
    required this.flightObjForGA,
    this.flightViewItineraryResponseModel,
    this.onTapHandler,
  }) : super(key: key);
  final ReviewScreenType reviewScreenType;
  final bool isFromFlightList;
  final MiniRuleDisplayModel miniRuleDisplayModel;
  final Map<String, Object>? flightObjForGA;
  final FlightViewItineraryResponseModel? flightViewItineraryResponseModel;
  final ADTapCallback? onTapHandler;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isFromFlightList)
          Divider(
            height: context.k_8,
            thickness: context.k_8,
            color: context.adColors.containerGreyBg,
          ).paddingBySide(top: context.k_30),
        if (isFromFlightList)
          InkWell(
            onTap: () => showBaggageCancellationView(
              context,
              miniRuleDisplayModel,
              flightObjForGA ?? {},
            ),
            child: BaggageAndPolicyView(
              icon: Icons.shopping_bag_rounded,
              title: 'baggage_and_cancellation_policy'.localize(context),
            ),
          ),
        if (isFromFlightList)
          Divider(
            height: context.k_8,
            thickness: context.k_8,
            color: context.adColors.containerGreyBg,
          ),
        if (reviewScreenType != ReviewScreenType.flightPayment)
          InkWell(
            onTap: () => flightViewItineraryResponseModel?.promoCoupon == null
                ? openCouponList(
                    context,
                    flightViewItineraryResponseModel,
                  )
                : null,
            child: FlightBookingApplyCoupon(
              leftHeader: 'apply_coupon_code'.localize(context),
              onTapHandler: () => onTapHandler?.call(),
              promoCoupon: flightViewItineraryResponseModel?.promoCoupon,
            ).paddingBySide(
              left: context.k_16,
              right: context.k_16,
            ),
          ),
        if (reviewScreenType != ReviewScreenType.flightPayment)
          Divider(
            height: context.k_8,
            thickness: context.k_8,
            color: context.adColors.containerGreyBg,
          ),
      ],
    );
  }

  // //to show baggage view -mini rule
  void showBaggageCancellationView(
    BuildContext context,
    MiniRuleDisplayModel miniRuleDisplayModel,
    Map<String, Object> flightObjBaggageCancellation,
  ) {
    adShowBottomSheet(
      context: context,
      childWidget: BaggageAndCancellationPoliciesScreen(
        miniRuleDisplayModel: miniRuleDisplayModel,
      ),
      headerTitle: 'baggage_and_cancellation_policy'.localize(context),
    );
    ClickEvents.book_flight_baggage_cancellation_policy_viewed
        .logEvent(parameters: flightObjBaggageCancellation);
  }

  //to call/open coupon widget
  void openCouponList(
    BuildContext context,
    FlightViewItineraryResponseModel? flightViewItineraryResponseModel,
  ) {
    context.read<ReviewFlightDetailsState>().setValueForVisibilityForStrip(
          value: false,
        );
    if (ProfileSingleton.profileSingleton.isLoggedIn) {
      _callCouponScreenWidget(
        context,
        flightViewItineraryResponseModel?.itineraryId,
        flightViewItineraryResponseModel?.isInternational ?? false,
      );
      FlightBookingGaAnalytics().applyCouponClick(
        ClickEvents.book_flight_apply_coupon_click,
        'book_flight',
        'purchase',
        (flightViewItineraryResponseModel?.isInternational ?? false)
            ? 'international'
            : 'domestic',
        'login',
      );
    } else {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        signInScreen,
        argumentObject: SignInStatusModel(
          currentRouteName: reviewFlightDetails,
          isLoginStatusTap: (value) => value
              ? navigateWithLoginToCouponList(
                  context,
                  flightViewItineraryResponseModel?.itineraryId,
                  isInternational:
                      flightViewItineraryResponseModel?.isInternational ??
                          false,
                )
              : null,
          isNotFromSplash: true,
        ),
      );
      FlightBookingGaAnalytics().applyCouponClick(
        ClickEvents.book_flight_apply_coupon_click,
        'book_flight',
        'purchase',
        (flightViewItineraryResponseModel?.isInternational ?? false)
            ? 'international'
            : 'domestic',
        'guest',
      );
    }
  }

  void _callCouponScreenWidget(
    BuildContext context,
    String? itineraryId,
    bool isInternational,
  ) {
    adShowCouponBottomSheet(
      context: context,
      childWidget: FlightBookingCouponList(
        itineraryId: itineraryId ?? '',
        context: context,
        viewIntee: (value) => context
            .read<ReviewFlightDetailsState>()
            .updateReviewModelfromCoupon(value),
        isInternational: isInternational,
      ),
    );
  }

  void navigateWithLoginToCouponList(
    BuildContext context,
    String? itineraryId, {
    required bool isInternational,
  }) {
    Future.delayed(
      const Duration(milliseconds: 500),
      () => _callCouponScreenWidget(context, itineraryId, isInternational),
    );
  }
}
