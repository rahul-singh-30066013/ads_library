/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';

import 'package:adani_airport_mobile/analytics/analytics.dart';
import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/analytics/screen_events.dart';
import 'package:adani_airport_mobile/modules/components/sticky_price_bar.dart';
import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_create_itinerary_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/coupon_response/coupon_list_response.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/priced_itinerary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/security_key.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/flight_list_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/trip_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/flight_list_model_mapping_helper.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/flights_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/flight_booking_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/sort_filter_screen/sort_filter_widget.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/views/app_bar_title.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/views/date_section.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/views/flight_listing_item.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/views/flight_loading_animation.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/views/flights_listing_shimmer.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/views/international_flight_listing_item.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/views/one_way_trip_header.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/views/two_way_trip_header.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_common_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_listing_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/offers/screens/flight_list_offer_item.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/remote_config_service.dart';
import 'package:adani_airport_mobile/utils/internet_connection/no_internet_view.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

/// Flight Listing page
/// Oneway trip or two way
bool isOneWayTrip = true;

/// Displays SRP page when flights are searched
/// List of flights available
class FlightListingScreen extends StatefulWidget {
  const FlightListingScreen({
    Key? key,
    required this.flightBookingModel,
  }) : super(key: key);

  static const Color sortFilterColor = Color(0xff293449);

  /// Flight Booking model which contains -
  /// TripType, OneWayTrip, RoundTrip and Travellers data
  final FlightBookingModel flightBookingModel;

  @override
  State<FlightListingScreen> createState() => _FlightListingScreenState();
}

class _FlightListingScreenState extends State<FlightListingScreen>
    with TickerProviderStateMixin {
  /// Flight Booking model which contains -
  /// TripType, OneWayTrip, RoundTrip and Travellers data
  FlightBookingModel? flightBookingModel;

  /// this state class is used for handling flight listing
  FlightListingState? flightListingProvider;

  /// one way selected flight key to handle selection of flight
  SecurityKey? oneWaySelectedFlightKey;

  /// round trip selected flight key to handle selection of flight
  SecurityKey? roundTripSelectedFlightKey;

  /// selected flight for out bound
  FlightsDisplayModel? oneWaySelectedFlight;

  /// selected flight for in bound (if applicable)
  FlightsDisplayModel? roundTripSelectedFlight;

  /// Price information for round trip selected flight
  /// only available when any flight combination has offer
  PricedItinerary? specialSelectedFlightCombination;

  /// amount notifier for bottom navigation bar
  ValueNotifier<int> notifier = ValueNotifier(0);

  ValueNotifier<Status> stateNotifier = ValueNotifier(Status.loading);

  ///TODO: doc
  bool listItemOnTap = false;

  /// count for when to display sort and filter button
  int sortFilterButtonCount = 10;

  /// dates to display on Date Section header on SRP
  List<DateTime> fareCalendarList = [];

  StreamSubscription? connectivityStream;

  // static const int internetErrorCode = 51;

  DateTime searchDateTime = DateTime.now();

  ///set true of api call completed and false if initiated
  bool apiCallStatus = false;

  /// selected flight for international
  FlightsDisplayModel? internationalSelectedFlight;

  /// used to keep the inBoundUniqueKey made to track the right side selection in international round-trip
  String inBoundUniqueKey = '';

  /// used to keep the outBoundUniqueKey made to track the left side selection in international round-trip
  String outBoundUniqueKey = '';
  double initialSingleBannerHeight = 48.sp;
  double initialBannerHeight = 64.sp;
  bool isFlightLoadingInitially = false;
  bool isDomestic = true;
  int maxSeatThreshold = 0;
  bool isListDataAvailable = true;
  double singleBannerHeight = 48.sp;
  double bannerHeight = 64.sp;
  double bannerWidth = 150.sp;
  double animationStart = 0;
  double animationEnd = -200;
  AnimationController? _controller;
  Animation<double>? animation;
  int shimmerCount = 3;
  int twoCount = 2;

  @override
  void initState() {
    isFlightLoadingInitially = true;
    //Analytics screen event
    ScreenEvents.flight_listing_screen.log();
    flightBookingModel = widget.flightBookingModel;
    flightListingProvider = FlightListingState(widget.flightBookingModel);
    adLog('${FlightUtils.loyaltyParams}');
    flightListingProvider?.sectorId =
        (!(flightBookingModel?.isDomesticDepartureCity ?? false) ||
                !(flightBookingModel?.isDomesticArrivalCity ?? false))
            ? 'I'
            : 'D';
    isDomestic = flightListingProvider?.sectorId.toLowerCase() == 'd';
    fareCalendarList = FlightUtils.createFareCalendarDateList(
      journeyDate: flightBookingModel?.oneWayTrip?.date,
    );
    apiCallStatus = false;

    ///first fetched flights
    ///then sorted flights by price
    if (FlightUtils.isOnewayTrip(flightBookingModel?.tripType)) {
      flightListingProvider?.getFareCalendar(fareCalendarList);
      flightListingProvider?.getFlights();
    } else if (FlightUtils.isRoundTrip(flightBookingModel?.tripType)) {
      flightListingProvider?.getFlights();
    } else {
      ///Multi-city handled for future cases
      flightListingProvider?.getFlights();
    }
    getMaxSeatThreshold();
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..addListener(
        () => setState(() {
          adLog('animation controller');
        }),
      );
    animation = Tween(begin: animationStart, end: animationEnd)
        .animate(_controller ?? AnimationController(vsync: this));
  }

  @override
  void dispose() {
    connectivityStream?.cancel();
    super.dispose();
  }

  SortType _getOutBoundSelectedSortType() {
    switch (flightListingProvider?.outBoundSelectedFilterButtonType) {
      case FlightSort.byTime:
        return flightListingProvider?.outBoundTimeSortType ?? SortType.des;
      case FlightSort.byDuration:
        return flightListingProvider?.outBoundDurationSortType ?? SortType.des;
      case FlightSort.byPrice:
        return flightListingProvider?.outBoundPriceSortType ?? SortType.des;
      default:
        break;
    }
    return SortType.des;
  }

  SortType _getInBoundSelectedSortType() {
    switch (flightListingProvider?.inBoundSelectedFilterButtonType) {
      case FlightSort.byTime:
        return flightListingProvider?.inBoundTimeSortType ?? SortType.des;
      case FlightSort.byDuration:
        return flightListingProvider?.inBoundDurationSortType ?? SortType.des;
      case FlightSort.byPrice:
        return flightListingProvider?.inBoundPriceSortType ?? SortType.des;
      default:
        break;
    }
    return SortType.des;
  }

  void onDateChanged(DateTime updatedDate) {
    isFlightLoadingInitially = false;
    oneWaySelectedFlight = null;
    oneWaySelectedFlightKey = null;
    internationalSelectedFlight = null;
    notifier.value = 0;
    stateNotifier.value = Status.loading;

    if (flightBookingModel?.oneWayTrip?.date != updatedDate) {
      flightBookingModel?.oneWayTrip?.date = updatedDate;
    }

    /// set the sort type again to price type in ascending order for UI
    setState(() {
      flightListingProvider?.outBoundPriceSortType = SortType.asc;
      flightListingProvider?.outBoundSelectedFilterButtonType =
          FlightSort.byPrice;
    });

    apiCallStatus = false;

    /// sort the flight listing for updated date
    flightListingProvider?.getFlights().then(
      (value) {
        flightListingProvider?.sortFlight(
          flightSort: FlightSort.byPrice,
          sortType: SortType.asc,
          isTypeReturn: false,
        );
      },
    );
  }

  void _refreshOnPopOfReviewPage() {
    if (FlightUtils.isOnewayTrip(flightBookingModel?.tripType)) {
      oneWaySelectedFlight = null;
      oneWaySelectedFlightKey = null;
      internationalSelectedFlight = null;
      notifier.value = 0;
      stateNotifier.value = Status.loading;
    }

    if (context.read<FlightCommonState>().isNeedRefresh) {
      flightListingProvider?.listItemSelector = false;
      apiCallStatus = false;
      flightListingProvider?.resetHeaderSort();
      flightListingProvider
        ?..getFareCalendar(fareCalendarList)
        ..getFlights();
      searchDateTime = DateTime.now();
    }
    setState(() {
      ///TODO: To update state
    });
  }

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<FlightListingState>(
      viewModel: flightListingProvider ??
          FlightListingState(widget.flightBookingModel),
      child: Selector<FlightListingState, Status>(
        selector: (_, viewModel) =>
            viewModel.flightListingState.viewStatus ?? Status.loading,
        builder: (context, flightData, child) {
          return isFlightLoadingInitially && flightData == Status.loading
              ? FlightLoadingAnimation(
                  flightBookingModel: widget.flightBookingModel,
                )
              : Scaffold(
                  backgroundColor: context.adColors.whiteTextColor,
                  appBar: AppBar(
                    centerTitle: false,
                    titleSpacing: 0,
                    backgroundColor: context.adColors.whiteTextColor,
                    iconTheme: IconThemeData(color: context.adColors.black),
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(bottom: context.k_16),
                        child: TextButton(
                          style: ButtonStyle(
                            overlayColor: MaterialStateColor.resolveWith(
                              (
                                states,
                              ) =>
                                  context.adColors.cardBackgroundColor,
                            ),
                          ),
                          child: Text(
                            'edit_'.localize(context),
                            style: ADTextStyle500.size14
                                .setTextColor(
                                  context.adColors.blackTextColor,
                                )
                                .copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                          onPressed: () => editButtonClickHandle(),
                        ),
                      ),
                    ],
                    elevation: 0,
                    title: AppBarTitle(flightBookingModel: flightBookingModel)
                        .paddingBySide(top: context.k_8),
                  ),
                  body: SafeArea(
                    child: Selector<FlightListingState, ADResponseState>(
                      selector: (context, viewModel) => viewModel.offerState,
                      builder: (context, value, child) {
                        final offerCount =
                            (flightListingProvider?.filteredOfferList ?? [])
                                .length;
                        return AbsorbPointer(
                          absorbing: value.viewStatus == Status.loading,
                          child: Column(
                            children: [
                              SizedBox(
                                height: offerCount > 0 &&
                                        value.viewStatus == Status.complete
                                    ? context.k_10
                                    : value.viewStatus == Status.loading
                                        ? context.k_10
                                        : 0,
                              ),
                              if (offerCount > 0 &&
                                  value.viewStatus == Status.complete)
                                AnimatedContainer(
                                  height: offerCount == 1
                                      ? singleBannerHeight
                                      : bannerHeight,
                                  duration: const Duration(milliseconds: 500),
                                  child: AnimatedBuilder(
                                    animation: _controller ??
                                        AnimationController(vsync: this),
                                    builder: (context, child) {
                                      return Transform.translate(
                                        offset: Offset(
                                          0,
                                          animation?.value ?? 0,
                                        ),
                                        child: value.viewStatus ==
                                                Status.complete
                                            ? offerCount <= twoCount
                                                ? Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: context.k_16,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              FlightListOfferItem(
                                                            item: flightListingProvider
                                                                    ?.filteredOfferList
                                                                    .first ??
                                                                const CouponDetails(),
                                                            isEnableClick:
                                                                (flightListingProvider
                                                                            ?.filteredOfferList
                                                                            .first
                                                                            .promoCode ??
                                                                        '') !=
                                                                    '1',
                                                          ),
                                                        ),
                                                        if (offerCount ==
                                                            twoCount)
                                                          SizedBox(
                                                            width: context.k_10,
                                                          ),
                                                        if (offerCount ==
                                                            twoCount)
                                                          Expanded(
                                                            child:
                                                                FlightListOfferItem(
                                                              item: flightListingProvider
                                                                          ?.filteredOfferList[
                                                                      1] ??
                                                                  const CouponDetails(),
                                                              isEnableClick: (flightListingProvider
                                                                          ?.filteredOfferList
                                                                          .first
                                                                          .promoCode ??
                                                                      '') !=
                                                                  '1',
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  )
                                                : SizedBox(
                                                    height: bannerHeight,
                                                    child: ListView.separated(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal:
                                                            context.k_16,
                                                      ),
                                                      itemCount: offerCount,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      separatorBuilder:
                                                          (context, index) =>
                                                              ADSizedBox(
                                                        width: context.k_10,
                                                      ),
                                                      itemBuilder:
                                                          (context, index) {
                                                        final item =
                                                            flightListingProvider
                                                                    ?.filteredOfferList[
                                                                index];
                                                        return FlightListOfferItem(
                                                          item: item ??
                                                              const CouponDetails(),
                                                          isEnableClick:
                                                              (item?.promoType ??
                                                                      '') !=
                                                                  '1',
                                                          bannerWidth:
                                                              bannerWidth,
                                                        );
                                                      },
                                                    ),
                                                  )
                                            : value.viewStatus == Status.loading
                                                ? ListView.separated(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: context.k_12,
                                                    ),
                                                    itemCount: shimmerCount,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            ADSizedBox(
                                                      width: context.k_10,
                                                    ),
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Column(
                                                        children: [
                                                          ADShimmerWidget
                                                              .shimmerShape(
                                                            type: ShimmerType
                                                                .squareBox,
                                                            height:
                                                                bannerHeight,
                                                            width: bannerWidth,
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  )
                                                : const SizedBox.shrink(),
                                      );
                                    },
                                  ),
                                ),
                              if (isOneWayTrip &&
                                  flightBookingModel?.travellers?.travelClass ==
                                      TravelClass.economy)
                                DateSection(
                                  dateTime: fareCalendarList,
                                  tripDetailModel:
                                      widget.flightBookingModel.oneWayTrip,
                                  dateTapCallBack: (DateTime updatedDate) =>
                                      onDateChanged(updatedDate),
                                )
                              else
                                ADSizedBox(height: context.k_16),
                              Selector<FlightListingState, ADResponseState>(
                                selector: (context, viewModel) =>
                                    viewModel.flightListingState,
                                builder: (context, value, Widget? child) {
                                  return Column(
                                    children: [
                                      if (isOneWayTrip || !isDomestic)
                                        AbsorbPointer(
                                          absorbing:
                                              flightData == Status.error ||
                                                  flightData == Status.loading,
                                          child: OneWayTripHeader(
                                            filterTapCallBack: (value) =>
                                                flightListingProvider
                                                    ?.sortClicked(
                                              sortButtonType: value,
                                              filterClick: false,
                                            ),
                                            selectedFilterButtonType:
                                                flightListingProvider
                                                        ?.outBoundSelectedFilterButtonType ??
                                                    FlightSort.byPrice,
                                            selectedSortType:
                                                _getOutBoundSelectedSortType(),
                                            isDomestic: isDomestic,
                                          ),
                                        )
                                      else
                                        isDomestic
                                            ? AbsorbPointer(
                                                absorbing: flightData ==
                                                        Status.error ||
                                                    flightData ==
                                                        Status.loading,
                                                child: TwoWayTripHeader(
                                                  outBoundFilterTapCallBack:
                                                      (value) =>
                                                          flightListingProvider
                                                              ?.sortClicked(
                                                    sortButtonType: value,
                                                    filterClick: false,
                                                  ),
                                                  inBoundFilterTapCallBack:
                                                      (value) =>
                                                          flightListingProvider
                                                              ?.sortClicked(
                                                    sortButtonType: value,
                                                    inBoundFilterButtonType:
                                                        value,
                                                    isTypeReturn: true,
                                                    filterClick: false,
                                                  ),
                                                  flightBookingModel:
                                                      widget.flightBookingModel,
                                                  outBoundSelectedFilterButtonType:
                                                      flightListingProvider
                                                              ?.outBoundSelectedFilterButtonType ??
                                                          FlightSort.byPrice,
                                                  inBoundSelectedFilterButtonType:
                                                      flightListingProvider
                                                              ?.inBoundSelectedFilterButtonType ??
                                                          FlightSort.byPrice,
                                                  outBoundSelectedSortType:
                                                      _getOutBoundSelectedSortType(),
                                                  inBoundSelectedSortType:
                                                      _getInBoundSelectedSortType(),
                                                ),
                                              )
                                            : const SizedBox.shrink(),
                                    ],
                                  );
                                },
                              ),
                              Selector<FlightListingState, ADResponseState>(
                                selector: (context, viewModel) =>
                                    viewModel.flightListingState,
                                builder: (context, value, Widget? child) {
                                  switch (value.viewStatus) {
                                    case Status.loading:
                                      return Expanded(
                                        child: FlightsListingShimmer(
                                          isDomestic: isDomestic,
                                        ),
                                      );
                                    case Status.error:
                                      return NoInternetView(
                                        statusCode: value.errorCode.toString(),
                                        pageMainDesc: value
                                                .errorCode.isNullOrEmpty
                                            ? ''
                                            : value.errorCode.toString() == '51'
                                                ? 'cant_find_you'.localize(
                                                    context,
                                                  )
                                                : value.errorCode
                                                    .toString()
                                                    .localize(context),
                                        pageSubDesc: value
                                                .errorCode.isNullOrEmpty
                                            ? ''
                                            : value.errorCode.toString() == '51'
                                                ? 'please_check_your_internet'
                                                    .localize(context)
                                                : '',
                                      );
                                    case Status.complete:
                                      final FlightListModel data =
                                          value.data ?? FlightListModel();
                                      final List<FlightsDisplayModel>
                                          outBoundFlightListing =
                                          data.outBoundFlightListing ?? [];
                                      final List<FlightsDisplayModel>
                                          inBoundFlightListing =
                                          data.inBoundFlightListing ?? [];
                                      listItemOnTap = flightListingProvider
                                              ?.listItemSelector ??
                                          false;
                                      final List<FlightsDisplayModel>
                                          internationalFlightListing =
                                          data.internationalFlightListingWithGroup ??
                                              [];
                                      if (isDomestic) {
                                        actionsToPerformOnAPIComplete(
                                          outBoundFlightListing,
                                          inBoundFlightListing,
                                        );
                                      } else {
                                        actionsToPerformOnAPICompleteInCaseInternational(
                                          internationalFlightListing,
                                        );
                                      }
                                      isListDataAvailable = isDataAvailable(
                                        outBoundFlightListing,
                                        inBoundFlightListing,
                                        internationalFlightListing,
                                      );
                                      return isDomestic
                                          ?
                                          //domestic
                                          Expanded(
                                              child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  if (outBoundFlightListing
                                                          .isNotEmpty ||
                                                      inBoundFlightListing
                                                          .isNotEmpty)
                                                    Row(
                                                      children: [
                                                        if (outBoundFlightListing
                                                            .isNotEmpty)
                                                          Expanded(
                                                            child: NotificationListener<
                                                                UserScrollNotification>(
                                                              onNotification:
                                                                  (notification) =>
                                                                      onScroll(
                                                                notification,
                                                              ),
                                                              child: ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .only(
                                                                  bottom:
                                                                      context
                                                                          .k_48,
                                                                ),
                                                                itemCount:
                                                                    outBoundFlightListing
                                                                        .length,
                                                                itemBuilder: (
                                                                  context,
                                                                  index,
                                                                ) {
                                                                  final FlightsDisplayModel
                                                                      outBoundFlightListingLocal =
                                                                      outBoundFlightListing[
                                                                          index];
                                                                  final FlightInfo
                                                                      flightDisplayInfo =
                                                                      outBoundFlightListingLocal
                                                                          .flightDisplayInfo;
                                                                  return InkWell(
                                                                    onTap: () =>
                                                                        onOneWayFlightTapped(
                                                                      outBoundFlightListingLocal,
                                                                    )?.then((
                                                                      value,
                                                                    ) {
                                                                      context.read<FlightCommonState>().isNeedRefresh = context
                                                                          .read<
                                                                              FlightCommonState>()
                                                                          .isNeedRefreshAfterATime(
                                                                            searchDateTime,
                                                                          );
                                                                      if (context
                                                                          .read<
                                                                              FlightCommonState>()
                                                                          .isNeedRefresh) {
                                                                        oneWaySelectedFlight =
                                                                            null;
                                                                        roundTripSelectedFlight =
                                                                            null;
                                                                      }
                                                                      _refreshOnPopOfReviewPage();
                                                                    }),
                                                                    child:
                                                                        FlightListingItem(
                                                                      isRoundTrip:
                                                                          !isOneWayTrip,
                                                                      flightDisplayInfo:
                                                                          flightDisplayInfo,
                                                                      isSelected: outBoundFlightListing[index]
                                                                              .pricedItinerary
                                                                              .securityKey ==
                                                                          oneWaySelectedFlightKey,
                                                                      sectorID:
                                                                          flightListingProvider
                                                                              ?.sectorId,
                                                                      innerFlightListItem:
                                                                          outBoundFlightListingLocal,
                                                                    ),
                                                                  );
                                                                },
                                                                separatorBuilder:
                                                                    (
                                                                  BuildContext
                                                                      context,
                                                                  int index,
                                                                ) {
                                                                  return Divider(
                                                                    indent:
                                                                        context
                                                                            .k_16,
                                                                    endIndent: isOneWayTrip
                                                                        ? context
                                                                            .k_16
                                                                        : 0,
                                                                    height: 1,
                                                                    thickness:
                                                                        1,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          )
                                                        else
                                                          Expanded(
                                                            child:
                                                                NoFlightsFound(
                                                              isFilterApplied:
                                                                  flightListingProvider
                                                                          ?.isFilterApplied ??
                                                                      false,
                                                              onResetTap: () =>
                                                                  setState(() {
                                                                flightListingProvider
                                                                        ?.isFilterApplied =
                                                                    false;
                                                                flightListingProvider
                                                                    ?.resetFilter();
                                                              }),
                                                            ),
                                                          ),
                                                        if (!isOneWayTrip)
                                                          const VerticalDivider(
                                                            width: 1,
                                                            thickness: 1,
                                                          ),
                                                        if (!isOneWayTrip)
                                                          inBoundFlightListing
                                                                  .isNotEmpty
                                                              ? Expanded(
                                                                  child: NotificationListener<
                                                                      UserScrollNotification>(
                                                                    onNotification:
                                                                        (notification) =>
                                                                            onScroll(
                                                                      notification,
                                                                    ),
                                                                    child: ListView
                                                                        .separated(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .only(
                                                                        bottom:
                                                                            context.k_48,
                                                                      ),
                                                                      itemCount:
                                                                          inBoundFlightListing
                                                                              .length,
                                                                      itemBuilder:
                                                                          (
                                                                        context,
                                                                        index,
                                                                      ) {
                                                                        final FlightsDisplayModel
                                                                            inBoundFlightListingLocal =
                                                                            inBoundFlightListing[index];
                                                                        final FlightInfo
                                                                            flightDisplayInfo =
                                                                            inBoundFlightListingLocal.flightDisplayInfo;
                                                                        return InkWell(
                                                                          onTap: () =>
                                                                              setState(
                                                                            () {
                                                                              flightListingProvider?.listItemSelector = true;
                                                                              roundTripSelectedFlightKey = inBoundFlightListingLocal.pricedItinerary.securityKey;
                                                                              roundTripSelectedFlight = inBoundFlightListingLocal;
                                                                            },
                                                                          ),
                                                                          child:
                                                                              FlightListingItem(
                                                                            isRoundTrip:
                                                                                !isOneWayTrip,
                                                                            isReturnTrip:
                                                                                true,
                                                                            isSelected:
                                                                                roundTripSelectedFlightKey == inBoundFlightListing[index].pricedItinerary.securityKey,
                                                                            flightDisplayInfo:
                                                                                flightDisplayInfo,
                                                                          ),
                                                                        );
                                                                      },
                                                                      separatorBuilder:
                                                                          (
                                                                        BuildContext
                                                                            context,
                                                                        int index,
                                                                      ) {
                                                                        return const Divider(
                                                                          indent:
                                                                              0,
                                                                          endIndent:
                                                                              16,
                                                                          height:
                                                                              1,
                                                                          thickness:
                                                                              1,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                )
                                                              : Expanded(
                                                                  child:
                                                                      NoFlightsFound(
                                                                    isFilterApplied:
                                                                        flightListingProvider?.isFilterApplied ??
                                                                            false,
                                                                    onResetTap:
                                                                        () =>
                                                                            setState(
                                                                      () {
                                                                        flightListingProvider?.isFilterApplied =
                                                                            false;
                                                                        flightListingProvider
                                                                            ?.resetFilter();
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                      ],
                                                    )
                                                  else
                                                    NoFlightsFound(
                                                      isFilterApplied:
                                                          flightListingProvider
                                                                  ?.isFilterApplied ??
                                                              false,
                                                      onResetTap: () =>
                                                          setState(() {
                                                        flightListingProvider
                                                                ?.isFilterApplied =
                                                            false;
                                                        flightListingProvider
                                                            ?.resetFilter();
                                                      }),
                                                    ),
                                                  SortFilterWidget(
                                                    flightListingProvider:
                                                        flightListingProvider,
                                                    isOneWay: isOneWayTrip,
                                                  ).paddingBySide(
                                                    bottom: context.k_12,
                                                  ),
                                                ],
                                              ),
                                            )
                                          :
                                          //international
                                          Expanded(
                                              child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  if (internationalFlightListing
                                                      .isNotEmpty)
                                                    Row(
                                                      children: [
                                                        if (internationalFlightListing
                                                            .isNotEmpty)
                                                          Expanded(
                                                            child: NotificationListener<
                                                                UserScrollNotification>(
                                                              onNotification:
                                                                  (notification) =>
                                                                      onScroll(
                                                                notification,
                                                              ),
                                                              child: ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .only(
                                                                  bottom:
                                                                      context
                                                                          .k_48,
                                                                ),
                                                                itemCount:
                                                                    internationalFlightListing
                                                                        .length,
                                                                itemBuilder: (
                                                                  context,
                                                                  index,
                                                                ) {
                                                                  final FlightsDisplayModel
                                                                      internationalFlightListingLocal =
                                                                      internationalFlightListing[
                                                                          index];
                                                                  final FlightInfo
                                                                      flightDisplayInfo =
                                                                      internationalFlightListingLocal
                                                                          .flightDisplayInfo;
                                                                  return InkWell(
                                                                    onTap: () =>
                                                                        {
                                                                      if (internationalFlightListingLocal
                                                                              .flightGroups
                                                                              .length >
                                                                          1)
                                                                        onInternationListItemTap(
                                                                          internationalFlightListingLocal
                                                                              .flightGroups,
                                                                          flightDisplayInfo,
                                                                        )
                                                                      else
                                                                        {
                                                                          Analytics.flightBookingGAObject?[Parameters
                                                                              .selection_type
                                                                              .name] = 'normal_select',
                                                                          onOneWayFlightTapped(
                                                                            internationalFlightListingLocal,
                                                                          )?.then(
                                                                            (
                                                                              value,
                                                                            ) {
                                                                              context.read<FlightCommonState>().isNeedRefresh = context.read<FlightCommonState>().isNeedRefreshAfterATime(
                                                                                    searchDateTime,
                                                                                  );
                                                                              if (context.read<FlightCommonState>().isNeedRefresh) {
                                                                                internationalSelectedFlight = null;
                                                                              }
                                                                              _refreshOnPopOfReviewPage();
                                                                            },
                                                                          ),
                                                                        },
                                                                    },
                                                                    child:
                                                                        InternationalFlightListingItem(
                                                                      isRoundTrip:
                                                                          !isOneWayTrip,
                                                                      flightDisplayInfo:
                                                                          flightDisplayInfo,
                                                                      sectorID:
                                                                          flightListingProvider
                                                                              ?.sectorId,
                                                                      innerFlightListItem:
                                                                          internationalFlightListingLocal,
                                                                      maxSeatThreshold:
                                                                          maxSeatThreshold,
                                                                      isMoreOptionVisible:
                                                                          true,
                                                                      isReturnFlightVisible:
                                                                          true,
                                                                      flightBookingModel:
                                                                          flightBookingModel,
                                                                    ),
                                                                  );
                                                                },
                                                                separatorBuilder:
                                                                    (
                                                                  BuildContext
                                                                      context,
                                                                  int index,
                                                                ) {
                                                                  return Divider(
                                                                    indent:
                                                                        context
                                                                            .k_16,
                                                                    endIndent:
                                                                        context
                                                                            .k_16,
                                                                    height: 1,
                                                                    thickness:
                                                                        1,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          )
                                                        else
                                                          Expanded(
                                                            child:
                                                                NoFlightsFound(
                                                              isFilterApplied:
                                                                  flightListingProvider
                                                                          ?.isFilterApplied ??
                                                                      false,
                                                              onResetTap: () =>
                                                                  setState(() {
                                                                flightListingProvider
                                                                        ?.isFilterApplied =
                                                                    false;
                                                                flightListingProvider
                                                                    ?.resetFilter();
                                                              }),
                                                            ),
                                                          ),
                                                      ],
                                                    )
                                                  else
                                                    NoFlightsFound(
                                                      isFilterApplied:
                                                          flightListingProvider
                                                                  ?.isFilterApplied ??
                                                              false,
                                                      onResetTap: () =>
                                                          setState(() {
                                                        flightListingProvider
                                                                ?.isFilterApplied =
                                                            false;
                                                        flightListingProvider
                                                            ?.resetFilter();
                                                      }),
                                                    ),
                                                  SortFilterWidget(
                                                    flightListingProvider:
                                                        flightListingProvider,
                                                    isOneWay: isOneWayTrip,
                                                  ).paddingBySide(
                                                    bottom: context.k_12,
                                                  ),
                                                ],
                                              ),
                                            );
                                    default:
                                  }
                                  return const SizedBox.shrink();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  bottomNavigationBar: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /*ValueListenableBuilder<Status>(
                          valueListenable: stateNotifier,
                          builder: (context, Status state, child) {
                            final List<String> rewardText = FlightUtils
                                    .loyaltyParams?.appRewardText
                                    ?.split('#') ??
                                [];
                            return (isDomestic
                                            ? FlightUtils
                                                .loyaltyParams?.appRewardValue
                                            : FlightUtils.loyaltyParams
                                                ?.internationalRewardValue) !=
                                        null &&
                                    rewardText.isNotEmpty &&
                                    state == Status.complete
                                ? isListDataAvailable
                                    ? LoyaltyPointsComponent(
                                        customTextWidget: RichText(
                                          text: TextSpan(
                                            style: ADTextStyle400.size14,
                                            children: [
                                              TextSpan(text: rewardText.first),
                                              TextSpan(
                                                text: isDomestic
                                                    ? FlightUtils.loyaltyParams
                                                        ?.appRewardValue
                                                    : FlightUtils.loyaltyParams
                                                        ?.internationalRewardValue,
                                                style: ADTextStyle600.size14,
                                              ),
                                              TextSpan(text: rewardText.last),
                                            ],
                                          ),
                                        ),
                                        points: 1,
                                      )
                                    : const SizedBox.shrink()
                                : const SizedBox.shrink();
                          },
                        ),*/
                        ValueListenableBuilder(
                          valueListenable: notifier,
                          builder: (context, int updatedVal, child) {
                            final discountedFare =
                                _getTotalTripPrice().totalDisplayFare;
                            final normalFare = _getTotalTripPrice().totalFare;
                            final isSpecialFare = normalFare > 0;
                            return updatedVal != 0 &&
                                    roundTripSelectedFlight != null &&
                                    oneWaySelectedFlight != null &&
                                    FlightUtils.isRoundTrip(
                                      flightBookingModel?.tripType,
                                    )
                                ? StickyPriceBar(
                                    buttonText: 'book'.localize(context),
                                    price: FlightUtils.getPriceFormatWithSymbol(
                                      price: isSpecialFare
                                          ? normalFare
                                          : discountedFare,
                                    ),
                                    specialFare: isSpecialFare
                                        ? FlightUtils.getPriceFormatWithSymbol(
                                            price: discountedFare,
                                          )
                                        : null,
                                    subtitleText: 'includes_all_taxes'.localize(
                                      context,
                                    ),
                                    subtitleTextStyle: ADTextStyle400.size12,
                                    onButtonTap: () => onBookPressed(
                                      isSpecialFare: isSpecialFare,
                                    )?.then((
                                      value,
                                    ) {
                                      context
                                              .read<FlightCommonState>()
                                              .isNeedRefresh =
                                          context
                                              .read<FlightCommonState>()
                                              .isNeedRefreshAfterATime(
                                                searchDateTime,
                                              );
                                      if (context
                                          .read<FlightCommonState>()
                                          .isNeedRefresh) {
                                        oneWaySelectedFlight = null;
                                        roundTripSelectedFlight = null;
                                        internationalSelectedFlight = null;
                                      }
                                      _refreshOnPopOfReviewPage();
                                    }),
                                  )
                                : const SizedBox.shrink();
                          },
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

  bool onScroll(UserScrollNotification notification) {
    final ScrollDirection direction = notification.direction;
    if (direction == ScrollDirection.reverse) {
      final forward = _controller?.forward();
      setState(() {
        bannerHeight = 0;
        singleBannerHeight = 0;
      });
      adLog('$forward');
    } else if (direction == ScrollDirection.forward) {
      final reverse = _controller?.reverse();

      setState(() {
        bannerHeight = initialBannerHeight;
        singleBannerHeight = initialSingleBannerHeight;
      });
      adLog('$reverse');
    }

    return true;
  }

  bool isDataAvailable(
    List<FlightsDisplayModel> outBoundFlightListing,
    List<FlightsDisplayModel> inBoundFlightListing,
    List<FlightsDisplayModel> internationalFlightListing,
  ) {
    bool isListDataAvailable = false;
    if (isDomestic) {
      if (outBoundFlightListing.isNotEmpty || inBoundFlightListing.isNotEmpty) {
        isListDataAvailable = true;
      }
    } else {
      if (internationalFlightListing.isNotEmpty) {
        isListDataAvailable = true;
      }
    }
    updateStateNotifierWhenNoData();
    return isListDataAvailable;
  }

  //to handle tap - in case of international to show list of international flight using bottom sheet,
  void onInternationListItemTap(
    List<FlightsDisplayModel> flightGroups,
    FlightInfo flightInfo,
  ) {
    FlightBookingGaAnalytics().viewMoreFlights(
      ClickEvents.view_more_options,
      flightInfo.seat,
      flightInfo.price.toDouble(),
    );
    final double dividerHeight = 68.sp;
    final TripDetailModel? tripDetailModel =
        widget.flightBookingModel.roundTrip;
    final FlightListModelMappingHelper flightListModelMappingHelper =
        FlightListModelMappingHelper();
    final List<FlightsDisplayModel> outBoundFlight =
        flightListModelMappingHelper
            .setInterNationalOutBoundGroup(flightGroups);
    List<InterNationalInboundFlights> inBoundFlight =
        flightListModelMappingHelper
            .getInterNationalInBoundGroupBasedOnSelectedOutBound(
      flightGroups,
      outBoundFlight.first,
    );
    outBoundUniqueKey = outBoundFlight
        .first.pricedItinerary.itinerary.firstFlightDetails.uniqueKey;
    inBoundUniqueKey = inBoundFlight.first.flightsDisplayModel.pricedItinerary
        .itinerary.lastFlightDetails.uniqueKey;
    final ValueNotifier<List<InterNationalInboundFlights>>
        onTapOutBoundFlightItem = ValueNotifier(inBoundFlight);
    final ValueNotifier<String> inBoundFlightItem =
        ValueNotifier(inBoundUniqueKey);
    internationalSelectedFlight = outBoundFlight.first;
    int tempKeyIndex = 0;
    final adShow = adShowFilterBottomSheet(
      context: context,
      childWidget: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              if (!isOneWayTrip)
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
              if (!isOneWayTrip)
                Container(
                  height: context.k_48,
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: context.k_20,
                            ),
                            Text(
                              tripDetailModel?.toCity?.cityCode ?? '',
                              textAlign: TextAlign.center,
                              style: ADTextStyle700.size14
                                  .setTextColor(context.adColors.black),
                            ),
                            SvgPicture.asset(
                              'lib/assets/images/svg/icons/flight/one way.svg',
                              width: context.k_10,
                              color: context.adColors.darkGreyTextColor,
                            ).paddingBySide(
                              left: context.k_8,
                              right: context.k_8,
                            ),
                            Text(
                              tripDetailModel?.fromCity?.cityCode ?? '',
                              textAlign: TextAlign.center,
                              style: ADTextStyle700.size14
                                  .setTextColor(context.adColors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 1,
                        height: dividerHeight,
                        color: context.adColors.tileBorderColor,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: context.k_20,
                            ),
                            Text(
                              tripDetailModel?.fromCity?.cityCode ?? '',
                              textAlign: TextAlign.center,
                              style: ADTextStyle700.size14
                                  .setTextColor(context.adColors.black),
                            ),
                            SvgPicture.asset(
                              'lib/assets/images/svg/icons/flight/one way.svg',
                              width: context.k_10,
                              color: context.adColors.darkGreyTextColor,
                            ).paddingBySide(
                              left: context.k_8,
                              right: context.k_8,
                            ),
                            Text(
                              tripDetailModel?.toCity?.cityCode ?? '',
                              textAlign: TextAlign.center,
                              style: ADTextStyle700.size14
                                  .setTextColor(context.adColors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              if (!isOneWayTrip)
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
              if (flightGroups.isNotEmpty)
                ValueListenableBuilder<List<InterNationalInboundFlights>>(
                  valueListenable: onTapOutBoundFlightItem,
                  builder: (
                    context,
                    List<InterNationalInboundFlights> onTapFlight,
                    child,
                  ) {
                    return Flexible(
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              itemCount: !isOneWayTrip
                                  ? outBoundFlight.length
                                  : flightGroups.length,
                              itemBuilder: (
                                context,
                                index,
                              ) {
                                final FlightsDisplayModel
                                    outBoundFlightListingLocal = !isOneWayTrip
                                        ? outBoundFlight[index]
                                        : flightGroups[index];
                                final FlightInfo flightDisplayInfo =
                                    outBoundFlightListingLocal
                                        .flightDisplayInfo;
                                return InkWell(
                                  onTap: () => {
                                    Analytics.flightBookingGAObject?[Parameters
                                        .selection_type
                                        .name] = 'more_options_select',
                                    if (isOneWayTrip)
                                      onOneWayFlightTapped(
                                        outBoundFlightListingLocal,
                                      )
                                    else
                                      {
                                        internationalSelectedFlight =
                                            outBoundFlight[index],
                                        outBoundUniqueKey =
                                            outBoundFlight[index]
                                                .pricedItinerary
                                                .itinerary
                                                .firstFlightDetails
                                                .uniqueKey,
                                        inBoundFlight = flightListModelMappingHelper
                                            .getInterNationalInBoundGroupBasedOnSelectedOutBound(
                                          flightGroups,
                                          outBoundFlight[index],
                                        ),
                                        // inBoundUniqueKey = inBoundFlight
                                        //     .first
                                        //     .flightsDisplayModel
                                        //     .pricedItinerary
                                        //     .itinerary
                                        //     .uniqueKey,
                                        inBoundUniqueKey =
                                            inBoundFlight.length > tempKeyIndex
                                                ? inBoundFlight[tempKeyIndex]
                                                    .flightsDisplayModel
                                                    .pricedItinerary
                                                    .itinerary
                                                    .lastFlightDetails
                                                    .uniqueKey
                                                : inBoundFlight
                                                    .first
                                                    .flightsDisplayModel
                                                    .pricedItinerary
                                                    .itinerary
                                                    .lastFlightDetails
                                                    .uniqueKey,
                                        onTapOutBoundFlightItem.value = List.of(
                                          inBoundFlight,
                                        ),
                                      },
                                  },
                                  child: InternationalFlightListingItem(
                                    isRoundTrip: !isOneWayTrip,
                                    flightDisplayInfo: flightDisplayInfo,
                                    sectorID: flightListingProvider?.sectorId,
                                    innerFlightListItem:
                                        outBoundFlightListingLocal,
                                    maxSeatThreshold: maxSeatThreshold,
                                    isSelected: outBoundUniqueKey ==
                                        outBoundFlight[index]
                                            .pricedItinerary
                                            .itinerary
                                            .firstFlightDetails
                                            .uniqueKey,
                                    flightBookingModel: flightBookingModel,
                                  ),
                                );
                              },
                              separatorBuilder: (
                                BuildContext context,
                                int index,
                              ) {
                                return Divider(
                                  indent: 0,
                                  endIndent: isOneWayTrip ? context.k_16 : 0,
                                  height: 1,
                                  thickness: 1,
                                );
                              },
                            ),
                          ),
                          if (!isOneWayTrip)
                            const VerticalDivider(
                              width: 1,
                              thickness: 1,
                            ),
                          if (!isOneWayTrip)
                            ValueListenableBuilder<String>(
                              valueListenable: inBoundFlightItem,
                              builder: (
                                context,
                                String inBoundFlightKey,
                                child,
                              ) {
                                return Expanded(
                                  child: ListView.separated(
                                    itemCount: inBoundFlight.length,
                                    itemBuilder: (
                                      context,
                                      index,
                                    ) {
                                      final FlightsDisplayModel
                                          inBoundFlightListingLocal =
                                          inBoundFlight[index]
                                              .flightsDisplayModel;
                                      final FlightInfo flightDisplayInfo =
                                          inBoundFlight[index]
                                                  .flightsDisplayModel
                                                  .internationReturnDisplayInfo ??
                                              FlightInfo(
                                                unitPrice: 0,
                                                stops: '',
                                                price: 0,
                                                numberOfStops: 0,
                                                flightDuration: '',
                                                flightDepartureTime: '',
                                                flightArrivalTime: '',
                                                airLineName: '',
                                                airLineIcon: '',
                                                airLineCode: '',
                                                seat: 0,
                                                dayChange: false,
                                                isMultiCarrier: 0,
                                                journeyDays: 0,
                                                priceAndDuration: 0,
                                                timePriceDuration: 0,
                                                arrivalCity: '',
                                                departureCity: '',
                                                arrivalDate: '',
                                              );
                                      return InkWell(
                                        onTap: inBoundFlight[index].isEnabled
                                            ? () => {
                                                  internationalSelectedFlight =
                                                      inBoundFlight[index]
                                                          .flightsDisplayModel,
                                                  inBoundUniqueKey =
                                                      inBoundFlight[index]
                                                          .flightsDisplayModel
                                                          .pricedItinerary
                                                          .itinerary
                                                          .lastFlightDetails
                                                          .uniqueKey,
                                                  tempKeyIndex = index,
                                                  inBoundFlightItem.value =
                                                      inBoundUniqueKey,
                                                }
                                            : null,
                                        child: InternationalFlightListingItem(
                                          isRoundTrip: !isOneWayTrip,
                                          flightDisplayInfo: flightDisplayInfo,
                                          sectorID:
                                              flightListingProvider?.sectorId,
                                          innerFlightListItem:
                                              inBoundFlightListingLocal,
                                          maxSeatThreshold: maxSeatThreshold,
                                          isEnable:
                                              inBoundFlight[index].isEnabled,
                                          isSelected: inBoundUniqueKey ==
                                              inBoundFlight[index]
                                                  .flightsDisplayModel
                                                  .pricedItinerary
                                                  .itinerary
                                                  .lastFlightDetails
                                                  .uniqueKey,
                                          flightBookingModel:
                                              flightBookingModel,
                                          isReturnTrip: true,
                                        ),
                                      );
                                    },
                                    separatorBuilder: (
                                      BuildContext context,
                                      int index,
                                    ) {
                                      return const Divider(
                                        indent: 0,
                                        endIndent: 0,
                                        height: 1,
                                        thickness: 1,
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                        ],
                      ),
                    );
                  },
                )
              else
                NoFlightsFound(
                  isFilterApplied:
                      flightListingProvider?.isFilterApplied ?? false,
                  onResetTap: () => setState(() {
                    flightListingProvider?.isFilterApplied = false;
                    flightListingProvider?.resetFilter();
                  }),
                ),
            ],
          ),
        ),
        bottomNavigationBar: !isOneWayTrip
            ? SafeArea(
                bottom: false,
                child: StickyPriceBar(
                  buttonText: 'book'.localize(context),
                  price: FlightUtils.getPriceFormatWithSymbol(
                    price:
                        (flightGroups.first.flightDisplayInfo.price).toDouble(),
                  ),
                  subtitleText: 'includes_all_taxes'.localize(
                    context,
                  ),
                  subtitleTextStyle: ADTextStyle400.size12,
                  onButtonTap: () => onBookPressed(
                    isSpecialFare: true,
                    flightGroups: flightGroups,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
      headerTitle: 'more_options_with_same_price'.localize(context),
    );
    adLog('$adShow');
  }

  void updateStateNotifierWhenNoData() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      stateNotifier
        ..value = Status.none
        ..value = Status.complete;
    });
  }

  void actionsToPerformOnAPIComplete(
    List<FlightsDisplayModel> outBoundFlightListing,
    List<FlightsDisplayModel> inBoundFlightListing,
  ) {
    ///update total price from 0 to the first flight price
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifier.value = (oneWaySelectedFlight?.flightDisplayInfo.price ?? 0) +
          (roundTripSelectedFlight?.flightDisplayInfo.price ?? 0);
      stateNotifier.value = Status.complete;
    });

    /// initially selecting the first flight for outBound
    if (!listItemOnTap && outBoundFlightListing.isNotEmpty && !isOneWayTrip) {
      oneWaySelectedFlightKey =
          outBoundFlightListing.first.pricedItinerary.securityKey;
      oneWaySelectedFlight = outBoundFlightListing.first;
    } else if (outBoundFlightListing.isEmpty) {
      oneWaySelectedFlightKey = null;
      oneWaySelectedFlight = null;
    }

    /// initially selecting the first flight for inBound
    if (!isOneWayTrip && !listItemOnTap && inBoundFlightListing.isNotEmpty) {
      roundTripSelectedFlightKey =
          inBoundFlightListing.first.pricedItinerary.securityKey;
      roundTripSelectedFlight = inBoundFlightListing.first;
    } else if (inBoundFlightListing.isEmpty) {
      roundTripSelectedFlightKey = null;
      roundTripSelectedFlight = null;
    }

    /// Used to update prices on date header on SRP
    /// according to the listing of flights
    if (FlightUtils.isOnewayTrip(flightBookingModel?.tripType) &&
        !apiCallStatus) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        apiCallStatus = true;
        flightListingProvider?.updateFareCalendarStateWithSRP(
          selectedDate: flightBookingModel?.oneWayTrip?.date ?? DateTime.now(),
          newMinimumPrice:
              outBoundFlightListing.first.flightDisplayInfo.price.toDouble(),
        );
      });
    }
  }

  void actionsToPerformOnAPICompleteInCaseInternational(
    List<FlightsDisplayModel> internationalFlightListing,
  ) {
    ///update total price from 0 to the first flight price
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifier.value =
          internationalSelectedFlight?.flightDisplayInfo.price ?? 0;
      stateNotifier.value = Status.complete;
    });

    /* /// initially selecting the first flight for outBound
    if (!listItemOnTap &&
        internationalFlightListing.isNotEmpty &&
        !isOneWayTrip) {
      oneWaySelectedFlightKey =
          internationalFlightListing.first.pricedItinerary.securityKey;
      internationalSelectedFlight = internationalFlightListing.first;
    } else if (internationalFlightListing.isEmpty) {
      oneWaySelectedFlightKey = null;
      internationalSelectedFlight = null;
    }

    /// initially selecting the first flight for inBound
    if (!isOneWayTrip &&
        !listItemOnTap &&
        internationalFlightListing.isNotEmpty) {
      roundTripSelectedFlightKey =
          internationalFlightListing.first.pricedItinerary.securityKey;
      internationalSelectedFlight = internationalFlightListing.first;
    } else if (internationalFlightListing.isEmpty) {
      roundTripSelectedFlightKey = null;
      internationalSelectedFlight = null;
    }*/

    /// Used to update prices on date header on SRP
    /// according to the listing of flights
    if (FlightUtils.isOnewayTrip(flightBookingModel?.tripType) &&
        !apiCallStatus) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        apiCallStatus = true;
        flightListingProvider?.updateFareCalendarStateWithSRP(
          selectedDate: flightBookingModel?.oneWayTrip?.date ?? DateTime.now(),
          newMinimumPrice: internationalFlightListing
              .first.flightDisplayInfo.price
              .toDouble(),
        );
      });
    }
  }

  Future<dynamic>? onOneWayFlightTapped(
    FlightsDisplayModel outBoundFlightListingLocal,
  ) {
    setState(() {
      flightListingProvider?.listItemSelector = true;
      oneWaySelectedFlightKey =
          outBoundFlightListingLocal.pricedItinerary.securityKey;
      oneWaySelectedFlight = outBoundFlightListingLocal;
      if (!isDomestic) {
        internationalSelectedFlight = outBoundFlightListingLocal;
      }
    });

    if (isOneWayTrip || !isDomestic) {
      return onBookPressed(
        isSpecialFare: false,
      );
    }
    Analytics.flightBookingGAObject?[Parameters.outbound_price.name] =
        outBoundFlightListingLocal.pricedItinerary.airItineraryPricingInfo
                ?.totalBaseFare?.amount ??
            0;
    return null;
  }

  Future<dynamic>? onBookPressed({
    required bool isSpecialFare,
    List<FlightsDisplayModel>? flightGroups,
  }) {
    HapticFeedback.mediumImpact();
    isFlightLoadingInitially = false;
    if (flightBookingModel?.tripType == TripType.roundTrip &&
        _isFlightOverlapping() &&
        isDomestic) {
      SnackBarUtil.showSnackBar(
        context,
        'flight_overlapping_msg'.localize(context),
      );
    } else {
      final selectedFlightModel = isDomestic
          ? _getSelectedFlightModel(isSpecialFare: isSpecialFare)
          : _getSelectedInternationalFlightModel(flightGroups);

      // GA events calling on flight select
      flightBookingAnalyticsData(flightBookingModel, selectedFlightModel);

      if (selectedFlightModel != null) {
        searchDateTime = DateTime.now();
        return navigateToScreenWithResult(
          context,
          reviewFlightDetails,
          argumentObject: selectedFlightModel,
        );
      }
    }

    return null;
  }

  SelectedFlightModel? _getSelectedFlightModel({
    required bool isSpecialFare,
  }) {
    if (isOneWayTrip) {
      Analytics.flightBookingGAObject?[Parameters.outbound_price.name] =
          oneWaySelectedFlight?.pricedItinerary.airItineraryPricingInfo
                  ?.totalBaseFare?.amount ??
              0;
      Analytics.flightBookingGAObject?[Parameters.seats_left.name] =
          oneWaySelectedFlight?.flightDisplayInfo.seat ?? 0;
      Analytics.flightBookingGAObject?[Parameters.departure_datetime.name] =
          '${Analytics.flightBookingGAObject?[Parameters.departure_date.name]} ${oneWaySelectedFlight?.flightDisplayInfo.flightDepartureTime}';

      Analytics.flightBookingGAObject?[Parameters.return_datetime.name] =
          '${Analytics.flightBookingGAObject?[Parameters.return_date.name]} ${oneWaySelectedFlight?.flightDisplayInfo.flightArrivalTime}';

      Analytics.flightBookingGAObject?[Parameters.arrival_date.name] =
          FlightUtils.eventDateYYYYMMDDFormat(
        oneWaySelectedFlight?.flightDisplayInfo.arrivalDate ?? 'N/A',
        Constant.dateFormat5,
        Constant.dateFormat21,
      );

      Analytics.flightBookingGAObject?[Parameters.arrival_datetime.name] =
          '${Analytics.flightBookingGAObject?[Parameters.arrival_date.name]} ${oneWaySelectedFlight?.flightDisplayInfo.flightArrivalTime}';

      Analytics.flightBookingGAObject?[Parameters.outbound_airline.name] =
          oneWaySelectedFlight?.flightDisplayInfo.airLineCode;
      Analytics.flightBookingGAObject?[Parameters.inbound_airline.name] =
          FlightUtils.isRoundTrip(flightBookingModel?.tripType)
              ? oneWaySelectedFlight?.flightDisplayInfo.airLineCode
              : '';

      return SelectedFlightModel.forOnWayFareSelection(
        oneWaySelectedPricedItinerary:
            oneWaySelectedFlight?.pricedItinerary ?? PricedItinerary(),
      );
    } else if ((oneWaySelectedFlight != null) &&
        (roundTripSelectedFlight != null)) {
      if (isSpecialFare) {
        Analytics.flightBookingGAObject?[Parameters.outbound_price.name] =
            specialSelectedFlightCombination
                    ?.airItineraryPricingInfo?.totalBaseFare?.amount ??
                0;
        Analytics.flightBookingGAObject?[Parameters.inbound_price.name] =
            specialSelectedFlightCombination
                    ?.airItineraryPricingInfo?.totalBaseFare?.amount ??
                0;
        Analytics.flightBookingGAObject?[Parameters.seats_left.name] =
            specialSelectedFlightCombination
                    ?.airItinerary
                    ?.originDestinationOption
                    ?.first
                    .getLowestSeatFlightSegment
                    .seat ??
                0;

        Analytics.flightBookingGAObject?[Parameters.departure_datetime.name] =
            '${Analytics.flightBookingGAObject?[Parameters.departure_date.name]} ${specialSelectedFlightCombination?.airItinerary?.firstFlightDetails.getLowestSeatFlightSegment.departureTime ?? ''}';
        Analytics.flightBookingGAObject?[Parameters.arrival_date.name] =
            FlightUtils.eventDateYYYYMMDDFormat(
          specialSelectedFlightCombination?.airItinerary?.firstFlightDetails
                  .getLowestSeatFlightSegment.arrivalDate ??
              'N/A',
          Constant.dateFormat5,
          Constant.dateFormat21,
        );

        Analytics.flightBookingGAObject?[Parameters.arrival_datetime.name] =
            '${Analytics.flightBookingGAObject?[Parameters.arrival_date.name]} ${specialSelectedFlightCombination?.airItinerary?.firstFlightDetails.getLowestSeatFlightSegment.arrivalTime ?? ''}';
        Analytics.flightBookingGAObject?[Parameters.return_datetime.name] =
            '${Analytics.flightBookingGAObject?[Parameters.return_date.name]} ${specialSelectedFlightCombination?.airItinerary?.lastFlightDetails.getLowestSeatFlightSegment.arrivalTime ?? ''}';
        Analytics.flightBookingGAObject?[Parameters.outbound_airline.name] =
            specialSelectedFlightCombination?.airItinerary?.firstFlightDetails
                .flightSegmentDetails.validatingCarrier;
      } else {
        Analytics.flightBookingGAObject?[Parameters.outbound_price.name] =
            oneWaySelectedFlight?.pricedItinerary.airItineraryPricingInfo
                    ?.totalBaseFare?.amount ??
                0;
        Analytics.flightBookingGAObject?[Parameters.departure_datetime.name] =
            '${Analytics.flightBookingGAObject?[Parameters.departure_date.name]} ${oneWaySelectedFlight?.flightDisplayInfo.flightDepartureTime ?? '00:00'}';

        Analytics.flightBookingGAObject?[Parameters.return_arrival_date.name] =
            FlightUtils.eventDateYYYYMMDDFormat(
          roundTripSelectedFlight?.flightDisplayInfo.arrivalDate ?? 'N/A',
          Constant.dateFormat5,
          Constant.dateFormat21,
        );
        Analytics.flightBookingGAObject?[
                Parameters.return_arrival_datetime.name] =
            '${Analytics.flightBookingGAObject?[Parameters.return_arrival_date.name]} ${roundTripSelectedFlight?.flightDisplayInfo.flightArrivalTime ?? '00:00'}';

        Analytics.flightBookingGAObject?[Parameters.arrival_date.name] =
            FlightUtils.eventDateYYYYMMDDFormat(
          oneWaySelectedFlight?.flightDisplayInfo.arrivalDate ?? 'N/A',
          Constant.dateFormat5,
          Constant.dateFormat21,
        );

        Analytics.flightBookingGAObject?[Parameters.arrival_datetime.name] =
            '${Analytics.flightBookingGAObject?[Parameters.arrival_date.name]} ${oneWaySelectedFlight?.flightDisplayInfo.flightArrivalTime}';

        Analytics.flightBookingGAObject?[Parameters.return_datetime.name] =
            '${Analytics.flightBookingGAObject?[Parameters.return_date.name]} ${oneWaySelectedFlight?.flightDisplayInfo.flightArrivalTime ?? '00:00'}';

        Analytics.flightBookingGAObject?[Parameters.inbound_price.name] =
            roundTripSelectedFlight?.pricedItinerary.airItineraryPricingInfo
                    ?.totalBaseFare?.amount ??
                0;
        Analytics.flightBookingGAObject?[Parameters.seats_left.name] =
            roundTripSelectedFlight?.flightDisplayInfo.seat ?? 0;
        Analytics.flightBookingGAObject?[
                Parameters.round_trip_departure_time.name] =
            '${Analytics.flightBookingGAObject?[Parameters.return_date.name]} ${roundTripSelectedFlight?.flightDisplayInfo.flightDepartureTime ?? '00:00'}';

        Analytics.flightBookingGAObject?[
                Parameters.round_trip_arrival_time.name] =
            '${Analytics.flightBookingGAObject?[Parameters.return_date.name]} ${roundTripSelectedFlight?.flightDisplayInfo.flightArrivalTime ?? '00:00'}';
        Analytics.flightBookingGAObject?[Parameters.outbound_airline.name] =
            oneWaySelectedFlight?.flightDisplayInfo.airLineCode;
        Analytics.flightBookingGAObject?[Parameters.inbound_airline.name] =
            FlightUtils.isRoundTrip(flightBookingModel?.tripType)
                ? roundTripSelectedFlight?.flightDisplayInfo.airLineCode
                : '';
      }
      return isSpecialFare
          ? SelectedFlightModel.forSpecialFareSelection(
              selectedSpecialPricedItinerary:
                  specialSelectedFlightCombination ?? PricedItinerary(),
            )
          : SelectedFlightModel.forNormalFareSelection(
              oneWaySelectedPricedItinerary:
                  oneWaySelectedFlight?.pricedItinerary ?? PricedItinerary(),
              roundTripSelectedPricedItinerary:
                  roundTripSelectedFlight?.pricedItinerary ?? PricedItinerary(),
            );
    }
    return null;
  }

  SelectedFlightModel? _getSelectedInternationalFlightModel(
    List<FlightsDisplayModel>? flightGroups,
  ) {
    if (isOneWayTrip) {
      Analytics.flightBookingGAObject?[Parameters.outbound_price.name] =
          internationalSelectedFlight?.pricedItinerary.airItineraryPricingInfo
                  ?.totalBaseFare?.amount ??
              0;
      Analytics.flightBookingGAObject?[Parameters.seats_left.name] =
          internationalSelectedFlight?.flightDisplayInfo.seat ?? 0;
      Analytics.flightBookingGAObject?[Parameters.departure_datetime.name] =
          '${Analytics.flightBookingGAObject?[Parameters.departure_date.name]} ${internationalSelectedFlight?.flightDisplayInfo.flightDepartureTime}';

      Analytics.flightBookingGAObject?[Parameters.return_datetime.name] =
          '${Analytics.flightBookingGAObject?[Parameters.return_date.name]} ${internationalSelectedFlight?.flightDisplayInfo.flightArrivalTime}';

      Analytics.flightBookingGAObject?[Parameters.arrival_date.name] =
          FlightUtils.eventDateYYYYMMDDFormat(
        internationalSelectedFlight?.flightDisplayInfo.arrivalDate ?? 'N/A',
        Constant.dateFormat5,
        Constant.dateFormat21,
      );

      Analytics.flightBookingGAObject?[Parameters.arrival_datetime.name] =
          '${Analytics.flightBookingGAObject?[Parameters.arrival_date.name]} ${internationalSelectedFlight?.flightDisplayInfo.flightArrivalTime ?? '00:00'}';
      return SelectedFlightModel.forOnWayFareSelection(
        oneWaySelectedPricedItinerary:
            internationalSelectedFlight?.pricedItinerary ?? PricedItinerary(),
      );
    } else {
      Analytics.flightBookingGAObject?[Parameters.outbound_price.name] =
          internationalSelectedFlight?.pricedItinerary.airItineraryPricingInfo
                  ?.totalBaseFare?.amount ??
              0;
      Analytics.flightBookingGAObject?[Parameters.inbound_price.name] =
          roundTripSelectedFlight?.pricedItinerary.airItineraryPricingInfo
                  ?.totalBaseFare?.amount ??
              0;

      Analytics.flightBookingGAObject?[Parameters.arrival_date.name] =
          FlightUtils.eventDateYYYYMMDDFormat(
        internationalSelectedFlight?.flightDisplayInfo.arrivalDate ?? 'N/A',
        Constant.dateFormat5,
        Constant.dateFormat21,
      );

      Analytics.flightBookingGAObject?[Parameters.arrival_datetime.name] =
          '${Analytics.flightBookingGAObject?[Parameters.arrival_date.name]} ${internationalSelectedFlight?.flightDisplayInfo.flightArrivalTime ?? '00:00'}';

      Analytics.flightBookingGAObject?[Parameters.return_arrival_date.name] =
          FlightUtils.eventDateYYYYMMDDFormat(
        internationalSelectedFlight
                ?.internationReturnDisplayInfo?.arrivalDate ??
            'N/A',
        Constant.dateFormat5,
        Constant.dateFormat21,
      );
      Analytics
              .flightBookingGAObject?[Parameters.return_arrival_datetime.name] =
          '${Analytics.flightBookingGAObject?[Parameters.return_arrival_date.name]} ${internationalSelectedFlight?.internationReturnDisplayInfo?.flightArrivalTime ?? '00:00'}';

      Analytics.flightBookingGAObject?[Parameters.departure_datetime.name] =
          '${Analytics.flightBookingGAObject?[Parameters.departure_date.name]} ${internationalSelectedFlight?.flightDisplayInfo.flightDepartureTime ?? '00:00'}';

      Analytics.flightBookingGAObject?[Parameters.return_datetime.name] =
          '${Analytics.flightBookingGAObject?[Parameters.return_date.name]} ${internationalSelectedFlight?.flightDisplayInfo.flightArrivalTime ?? '00:00'}';

      Analytics.flightBookingGAObject?[Parameters.seats_left.name] =
          roundTripSelectedFlight?.flightDisplayInfo.seat ?? 0;
      Analytics.flightBookingGAObject?[
              Parameters.round_trip_departure_time.name] =
          '${Analytics.flightBookingGAObject?[Parameters.return_date.name]} ${internationalSelectedFlight?.internationReturnDisplayInfo?.flightDepartureTime ?? '00:00'}';

      Analytics
              .flightBookingGAObject?[Parameters.round_trip_arrival_time.name] =
          '${Analytics.flightBookingGAObject?[Parameters.return_date.name]} ${internationalSelectedFlight?.internationReturnDisplayInfo?.flightArrivalTime ?? '00:00'}';

      ///setting right selected item based on selected outbound key and inbound key
      setSelectedInternationalFlight(flightGroups ?? []);

      return SelectedFlightModel.forSpecialFareSelection(
        selectedSpecialPricedItinerary:
            internationalSelectedFlight?.pricedItinerary ?? PricedItinerary(),
      );
    }
  }

  void setSelectedInternationalFlight(List<FlightsDisplayModel> flightGroup) {
    if (flightGroup.isNotEmpty) {
      for (final object in flightGroup) {
        final combinedUniqueKey = object.pricedItinerary.itinerary.uniqueKey;
        if (combinedUniqueKey == '$outBoundUniqueKey$inBoundUniqueKey') {
          internationalSelectedFlight = object;
          break;
        }
      }
    }
  }

  ///This function is used to check the overlapping flights
  bool _isFlightOverlapping() {
    const int defaultTimeDifference = 3;
    final firstFlight =
        oneWaySelectedFlight?.pricedItinerary.arrivalEPOCHTime ??
            DateTime.now();
    final returnFlight =
        roundTripSelectedFlight?.pricedItinerary.departureEPOCHTime ??
            DateTime.now();
    final timeDifferenceInTwoFlights = returnFlight.difference(firstFlight);
    return timeDifferenceInTwoFlights.inHours < defaultTimeDifference;
  }

  SelectedFlightPrice _getIntTotalTripPrice() {
    final int oneWayPrice =
        internationalSelectedFlight?.flightDisplayInfo.price ?? 0;
    final int returnTripPrice =
        internationalSelectedFlight?.internationReturnDisplayInfo?.price ?? 0;

    return SelectedFlightPrice(
      totalFare: 0,
      totalDisplayFare:
          !isOneWayTrip ? returnTripPrice.toDouble() : oneWayPrice.toDouble(),
    );
  }

  SelectedFlightPrice _getTotalTripPrice() {
    final specialPrice = _getSpecialPrice();
    final int oneWayPrice = oneWaySelectedFlight?.flightDisplayInfo.price ?? 0;
    final int returnTripPrice =
        roundTripSelectedFlight?.flightDisplayInfo.price ?? 0;
    final totalPrice = oneWayPrice + returnTripPrice;
    if (specialPrice > 0 && specialPrice < totalPrice) {
      return SelectedFlightPrice(
        totalFare: totalPrice.toDouble(),
        totalDisplayFare: specialPrice,
      );
    }
    return SelectedFlightPrice(
      totalFare: 0,
      totalDisplayFare: totalPrice.toDouble(),
    );
  }

  //Get special method
  double _getSpecialPrice() {
    if (flightListingProvider?.flightListingState.viewStatus ==
        Status.complete) {
      final departureUniqueKey =
          oneWaySelectedFlight?.pricedItinerary.airItinerary?.uniqueKey;
      final arrivalUniqueKey =
          roundTripSelectedFlight?.pricedItinerary.airItinerary?.uniqueKey;
      final _uniqueKey = '$departureUniqueKey$arrivalUniqueKey';
      final specialPriceItineraryObj =
          (flightListingProvider?.flightListingState.data as FlightListModel)
              .getSpecialPricedItinerary(_uniqueKey);
      if (specialPriceItineraryObj != null) {
        specialSelectedFlightCombination = specialPriceItineraryObj;
      }
      adLog(
        'Total Fare = ${specialPriceItineraryObj?.airItineraryPricingInfo?.totalFare?.amount}',
      );
      return specialPriceItineraryObj
              ?.airItineraryPricingInfo?.totalFare?.amount ??
          0;
    }
    return 0;
  }

  void flightBookingAnalyticsData(
    FlightBookingModel? flightBookingModel,
    SelectedFlightModel? selectedFlightModel,
  ) {
    final selectBookingObject = <String, Object?>{
      Parameters.category.name: 'book_flight',
      Parameters.sub_category.name: 'purchase',
      Parameters.trip_type.name: flightBookingModel?.tripType.name,
      Parameters.booking_class.name:
          flightBookingModel?.travellers?.travelClass?.name,
      Parameters.departure_station.name:
          flightBookingModel?.oneWayTrip?.fromCity?.cityCode,
      Parameters.arrival_station.name:
          flightBookingModel?.oneWayTrip?.toCity?.cityCode,
      Parameters.market.name:
          Analytics.flightBookingGAObject?[Parameters.market.name] ?? '',
      Parameters.departure_date.name: FlightUtils.eventDateYYYYMMDDFormat(
        flightBookingModel?.oneWayTrip?.date.toString() ?? 'N/A',
        Constant.dateFormat12,
        Constant.dateFormat22,
      ),
      Parameters.return_date.name: FlightUtils.isRoundTrip(
        flightBookingModel?.tripType,
      )
          ? FlightUtils.eventDateYYYYMMDDFormat(
              flightBookingModel?.roundTrip?.date.toString() ?? 'N/A',
              Constant.dateFormat12,
              Constant.dateFormat22,
            )
          : 'N/A',
      Parameters.departure_datetime.name: FlightUtils.eventDateYYYYMMDDFormat(
        Analytics.flightBookingGAObject?[Parameters.departure_datetime.name]
                .toString() ??
            'N/A',
        Constant.dateFormat23,
        Constant.dateFormat22,
      ),
      Parameters.return_datetime.name: FlightUtils.isRoundTrip(
        flightBookingModel?.tripType,
      )
          ? FlightUtils.eventDateYYYYMMDDFormat(
              Analytics.flightBookingGAObject?[
                          Parameters.round_trip_departure_time.name]
                      .toString() ??
                  'N/A',
              Constant.dateFormat23,
              Constant.dateFormat22,
            )
          : 'N/A',
      Parameters.arrival_datetime.name: FlightUtils.eventDateYYYYMMDDFormat(
        Analytics.flightBookingGAObject?[Parameters.arrival_datetime.name]
                .toString() ??
            'N/A',
        Constant.dateFormat23,
        Constant.dateFormat22,
      ),
      Parameters.return_arrival_datetime.name: FlightUtils.isRoundTrip(
        flightBookingModel?.tripType,
      )
          ? FlightUtils.eventDateYYYYMMDDFormat(
              Analytics.flightBookingGAObject?[
                          Parameters.return_arrival_datetime.name]
                      .toString() ??
                  'N/A',
              Constant.dateFormat23,
              Constant.dateFormat22,
            )
          : 'N/A',
      Parameters.pax_count.name:
          (flightBookingModel?.travellers?.totalTravellers ?? 0) -
              (flightBookingModel?.travellers?.infants ?? 0),
      Parameters.child_count.name: flightBookingModel?.travellers?.children,
      Parameters.infant_count.name: flightBookingModel?.travellers?.infants,
      Parameters.total_price.name: isDomestic
          ? _getTotalTripPrice().totalDisplayFare
          : _getIntTotalTripPrice().totalDisplayFare,
      Parameters.travel_type.name:
          Analytics.flightBookingGAObject?[Parameters.travel_type.name],
      Parameters.seats_left.name:
          Analytics.flightBookingGAObject?[Parameters.seats_left.name],
      Parameters.inbound_airline.name:
          FlightUtils.isRoundTrip(flightBookingModel?.tripType)
              ? isDomestic
                  ? flightListingProvider
                      ?.responseMainData
                      ?.inBoundFlightListing
                      ?.first
                      .flightDisplayInfo
                      .airLineCode
                  : flightListingProvider
                      ?.responseMainData
                      ?.internationalFlightListing
                      ?.first
                      .flightDisplayInfo
                      .airLineCode
              : '',
      Parameters.outbound_airline.name: isDomestic
          ? flightListingProvider?.responseMainData?.outBoundFlightListing
              ?.first.flightDisplayInfo.airLineCode
          : flightListingProvider?.responseMainData?.internationalFlightListing
              ?.first.flightDisplayInfo.airLineCode,
      Parameters.inbound_airline.name:
          Analytics.flightBookingGAObject?[Parameters.inbound_airline.name],
      Parameters.outbound_airline.name:
          Analytics.flightBookingGAObject?[Parameters.outbound_airline.name],
      Parameters.inbound_airline.name:
          Analytics.flightBookingGAObject?[Parameters.inbound_airline.name],
      Parameters.inbound_price.name:
          Analytics.flightBookingGAObject?[Parameters.inbound_price.name],
      Parameters.outbound_price.name:
          Analytics.flightBookingGAObject?[Parameters.outbound_price.name],
      Parameters.inbound_layover_time.name:
          Analytics.flightBookingGAObject?[Parameters.inbound_layover_time],
      Parameters.outbound_layover_time.name:
          Analytics.flightBookingGAObject?[Parameters.outbound_layover_time],
      Parameters.type.name:
          Analytics.flightBookingGAObject?[Parameters.selection_type.name],
      Parameters.purchase_revenue.name: isDomestic
          ? _getTotalTripPrice().totalDisplayFare
          : _getIntTotalTripPrice().totalDisplayFare,
      Parameters.value.name: isDomestic
          ? _getTotalTripPrice().totalDisplayFare
          : _getIntTotalTripPrice().totalDisplayFare,
      Parameters.cart_amount.name: isDomestic
          ? _getTotalTripPrice().totalDisplayFare
          : _getIntTotalTripPrice().totalDisplayFare,
    };

    Analytics.flightBookingGAObject?[Parameters.departure_date_with_iso.name] =
        FlightUtils.eventDateYYYYMMDDFormat(
      flightBookingModel?.oneWayTrip?.date.toString() ?? 'N/A',
      Constant.dateFormat12,
      Constant.dateFormat22,
    );
    Analytics.flightBookingGAObject?[Parameters.return_date_with_iso.name] =
        FlightUtils.isRoundTrip(
      flightBookingModel?.tripType,
    )
            ? FlightUtils.eventDateYYYYMMDDFormat(
                flightBookingModel?.roundTrip?.date.toString() ?? 'N/A',
                Constant.dateFormat12,
                Constant.dateFormat22,
              )
            : 'N/A';

    Analytics
            .flightBookingGAObject?[Parameters.arrival_datetime_with_iso.name] =
        FlightUtils.eventDateYYYYMMDDFormat(
      Analytics.flightBookingGAObject?[Parameters.arrival_datetime.name]
              .toString() ??
          'N/A',
      Constant.dateFormat23,
      Constant.dateFormat22,
    );
    Analytics.flightBookingGAObject?[Parameters
        .return_arrival_datetime_with_iso.name] = FlightUtils.isRoundTrip(
      flightBookingModel?.tripType,
    )
        ? FlightUtils.eventDateYYYYMMDDFormat(
            Analytics.flightBookingGAObject?[
                        Parameters.return_arrival_datetime.name]
                    .toString() ??
                'N/A',
            Constant.dateFormat23,
            Constant.dateFormat22,
          )
        : 'N/A';

    ClickEvents.book_flight_select.logEvent(parameters: selectBookingObject);

    Analytics.flightBookingGAObject?[Parameters.outbound_airline.name] =
        isDomestic
            ? flightListingProvider?.responseMainData?.outBoundFlightListing
                ?.first.flightDisplayInfo.airLineCode
            : flightListingProvider
                ?.responseMainData
                ?.internationalFlightListing
                ?.first
                .flightDisplayInfo
                .airLineCode;
    // calling ecommerce flight select event
    FlightBookingGaAnalytics().ecommerceGAEvents(
      ClickEvents.add_to_cart,
      selectedFlightModel,
      selectBookingObject,
    );
  }

  void editButtonClickHandle() {
    FlightBookingGaAnalytics().modifySearchAnalyticsData(flightBookingModel);
    navigatorPopScreen(context);
  }

//to get max threshold for seat left that configure in RemoteConfig
  Future<void> getMaxSeatThreshold() async {
    final maxSeatLeft =
        RemoteConfigService().getInstance().getInt('seatLeftThreshold');
    flightListingProvider?.maxSeatThreshold = maxSeatLeft;
    maxSeatThreshold = flightListingProvider?.maxSeatThreshold ?? 0;
  }
}

class NoFlightsFound extends StatelessWidget {
  final bool isFilterApplied;
  final ADTapCallback? onResetTap;

  const NoFlightsFound({
    Key? key,
    required this.isFilterApplied,
    this.onResetTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentWidth = context.widthOfScreen * 0.68;
    const flexHeightValue = 10;

    return Column(
      children: [
        const Expanded(
          flex: 2,
          child: ADSizedBox(),
        ),
        Expanded(
          flex: flexHeightValue,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.k_16),
            child: Column(
              children: [
                Image.asset(
                  'lib/assets/gif/no_result_found.gif',
                  width: contentWidth,
                ),
                ADSizedBox(
                  height: context.k_22,
                ),
                ADSizedBox(
                  width: contentWidth,
                  child: Text(
                    isFilterApplied
                        ? 'we_cant_find_what_you_are_looking_for'
                            .localize(context)
                        : 'no_flights_found'.localize(context),
                    style: ADTextStyle400.size16.setTextColor(
                      context.adColors.greyTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ADSizedBox(
                  height: context.k_30,
                ),
                if (isFilterApplied)
                  OutlinedButton(
                    onPressed: onResetTap,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: context.adColors.blackTextColor,
                      ),
                      minimumSize: Size.zero, // Set this
                      padding: EdgeInsets.symmetric(
                        horizontal: context.k_34,
                        vertical: context.k_14,
                      ), //
                    ),
                    child: Text(
                      'reset_filters'.localize(context),
                      style: ADTextStyle500.size14
                          .setTextColor(context.adColors.blackTextColor),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
