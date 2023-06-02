/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:io';

import 'package:adani_airport_mobile/analytics/screen_events.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/booking_model_for_api.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_response_model.dart';
import 'package:adani_airport_mobile/modules/my_bookings/utils/booking_tab_type.dart';
import 'package:adani_airport_mobile/modules/session/utils/enums/login_skip_type.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/chat_bot/chat_bot_configuration.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/deep_link_manager/deep_link_manager.dart';
import 'package:adani_airport_mobile/utils/launch_icon_changer/launch_icon_changer.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/all_router.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart' hide CupertinoTabController;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

/// this class is used to draw bottom navigation bar with the tabs widgets

bool isbottomBarVisible = true;
ConnectivityResult? globalResult;

class BottomBar extends StatefulWidget {
  const BottomBar({
    Key? key,
    required this.bottomNavigationItemsList,
    required this.widgetMap,
  }) : super(key: key);
  final List<BottomNavigationBarItem> bottomNavigationItemsList;
  final Map<GlobalKey<NavigatorState>, Widget> widgetMap;

  @override
  State<BottomBar> createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> with WidgetsBindingObserver {
  final CupertinoTabController _controller = CupertinoTabController();
  static GlobalKey<BottomBarState> key = GlobalKey<BottomBarState>();

  final LaunchIconChanger launchIconChanger = LaunchIconChanger();
  static int currentIndex = 0;
  StreamSubscription? connectivityStream;
  String routeName = '';
  final double defaultAppbarHeight = 54.sp;
  ScrollNotification? scrollNotification;
  bool networkBool = true;

  @override
  void dispose() {
    _controller.dispose();
    connectivityStream?.cancel();
    final widgetBinding = WidgetsBinding.instance.removeObserver(this);
    adLog(widgetBinding.toString());
    ChatBotConfiguration.disposeChatBotListeners();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        networkBool = true;
        networkDialogDismiss();
        break;
      case AppLifecycleState.inactive:
        networkBool = false;
        break;
      case AppLifecycleState.paused:
        networkBool = false;
        if (Platform.isAndroid) {
          if (!ChatBotConfiguration.isChatBotRunning) {
            launchIconChanger.changeIcon();
          }
        }
        break;
      case AppLifecycleState.detached:
        networkBool = false;
        break;
    }
  }

  void networkDialogDismiss() {
    final String routeName = ModalRoute.of(context)?.settings.name ?? '';
    if (globalResult == ConnectivityResult.wifi &&
        routeName.contains('noDataFound')) {
      navigatorPopScreen(context);
    } else if (globalResult == ConnectivityResult.none &&
        routeName != noDataFound) {
      navigateToScreenUsingNamedRoute(context, noDataFound);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (Platform.isIOS) {
      launchIconChanger.changeIcon();
    }

    /// fetch user id once App lands on home screen
    ProfileSingleton.profileSingleton
        .readUserProfile(SharedPrefUtilsKeys.keyUserProfileData)
        .then((value) {
      adLog(' ProfileSingleton.profileSingleton.userProfile ${value.userId}');
      ProfileSingleton.profileSingleton.userProfile = value;
    });

    connectivityStream = Connectivity().onConnectivityChanged.listen(
          (ConnectivityResult result) => {
            globalResult = result,
            if (result == ConnectivityResult.none)
              {
                routeName = ModalRoute.of(context)?.settings.name ?? '',
                if (routeName.isNotEmpty && routeName != noDataFound)
                  {
                    if (networkBool)
                      {
                        navigateToScreenUsingNamedRoute(context, noDataFound),
                      },
                  },
              },
          },
        );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      DeepLinkManager().handleDeepLinkRoute(
        context: context,
      );
      ChatBotConfiguration.chatBotConfigurationSetup(context: context);
      ScreenEvents.home_page.log();
    });
  }

  bool setScrollNotification(ScrollNotification notification) {
    scrollNotification = notification;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPopScope(),
      child: CustomTabScaffold(
        key: key,
        controller: _controller,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        tabBar: CupertinoTabBar(
          currentIndex: currentIndex,
          height: defaultAppbarHeight,
          onTap: onTap,
          backgroundColor: context.adColors.transparentColor,
          activeColor: context.adColors.storyViewBarFillColor,
          inactiveColor: context.adColors.darkGreyTextColor,
          items: widget.bottomNavigationItemsList,
        ),
        tabBuilder: (context, index) {
          return Material(
            color: Colors.transparent,
            shadowColor: Colors.transparent,
            child: InkWell(
              child: CupertinoTabView(
                onGenerateRoute: AllRouter.generateRoute,
                navigatorKey: widget.widgetMap.keys.elementAt(index),
                builder: (context) {
                  return CupertinoPageScaffold(
                    child: widget.widgetMap.values.elementAt(index),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  /// this method is used for managing state of routes while preforming hard back click.
  Future<bool> _onWillPopScope() async {
    final GlobalKey<NavigatorState> selectedTabKey =
        widget.widgetMap.keys.elementAt(_controller.index);
    final NavigatorState selectedTabState =
        selectedTabKey.currentState ?? NavigatorState();
    final isFirstRouteInCurrentTab = !await selectedTabState.maybePop();
    adLog(
      'isFirstRouteInCurrentTab $isFirstRouteInCurrentTab',
      className: '$BottomBar',
    );

    if (isFirstRouteInCurrentTab) {
      // if not on the 'main' tab
      adLog(
        '_controller.index ${_controller.index}',
        className: '$BottomBar',
      );
      if (_controller.index != 0) {
        setState(() {
          _controller.index = 0;
          currentIndex = 0;
          final CustomTabScaffold customTabScaffold =
              BottomBarState.key as CustomTabScaffold;
          customTabScaffold.heightNotifier.value =
              customTabScaffold.tabBar.height;
        });
      } else {
        // pop to first route
        selectedTabState.popUntil((route) => route.isFirst);
        return true;
      }
      return false;
    }

// let system handle back button if we're on the first route
    return isFirstRouteInCurrentTab;
  }

  Future<bool> getIsFirstScreenOfSelectedTab() async {
    final GlobalKey<NavigatorState> selectedTabKey =
        widget.widgetMap.keys.elementAt(_controller.index);
    final NavigatorState selectedTabState =
        selectedTabKey.currentState ?? NavigatorState();
    final isFirstRouteInCurrentTab = !await selectedTabState.maybePop();
    adLog(
      'isFirstRouteInCurrentTab $isFirstRouteInCurrentTab',
      className: '$BottomBar',
    );
    return isFirstRouteInCurrentTab;
  }

  Future<void> onTap(int index) async {
    await HapticFeedback.lightImpact();
    if (!ProfileSingleton.profileSingleton.isLoggedIn &&
        (index == BottomTabType.orders.index)) {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        signInScreen,
        argumentObject: SignInStatusModel(
          isNotFromSplash: true,
          isLoginStatusTap: (value) =>
              statusTap(isLoggedIn: value, index: index),
          currentRouteName: tabRoute,
        ),
      );
    } else {
      if (index == BottomTabType.cart.index) {
        // final AppCartUtils appCartUtils = AppCartUtils();
        // final String cartName = await appCartUtils.readCartName();
        // navigateToScreenUsingNamedRoute(
        //   context,
        //   cartName == CartType.pranaam.name ? cart : dutyFreeShoppingCartRoute,
        // );
        navigateToScreenUsingNamedRoute(context, genericCartScreen);
      } else if (index == BottomTabType.orders.index) {
        if (context.read<AppSessionState>().mainTabType ==
            BookingHistory().bookingType(BookingTabType.all)) {
          context
              .read<AppSessionState>()
              .setInitialStateToLoading(BookingTabType.all);
          context
              .read<AppSessionState>()
              .setValueForPullToRefresh(value: false);
        } else if (context.read<AppSessionState>().mainTabType ==
            BookingHistory().bookingType(BookingTabType.shopping)) {
          context
              .read<AppSessionState>()
              .setInitialStateToLoading(BookingTabType.shopping);
          context
              .read<AppSessionState>()
              .setValueForPullToRefresh(value: false);
        } else if (context.read<AppSessionState>().mainTabType ==
            BookingHistory().bookingType(BookingTabType.booking)) {
          context
              .read<AppSessionState>()
              .setInitialStateToLoading(BookingTabType.booking);
          context
              .read<AppSessionState>()
              .setValueForPullToRefresh(value: false);
        }

        /// it is use for update api of booking
        final data = await context
            .read<AppSessionState>()
            .getBookings(bookType: context.read<AppSessionState>().mainTabType);
        final MyBookingResponseModel? flightBookingDetails = data.data;
        //  context.read<AppSessionState>().initializeAllOrders();
        if (context.read<AppSessionState>().mainTabType ==
            BookingHistory().bookingType(BookingTabType.all)) {
          context.read<AppSessionState>().allOrders?.history =
              flightBookingDetails?.all;
          context.read<AppSessionState>().allOrders?.totalRecords =
              flightBookingDetails?.totalRecord;
          context.read<AppSessionState>().allOrders?.pageIndex = 1;
          context
              .read<AppSessionState>()
              .allOrders
              ?.setValueForReload(value: true);
          // setValueIsReload();
        } else if (context.read<AppSessionState>().mainTabType ==
            BookingHistory().bookingType(BookingTabType.shopping)) {
          context.read<AppSessionState>().shoppingOrders?.history =
              flightBookingDetails?.all;
          context.read<AppSessionState>().shoppingOrders?.totalRecords =
              flightBookingDetails?.totalRecord;
          context.read<AppSessionState>().shoppingOrders?.pageIndex = 1;
          context
              .read<AppSessionState>()
              .shoppingOrders
              ?.setValueForReload(value: true);
          // setValueIsReload();
        } else if (context.read<AppSessionState>().mainTabType ==
            BookingHistory().bookingType(BookingTabType.booking)) {
          context.read<AppSessionState>().bookingOrders?.history =
              flightBookingDetails?.all;
          context.read<AppSessionState>().bookingOrders?.totalRecords =
              flightBookingDetails?.totalRecord;
          context.read<AppSessionState>().bookingOrders?.pageIndex = 1;
          context
              .read<AppSessionState>()
              .bookingOrders
              ?.setValueForReload(value: true);
          // setValueIsReload();
        }
        adLog(data.data.toString());
      } else if (index == BottomTabType.services.index) {
        ///TODO Need to test
        if (selectedAirportsData?.isNonAdaniAirport ?? false) {
          // homeScreenKey.currentState?.handlePressed((value) {
          //   if (value != null && selectedAirportsData?.city != 'Other') {
          //     _controller.index = 1;
          //     currentIndex = 1;
          //     final CustomTabScaffold customTabScaffold =
          //         BottomBarState.key as CustomTabScaffold;
          //     customTabScaffold.heightNotifier.value =
          //         customTabScaffold.tabBar.height;
          //   } else {
          //     _controller.index = 0;
          //     currentIndex = 0;
          //   }
          // });
          _controller.index = 1;
          currentIndex = 1;
          final CustomTabScaffold customTabScaffold =
              BottomBarState.key as CustomTabScaffold;
          customTabScaffold.heightNotifier.value =
              customTabScaffold.tabBar.height;
        }
      } else if (index == BottomTabType.more.index) {
        final GlobalKey<NavigatorState> selectedTabKey =
            widget.widgetMap.keys.elementAt(_controller.index);
        final NavigatorState selectedTabState =
            selectedTabKey.currentState ?? NavigatorState()
              ..popUntil((route) => route.isFirst);
        adLog(selectedTabState.toString());
      }
      if (currentIndex == index) {
        final bool isFirstScreen = await getIsFirstScreenOfSelectedTab();
        if (isFirstScreen) {
          if (currentIndex == BottomTabType.home.index) {
            homeScreenScrollToTop.value = true;
          } else if (currentIndex == BottomTabType.services.index) {
            servicesScreenScrollToTop.value = true;
          } else if (currentIndex == BottomTabType.more.index) {
            moreScreenScrollToTop.value = true;
          }
        }
      } else {
        if (index != BottomTabType.cart.index) {
          currentIndex = index;
        } else {
          (BottomBarState.key.currentWidget as CustomTabScaffold)
              .controller
              ?.index = currentIndex;
        }
      }
    }
  }

  void statusTap({required bool isLoggedIn, required int index}) {
    if (isLoggedIn) {
      final CustomTabScaffold scaffold =
          BottomBarState.key.currentWidget as CustomTabScaffold;
      scaffold.controller?.index = index;
    } else {
      final CustomTabScaffold scaffold =
          BottomBarState.key.currentWidget as CustomTabScaffold;
      scaffold.controller?.index = currentIndex;
    }
  }
}

class SignInStatusModel {
  final bool isNotFromSplash;
  final bool popUpRequired;
  final ADTapCallbackWithValue isLoginStatusTap;
  final String? currentRouteName;
  final LoginSkipType? loginSkipType;
  final String? referCode;
  final bool? loginFromPopup;
  final String? lob;

  const SignInStatusModel({
    required this.isLoginStatusTap,
    this.isNotFromSplash = false,
    this.popUpRequired = false,
    this.currentRouteName,
    this.loginSkipType = LoginSkipType.cross,
    this.referCode,
    this.loginFromPopup,
    this.lob,
  });

}

enum BottomTabType {
  home,
  services,
  orders,
  cart,
  more,
}
