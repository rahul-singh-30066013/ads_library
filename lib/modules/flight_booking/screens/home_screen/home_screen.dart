/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:ui';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_builder/home_dashboard_screen.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/ga_analytics_event/home_and_airport_selection_click_event.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/get_cart_on_user_basis.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_tab_nav_keys.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/home_bottom_assets.dart';
import 'package:adani_airport_mobile/modules/businesses/business_screen.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/cab_booking_confirmation_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/components/ad_profile_with_action.dart';
import 'package:adani_airport_mobile/modules/components/home_sliver_app_bar_base_component.dart';
import 'package:adani_airport_mobile/modules/components/primary_scroll_to_top/scrolls_to_top.dart';
import 'package:adani_airport_mobile/modules/components/sliver_app_bar_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_age_confirmation.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/airports_list_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/widget_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/airport_list_state_management.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/dashboard_view_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/fids_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dialog/dialog_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dialog/loyalty_diaglog_screen.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/update_short_profile.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_list_item.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/sign_in_screen_with_offer.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_state_management.dart';
import 'package:adani_airport_mobile/modules/themes/google_event/theme_ga_event.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/animation_text/marquee.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_bottom_sheet_drag_bar.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/chat_bot/chat_bot_configuration.dart';
import 'package:adani_airport_mobile/utils/constants/app_constants.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/deep_link_manager/deep_link_manager.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_constant_remote.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/remote_config_service.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/offer_banner/offer_banner_remote.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/speech_text/text_to_speech.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/carousel/carousel_options.dart';
import 'package:superapp_mobile_style_guide/carousel/carousel_slider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_layout_builder.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

const double percentageOfScrollLimit = 45;
const int maxLinesLimit = 3;
const int itemCountLimit = 6;
const double topPaddingADSearch = 100;
const double expandedHeightValue = 160;
const double blackOpacity = 0.5;
const double size_500 = 500;
const double size_325 = 325;
const double size_300 = 300;
const double size_200 = 200;
const double size_160 = 160;
const double size_150 = 150;
const double size_100 = 100;
const double size_80 = 80;
const double size_250 = 250;
final double animateHeight = 80.sp;
const double airportListBottomSheetHeight = 0.92;
final double percentageHeightOfScreen = 0.9.h;
const double _borderThickness = 0.5;
final double widthOfLine = 50.h;
const double three = 3;

GlobalKey<HomeScreenState> homeScreenKey = GlobalKey();

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState
    extends State<HomeScreen> /*with WidgetsBindingObserver*/ {
  ScrollController _scrollController = ScrollController();

  int _currentOrder = 0;
  final double currentOrderColorOpacity = 0.9;
  final double blurValue = 70;
  final double fontSize13 = 13;
  final double crossBorder = 0.5;
  double bottomPadding = 0;
  double safeAreaPadding = 0;

  StreamSubscription<RemoteMessage>? listenMessage;
  bool isClosed = false;
  Timer? upcomingBookingTimer;

  Future<void> setupFCMdMessage() async {
    listenMessage = FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      /*   SnackBarUtil.showSnackBar(
        context,
        message.notification?.title ?? '',
      );*/
      adLog('fcm received ${message.notification?.title ?? ''}');
    });
  }

/*  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    loadUpcomingBooking(state: state);
  }

  Future<void> loadUpcomingBooking({AppLifecycleState? state}) async {
    if (state == null || state == AppLifecycleState.resumed) {
      if (!(upcomingBookingTimer?.isActive ?? false)) {
        upcomingBookingTimer = Timer.periodic(
          const Duration(seconds: 3),
          (tick) => {
            context.read<AppSessionState>().getUpcomingBookings(),
          },
        );
      }
    } else {
      if (upcomingBookingTimer?.isActive ?? false) {
        upcomingBookingTimer?.cancel();
      }
    }
  }*/

  @override
  void dispose() {
    /*  if (upcomingBookingTimer?.isActive ?? false) {
      upcomingBookingTimer?.cancel();
    }
    adLog(WidgetsBinding.instance.removeObserver(this).toString());*/
    listenMessage?.cancel();
    super.dispose();
  }

  bool get checkNetworkConnectivity => globalResult != ConnectivityResult.none;
  bool isAlertVisible = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      LoyaltyDiaglogScreen.showAPIAlertDialog(
        context,
      );
    });

    callInitialApis();
    setupFCMdMessage();
    adLog('home_selectedAirportsData  $selectedAirportsData');
    context.read<SiteCoreStateManagement>().fetchPaymentFromSiteCore();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final appSessionState = context.read<AppSessionState>();
        context.read<AppSessionState>().getUpcomingBookings();
        bottomPadding = MediaQuery.of(context).padding.bottom;
        safeAreaPadding = MediaQuery.of(context).viewPadding.bottom;
        final isFromDeepLink = DeepLinkManager().hasDeepLink;
        final isLoggedIn = ProfileSingleton.profileSingleton.isLoggedIn;
        if (!isLoggedIn &&
            (AppConstantRemote()
                    .appConstantRemoteModel
                    ?.isBottomSignInEnabled ??
                false) &&
            !isFromDeepLink) {
          Future.delayed(
            const Duration(milliseconds: 2000),
            () => firstTimeOpenLogin(),
          );
        } else if (isLoggedIn &&
            (AppConstantRemote()
                    .appConstantRemoteModel
                    ?.isIncompleteProfilePopupEnabled ??
                false) &&
            !appSessionState.isRequiredDetailAvailable() &&
            !isFromDeepLink) {
          {
            Future.delayed(
              const Duration(milliseconds: 2000),
              () => openShortProfileSheet(),
            );
          }
        }

        ///Show Offer banner based on firebase value
        final dateTime = LoyaltyDiaglogScreen.getSavedDateTime().then(
          (value) {
            final date = DateTime.fromMillisecondsSinceEpoch(
              value ?? 0,
            );
            final differenceInDays = DateTime.now().difference(date).inDays;
            final offerBannerRemoteModel =
                OfferBannerRemote().offerBannerRemoteModel;
            final showAfterDays =
                offerBannerRemoteModel?.widgetItem?.showAfterNoOfDays ?? 0;
            if (differenceInDays >= showAfterDays &&
                !isExpirePopupEnabled &&
                ProfileSingleton.profileSingleton.isLoggedIn &&
                (offerBannerRemoteModel?.isPopUpEnabled ?? false)) {
              LoyaltyDiaglogScreen.saveCurrentDateTime();
              LoyaltyDiaglogScreen.showOfferBannerDialog(
                context,
              );
            }
          },
        );
        adLog('message $dateTime');
      },
    );
    if (ProfileSingleton.profileSingleton.isLoggedIn) {
      FlightBookingGaAnalytics().loginAndLogoutSuccessfulAnalyticsData(
        ProfileSingleton.profileSingleton.userID,
        label: '',
        type: '',
      );
    } else {
      FlightBookingGaAnalytics().loginAndLogoutSuccessfulAnalyticsData(
        '',
        label: '',
        type: '',
      );
    }
    DeepLinkManager().handleNativeDeepLink();
    // WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  int differenceInDays(DateTime dt1, DateTime dt2) {
    if (dt1.isAfter(dt2)) {
      final DateTime temp = dt1;
      dt1 = dt2;
      dt2 = temp;
    }
    return dt2.difference(dt1).inDays;
  }

  void firstTimeOpenLogin() {
    if (checkNetworkConnectivity) {
      adShowBottomSheetWithWrap(
        context: context,
        childWidget: Flexible(
          child: SignInScreenWithOffer(
            signInStatusModel: SignInStatusModel(
              isNotFromSplash: true,
              isLoginStatusTap: (value) => adLog(value.toString()),
              currentRouteName: tabRoute,
              loginFromPopup: true,
            ),
          ),
        ),
        headerTitle: '',
      );
    }
  }

  void openShortProfileSheet() {
    if (checkNetworkConnectivity) {
      adShowBottomSheetWithWrap(
        context: context,
        childWidget: const UpdateShortProfile(),
        headerTitle: 'update_your_profile'.localize(context),
      );
    }
  }

  Future<void> callInitialApis() async {
    if (selectedAirportsData == null) {
      selectedAirportsData =
          context.read<SiteCoreStateManagement>().adaniAirportsList.firstWhere(
                (element) =>
                    element.city?.toLowerCase().contains('other') ?? true,
              );
      saveToPreference(
        keySelectedAirport,
        selectedAirportsData ?? AirportItemModel(),
      );
    }
    selectedAirportNotifier.value = selectedAirportsData?.city ?? 'Other';
    //Moved this profile call to initial launch
    // if (ProfileSingleton.profileSingleton.isLoggedIn) {
    //   adLog('start profile');
    //   await context.read<AppSessionState>().getProfileDetails();
    //   adLog('end profile');
    // }
    adLog('start getCartData');
    await GetCartOnUserBasis().getCartData(context);
    adLog('end getCartData');
    if (ProfileSingleton.profileSingleton.isLoggedIn) {
      unawaited(
        FirebaseMessaging.instance.getToken().then(
              (value) => sendFCMToBackend(value ?? ''),
            ),
      );
      FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
        sendFCMToBackend(fcmToken);
        adLog('onTokenRefresh-FCM$fcmToken');
      }).onError((err) {
        adLog('On error fcm token');
      });
    }
  }

  void refreshTokenIsExpired(BuildContext context) {
    _showMyBottomSheet(context);
    adLog('IsRefreshTokenExpire3 : ${isRefreshTokenExpire.value}');
  }

  // Future<void> _showMyDialog(BuildContext context) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Center(child: Text('Adani')),
  //         content: Text('your_session_has_been_expired'.localize(context)),
  //         actions: <Widget>[
  //           Center(
  //             child: TextButton(
  //               onPressed: () => okButtonTap(context),
  //               child: Text('ok'.localize(context)),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Future<void> _showMyBottomSheet(BuildContext context) async {
    final height = 100.sp;
    return showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              context.k_22, //
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ADBottomSheetDragBar(
              height: context.k_4,
              width: context.k_40,
            ).paddingBySide(top: context.k_10),
            SizedBox(
              height: context.k_48,
            ),
            SizedBox(
              height: height,
              child: Lottie.asset(
                'lib/assets/gif/session_exp_json_small.json',
              ),
            ),
            SizedBox(
              height: context.k_22,
            ),
            Text(
              'session_expired'.localize(context),
              textAlign: TextAlign.center,
              style: ADTextStyle700.size22.copyWith(
                color: context.adColors.filterBlackText,
              ),
            ),
            SizedBox(
              height: context.k_20,
            ),
            Text(
              'your_session_has_been_expired'.localize(context),
              textAlign: TextAlign.center,
              style: ADTextStyle400.size14.copyWith(
                color: context.adColors.neutralInfoMsg,
                decoration: TextDecoration.none,
              ),
            ).paddingBySide(
              left: context.k_16,
              right: context.k_16,
            ),
            SizedBox(
              height: context.k_20,
            ),
            SizedBox(
              height: context.k_48,
              width: context.widthOfScreen - context.k_32,
              child: ElevatedButton(
                onPressed: () => okButtonTap(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.adColors.blackTextColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(context.k_48),
                    side: BorderSide(
                      color: context.adColors.blackTextColor,
                    ),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'login'.localize(context),
                  style: ADTextStyle700.size16.setTextColor(
                    context.adColors.whiteTextColor,
                  ),
                ),
              ).paddingBySide(
                left: context.scaled(context.k_16),
                right: context.scaled(context.k_16),
              ),
            ),
            SizedBox(
              height: context.k_30,
            ),
          ],
        ),
      ),
    );
  }

  void okButtonTap(BuildContext context) {
    Navigator.of(context).pop();
    logoutTap(context: context);
    isRefreshTokenExpire.value = false;
    isExpirePopupEnabled = false;
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      signInScreen,
      argumentObject: SignInStatusModel(
        isLoginStatusTap: (value) => adLog(value.toString()),
        currentRouteName: tabRoute,
        isNotFromSplash: true,
      ),
    );
  }

  Future<void> logoutTap({required BuildContext context}) async {
    await Utils.logOutTap(context: context);
  }

  Future<void> _onScrollsToTop(ScrollsToTopEvent event) async {
    adLog(event.toString());
    Utils.scrollTabScreensToTop(scrollController: _scrollController);
  }

  List<DutyFreeItem>? getServiceList() {
    final data = context.read<DashBoardViewModel>().homeDashBoardState.data
        as List<DutyFreeDashboardItem>;

    final items = data.firstWhere(
      (element) => element.widgetType == kGridServicesTile,
    );
    return items.widgetItems;
  }

  AirportListStateManagement? _airportListStateManagement;
  final bool enableTapToSalute =
      RemoteConfigService().getInstance().getBool(RemoteKeys.enableTapToSalute);
  final bool isTapable = RemoteConfigService()
      .getInstance()
      .getBool(RemoteKeys.enableTapToNavigate);

  bool isExpirePopupEnabled = false;

  ///Used for start and stop vertically search text
  final ValueNotifier<bool> repeatForever = ValueNotifier(true);
  bool isPinned = true;

  @override
  Widget build(BuildContext context) {
    return ScrollsToTop(
      onScrollsToTop: _onScrollsToTop,
      child: ValueListenableBuilder(
        valueListenable: isRefreshTokenExpire,
        builder: (context, bool isExpire, child) {
          adLog('IsRefreshTokenExpire1 : ${isRefreshTokenExpire.value}');
          if (isExpire && !isExpirePopupEnabled) {
            adLog(
              'IsRefreshTokenExpire2 : ${isRefreshTokenExpire.value}',
            );
            Utils.logOutTap(context: context);
            isExpirePopupEnabled = true;
            Future.delayed(
              const Duration(milliseconds: 100),
              () => refreshTokenIsExpired(context),
            );
          }
          return Consumer<AirportListStateManagement>(
            builder: (context, airportListManagement, child) {
              airportListManagement.airportData ??= selectedAirportsData;
              _airportListStateManagement = airportListManagement;
              context.read<DutyFreeState>().airportData = selectedAirportsData;
              Color? appBackgroundColor;
              Color? appBarTitleColor;
              Color? appBarSubTitleColor;
              Color stickyWidgetBackgroundColor = context.adColors.paleGrey;
              Color stickyWidgetTextColor = context.adColors.greyTextColor;
              Color stickyWidgetIconColor = context.adColors.inactiveGreyColor;
              if (airportListManagement.airportData?.isTheme ?? false) {
                try {
                  appBackgroundColor = Color(
                    int.parse(
                      airportListManagement
                              .airportData?.appBarBackgroundColor ??
                          '',
                    ),
                  );
                } catch (e) {
                  adLog(e.toString());
                }
                appBarSubTitleColor = Color(
                  int.tryParse(
                        airportListManagement
                                .airportData?.appBarSubtitleColor ??
                            '',
                      ) ??
                      context.adColors.greyCircleColor.value,
                );
                appBarTitleColor = Color(
                  int.tryParse(
                        airportListManagement.airportData?.appBarTitleColor ??
                            '',
                      ) ??
                      context.adColors.blackTextColor.value,
                );
                stickyWidgetBackgroundColor = Color(
                  int.tryParse(
                        airportListManagement
                                .airportData?.stickyWidgetBackgroundColor ??
                            '',
                      ) ??
                      ADColors.white.value,
                );
                stickyWidgetTextColor = Color(
                  int.tryParse(
                        airportListManagement
                                .airportData?.stickyWidgetTextColor ??
                            '',
                      ) ??
                      context.adColors.greyTextColor.value,
                );
                stickyWidgetIconColor = Color(
                  int.tryParse(
                        airportListManagement
                                .airportData?.stickyWidgetIconColor ??
                            '',
                      ) ??
                      context.adColors.inactiveGreyColor.value,
                );
              }
              if (lastSelectedAirport != selectedAirportsData?.city) {
                context.read<DashBoardViewModel>()
                  ..homeDashBoardState = ADResponseState.loading()
                  ..getDashBoardData(
                    selectedAirportNotifier.value,
                    postFix: airportListManagement.airportData?.postFix,
                  );
                //   updateDashBoard();
                lastSelectedAirport = selectedAirportsData?.city ?? '';
              }
              return Selector<DashBoardViewModel, ADResponseState>(
                selector: (context, model) => model.homeDashBoardState,
                builder: (context, dashboardStatus, child) {
                  if (dashboardStatus.viewStatus == Status.loading) {
                    if (_scrollController.hasClients) {
                      _scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  }
                  final List<DutyFreeDashboardItem> dutyFreeDashboardItems =
                      (dashboardStatus.viewStatus == Status.complete &&
                              dashboardStatus.data != null &&
                              dashboardStatus.data
                                  is List<DutyFreeDashboardItem>)
                          ? (dashboardStatus.data
                              as List<DutyFreeDashboardItem>)
                          : [];
                  return Scaffold(
                    backgroundColor: appBackgroundColor,
                    appBar: AppBar(
                      toolbarHeight: 0,
                      backgroundColor: appBackgroundColor,
                      elevation: 0,
                      systemOverlayStyle:
                          (airportListManagement.airportData?.isTheme ??
                                      false) &&
                                  (airportListManagement
                                              .airportData?.lightStatusBar ==
                                          null ||
                                      (airportListManagement
                                              .airportData?.lightStatusBar ??
                                          false))
                              ? SystemUiOverlayStyle.light
                              : SystemUiOverlayStyle.dark,
                    ),
                    body: Scaffold(
                      backgroundColor: dutyFreeDashboardItems.isNotEmpty
                          ? Color(
                              int.tryParse(
                                    dutyFreeDashboardItems
                                        .first.backgroundColor,
                                  ) ??
                                  ADColors.white.value,
                            )
                          : ADColors.white,
                      body: SafeArea(
                        bottom: false,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            HomeSliverAppBarBaseComponent(
                              physics:
                                  (airportListManagement.airportData?.isTheme ??
                                          false)
                                      ? const ClampingScrollPhysics()
                                      : null,
                              scrollListener: (scrollController) => {
                                ///Know the appbar expanded or collapse
                                _scrollController = scrollController,
                                _scrollController.addListener(() {
                                  if (!isPinned &&
                                      _scrollController.hasClients &&
                                      _scrollController.offset >
                                          kToolbarHeight) {
                                    repeatForever.value = isPinned;
                                    isPinned = true;
                                  } else if (isPinned &&
                                      _scrollController.hasClients &&
                                      _scrollController.offset <
                                          kToolbarHeight) {
                                    repeatForever.value = isPinned;
                                    isPinned = false;
                                  }
                                }),
                              },
                              appBarBackgroundColor: appBackgroundColor,
                              stickyWidgetBackgroundColor: appBackgroundColor,
                              actions: const [
                                AdProfileWithAction(),
                              ],
                              body: ValueListenableBuilder(
                                valueListenable: homeScreenScrollToTop,
                                builder: (context, bool scrollToTop, child) {
                                  if (scrollToTop) {
                                    Utils.scrollTabScreensToTop(
                                      scrollController: _scrollController,
                                    );
                                  }
                                  homeScreenScrollToTop.value = false;

                                  return HomeDashBoardScreen(
                                    shimmerWidget: _ShimmerWidget(),
                                    onTapHandler: (value) => _onTapHandler(
                                      value,
                                      context,
                                      homeScreenViewModel:
                                          airportListManagement,
                                    ),
                                    postFix: airportListManagement
                                        .airportData?.postFix,
                                  );
                                },
                              ),
                              subTitle: airportListManagement
                                  .airportData?.airportName
                                  ?.trim(),
                              subTitleTextStyle: ADTextStyle400.size14
                                  .setTextColor(
                                    appBarSubTitleColor ??
                                        context.adColors.greyCircleColor,
                                  )
                                  .copyWith(fontSize: fontSize13.sp),
                              titleTextStyle:
                                  ADTextStyle700.size32.setTextColor(
                                appBarTitleColor ??
                                    context.adColors.blackTextColor,
                              ),
                              searchBarPadding: EdgeInsets.only(
                                top: context.k_8,
                                bottom: context.k_8,
                                left: context.k_16,
                                right: context.k_16,
                              ),
                              title: airportListManagement.airportData?.city,
                              titleCallBack: () => handlePressed(null),
                              stickyWidget: InkWell(
                                onTap: () => adShowBottomSheet(
                                  context: context,
                                  childWidget: const BusinessScreen(
                                    openBottomSheet: true,
                                  ),
                                  headerTitle: 'search_airport_services'
                                      .localize(context),
                                ),
                                child: SizedBox(
                                  height: context.k_40,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: stickyWidgetBackgroundColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          context.k_26,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.search,
                                          color: stickyWidgetIconColor,
                                        ).paddingBySide(
                                          left: context.k_14,
                                        ),
                                        ValueListenableBuilder<bool>(
                                          valueListenable: repeatForever,
                                          builder:
                                              (context, bool value, child) =>
                                                  Expanded(
                                            child: Container(
                                              height: context.k_40,
                                              width: size_250,
                                              child: Marquee(
                                                textList: context
                                                    .read<DashBoardViewModel>()
                                                    .tipMarqueeList,
                                                textColor:
                                                    stickyWidgetTextColor,
                                                // your text list
                                                scrollDuration: const Duration(
                                                  milliseconds: 800,
                                                ),
                                                // every scroll duration
                                                stopDuration: const Duration(
                                                  seconds: 2,
                                                ),
                                                //every stop duration
                                                controller: MarqueeController(),
                                                /*  repeatMaxCounter:
                                                        context.k_2.toInt(),
                                                    repeatForever: false,*/
                                                repeatForever: value,
                                              ),
                                            ).paddingBySide(
                                              left: context.k_2,
                                            ),
                                          ),
                                        ),
                                        if (selectedAirportsData
                                                    ?.airportPrefixName
                                                    ?.isNullOrEmpty ==
                                                false &&
                                            (AppConstantRemote()
                                                    .appConstantRemoteModel
                                                    ?.isSpeechEnable ??
                                                false))
                                          InkWell(
                                            onTap: () => {
                                              showDialog(
                                                context: context,
                                                barrierDismissible: true,
                                                builder:
                                                    (BuildContext context) {
                                                  return getServiceList()
                                                              ?.isNotEmpty ??
                                                          false
                                                      ? TextToSpeech(
                                                          servicesResult:
                                                              getServiceList() ??
                                                                  [],
                                                          onTapHandler:
                                                              (value) =>
                                                                  _onTapHandler(
                                                            value,
                                                            context,
                                                          ),
                                                        )
                                                      : const SizedBox.shrink();
                                                },
                                              ),
                                            },
                                            child: SizedBox(
                                              width: context.k_28,
                                              height: context.k_28,
                                              child: Icon(
                                                Icons.mic,
                                                color: stickyWidgetIconColor,
                                              ),
                                            ).paddingBySide(
                                              right: context.k_14,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Consumer<AppSessionState>(
                              builder: (
                                BuildContext context,
                                value,
                                Widget? child,
                              ) {
                                final List<MyBookingListItem>
                                    currentOrdersList =
                                    value.currentOrdersStrip;
                                //   const visibility = 0.5;
                                return currentOrdersList.isNotEmpty
                                    ? /*VisibilityDetector(
                                        onVisibilityChanged: (visibilityInfo) =>
                                            (visibilityInfo.visibleFraction >
                                                        visibility &&
                                                    currentOrdersList
                                                        .isNotEmpty)
                                                ? loadUpcomingBooking()
                                                : (upcomingBookingTimer
                                                            ?.isActive ??
                                                        false)
                                                    ? upcomingBookingTimer
                                                        ?.cancel()
                                                    : adLog(
                                                        'Timer is not active',
                                                      ),
                                        key: const Key('homeBottomStripe'),
                                        child:*/
                                    ValueListenableBuilder(
                                        builder: (
                                          BuildContext context,
                                          double value,
                                          Widget? child,
                                        ) =>
                                            AnimatedPadding(
                                          padding: EdgeInsets.only(
                                            bottom:
                                                value != 0 ? bottomPadding : 0,
                                          ),
                                          duration: const Duration(
                                            milliseconds: 200,
                                          ),
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                              milliseconds: 200,
                                            ),
                                            width: double.infinity,
                                            height: safeAreaPadding != 0.0
                                                ? (value != 0
                                                    ? context.k_60
                                                    : animateHeight)
                                                : context.k_60,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  color: context
                                                      .adColors.dividerColor,
                                                  width: _borderThickness,
                                                ),
                                              ),
                                              color: context
                                                  .adColors.whiteTextColor,
                                            ),
                                            clipBehavior: Clip.hardEdge,
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaX: blurValue,
                                                sigmaY: blurValue,
                                                tileMode: TileMode.decal,
                                              ),
                                              child: Container(
                                                height: context.k_60,
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    children: [
                                                      Container(
                                                        height: context.k_60,
                                                        child: ADCarouselSlider
                                                            .builder(
                                                          itemCount:
                                                              currentOrdersList
                                                                  .length,
                                                          itemBuilder: (
                                                            context,
                                                            index,
                                                            ind,
                                                          ) =>
                                                              ListTile(
                                                            dense: true,
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                              left:
                                                                  context.k_16,
                                                              right:
                                                                  context.k_4,
                                                            ),
                                                            leading:
                                                                Image.asset(
                                                              getBookingImage(
                                                                currentOrdersList[
                                                                    index],
                                                              ),
                                                            ),
                                                            title: Text(
                                                              getBookingType(
                                                                currentOrdersList[
                                                                    index],
                                                              ),
                                                              style:
                                                                  ADTextStyle600
                                                                      .size14,
                                                            ),
                                                            subtitle: RichText(
                                                              // maxLines: 1,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text:
                                                                        getBookingStatus(
                                                                      currentOrdersList[
                                                                          index],
                                                                    ),
                                                                    style: ADTextStyle600
                                                                        .size12
                                                                        .setTextColor(
                                                                      FlightUtils
                                                                          .getBookingStatusTypeColor(
                                                                        currentOrdersList[index].status ??
                                                                            '',
                                                                        context,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        getBookingDate(
                                                                      currentOrdersList[
                                                                          index],
                                                                    ),
                                                                    style: ADTextStyle400
                                                                        .size12,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            trailing: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      onViewButtonPressed(
                                                                    currentOrdersList[
                                                                        index],
                                                                  ),
                                                                  child: Text(
                                                                    'view'
                                                                        .localize(
                                                                      context,
                                                                    ),
                                                                    style: ADTextStyle600
                                                                        .size12
                                                                        .setTextColor(
                                                                      context
                                                                          .adColors
                                                                          .blueColor,
                                                                    ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                      100,
                                                                    ),
                                                                  ),
                                                                  onTap: () => context
                                                                      .read<
                                                                          AppSessionState>()
                                                                      .removeUpcomingBooking(
                                                                        currentOrdersList[
                                                                            index],
                                                                      ),
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(
                                                                      context
                                                                          .k_6,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        width:
                                                                            crossBorder,
                                                                        color:
                                                                            const Color(
                                                                          0xff979797,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .close,
                                                                      color: context
                                                                          .adColors
                                                                          .darkGreyTextColor,
                                                                      size: context
                                                                          .k_12,
                                                                    ),
                                                                  ),
                                                                ).paddingBySide(
                                                                  right: context
                                                                      .k_8,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          options:
                                                              ADCarouselOptions(
                                                            onPageChanged:
                                                                _onPageChanged,
                                                            enableInfiniteScroll:
                                                                false,
                                                            height:
                                                                context.k_60,
                                                            viewportFraction: 1,
                                                          ),
                                                        ),
                                                      ),
                                                      if (currentOrdersList
                                                              .length >
                                                          1)
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children:
                                                              currentOrdersList
                                                                  .map(
                                                            (image) {
                                                              final int index =
                                                                  currentOrdersList
                                                                      .indexOf(
                                                                image,
                                                              );
                                                              return Container(
                                                                width:
                                                                    context.k_8,
                                                                height:
                                                                    context.k_2,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                bottom:
                                                                    context.k_4,
                                                                left:
                                                                    context.k_2,
                                                                right:
                                                                    context.k_2,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  context.k_2,
                                                                ),
                                                                color: _currentOrder ==
                                                                        index
                                                                    ? context
                                                                        .adColors
                                                                        .greyTextColor
                                                                    : context
                                                                        .adColors
                                                                        .contentBulletColor,
                                                              ),
                                                            );
                                                          },
                                                        ).toList(),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        valueListenable:
                                            (BottomBarState.key.currentWidget
                                                    as CustomTabScaffold)
                                                .heightNotifier,
                                      )
                                /*  ,)*/
                                    : const ADSizedBox.shrink();
                              },
                            ),
                          ],
                        ),
                      ),
                      floatingActionButton: enableTapToSalute
                          ? ValueListenableBuilder(
                              valueListenable: (BottomBarState.key.currentWidget
                                      as CustomTabScaffold)
                                  .heightNotifier,
                              builder: (
                                BuildContext context,
                                double value,
                                Widget? child,
                              ) =>
                                  AnimatedPadding(
                                duration: const Duration(milliseconds: 200),
                                padding: EdgeInsets.only(
                                  bottom: value == 0
                                      ? 0
                                      : bottomPadding - safeAreaPadding,
                                ),
                                child: StatefulBuilder(
                                  builder: (
                                    BuildContext context,
                                    void Function(void Function()) setState,
                                  ) =>
                                      isClosed
                                          ? const ADSizedBox.shrink()
                                          : InkWell(
                                              onTap: () => {
                                                if (isTapable)
                                                  {
                                                    navigateToScreenWithRootNavigatorResult(
                                                      context,
                                                      republicDayTheme,
                                                    ).then(
                                                      (value) => setState(() {
                                                        isClosed = value;
                                                      }),
                                                    ),
                                                    ThemeGaEvent()
                                                        .campaignPopup(),
                                                  },
                                              },
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                          20,
                                                        ),
                                                        bottomRight:
                                                            Radius.circular(
                                                          20,
                                                        ),
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          offset: Offset(
                                                            0,
                                                            2,
                                                          ),
                                                          blurRadius: 2,
                                                        ),
                                                      ],
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                          20,
                                                        ),
                                                        bottomRight:
                                                            Radius.circular(
                                                          20,
                                                        ),
                                                      ),
                                                      child: Image.network(
                                                        '${Environment.instance.configuration.cmsImageBaseUrl}-/media/Project/assets/pop_up_with_hide_symbol.gif',
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 0,
                                                    right: 0,
                                                    child: InkWell(
                                                      onTap: () => {
                                                        setState(
                                                          () {
                                                            isClosed = true;
                                                          },
                                                        ),
                                                      },
                                                      child: Container(
                                                        height: context.k_40,
                                                        width: context.k_40,
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                ),
                              ),
                            )
                          : null,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  InputBorder getBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(context.k_26)),
      borderSide: BorderSide(
        color: context.adColors.transparentColor,
      ),
    );
  }

  void onViewButtonPressed(MyBookingListItem? currentOrdersList) {
    if (currentOrdersList?.businessSubType == BookingType.flightBooking) {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        flightBookingItemDetails,
        argumentObject: currentOrdersList?.orderReferenceId,
      );
    } else if (currentOrdersList?.businessSubType == BookingType.cabBooking) {
      _onCabBookingTap(context, currentOrdersList);
    } else if (currentOrdersList?.businessSubType == BookingType.pranaam) {
      _onPranaamBookingTap(context, currentOrdersList);
    } else if (currentOrdersList?.businessSubType == BookingType.trainman) {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        trainBooking,
        argumentObject:
            currentOrdersList?.orderDetail?.trainManOrder?.tmBookingId,
      );
    } else {
      context.read<DutyFreeOrderState>().dutyFreeCancellationRequest = context
          .read<DutyFreeOrderState>()
          .dutyFreeCancellationRequest
          .copyWith(orderReferenceId: currentOrdersList?.orderReferenceId);
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        dutyFreeConfirmationOrder,
        argumentObject: currentOrdersList?.orderReferenceId ?? '',
      );
    }
  }

  void navigateToCancelDetailPage(
    BuildContext context,
    MyBookingListItem? currentOrdersList,
  ) {
    context.read<DutyFreeOrderState>().dutyFreeCancellationRequest = context
        .read<DutyFreeOrderState>()
        .dutyFreeCancellationRequest
        .copyWith(orderReferenceId: currentOrdersList?.orderReferenceId);
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      dutyFreeConfirmationOrder,
      argumentObject: currentOrdersList?.orderReferenceId ?? '',
    );
  }

  Future<void> _onPranaamBookingTap(
    BuildContext context,
    MyBookingListItem? currentOrdersList,
  ) async {
    final bool isRoundTrip = context
            .read<PranaamAppDataStateManagement>()
            .serviceBookingData
            .selectedService
            ?.serviceId ==
        id_3;
    await navigateToScreenWithRootNavigatorResult(
      context,
      myAccountView,
      argumentObject: [
        currentOrdersList?.orderReferenceId,
        false,
        isRoundTrip,
        isRoundTrip,
      ],
    ).then((value) => null);
  }

  Future<void> _onCabBookingTap(
    BuildContext context,
    MyBookingListItem? currentOrdersList,
  ) async {
    CabGoogleAnalytics().sendGAParametersCabBookingViewOrder(
      currentOrdersList,
    );
    await navigateToScreenWithRootNavigatorResult(
      context,
      cabBookingConfirmationScreen,
      argumentObject: CabBookingConfirmationNavigateModel(
        orderReferenceId: currentOrdersList?.orderReferenceId ?? '',
        isFromHomeView: currentOrdersList?.status == 'OnTheWay',
      ),
    ).then((value) => null);
  }

  String getBookingType(MyBookingListItem? currentOrdersList) {
    if (currentOrdersList?.businessSubType == BookingType.flightBooking) {
      return 'Flight Booking';
    } else if (currentOrdersList?.businessSubType == BookingType.cabBooking) {
      return currentOrdersList?.status == 'OnTheWay'
          ? 'You are on your way!'
          : currentOrdersList?.status == 'Scheduled'
              ? 'Your cab is scheduled'
              : 'Your upcoming ride';
    } else if (currentOrdersList?.businessSubType == BookingType.pranaam) {
      //todo localize
      if (currentOrdersList?.orderDetail?.pranaamDetail?.pranaamBookingType ==
          'StandalonePorterBooking') {
        return 'Porter Service';
      }
      return 'Pranaam Service';
    } else if (currentOrdersList?.businessSubType == BookingType.trainman) {
      return 'Train Booking';
    } else {
      return 'Duty Free';
    }
  }

  String getBookingStatus(MyBookingListItem? currentOrdersList) {
    if (currentOrdersList?.businessSubType == BookingType.flightBooking) {
      return 'Travel Date ';
      // return currentOrdersList?.orderStatus ?? '-';
    } else if (currentOrdersList?.businessSubType == BookingType.cabBooking) {
      return '';
      // return currentOrdersList?.orderStatus ?? '-';
    } else if (currentOrdersList?.businessSubType == BookingType.pranaam) {
      return '';
      // return currentOrdersList?.orderStatus ?? '-';
    } else if (currentOrdersList?.businessSubType == BookingType.trainman) {
      return 'Travel Date ';
      // return currentOrdersList?.orderStatus ?? '-';
    } else {
      return 'Pickup ';
      // return currentOrdersList?.orderStatus ?? '-';
    }
  }

  String getBookingImage(MyBookingListItem? currentOrdersList) {
    if (currentOrdersList?.businessSubType == BookingType.flightBooking) {
      return 'lib/assets/gif/plane.gif';
    } else if (currentOrdersList?.businessSubType == BookingType.cabBooking) {
      return 'lib/assets/gif/cab.gif';
    } else if (currentOrdersList?.businessSubType == BookingType.pranaam) {
      return 'lib/assets/gif/pranaam_service.gif';
    } else if (currentOrdersList?.businessSubType == BookingType.trainman) {
      return 'lib/assets/gif/Train_icon.gif';
    } else {
      return 'lib/assets/gif/bag.gif';
    }
  }

  String getBookingDate(MyBookingListItem? currentOrdersList) {
    if (currentOrdersList?.businessSubType == BookingType.flightBooking) {
      return 'on ${currentOrdersList?.orderDetail?.flightbookingDetail?.departure?.date ?? '-'}';
    } else if (currentOrdersList?.businessSubType == BookingType.cabBooking) {
      return currentOrdersList?.status == 'OnTheWay'
          ? 'Sit back and relax'
          : dateTimeFormatter(
              currentOrdersList?.createdOn?.toString() ?? '-',
            );
    } else if (currentOrdersList?.businessSubType == BookingType.pranaam) {
      return 'on ${dateTimeFormatter(
        currentOrdersList?.orderDetail?.pranaamDetail?.serviceDateTime ?? '-',
      )}';
    } else if (currentOrdersList?.businessSubType == BookingType.trainman) {
      return 'on ${dateTimeFormatterForTrain(
        currentOrdersList?.orderDetail?.trainManOrder?.boardingDate ?? '-',
      )}';
    } else {
      return 'on ${dateTimeFormatter(currentOrdersList?.createdOn ?? '')}';
    }
  }

  String dateTimeFormatter(String dateTime, {String? format}) {
    return DateFormat(format ?? Constant.dateFormat13)
        .format(DateTime.parse(dateTime).toLocal())
        .toString();
  }

  String dateTimeFormatterForTrain(String dateTime, {String? format}) {
    return DateFormat(format ?? Constant.dateFormat11)
        .format(DateTime.parse(dateTime).toLocal())
        .toString();
  }

  void _onPageChanged(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentOrder = index;
    });
    adLog(reason.toString());
  }

  String? _getLob(
    DutyFreeItem? item,
  ) {
    String? availableAirportsBasedOnLob;
    if (item?.uniqueId == '1') {
      availableAirportsBasedOnLob = ServicesEnum.pranaam.name.toString();
    } else if (item?.uniqueId == '9') {
      availableAirportsBasedOnLob = ServicesEnum.porter.name.toString();
    } else if (item?.uniqueId == '2') {
      availableAirportsBasedOnLob = ServicesEnum.dutyfree.name.toString();
    } else if (item?.uniqueId == '8') {
      availableAirportsBasedOnLob = ServicesEnum.cabbooking.name.toString();
    } else {
      availableAirportsBasedOnLob = null;
    }
    return availableAirportsBasedOnLob;
  }

  void handlePressed(
    ADTapCallbackWithValue? onTapHandler, {
    DutyFreeItem? item,
  }) {
    BottomSheetUtils.showBottomSheetDialog(
      context,
      ADDraggableScrollableBottomSheet(
        initialChildSize: BottomSheetUtils.getBottomSheetHeightRatio(context),
        childWidget: SliverAppBarBottomSheet(
          body: AirportsListScreen(
            airportsData: _airportListStateManagement?.airportData,
            availableAirportsBasedOnLob: _getLob(item),
          ),
          title: 'select_airport'.localize(context),
          flexibleTitleBottomPadding: context.k_2,
        ),
      ),
    ).then((value) {
      if (value != null) {
        final AirportItemModel selectedAirportsData = value;
        _airportListStateManagement?.updateData(selectedAirportsData, context);
        _onTapHandler(item = item, context, isFromAirportBottomSheet: true);
      }
      onTapHandler?.call(value);
    });
  }

  void _onTapHandler(
    dynamic item,
    BuildContext context, {
    bool isFromAirportBottomSheet = false,
    AirportListStateManagement? homeScreenViewModel,
  }) {
    if (item is AirportItemModel) {
      final AirportItemModel airportData = item;
      saveToPreference(keySelectedAirport, airportData);
      selectedAirportsData = airportData;
      HomeAndAirportSelectionClickEvent().airportSelectionAnalyticsData(
        selectedAirportsData?.city ?? '',
        item.widgetType ?? '',
      );
      selectedAirportNotifier.value = airportData.city ?? '';
      homeScreenViewModel?.updateData(airportData, context);
      if (selectedAirportsData?.airportCode?.isNotEmpty ?? false) {
        context.read<DutyFreeState>().getDutyFreeTerminalList();
      }
      Utils.scrollTabScreensToTop(scrollController: _scrollController);
    }
    if (item is DutyFreeItem) {
      if (item.widgetType == WidgetType.grid.name ||
          item.widgetType == WidgetType.gridServicesTile.name) {
        HomeAndAirportSelectionClickEvent()
            .lobSelectionAnalyticsData(item.title);
      } else if (item.widgetType == WidgetType.homeTileWidget.name) {
        HomeAndAirportSelectionClickEvent()
            .viewBottomTilesSelectionAnalyticsData(item.title, item.title);
      } else {
        HomeAndAirportSelectionClickEvent().viewBannerSelectionAnalyticsData(
          item.title,
          item.widgetType,
        );
      }
      if (!isFromAirportBottomSheet && item.isAirportSelectNeeded) {
        handlePressed(null, item: item);
      } else {
        adLog('WebViewModel ${item.uniqueId}');
        if (item.uniqueId.isEmpty &&
            item.ctaUrl.isNotEmpty &&
            item.ctaUrl.contains('http')) {
          final WebViewModel model = WebViewModel(
            title: item.title.isNotEmpty &&
                    item.widgetType != WidgetType.moreServices.name
                ? item.title
                : 'services'.localize(context),
            url:
                '${item.ctaUrl}&app_id=${ProfileSingleton.profileSingleton.appInstanceId}',
          );
          if (model.url.isNotEmpty) {
            navigateToScreenUsingNamedRouteWithArguments(
              context,
              webViewContainer,
              argumentObject: model,
            );
          }
        } else if ((item.uniqueId.isNotEmpty && item.ctaUrl.isNotEmpty) &&
            item.uniqueId == RedirectionUniqueIds.openOutsideApp) {
          Utils.launchAppUrl(
            Uri.parse(item.ctaUrl),
          );
        } else if (item.promoCode.isNotEmpty) {
          navigateToScreenUsingNamedRouteWithArguments(
            context,
            offerDetail,
            rootNavigator: false,
            argumentObject: OfferKeyModel(
              id: item.promoCode,
              title: item.subTitle,
            ),
          );
        } else if ((item.uniqueId.isNotEmpty && item.ctaUrl.isEmpty) ||
            (item.uniqueId.isNotEmpty && item.ctaUrl.isNotEmpty)) {
          handleVerticalTap(
            item,
            int.parse(item.uniqueId),
            context,
          );
        }
      }
    }
  }

  /// Save Data to Preference
  void saveToPreference(String key, AirportItemModel airportsData) {
    // final dataObj = <String, Object>{
    //   'key': key,
    //   'dataType': 'string',
    //   'value': jsonEncode(airportsData),
    // };
    // AdaniMobilePlugin.writeSharedPref(dataObj);
    SharedPrefsUtils().putVarValueInPrefs(key, airportsData);
  }

  /// this method is used to perform click listener on circle grid view
  void handleVerticalTap(
    DutyFreeItem item,
    int? objectID,
    BuildContext context,
  ) {
    const int flightBookingFlag = 0;
    const int pranaamServiceId = 1;
    const int dutyFree = 2;
    const int shopFlag = 4;
    const int foodFlag = 5;
    const int flightStatusFlag = 6;
    const int cabBookingFlag = 8;
    const int helpSupport = 1001;
    const int feedback = 1002;
    const int chatBot = 1004;
    const int rateUs = 1003;
    const int viewAllServices = 100;
    const int loyaltyDashboardFlag = 7;
    const int porterServiceFlag = 9;
    const int republicRewardFlag = 11;
    const int trainBookingFlag = 12;
    const int offerAndDiscountDashboardFlag = 13;

    switch (objectID) {
      case flightBookingFlag:
        navigateToScreenUsingNamedRoute(context, flightBooking);
        break;
      case pranaamServiceId:
        navigateToPranaamScreen(context);
        break;
      case porterServiceFlag:
        navigateToStandAloneScreen(
          context,
          StandAloneServiceType.porter,
        );
        break;
      case shopFlag:
        navigateToScreenUsingNamedRoute(
          context,
          airportShopList,
        );
        break;
      case trainBookingFlag:
        navigateToScreenUsingNamedRoute(
          context,
          trainBooking,
        );
        break;
      case dutyFree:
        ageConfirmation(context);
        break;
      case foodFlag:
        navigateToScreenUsingNamedRoute(
          context,
          airportFoodList,
        );
        break;
      case flightStatusFlag:
        final AirportItemModel? selectedAirportItemModel = selectedAirportsData;
        if (selectedAirportItemModel?.isNonAdaniAirport ?? false) {
          navigateToScreenUsingNamedRouteWithArguments(
            context,
            addFlightInformation,
            argumentObject: item.title,
          );
        } else {
          navigateToScreenUsingNamedRouteWithArguments(
            context,
            flightStatusScreen,
            argumentObject:
                FidsModel(airportItemModel: selectedAirportItemModel),
          );
        }
        break;
      case loyaltyDashboardFlag:
        navigateToScreenUsingNamedRoute(
          context,
          loyaltyDashboard,
          rootNavigator: false,
        );
        break;
      case cabBookingFlag:
        final GlobalKey<NavigatorState> navigatorState =
            HomeBottomAssets.homeBottomPages.keys.toList()[1];
        BottomBarState.currentIndex = 1;
        final CustomTabScaffold customTabScaffold =
            BottomBarState.key.currentWidget as CustomTabScaffold;
        customTabScaffold.controller?.index = 1;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          navigatorState.currentState
              ?.pushNamedAndRemoveUntil(
                cabBookingHomeScreen,
                (route) => route.isFirst,
              )
              .then((value) => debugPrint(value?.toString()));
        });
        break;
      case helpSupport:
        if (item.contactDetail != null) {
          Utils.helpBottomSheet(context, item.contactDetail);
        } else {
          Utils.showContactDetailNotFoundSnackBar(context);
        }
        break;
      case feedback:

        ///GA event book now feedback start
        GaEvent.getInstance().feedbackEvent('Home Screen');
        ClickEvents.feedback_start
            .logEvent(parameters: GaEvent.getInstance().parameterMap);
        navigateToScreenUsingNamedRoute(
          context,
          customerFeedback,
        );
        break;
      case chatBot:
        ChatBotConfiguration.startChatBot();
        break;
      case rateUs:
        Utils.openStore();
        break;
      case viewAllServices:
        BottomTabNavKeys.businessTabItemKey.currentState?.popUntil(
          (route) => route.isFirst,
        );
        final CustomTabScaffold scaffold =
            BottomBarState.key.currentWidget as CustomTabScaffold;
        scaffold.controller?.index = 1;
        break;
      case republicRewardFlag:
        navigateToScreenUsingNamedRoute(
          context,
          republicReward,
        );
        break;
      case offerAndDiscountDashboardFlag:
        navigateToScreenUsingNamedRouteWithArguments(
          context,
          offersDashboard,
          rootNavigator: false,
          argumentObject:
              OfferDashKeyModel(selectedOffersTabTitle: item.description),
        );
        break;
      default:
        adLog('Item Not Found');
    }
  }

  void sendFCMToBackend(String value) {
    if (value.isNotEmpty) {
      context.read<AppSessionState>().sendFCMToBackend(value);
    }
  }
}

void navigateToStandAloneScreen(
  BuildContext context,
  StandAloneServiceType standAloneServiceType, {
  bool isFromBottomSheet = false,
}) {
  if (isFromBottomSheet) {
    navigatorPopScreen(context);
  }
  final CustomTabScaffold customTabScaffold =
      BottomBarState.key.currentWidget as CustomTabScaffold;
  final GlobalKey<NavigatorState> navigatorState =
      HomeBottomAssets.homeBottomPages.keys.toList()[1];
  BottomBarState.currentIndex = 1;
  customTabScaffold.controller?.index = 1;
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    navigatorState.currentState
        ?.pushNamedAndRemoveUntil(
          standAloneDashboard,
          (route) => route.isFirst,
          arguments: standAloneServiceType,
        )
        .then((value) => adLog(value?.toString()));
  });
}

void ageConfirmation(
  BuildContext context, {
  bool openFromBottomSheet = false,
}) {
  // final dataObj = <String, Object>{
  //   'key': 'age',
  //   'dataType': 'boolean',
  // };
  if (!context.read<DutyFreeState>().ageAbove25) {
    if ((selectedAirportsData?.dutyFreeAgeLimit ?? 0) > 0) {
      openAgeDialog(context, openFromBottomSheet: openFromBottomSheet);
    } else {
      navigateToDutyFreeScreen(
        context,
        openFromBottomSheet: openFromBottomSheet,
      );
    }
  } else {
    navigateToDutyFreeScreen(context, openFromBottomSheet: openFromBottomSheet);
  }
}

void openAgeDialog(
  BuildContext context, {
  bool openFromBottomSheet = false,
}) {
  final bottomSheet = showModalBottomSheet(
    useRootNavigator: true,
    backgroundColor: context.adColors.whiteTextColor,
    elevation: context.k_8,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(context.k_22),
      ),
    ),
    context: context,
    builder: (dialogContext) {
      return DutyFreeAgeConfirmation(
        detailString: 'age_confirmation_message'.localize(context).replaceAll(
              '#1',
              (selectedAirportsData?.dutyFreeAgeLimit ?? 0).toString(),
            ),
        titleString: 'age_confirmation'.localize(context),
        yesCallBack: () => openDutyFreeScreen(
          context,
          dialogContext,
          isAgeAbove25: true,
          openFromBottomSheet: openFromBottomSheet,
        ),
        noCallBack: () => openDutyFreeScreen(
          context,
          dialogContext,
          isAgeAbove25: false,
          openFromBottomSheet: openFromBottomSheet,
        ),
      );

      // return DutyFreeRemoveItem(
      //   detailString: 'age_confirmation_message'.localize(context),
      //   titleString: 'age_confirmation'.localize(context),
      //   yesCallBack: () =>
      //       openDutyFreeScreen(context, dialogContext, isAgeAbove25: true),
      //   noCallBack: () =>
      //       openDutyFreeScreen(context, dialogContext, isAgeAbove25: false),
      // );
    },
  );
  adLog('$bottomSheet');
}

/// Function to pop dialog and push duty free screen
void openDutyFreeScreen(
  BuildContext context,
  BuildContext dialogContext, {
  required bool isAgeAbove25,
  bool openFromBottomSheet = false,
}) {
  // final dataObj = <String, Object>{
  //   'key': 'age',
  //   'dataType': 'boolean',
  //   'value': isAgeAbove25,
  // };
  // AdaniMobilePlugin.writeSharedPref(dataObj);

  context.read<DutyFreeState>().ageAbove25 = isAgeAbove25;
  context
      .read<DutyFreeState>()
      .dutyFreeEventState
      .ageConfirmationEvent(isAgeAbove: isAgeAbove25);
  navigatorPopScreen(dialogContext);
  navigateToDutyFreeScreen(context, openFromBottomSheet: openFromBottomSheet);
}

void navigateToDutyFreeScreen(
  BuildContext context, {
  bool openFromBottomSheet = false,
}) {
  if (openFromBottomSheet) {
    navigatorPopScreen(context);
  }
  final CustomTabScaffold customTabScaffold =
      BottomBarState.key.currentWidget as CustomTabScaffold;
  final GlobalKey<NavigatorState> navigatorState =
      HomeBottomAssets.homeBottomPages.keys.toList()[1];
  BottomBarState.currentIndex = 1;
  customTabScaffold.controller?.index = 1;
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    navigatorState.currentState
        ?.pushNamedAndRemoveUntil(
          dutyFreeScreen,
          (route) => route.isFirst,
        )
        .then((value) => adLog(value?.toString()));
  });
}

void navigateToPranaamScreen(
  BuildContext context, {
  bool isFromBottomSheet = false,
}) {
  if (isFromBottomSheet) {
    navigatorPopScreen(context);
  }
  final CustomTabScaffold customTabScaffold =
      BottomBarState.key.currentWidget as CustomTabScaffold;
  final GlobalKey<NavigatorState> navigatorState =
      HomeBottomAssets.homeBottomPages.keys.toList()[1];
  BottomBarState.currentIndex = 1;
  customTabScaffold.controller?.index = 1;
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    navigatorState.currentState
        ?.pushNamedAndRemoveUntil(
          pranaamService,
          (route) => route.isFirst,
        )
        .then((value) => adLog(value?.toString()));
  });
}

class _ShimmerWidget extends StatelessWidget {
  final double shimmerWidth_100 = 100.w;
  final double shimmerWidth_150 = 150.w;
  final double shimmerHeight_20 = 20.h;
  final double shimmerWidth_500 = 500.w;
  final double shimmerHeight_180 = 180.h;
  final double _shimmerWidth_100 = 100.sp;
  final double shimmerHeight_100 = 100.sp;
  final int gridRowCount_3 = 3;
  final int shimmerItemCount = 6;
  final double containerHorizontalMargin_25 = 12.w;
  final double sizeBoxWidth_160 = 160.w;
  final double sizeBoxHeight_300 = 300.h;
  final double sizeBoxHeight_10 = 10.h;
  final int sizeBoxCount = 6;

  _ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: containerHorizontalMargin_25,
          ),
          child: ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            width: shimmerWidth_500,
            height: shimmerHeight_180,
          ),
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        ADShimmerBuilder(
          shimmerBuilderType: ShimmerBuilderType.grid,
          shimmerWidget: ADShimmerWidget.shimmerShape(
            type: ShimmerType.circleWithText,
            height: shimmerHeight_100,
            width: _shimmerWidth_100,
          ),
          gridRowCount: gridRowCount_3,
          itemCount: shimmerItemCount,
        ),
        ADSizedBox(
          height: context.k_10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              width: shimmerWidth_150,
              height: shimmerHeight_20,
            ),
            ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              width: shimmerWidth_100,
              height: shimmerHeight_20,
            ),
          ],
        ),
        SizedBox(
          height: sizeBoxHeight_300,
          child: ADShimmerBuilder(
            shimmerBuilderType: ShimmerBuilderType.listHorizontal,
            shimmerWidget: ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              height: sizeBoxHeight_300,
              width: sizeBoxWidth_160,
            ),
            itemCount: sizeBoxCount,
          ),
        ),
      ],
    );
  }
}

/*/// This class will used to represent _FlexibleSpaceBar.
class _FlexibleSpaceBar extends StatelessWidget {
  final double flexableSpaceBar = 80.sp;
  final int maxLines_3 = 3;
  final double decorationThickness = 2.sp;
  _FlexibleSpaceBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ADSizedBox(
                  height: flexableSpaceBar,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Duty Free',
                      style: ADTextStyle700.size32.setTextColor(Colors.black),
                      maxLines: maxLines_3,
                      textAlign: TextAlign.left,
                    ).paddingBySide(
                      top: context.k_40,
                      left: context.k_10,
                    ),
                  ),
                ),
                Text(
                  'DEPARTURE TERMINAL 2',
                  style: ADTextStyle500.size14
                      .setTextColor(context.adColors.greyTextColor)
                      .copyWith(
                    shadows: [
                      const Shadow(color: Colors.grey, offset: Offset(0, -4)),
                    ],
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.grey,
                    decorationThickness: decorationThickness,
                    decorationStyle: TextDecorationStyle.dashed,
                  ),
                ).paddingBySide(top: context.k_8, left: context.k_12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/
class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.k_4,
          ),
          ADShimmerBuilder(
            shimmerBuilderType: ShimmerBuilderType.grid,
            shimmerWidget: ADShimmerWidget.shimmerShape(
              type: ShimmerType.circleWithText,
              height: size_80.sp,
              width: size_80.sp,
              detailTextWidth: size_80.sp,
              detailTextHeight: context.k_20,
            ),
            gridRowCount: maxLinesLimit,
            itemCount: itemCountLimit,
          ),
          ADShimmerWidget.shimmerShape(
            type: ShimmerType.rectangleBox,
            width: size_500.sp,
            height: size_150.sp,
          ).paddingBySide(left: context.k_20, right: context.k_20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                width: size_200.sp,
                height: context.k_20,
              ),
              ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                width: size_100.sp,
                height: context.k_20,
              ),
            ],
          ),
          SizedBox(
            height: size_300.sp,
            child: ADShimmerBuilder(
              shimmerBuilderType: ShimmerBuilderType.listHorizontal,
              shimmerWidget: ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                height: size_300.sp,
                width: size_160.sp,
              ),
              itemCount: itemCountLimit,
            ),
          ),
        ],
      ),
    );
  }
}

class ShowTitleWhenCollapsed extends StatelessWidget {
  const ShowTitleWhenCollapsed({
    Key? key,
    required this.dynamicTitle,
    required this.dynamicTextColor,
  }) : super(key: key);

  final ValueNotifier<String> dynamicTitle;
  final ValueNotifier<Color> dynamicTextColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([dynamicTitle, dynamicTextColor]),
      builder: (BuildContext context, _) => Text(
        dynamicTitle.value.toUpperCase(),
        style: ADTextStyle400.size12.setTextColor(dynamicTextColor.value),
        maxLines: maxLinesLimit,
      ),
    );
  }
}

class ShowTitleWhenExpanded extends StatelessWidget {
  const ShowTitleWhenExpanded({
    Key? key,
    required this.dynamicTextColor,
    required this.airportStateData,
  }) : super(key: key);

  final ValueNotifier<Color> dynamicTextColor;
  final AirportItemModel? airportStateData;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([dynamicTextColor]),
      builder: (BuildContext context, _) => Text(
        airportStateData?.airportName?.trim().toUpperCase() ?? '',
        overflow: TextOverflow.ellipsis,
        style: ADTextStyle400.size12.setTextColor(dynamicTextColor.value),
        maxLines: 1,
        textAlign: TextAlign.left,
      ),
    );
  }
}

// class GetSelectedState extends StatelessWidget {
//   const GetSelectedState({
//     Key? key,
//     required this.cityDetailModel,
//   }) : super(key: key);
//
//   final AirportsData cityDetailModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => handlePressed(context, cityDetailModel),
//       child: Row(
//         children: [
//           Flexible(
//             child: Text(
//               cityDetailModel.title ?? '',
//               style: ADTextStyle700.size32.setTextColor(context.adColors.black),
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           Icon(
//             Icons.keyboard_arrow_down,
//             size: context.k_28,
//             color: context.adColors.blackTextColor,
//           ),
//         ],
//       ).paddingBySide(right: context.k_60),
//     );
//   }
//
//   void handlePressed(BuildContext context, AirportsData airportsData) {
//     showModalBottomSheet(
//       backgroundColor: context.adColors.whiteTextColor,
//       elevation: context.k_8,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(context.k_18),
//         ),
//       ),
//       context: context,
//       builder: (context) {
//         return ADDraggableScrollableBottomSheet(
//           initialChildSize: BottomSheetUtils.getBottomSheetHeightRatio(context),
//           childWidget: AirportsListScreen(
//             airportsData: airportsData,
//           ),
//         );
//       },
//     ).then((value) {
//       if (value != null) {
//         final AirportsData selectedAirportsData = value;
//         homeScreenViewModel.updateData(selectedAirportsData);
//       }
//     });
//   }
// }
//
// class SetFlexibleSpaceBar extends StatelessWidget {
//   const SetFlexibleSpaceBar({
//     Key? key,
//     required this.cityDetailModel,
//     required this.dynamicTextColor,
//   }) : super(key: key);
//
//   final AirportsData cityDetailModel;
//   final ValueNotifier<Color> dynamicTextColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return FlexibleSpaceBar(
//       background: Stack(
//         children: [
//           SafeArea(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 SizedBox(
//                   width: size_300.sp,
//                   child: Align(
//                     alignment: Alignment.bottomLeft,
//                     child: ShowTitleWhenExpanded(
//                       airportStateData: cityDetailModel,
//                       dynamicTextColor: dynamicTextColor,
//                     ).paddingBySide(
//                       top: context.k_10,
//                       left: context.k_20,
//                     ),
//                   ),
//                 ),
//                 GetSelectedState(
//                   cityDetailModel: cityDetailModel,
//                 ).paddingBySide(
//                   left: context.k_20,
//                   top: context.k_6,
//                 ),
//               ],
//             ).paddingBySide(
//               top: context.k_4,
//             ),
//           ),
//           SafeArea(
//             child: ADSearch(
//               searchTitle: 'search_services'.localize(context),
//             ).paddingBySide(
//               top: topPaddingADSearch.sp,
//               bottom: context.k_8,
//               left: context.k_16,
//               right: context.k_16,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
///this widget is used to open alert dialog
Future showDialogScreen(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext buildContext) {
      return DialogView(
        buttonRequired: true,
        buildContext: context,
      );
    },
  );
}
