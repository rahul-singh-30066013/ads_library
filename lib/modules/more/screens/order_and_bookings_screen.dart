/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/analytics/screen_events.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/components/ad_profile_with_action.dart';
import 'package:adani_airport_mobile/modules/components/home_sliver_app_bar_base_component.dart';
import 'package:adani_airport_mobile/modules/more/ga_analytics_profile/profile_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_response_model.dart';
import 'package:adani_airport_mobile/modules/my_bookings/screens/flight_booking_list_screen.dart';
import 'package:adani_airport_mobile/modules/my_bookings/utils/booking_tab_type.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

const int tabCount = 3;

class OrderAndBookingsScreen extends StatefulWidget {
  final bool fromMoreScreen;

  /// this is use for bottom tab
  final bool? fromBottomTab;

  const OrderAndBookingsScreen({
    Key? key,
    required this.fromMoreScreen,
    this.fromBottomTab,
  }) : super(key: key);

  @override
  _OrderAndBookingsScreenState createState() => _OrderAndBookingsScreenState();
}

class _OrderAndBookingsScreenState extends State<OrderAndBookingsScreen> {
  int pageSize = 7;

  // BookingHistory? allOrders;
  // BookingHistory? shoppingOrders;
  // BookingHistory? bookingOrders;
  final double fontSize15 = 15;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ScreenEvents.order_booking_screen.log();
    context.read<AppSessionState>().initializeAllOrders();
    // WidgetsBinding.instance.addPostFrameCallback((_){
    //   // Add Your Code here.
    //   context.read<AppSessionState>().initializeAllOrders();
    // });
    // context.read<AppSessionState>().initializeAllOrders();
    // allOrders = BookingHistory(
    //   typeOfHistory: BookingTabType.all,
    //   pageSize: pageSize,
    //   isReload: false,
    //   tabType: 'all',
    //   pageIndex: 1,
    // );
    // shoppingOrders = BookingHistory(
    //   typeOfHistory: BookingTabType.shopping,
    //   pageSize: pageSize,
    //   isReload: false,
    //   tabType: 'shopping',
    //   pageIndex: 1,
    // );
    // bookingOrders = BookingHistory(
    //   typeOfHistory: BookingTabType.booking,
    //   pageSize: pageSize,
    //   isReload: false,
    //   tabType: 'booking',
    //   pageIndex: 1,
    // );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    ProfileGaAnalytics().selectBackToOrderAndBookingAnalyticsData();
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance?.addPostFrameCallback(
  //     (_) async {
  //       appSessionState = context.read<AppSessionState>();
  //
  //       //    await callDataRetrieveFuture();
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Selector<AppSessionState, bool>(
      selector: (context, viewModel) => viewModel.isLoggedIn,
      builder: (context, isLoggedIn, child) {
        return isLoggedIn
            ? Scaffold(
                backgroundColor: context.adColors.whiteTextColor,
                appBar: Utils.getGenericAppBar(context),
                body: Selector<AppSessionState, Status?>(
                  selector: (context, state) =>
                      state.bookingTabType == BookingTabType.all
                          ? state.myBooking.viewStatus
                          : (state.bookingTabType == BookingTabType.shopping
                              ? state.shopping.viewStatus
                              : state.flightBooking.viewStatus),
                  builder: (BuildContext context, status, Widget? child) {
                    return AbsorbPointer(
                      absorbing: status == Status.loading,
                      child: SafeArea(
                        bottom: false,
                        child: DefaultTabController(
                          length: tabCount,
                          child: Selector<AppSessionState, ProfileModel>(
                            selector: (context, viewModel) =>
                                viewModel.profileModel,
                            builder: (context, profileModel, child) {
                              return Selector<AppSessionState, bool>(
                                selector: (context, viewModel) =>
                                    viewModel.isLoggedIn,
                                builder: (context, isLoggedIn, child) {
                                  return HomeSliverAppBarBaseComponent(
                                    pinnedVale: true,
                                    closeWidgetBottomSpacing: 0,
                                    appBarLeftPadding: widget.fromMoreScreen
                                        ? 0
                                        : context.k_14,
                                    title:
                                        'orders_and_bookings'.localize(context),
                                    titleTextStyle:
                                        ADTextStyle700.size32.setTextColor(
                                      context.adColors.blackTextColor,
                                    ),
                                    actions: [
                                      if (!widget.fromMoreScreen)
                                        const AdProfileWithAction(
                                          isFromOrderAndBooking: true,
                                        ),
                                    ],
                                    subTitleTextStyle:
                                        ADTextStyle700.size32.setTextColor(
                                      context.adColors.blackTextColor,
                                    ),
                                    searchBarPadding: EdgeInsets.only(
                                      top: context.k_8,
                                      bottom: context.k_8,
                                      left: context.k_16,
                                      right: context.k_16,
                                    ),
                                    leadingTitleTextStyle:
                                        ADTextStyle700.size32.setTextColor(
                                      context.adColors.blackTextColor,
                                    ),
                                    stickyWidget: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TabBar(
                                          isScrollable: true,
                                          labelColor: context.adColors.black,
                                          unselectedLabelColor:
                                              context.adColors.greyTextColor,
                                          labelStyle: ADTextStyle600.size16,
                                          indicatorColor: context
                                              .adColors.darkGreyTextColor,
                                          unselectedLabelStyle: ADTextStyle400
                                              .size16
                                              .setTextColor(
                                            context.adColors.greyTextColor,
                                          ),
                                          onTap: (int index) => {
                                            GaEvent.getInstance()
                                                .orderAndMenuSelectEvent(
                                              context.read<
                                                  PranaamAppDataStateManagement>(),
                                            ),
                                            ClickEvents
                                                .order_and_booking_menu_select
                                                .logEvent(
                                              parameters: GaEvent.getInstance()
                                                  .parameterMap,
                                            ),
                                          },
                                          indicatorWeight: 1,
                                          tabs: [
                                            Tab(
                                              text: 'all'.localize(context),
                                            ),
                                            Tab(
                                              text:
                                                  'shopping'.localize(context),
                                            ),
                                            Tab(
                                              text:
                                                  'bookings'.localize(context),
                                            ),
                                          ],
                                        ),
                                        const Divider(
                                          height: 1,
                                        ),
                                      ],
                                    ),
                                    body: Selector<AppSessionState,
                                        MyBookingResponseModel>(
                                      selector: (context, viewModel) =>
                                          viewModel.myBookingResponseModel ??
                                          MyBookingResponseModel(),
                                      builder: (context, updatedVal, child) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: TabBarView(
                                                children: [
                                                  FlightBookingListScreen(
                                                    bookingModelForApi: context
                                                        .read<AppSessionState>()
                                                        .allOrders,
                                                    isFromMoreScreen:
                                                        widget.fromMoreScreen,
                                                    fromBottomTab:
                                                        widget.fromBottomTab,
                                                  ),
                                                  FlightBookingListScreen(
                                                    bookingModelForApi: context
                                                        .read<AppSessionState>()
                                                        .shoppingOrders,
                                                    isFromMoreScreen:
                                                        widget.fromMoreScreen,
                                                    fromBottomTab:
                                                        widget.fromBottomTab,
                                                  ),
                                                  FlightBookingListScreen(
                                                    bookingModelForApi: context
                                                        .read<AppSessionState>()
                                                        .bookingOrders,
                                                    isFromMoreScreen:
                                                        widget.fromMoreScreen,
                                                    fromBottomTab:
                                                        widget.fromBottomTab,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }

  /// to get stored booking data from local storage
  Future<void> callDataRetrieveFuture() async {
    if (ProfileSingleton.profileSingleton.secureToken.isNotEmpty) {
      context.read<AppSessionState>().getUpcomingBookings();
      //  await appSessionState?.getBookings();
    }
  }
}
