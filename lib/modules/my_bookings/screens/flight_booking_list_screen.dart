/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/analytics/screen_events.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/components/no_record_found.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/more/ga_analytics_profile/profile_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/booking_model_for_api.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/flight_booking.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_list_item.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_response_model.dart';
import 'package:adani_airport_mobile/modules/my_bookings/screens/my_bookings_list_item.dart';
import 'package:adani_airport_mobile/modules/my_bookings/utils/booking_tab_type.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/custom_progress/ad_circular_progress_bar.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

//this screen will used to show flight booking list screen - it will connected from my order screen
final double boxHeight = 66.sp;
final double boxWidth = 66.sp;
const double borderWidth = 0.5;
final double viewHeight = 150.sp;

class FlightBookingListScreen extends StatefulWidget {
  const FlightBookingListScreen({
    Key? key,
    required this.isFromMoreScreen,
    this.value,
    this.bookingModelForApi,
    this.fromBottomTab,
  }) : super(key: key);

  final bool isFromMoreScreen;
  final int? value;
  final BookingHistory? bookingModelForApi;
  final bool? fromBottomTab;

  @override
  State<FlightBookingListScreen> createState() =>
      _FlightBookingListScreenState();
}

class _FlightBookingListScreenState extends State<FlightBookingListScreen> {
  AppSessionState? appSessionState;

  /// Scroll controller for scroll end deduction
  ScrollController scrollController = ScrollController();

  bool isReLoadMore = false;

  @override
  void initState() {
    super.initState();
    appSessionState = context.read<AppSessionState>();
    if (widget.fromBottomTab == true) {
      if (widget.bookingModelForApi?.tabType == 'all') {
        ScreenEvents.all_order_screen.log();
        appSessionState?.updateValueOfTab(
          BookingHistory().bookingType(BookingTabType.all),
        );
      } else if (widget.bookingModelForApi?.tabType == 'shopping') {
        ScreenEvents.shopping_order_screen.log();
        appSessionState?.updateValueOfTab(
          BookingHistory().bookingType(BookingTabType.shopping),
        );
      } else if (widget.bookingModelForApi?.tabType == 'booking') {
        ScreenEvents.booking_order_screen.log();
        appSessionState?.updateValueOfTab(
          BookingHistory().bookingType(BookingTabType.booking),
        );
      }
    }
    if (widget.bookingModelForApi?.isReload == false) {
      appSessionState
          ?.setInitialStateToLoading(widget.bookingModelForApi?.typeOfHistory);
      callDataRetrieveFuture(
        bookingHistory: widget.bookingModelForApi ?? BookingHistory(),
      );
      widget.bookingModelForApi?.setValueForReload(value: true);
    }

    if (widget.bookingModelForApi?.tabType == 'all') {
      ProfileGaAnalytics().viewOrderAndBookingAnalyticsData(label: 'All');
    } else if (widget.bookingModelForApi?.tabType == 'shopping') {
      ProfileGaAnalytics().viewOrderAndBookingAnalyticsData(label: 'Shopping');
    } else if (widget.bookingModelForApi?.tabType == 'booking') {
      ProfileGaAnalytics().viewOrderAndBookingAnalyticsData(label: 'Booking');
    }

    // adding listener to scroll controller
    scrollController.addListener(pagination);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  /// function handling pagination
  Future<void> pagination() async {
    if ((scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) &&
        (widget.bookingModelForApi?.history?.length ?? 0) <
            (widget.bookingModelForApi?.totalRecords ?? 0)) {
      setValueForReload(value: true);
      await getMoreOrders(
        widget.bookingModelForApi?.typeOfHistory ?? BookingTabType.all,
      );
    }
  }

  void setValueForReload({required bool value}) {
    setState(() {
      isReLoadMore = value;
    });
  }

  Future<void> getMoreOrders(BookingTabType bookingTabType) async {
    if (bookingTabType == BookingTabType.all) {
      if (appSessionState?.myBooking.viewStatus != Status.loading) {
        appSessionState?.setValueForPullToRefresh(value: true);
        widget.bookingModelForApi?.pageIndex =
            (widget.bookingModelForApi?.pageIndex ?? 0) + 1;
        await callDataRetrieveFuture(
          bookingHistory: widget.bookingModelForApi ?? BookingHistory(),
        );
        setValueForReload(value: false);
      }
    } else if (bookingTabType == BookingTabType.booking) {
      if (appSessionState?.flightBooking.viewStatus != Status.loading) {
        appSessionState?.setValueForPullToRefresh(value: true);
        widget.bookingModelForApi?.pageIndex =
            (widget.bookingModelForApi?.pageIndex ?? 0) + 1;
        await callDataRetrieveFuture(
          bookingHistory: widget.bookingModelForApi ?? BookingHistory(),
        );
        setValueForReload(value: false);
      }
    } else {
      if (appSessionState?.shopping.viewStatus != Status.loading) {
        appSessionState?.setValueForPullToRefresh(value: true);
        widget.bookingModelForApi?.pageIndex =
            (widget.bookingModelForApi?.pageIndex ?? 0) + 1;
        await callDataRetrieveFuture(
          bookingHistory: widget.bookingModelForApi ?? BookingHistory(),
        );
        setValueForReload(value: false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // const int dividerValue = 3;
    return Selector<AppSessionState, ADResponseState>(
      selector: (context, viewModel) => setStateAccordingToTab(
        widget.bookingModelForApi?.typeOfHistory,
        viewModel,
      ),
      builder: (context, updatedVal, child) {
        // print('12345${widget.bookingModelForApi?.history ?? []}');
        // print(updatedVal.viewStatus);
        switch (updatedVal.viewStatus) {
          case Status.loading:
            return const ShowShimmerForOrder();
          // return const Center(
          //   child: ADDotProgressView(
          //       // loaderText: 'flight_waiting_msg'.localize(context),
          //       ),
          // );
          case Status.complete:
            // final MyBookingResponseModel? flightBookingDetails =
            //     updatedVal.data;
            // widget.bookingModelForApi?.history = flightBookingDetails?.all;

            return (widget.bookingModelForApi?.history ?? []).isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          color: context.adColors.black,
                          onRefresh: getDataAccordingToTab,
                          child: ListView.separated(
                            controller: scrollController,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount:
                                widget.bookingModelForApi?.history?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              return MyBookingsListItem(
                                bookingItemObj: widget
                                        .bookingModelForApi?.history?[index] ??
                                    const MyBookingListItem(
                                      businessSubType:
                                          BookingType.flightBooking,
                                    ),
                                isFromMoreScreen: widget.isFromMoreScreen,
                                onTapHandler: () =>
                                    apiCallAccordingToOderCancel(),
                                bookingHistory: widget.bookingModelForApi,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              final orderItem =
                                  widget.bookingModelForApi?.history?[index];
                              if (orderItem != null &&
                                  orderItem.businessSubType ==
                                      BookingType.other) {
                                return const SizedBox.shrink();
                              }
                              return Divider(
                                thickness: borderWidth,
                                color: context
                                    .adColors.lightGreyGridSeparatorColor,
                              ).paddingBySide(
                                left: context.k_20,
                                right: context.k_20,
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.k_10,
                      ),
                      if (isReLoadMore)
                        Center(
                          child: ADCircularProgressBar(
                            size: context.k_26,
                            value: 1,
                            strokeWidth: context.k_4,
                          ),
                        ).paddingBySide(
                          bottom: context.k_10,
                          top: context.k_10,
                        ),
                    ],
                  )
                : Stack(
                    children: [
                      RefreshIndicator(
                        color: context.adColors.black,
                        onRefresh: getDataAccordingToTab,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Container(
                            height: context.heightOfScreen - viewHeight,
                            child: NoRecordFound(
                              errorMessage:
                                  'looks_like_you_havent_made_any_orders_bookings_yet'
                                      .localize(context),
                              subTitleError:
                                  'lets_explore_shall_we'.localize(context),
                              buttonText: 'start_exploring'.localize(context),
                              imagePath:
                                  'lib/assets/gif/orders_and_bookings.gif',
                              isFromOrders: true,
                              isFromMoreScreen: widget.isFromMoreScreen,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
          default:
            const ADSizedBox.shrink();
        }
        return const ADSizedBox.shrink();
      },
      //   return updatedVal == Status.loading
      //       ? const Center(
      //           child: ADDotProgressView(
      //               // loaderText: 'flight_waiting_msg'.localize(context),
      //               ),
      //         )
      //       : widget.itemsList.isNotEmpty
      //           ? RefreshIndicator(
      //               onRefresh: callDataRetrieveFuture,
      //               child: ListView.separated(
      //                 physics: const ClampingScrollPhysics(),
      //                 itemCount: widget.itemsList.length,
      //                 itemBuilder: (BuildContext context, int index) {
      //                   return MyBookingsListItem(
      //                     bookingItemObj: widget.itemsList[index],
      //                     refreshCallback: callDataRetrieveFuture,
      //                     isFromMoreScreen: widget.isFromMoreScreen,
      //                   );
      //                 },
      //                 separatorBuilder: (BuildContext context, int index) {
      //                   return Divider(
      //                     thickness: borderWidth,
      //                     color: context.adColors.lightGreyGridSeparatorColor,
      //                   ).paddingBySide(
      //                     left: context.k_20,
      //                     right: context.k_20,
      //                   );
      //                 },
      //               ),
      //             )
      //           : Stack(
      //               children: [
      //                 NoRecordFound(
      //                   errorMessage:
      //                       'Looks like you haven’t made any orders/bookings yet.',
      //                   buttonText: 'Start Shopping',
      //                   subTitleError: 'Let’s explore, shall we?',
      //                   imagePath: 'lib/assets/gif/orders_and_bookings.gif',
      //                   continueShoppingCallBack: _continueShoppingCallBack,
      //                 ),
      //                 RefreshIndicator(
      //                   onRefresh: callDataRetrieveFuture,
      //                   child: Container(
      //                     height: context.heightOfScreen / dividerValue,
      //                     child: ListView(),
      //                   ),
      //                 ),
      //               ],
      //             );
      // },
    );
  }

  ADResponseState setStateAccordingToTab(
    BookingTabType? bookingTabType,
    AppSessionState viewModel,
  ) {
    if (bookingTabType == BookingTabType.all) {
      return viewModel.myBooking;
    } else if (bookingTabType == BookingTabType.shopping) {
      return viewModel.shopping;
    } else {
      return viewModel.flightBooking;
    }
  }

  void apiCallAccordingToOderCancel() {
    widget.bookingModelForApi?.pageIndex = 1;
    const int pageSize = 7;
    if (context.read<AppSessionState>().updateBookingValue) {
      if (widget.bookingModelForApi?.tabType == 'all') {
        appSessionState?.setValueForPullToRefresh(value: false);
        //  widget.bookingModelForApi?.history = null;
        context
            .read<AppSessionState>()
            .setInitialStateToLoading(BookingTabType.all);
        callDataRetrieveFuture(
          bookingHistory: BookingHistory(
            typeOfHistory: BookingTabType.all,
            pageIndex: 1,
            pageSize: pageSize,
          ),
        );
        context
            .read<AppSessionState>()
            .updateValueOfBooking(updateValue: false);
      } else if (widget.bookingModelForApi?.tabType == 'shopping') {
        appSessionState?.setValueForPullToRefresh(value: false);
        //  widget.bookingModelForApi?.history = null;
        context
            .read<AppSessionState>()
            .setInitialStateToLoading(BookingTabType.shopping);
        callDataRetrieveFuture(
          bookingHistory: BookingHistory(
            typeOfHistory: BookingTabType.shopping,
            pageIndex: 1,
            pageSize: pageSize,
          ),
        );
        context
            .read<AppSessionState>()
            .updateValueOfBooking(updateValue: false);
      } else if (widget.bookingModelForApi?.tabType == 'booking') {
        appSessionState?.setValueForPullToRefresh(value: false);
        //  widget.bookingModelForApi?.history = null;

        GaEvent.getInstance().fireOrderAndBookingItemSelect();
        ClickEvents.order_and_booking_item_select
            .logEvent(parameters: GaEvent.getInstance().parameterMap);
        context
            .read<AppSessionState>()
            .setInitialStateToLoading(BookingTabType.booking);
        callDataRetrieveFuture(
          bookingHistory: BookingHistory(
            typeOfHistory: BookingTabType.booking,
            pageIndex: 1,
            pageSize: pageSize,
          ),
        );
        context
            .read<AppSessionState>()
            .updateValueOfBooking(updateValue: false);
      }
    }
  }

  // void _continueShoppingCallBack() {
  //   final CupertinoTabScaffold scaffold =
  //       BottomBarState.key.currentWidget as CupertinoTabScaffold;
  //   scaffold.controller?.index = 0;
  // }

//to get stored booking data from local storage
  Future<void> callDataRetrieveFuture({
    required BookingHistory bookingHistory,
  }) async {
    if (ProfileSingleton.profileSingleton.secureToken.isNotEmpty) {
      final value = await appSessionState?.getBookings(
        bookType: bookingHistory.bookingType(
          bookingHistory.typeOfHistory ?? BookingTabType.all,
        ),
        pageSize: bookingHistory.pageSize,
        pageIndex: bookingHistory.pageIndex,
      );
      final MyBookingResponseModel? flightBookingDetails = value?.data;

      if (appSessionState?.isPullToRefresh ?? true) {
        if ((widget.bookingModelForApi?.history?.isEmpty) ?? true) {
          widget.bookingModelForApi?.history = flightBookingDetails?.all;
        } else {
          widget.bookingModelForApi?.history
              ?.addAll(flightBookingDetails?.all ?? []);
        }
      } else {
        widget.bookingModelForApi?.history = flightBookingDetails?.all;
      }

      widget.bookingModelForApi?.totalRecords =
          flightBookingDetails?.totalRecord;
    }
  }

  Future<void> getDataAccordingToTab() async {
    if (widget.bookingModelForApi?.typeOfHistory == BookingTabType.all) {
      await callDataRetrieveFuture(
        bookingHistory: getDetailForApi(BookingTabType.all),
      );
    } else if (widget.bookingModelForApi?.typeOfHistory ==
        BookingTabType.shopping) {
      await callDataRetrieveFuture(
        bookingHistory: getDetailForApi(BookingTabType.shopping),
      );
    } else if (widget.bookingModelForApi?.typeOfHistory ==
        BookingTabType.booking) {
      await callDataRetrieveFuture(
        bookingHistory: getDetailForApi(BookingTabType.booking),
      );
    }
  }

  BookingHistory getDetailForApi(BookingTabType type) {
    appSessionState?.setValueForPullToRefresh(value: false);
    // widget.bookingModelForApi?.history = null;
    widget.bookingModelForApi?.pageIndex = 1;
    const int pageSize = 7;
    return BookingHistory(
      typeOfHistory: type,
      pageSize: pageSize,
      isReload: false,
      tabType: widget.bookingModelForApi?.tabType,
      pageIndex: 1,
    );
  }

/*final dataObjToRead = <String, Object>{
      'key': keyCurrentFlightBooking,
      'dataType': 'string',
      'value': '',
    };
    await AdaniMobilePlugin.readSharedPref(dataObjToRead).then((value) {
      if (value.toString().isNotEmpty) {
        flightBookingOrderList.clear();
        final FlightOrderList flightOrder =
            FlightOrderList.fromJson(json.decode(value));
        flightBookingOrderList.addAll(
          flightOrder.flightOrderList ?? [],
        );
      }
    });
    setState(() {
      adLog('${flightBookingOrderList.length}');
    });*/
// }
}

// this class will show flight booking details
class BookingDetail extends StatefulWidget {
  final MyBookingListItem myBookingListItem;
  final Future<void>? Function() refreshCallback;
  final ADTapCallback? onTap;
  final BookingHistory? bookingHistory;

  const BookingDetail({
    required this.myBookingListItem,
    required this.refreshCallback,
    this.onTap,
    this.bookingHistory,
    Key? key,
  }) : super(key: key);

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {
  @override
  void initState() {
    super.initState();
    ProfileGaAnalytics().selectOrderAndBookingAnalyticsData(
      type: widget.bookingHistory?.tabType,
      label: 'book_flight',
      date: widget.bookingHistory?.history?.first.createdOn,
      transactionId: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final siteCore = context.read<SiteCoreStateManagement>();
    final FlightBooking? flightBooking =
        widget.myBookingListItem.orderDetail?.flightbookingDetail;
    final String orderStatus = widget.myBookingListItem.cancelType != null
        ? (widget.myBookingListItem.cancelType ?? '').toLowerCase() == 'partial'
            ? 'Partially Cancelled'
            : widget.myBookingListItem.status ?? ''
        : widget.myBookingListItem.status ?? '';
    final String refundStatus = flightBooking?.refundStatus ?? '';
    return InkWell(
      onTap: () => navigateToScreenWithRootNavigatorResult(
        context,
        flightBookingItemDetails,
        argumentObject: widget.myBookingListItem.orderReferenceId,
      ).then(
        (value) => widget.onTap?.call(),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: boxWidth,
              height: boxHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(context.k_4),
                ),
                border: Border.all(
                  color: context.adColors.tileBorderColor,
                  width: borderWidth,
                ),
                color: context.adColors.whiteTextColor,
              ),
              child: SvgPicture.asset(
                'lib/assets/images/svg/icons/more/flight-246.svg',
                color: context.adColors.darkGreyTextColor,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        siteCore
                                .airportCityMap[
                                    flightBooking?.from?.locationCode]
                                ?.cityName ??
                            flightBooking?.from?.city ??
                            '',
                        style: ADTextStyle600.size16
                            .setTextColor(context.adColors.black),
                      ),
                      SvgPicture.asset(
                        flightBooking?.tripType == ItineraryTripType.O
                            ? 'lib/assets/images/svg/icons/flight/one way.svg'
                            : 'lib/assets/images/svg/icons/flight/round trip.svg',
                        height: flightBooking?.tripType == ItineraryTripType.O
                            ? context.k_8
                            : context.k_10,
                        width: context.k_12,
                        color: context.adColors.darkGreyTextColor,
                        fit: BoxFit.cover,
                      ).paddingBySide(
                        left: context.k_6,
                        right: context.k_6,
                      ),
                      Text(
                        siteCore.airportCityMap[flightBooking?.to?.locationCode]
                                ?.cityName ??
                            flightBooking?.to?.city ??
                            '',
                        style: ADTextStyle600.size16
                            .setTextColor(context.adColors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.k_8,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      flightBooking?.tripType == ItineraryTripType.O
                          ? '${flightBooking?.departure?.date}'
                          : '${flightBooking?.departure?.date} - ${flightBooking?.arrival?.date}',
                      style: ADTextStyle400.size14
                          .setTextColor(context.adColors.blackTextColor),
                    ),
                  ),
                  SizedBox(
                    height: context.k_8,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      orderStatus,
                      /*  FlightUtils.getBookingStatusType(
                        flightBooking?.bookingStatusCode ?? '',
                      ).localize(context),*/
                      style: ADTextStyle600.size14.setTextColor(
                        FlightUtils.getBookingStatusTypeColor(
                          orderStatus,
                          context,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: refundStatus.isNotEmpty ? context.k_10 : 0,
                  ),
                  if (refundStatus.isNotEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.k_12,
                        vertical: context.k_4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(context.k_4),
                        ),
                        color: const Color(0xfffff7df),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        refundStatus,
                        style: ADTextStyle400.size12.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                      ),
                    ).paddingBySide(right: context.k_20),
                ],
              ).paddingBySide(left: context.k_16),
            ),
            Align(
              child: Icon(
                Icons.keyboard_arrow_right,
                size: context.k_20,
                color: context.adColors.blackTextColor,
              ),
            ),
          ],
        ).paddingAllSide(context.k_16),
      ),
    );
  }
}

class ShowShimmerForOrder extends StatelessWidget {
  ///
  /// usage
  /// ShowShimmerForFlights();
  ///
  ///
  const ShowShimmerForOrder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int shimmerCount = 6;
    final double widthLength = 150.sp;
    return ListView.builder(
      itemCount: shimmerCount,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          children: [
            ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              width: context.k_64,
              height: context.k_64,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  width: widthLength,
                  height: context.k_10,
                ),
                ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  width: context.k_64,
                  height: context.k_10,
                ).paddingBySide(
                  right: context.k_64,
                ),
                ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  width: context.k_30,
                  height: context.k_10,
                ),
              ],
            ),
          ],
        ).paddingBySide(
          bottom: context.k_40,
        );
      },
    );
  }
}
