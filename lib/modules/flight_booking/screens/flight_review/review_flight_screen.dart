/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/analytics/screen_events.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_create_itinerary_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_view_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/priced_itinerary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/price_increase_decrease_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/review_flight_status_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/show_review_flight_details.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_common_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/review_flight_details_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/internet_connection/no_internet_view.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

/// This class is used to review flight details in which
/// [ReviewFlightStatusView] is used to make stepper to show the status of your booking.
/// [ShowReviewFlightDetails] is used to show the booking details including source,destination, time ,status and terminal.

class ReviewFlightScreen extends StatefulWidget {
  const ReviewFlightScreen({
    Key? key,
    required this.selectedFlightModel,
  }) : super(key: key);

  final SelectedFlightModel selectedFlightModel;

  @override
  State<ReviewFlightScreen> createState() => _ReviewFlightScreenState();
}

class _ReviewFlightScreenState extends State<ReviewFlightScreen> {
  TripType? tripType;

  final double stepTextSize = 13;
  final shakeKey = GlobalKey<ShakeWidgetState>();

  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  ReviewFlightDetailsState flightBookingReviewState =
      ReviewFlightDetailsState();
  final List flightStatusList = [
    FlightStatusClass(name: 'Flight Details', statusCode: 1),
    FlightStatusClass(name: 'Traveller Details', statusCode: 0),
    FlightStatusClass(name: 'Payment', statusCode: 0),
  ];

  num totalFareFromList = 0;

  @override
  void initState() {
    super.initState();
    //Analytics screen event
    ScreenEvents.review_flight_details.log();
    context.read<FlightCommonState>().travellerPassengerResponseModel = null;
    context.read<FlightCommonState>().countryCodeData =
        ProfileSingleton.profileSingleton.countryCodeData;
    context.read<FlightCommonState>().reviewedUserID =
        ProfileSingleton.profileSingleton.userID;
    context.read<SiteCoreStateManagement>().fetchInsuranceData();
    flightBookingReviewState.createItinerary(
      widget.selectedFlightModel,
      context.read<FlightCommonState>().reviewedUserID ?? '',
    );
    tripType = widget.selectedFlightModel.isRoundTrip
        ? TripType.roundTrip
        : TripType.oneWay;
    if (tripType == TripType.roundTrip) {
      final List<PricedItinerary> pricedItineraryList =
          widget.selectedFlightModel.pricedItineraryList ?? [];
      if (pricedItineraryList.isNotEmpty) {
        final oneWayFare = pricedItineraryList
                .first.airItineraryPricingInfo?.totalFare?.amount ??
            0;
        final roundWayFare = pricedItineraryList
                .last.airItineraryPricingInfo?.totalFare?.amount ??
            0;
        totalFareFromList = pricedItineraryList.first.isDomestic
            ? oneWayFare + roundWayFare
            : oneWayFare;
      } else {
        totalFareFromList = widget.selectedFlightModel.pricedItinerary
                ?.airItineraryPricingInfo?.totalFare?.amount ??
            0;
      }
    } else {
      totalFareFromList = widget.selectedFlightModel.pricedItinerary
              ?.airItineraryPricingInfo?.totalFare?.amount ??
          0;
    }
    flightBookingReviewState.setValueForZeroCancellation(
      valueOfZeroCan: flightBookingReviewState.flightViewItineraryResponseModel
              ?.zeroCancellationSummary?.isActive ??
          false,
    );
    context.read<AppSessionState>().getProfileDetails();
  }

  @override
  void dispose() {
    rootScaffoldMessengerKey.currentState?.removeCurrentSnackBar();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<ReviewFlightDetailsState>(
      viewModel: flightBookingReviewState,
      child: ScaffoldMessenger(
        key: rootScaffoldMessengerKey,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: context.adColors.whiteTextColor,
            elevation: 0,
            title: Text(
              'review_flight_details'.localize(context),
              style: ADTextStyle700.size22.setTextColor(context.adColors.black),
            ),
            actions: [
              Center(
                child: Text(
                  'step_1/3'.localize(context),
                  style: ADTextStyle400.size14.setFontSize(stepTextSize),
                ).paddingBySide(right: context.k_16),
              ),
            ],
          ),
          body: _BuildPage(
            flightStatusList: flightStatusList,
            tripType: tripType,
            flightBookingReviewState: flightBookingReviewState,
            selectedFlightModel: widget.selectedFlightModel,
            shakeKey: shakeKey,
            selectedFlightFareFromList: totalFareFromList,
            rootScaffoldMessengerKey: rootScaffoldMessengerKey,
          ),
        ),
      ),
    );
  }
}

/// this method is used to create DashBoard page
class _BuildPage extends StatelessWidget {
  final List flightStatusList;
  final TripType? tripType;
  final ReviewFlightDetailsState flightBookingReviewState;
  final SelectedFlightModel selectedFlightModel;
  final GlobalKey<ShakeWidgetState>? shakeKey;
  final num selectedFlightFareFromList;
  final GlobalKey<ScaffoldMessengerState>? rootScaffoldMessengerKey;

  const _BuildPage({
    required this.flightStatusList,
    this.tripType,
    required this.flightBookingReviewState,
    Key? key,
    required this.selectedFlightModel,
    this.shakeKey,
    required this.selectedFlightFareFromList,
    this.rootScaffoldMessengerKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// this is use for bottom margin of strip
    final double marginFromBottom = 85.sp;
    return Selector<ReviewFlightDetailsState, ADResponseState>(
      selector: (context, viewModel) => viewModel.reviewDetails,
      builder: (context, value, Widget? child) {
        switch (value.viewStatus) {
          case Status.loading:
            return ReviewShimmer();
          case Status.error:
            return NoInternetView(
              statusCode: value.errorCode.toString(),
              pageMainDesc: value.errorCode.isNullOrEmpty
                  ? 'CTU000'.localize(context)
                  : value.errorCode.toString() == '51'
                      ? 'cant_find_you'.localize(context)
                      : value.errorCode.toString().safeLocalize(
                            context,
                            'CTU000'.localize(context),
                          ),
              pageSubDesc: value.errorCode.isNullOrEmpty
                  ? ''
                  : value.errorCode.toString() == '51'
                      ? 'please_check_your_internet'.localize(context)
                      : '',
            );
          case Status.complete:
            final FlightViewItineraryResponseModel?
                flightViewItineraryResponseModel =
                flightBookingReviewState.flightViewItineraryResponseModel;
            final currentFare = flightViewItineraryResponseModel
                    ?.pricingSummary?.totalFare
                    ?.toDouble() ??
                0;
            final offerValue =
                flightViewItineraryResponseModel?.promoCoupon?.offerValue ?? 0;
            if (selectedFlightFareFromList != currentFare &&
                offerValue <= 0 &&
                flightViewItineraryResponseModel?.insurance?.insured == null &&
                flightViewItineraryResponseModel
                        ?.zeroCancellationSummary?.isActive ==
                    null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                flightBookingReviewState.setValueForVisibilityForStrip(
                  value: true,
                );
              });
            }
            return Selector<ReviewFlightDetailsState, ADResponseState>(
              selector: (context, state) => state.applyInsurance,
              builder: (context, value, child) {
                return AbsorbPointer(
                  absorbing: value.viewStatus == Status.loading,
                  child: Stack(
                    children: [
                      ShowReviewFlightDetails(
                        selectedFlightModel: selectedFlightModel,
                        flightViewItineraryResponseModel:
                            flightViewItineraryResponseModel,
                        reviewScreenType: ReviewScreenType.flightList,
                        shakeKeyReview: shakeKey,
                        onTapHandler: () => apiCallForRemoveCoupon(
                          flightViewItineraryResponseModel,
                        ),
                        flightBookingReviewState: flightBookingReviewState,
                      ),

                      /// this is use for fare increase strip
                      Selector<ReviewFlightDetailsState, bool?>(
                        selector: (context, stateClass) =>
                            stateClass.valueForVisibleOfStrip,
                        builder: (
                          BuildContext context,
                          resultValue,
                          Widget? child,
                        ) {
                          return Visibility(
                            visible: resultValue ?? false,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: PriceIncreaseDecreaseView(
                                currentFlightFare: currentFare,
                                selectedFlightFareFromList:
                                    selectedFlightFareFromList,
                                onTap: () => flightBookingReviewState
                                    .setValueForVisibilityForStrip(
                                  value: false,
                                ),
                              ),
                            ).paddingBySide(
                              bottom: marginFromBottom,
                              right: context.k_16,
                              left: context.k_16,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          default:
            const ADSizedBox.shrink();
        }
        return const ADSizedBox.shrink();
      },
    );
  }

  void apiCallForRemoveCoupon(
    FlightViewItineraryResponseModel? flightViewItineraryResponseModel,
  ) {
    ///GA Offers coupon apply
    GaEvent.getInstance().offersCouponRemoveEvent(
      flightViewItineraryResponseModel?.promoCoupon?.promoCode ?? '',
      'book_flight',
    );
    ClickEvents.book_flight_coupon_code_removed
        .logEvent(parameters: GaEvent.getInstance().parameterMap);

    flightBookingReviewState.removeCoupon(
      flightViewItineraryResponseModel?.itineraryId ?? '',
      flightViewItineraryResponseModel?.promoCoupon?.promoCode ?? '',
    );
  }

  //to show toast, in case of price change
  // void showPriceChangedSnackBar(
  //   BuildContext context,
  //   num selectedFlightFareFromList,
  //   double currentFare,
  //   GlobalKey<ScaffoldMessengerState>? rootScaffoldMessengerKey,
  // ) {
  //   const double elevation = 20;
  //   final showSnackBar = rootScaffoldMessengerKey?.currentState?.showSnackBar(
  //     SnackBar(
  //       elevation: elevation,
  //       margin: EdgeInsets.symmetric(
  //         horizontal: context.k_16,
  //         vertical: context.k_64,
  //       ),
  //       behavior: SnackBarBehavior.floating,
  //       content: PriceIncreaseDecreaseView(
  //         currentFlightFare: 2.0,
  //         selectedFlightFareFromList: selectedFlightFareFromList,
  //         onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
  //       ),
  //       duration: const Duration(
  //         days: 365,
  //       ),
  //       backgroundColor: Colors.transparent,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(
  //           Radius.circular(context.k_4),
  //         ),
  //       ),
  //     ),
  //   );
  //   adLog(showSnackBar.toString());
  // }
}

class ReviewShimmer extends StatelessWidget {
  ReviewShimmer({
    Key? key,
  }) : super(key: key);

  final double width152 = 152.sp;
  final double width170 = 170.sp;
  final double width52 = 52.sp;
  final double width198 = 198.sp;
  final double width130 = 130.sp;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.k_6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              height: context.k_20,
              width: width152,
            ),
            ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              height: context.k_26,
              width: double.infinity,
              rectanglePadding: const EdgeInsets.only(
                right: 10,
                left: 10,
                top: 2,
                bottom: 2,
              ),
            ),
            ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              height: context.k_20,
              width: width152,
            ),
            ADSizedBox(
              height: context.k_10,
            ),
            ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              height: width170,
              width: double.infinity,
            ),
            ADSizedBox(
              height: context.k_12,
            ),
            ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              height: width52,
              width: width198,
            ),
            ADSizedBox(
              height: context.k_16,
            ),
            ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              height: context.k_20,
              width: width130,
            ),
            ADSizedBox(
              height: context.k_32,
            ),
            ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              height: width52,
              width: double.infinity,
            ),
            ADSizedBox(
              height: context.k_8,
            ),
            ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              height: width52,
              width: double.infinity,
            ),
            ADSizedBox(
              height: context.k_6,
            ),
            // added extra shimmer to fill space
            ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              height: context.k_20,
              width: width130,
            ),
          ],
        ),
      ),
    );
  }
}
