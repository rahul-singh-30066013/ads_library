/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/analytics.dart';
import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/components/loyalty_points_component.dart';
import 'package:adani_airport_mobile/modules/components/sticky_price_bar.dart';
import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_create_itinerary_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_view_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pax_info_list.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/mini_rule_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/fare_detail_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/flight_information_section_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/insurance_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/show_baggage_coupon_widget.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/show_booking_detail_list.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/show_travellers_for_current_itinerary_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/zero_cancellation_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_common_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/review_flight_details_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/show_available_offers.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

///this class will used to show flight related details below stepper - will call from review and payment screen
class ShowReviewFlightDetails extends StatefulWidget {
  final FlightViewItineraryResponseModel? flightViewItineraryResponseModel;
  final ReviewScreenType reviewScreenType;
  final GlobalKey<ShakeWidgetState>? shakeKeyReview;

  final ReviewFlightDetailsState? flightBookingReviewState;
  final ADTapCallback? onTapHandler;
  final ScrollController? scrollController;
  final SelectedFlightModel? selectedFlightModel;
  final PaymentMethodState? paymentMethodViewModel;

  const ShowReviewFlightDetails({
    Key? key,
    required this.flightViewItineraryResponseModel,
    required this.reviewScreenType,
    this.shakeKeyReview,
    this.onTapHandler,
    this.flightBookingReviewState,
    this.scrollController,
    this.selectedFlightModel,
    this.paymentMethodViewModel,
  }) : super(key: key);

  @override
  State<ShowReviewFlightDetails> createState() =>
      _ShowReviewFlightDetailsState();
}

class _ShowReviewFlightDetailsState extends State<ShowReviewFlightDetails> {
  ScrollController? controller;
  final double fontSize15 = 15;
  FlightReviewDetailModel? flightReviewDetailModel;
  List<FlightReviewDetailInfo> flightReviewDetailInfo = [];
  MiniRuleDisplayModel? miniRuleDisplayModel;
  List<PaxInfoList> travellerList = [];
  Map<String, Object>? flightObjForGA;
  bool isFromFlightList = false;
  bool isInternational = false;
  double widthOfButton = 200.sp;
  double heightOfButton = 50.sp;

  @override
  void initState() {
    controller = widget.scrollController ?? ScrollController();
    flightReviewDetailModel =
        widget.flightViewItineraryResponseModel?.flightReviewDetailModel;
    flightReviewDetailInfo =
        flightReviewDetailModel?.flightReviewDetailInfo ?? [];
    miniRuleDisplayModel =
        flightReviewDetailModel?.miniRuleDisplayModel ?? MiniRuleDisplayModel();
    travellerList = widget.flightViewItineraryResponseModel?.paxInfoList ?? [];
    flightObjForGA = FlightBookingGaAnalytics().reviewFlightAnalyticsData(
      flightReviewDetailInfo,
      widget.flightViewItineraryResponseModel,
    );
    if (widget.reviewScreenType == ReviewScreenType.flightList) {
      isFromFlightList = true;
    }
    isInternational =
        widget.flightViewItineraryResponseModel?.isInternational ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Selector<AppSessionState, bool?>(
        selector: (context, stateClass) => stateClass.isLoggedIn,
        builder: (BuildContext context, model, Widget? child) {
          return Stack(
            alignment: widget.reviewScreenType != ReviewScreenType.flightPayment
                ? Alignment.bottomCenter
                : Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom:
                      widget.reviewScreenType == ReviewScreenType.flightPayment
                          ? context.k_16
                          : context.k_60,
                  top: isFromFlightList
                      ? context.k_20
                      : widget.reviewScreenType ==
                              ReviewScreenType.flightPayment
                          ? context.k_20
                          : 0,
                ),
                child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    children: [
                      if (isFromFlightList &&
                          (widget.flightBookingReviewState?.filteredOfferList ??
                                  [])
                              .isNotEmpty)
                        ShowAvailableOffers(
                          offerList: widget.flightBookingReviewState
                                  ?.filteredOfferList ??
                              [],
                        ).paddingBySide(
                          bottom: context.k_20,
                          left: context.k_16,
                          right: context.k_16,
                        ),
                      FlightInformationSectionView(
                        flightReviewDetailInfoDetails: flightReviewDetailInfo,
                      ),
                      ShowBookingDetailList(
                        flightReviewDetailInfo: flightReviewDetailInfo,
                        reviewScreenType: widget.reviewScreenType,
                        tripType:
                            widget.flightViewItineraryResponseModel?.tripType ??
                                'O',
                        isInternational: isInternational,
                        miniRuleDisplayModel:
                            miniRuleDisplayModel ?? MiniRuleDisplayModel(),
                      ),
                      ShowBaggageCouponWidget(
                        reviewScreenType: widget.reviewScreenType,
                        flightObjForGA: flightObjForGA ?? {},
                        isFromFlightList: isFromFlightList,
                        miniRuleDisplayModel:
                            miniRuleDisplayModel ?? MiniRuleDisplayModel(),
                        flightViewItineraryResponseModel:
                            widget.flightViewItineraryResponseModel,
                        onTapHandler: widget.onTapHandler,
                      ),
                      ShowTravellersForCurrentItineraryView(
                        reviewScreenType: widget.reviewScreenType,
                        travellerList: travellerList,
                        isInternational: isInternational,
                      ),
                      // this condition is use for insurance is show or not
                      if (widget.reviewScreenType !=
                              ReviewScreenType.flightPayment &&
                          (widget.flightViewItineraryResponseModel
                                  ?.itineraryMetaData?.isInsuranceRequired ??
                              false))
                        InsuranceView(
                          flightViewItineraryResponseModel:
                              widget.flightViewItineraryResponseModel,
                        ),
                      if (widget.reviewScreenType !=
                              ReviewScreenType.flightPayment &&
                          (widget
                                  .flightViewItineraryResponseModel
                                  ?.itineraryMetaData
                                  ?.isZeroCancellationRequired ??
                              false))
                        ZeroCancellationView(
                          flightViewItineraryResponseModel:
                              widget.flightViewItineraryResponseModel,
                        ),
                      Divider(
                        height: context.k_8,
                        thickness: context.k_8,
                        color: context.adColors.containerGreyBg,
                      ),
                      if (widget.reviewScreenType !=
                          ReviewScreenType.flightPayment)
                        FareDetailView(
                          pricedItineraryList: widget
                              .flightViewItineraryResponseModel
                              ?.pricedItineraries,
                          paxInfoList: widget.flightViewItineraryResponseModel
                                  ?.paxInfoList ??
                              [],
                          reviewScreenType: widget.reviewScreenType,
                          shakeKeyReview: widget.shakeKeyReview,
                          priceSummary: widget
                              .flightViewItineraryResponseModel?.pricingSummary,
                          tripType: widget.flightViewItineraryResponseModel
                                      ?.tripType ==
                                  'O'
                              ? TripType.oneWay
                              : TripType.roundTrip,
                          reward: (widget.paymentMethodViewModel
                                      ?.isRedeemPointsChecked ??
                                  false)
                              ? widget.paymentMethodViewModel?.rewardPoint
                                      .value ??
                                  0
                              : 0,
                          totalAmount:
                              widget.paymentMethodViewModel?.totalAmount,
                          insurance: widget
                              .flightViewItineraryResponseModel?.insurance,
                          zeroCancellationSummary: widget
                              .flightViewItineraryResponseModel
                              ?.zeroCancellationSummary,
                        ),
                      if (isFromFlightList)
                        LoyaltyPointsComponent(
                          points: widget.flightViewItineraryResponseModel
                                  ?.loyaltyPotentialPoint ??
                              0,
                        ).paddingBySide(
                          left: context.k_16,
                          right: context.k_16,
                          top: context.k_20,
                          bottom: context.k_56,
                        ),
                    ],
                  ),
                ),
              ),
              if (isFromFlightList)
                StickyPriceBar(
                  price: FlightUtils.getPriceFormatWithSymbol(
                    price: widget.flightViewItineraryResponseModel
                            ?.pricingSummary?.totalFare
                            ?.toDouble() ??
                        0,
                  ),
                  onSubtitleTap: () => scrollToDown(widget.shakeKeyReview),

                  /// this is use for click and custom button
                  customButton: ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                        Size(
                          widthOfButton,
                          heightOfButton,
                        ),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            context.k_28,
                          ),
                        ),
                      ),
                      side: MaterialStateProperty.all(
                        BorderSide.none,
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        context.adColors.blueColor,
                      ),
                    ),
                    onPressed: () => navigateToTravellersDetailsScreen(
                      context,
                      flightObjForGA ?? {},
                    ),
                    child: Selector<ReviewFlightDetailsState, ADResponseState>(
                      selector: (context, stateClass) =>
                          stateClass.applyInsurance,
                      builder: (BuildContext context, value, Widget? child) {
                        return value.viewStatus == Status.loading
                            ? ADDotProgressView(
                                color: context.adColors.whiteTextColor,
                              )
                            : Text(
                                'continue'.localize(context),
                                style: ADTextStyle700.size16.setTextColor(
                                  context.adColors.whiteTextColor,
                                ),
                                maxLines: 1,
                              );
                      },
                    ),
                  ),
                  // onButtonTap: () => navigateToTravellersDetailsScreen(
                  //   context,
                  //   flightObjForGA ?? {},
                  // ),
                ),
            ],
          );
        },
      ),
    );
  }

  void scrollToDown(GlobalKey<ShakeWidgetState>? shakeKeyReview) {
    if (controller?.position.pixels == controller?.position.maxScrollExtent) {
      shakeKeyReview?.currentState?.shake();
    } else {
      controller?.animateTo(
        (controller ?? ScrollController()).position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 200),
      );
    }
  }

  void navigateToTravellersDetailsScreen(
    BuildContext context,
    Map<String, Object> flightObj,
  ) {
    context.read<ReviewFlightDetailsState>().setValueForVisibilityForStrip(
          value: false,
        );
    flightObj[Parameters.insurance_opt.name] =
        (widget.flightViewItineraryResponseModel?.insurance?.insured ?? false)
            ? 'Yes'
            : 'No';
    flightObj[Parameters.insurance_price.name] =
        widget.flightViewItineraryResponseModel?.insurance?.netAmt ?? 0;

    flightObj[Parameters.zero_cancellation_opt.name] = (widget
                .flightViewItineraryResponseModel
                ?.zeroCancellationSummary
                ?.isActive ??
            false)
        ? 'yes'
        : 'no';
    flightObj[Parameters.zero_cancellation_amount.name] = (widget
                .flightViewItineraryResponseModel
                ?.zeroCancellationSummary
                ?.isActive ??
            false)
        ? widget.flightViewItineraryResponseModel?.zeroCancellationSummary
                ?.netAmt ??
            0
        : 0;

    if (ProfileSingleton.profileSingleton.isLoggedIn) {
      if (context.read<ReviewFlightDetailsState>().result == null &&
          widget.flightViewItineraryResponseModel?.insurance?.baseAmt != null &&
          (widget.flightViewItineraryResponseModel?.itineraryMetaData
                  ?.isInsuranceRequired ??
              false) &&
          context.read<ReviewFlightDetailsState>().globalKey?.currentWidget !=
              null) {
        context.read<ReviewFlightDetailsState>().setErrorCodeVisible();
        Scrollable.ensureVisible(
          context.read<ReviewFlightDetailsState>().globalKey?.currentContext ??
              context,
        );
      } else {
        final Map<String, Object> couponEvent = {};
        couponEvent[Parameters.departure_date.name] =
            Analytics.flightBookingGAObject?[
                    Parameters.departure_date_with_iso.name] ??
                '';
        couponEvent[Parameters.return_date.name] = Analytics
                .flightBookingGAObject?[Parameters.return_date_with_iso.name] ??
            '';
        couponEvent[Parameters.coupon.name] =
            Analytics.flightBookingGAObject?[Parameters.coupon.name] ?? '';
        couponEvent[Parameters.coupon_value.name] =
            Analytics.flightBookingGAObject?[Parameters.coupon_value.name] ??
                '';
        couponEvent[Parameters.total_discount.name] =
            Analytics.flightBookingGAObject?[Parameters.coupon_value.name] ??
                '';
        couponEvent[Parameters.total_price.name] =
            Analytics.flightBookingGAObject?[Parameters.total_price.name] ??
                0.0;
        couponEvent[Parameters.cart_amount.name] =
            Analytics.flightBookingGAObject?[Parameters.cart_amount.name] ??
                0.0;
        couponEvent[Parameters.purchase_revenue.name] =
            Analytics.flightBookingGAObject?[Parameters.total_price.name] ??
                0.0;
        couponEvent[Parameters.value.name] =
            Analytics.flightBookingGAObject?[Parameters.total_price.name] ??
                0.0;

        flightObj.addAll(couponEvent);

        ClickEvents.book_flight_review.logEvent(parameters: flightObj);
        bool isRoundTrip = false;
        if (widget.flightViewItineraryResponseModel?.tripType == 'R' ||
            widget.flightViewItineraryResponseModel?.tripType == 'I') {
          isRoundTrip = true;
        }
        final selectedAFlight = SelectedFlightModel(
          pricedItineraryList:
              widget.flightViewItineraryResponseModel?.pricedItineraries,
          isRoundTrip: isRoundTrip,
          pricedItinerary:
              widget.flightViewItineraryResponseModel?.pricedItineraries?.first,
        );
        FlightBookingGaAnalytics().ecommerceGAEvents(
          ClickEvents.begin_checkout,
          selectedAFlight,
          flightObj,
        );
        navigateToScreenWithResult(
          context,
          travellersDetails,
          argumentObject: widget.flightViewItineraryResponseModel,
        ).then((value) {
          if (context.read<FlightCommonState>().isCouponRemovedFromBackend) {
            context.read<FlightCommonState>().isCouponRemovedFromBackend =
                false;
            widget.flightBookingReviewState?.viewItineraryDetails(
              widget.flightViewItineraryResponseModel?.itineraryId ?? '',
              context.read<FlightCommonState>().reviewedUserID ?? '',
            );
          }
        });
      }
    } else {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        signInScreen,
        argumentObject: SignInStatusModel(
          isLoginStatusTap: (value) =>
              value ? navigateWithLogin(context, flightObj) : null,
          isNotFromSplash: true,
          currentRouteName: reviewFlightDetails,
        ),
      );
    }
  }

  void navigateWithLogin(BuildContext context, Map<String, Object> flightObj) {
    Future.delayed(
      const Duration(milliseconds: 500),
      () => navigateToTravellersDetailsScreen(context, flightObj),
    );
  }
}
