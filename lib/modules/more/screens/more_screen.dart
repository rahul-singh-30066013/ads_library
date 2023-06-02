/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/home_bottom_assets.dart';
import 'package:adani_airport_mobile/modules/components/ad_profile_with_action.dart';
import 'package:adani_airport_mobile/modules/components/coming_soon.dart';
import 'package:adani_airport_mobile/modules/components/home_sliver_app_bar_base_component.dart';
import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/reward_balance_view.dart';
import 'package:adani_airport_mobile/modules/more/ga_analytics_profile/profile_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/more/models/more_options_model.dart';
import 'package:adani_airport_mobile/modules/more/screens/logout_screen/logout_screen.dart';
import 'package:adani_airport_mobile/modules/more/state_management/app_model_state_management.dart';
import 'package:adani_airport_mobile/modules/more/state_management/more_tab_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/network/web_links/web_links.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/chat_bot/chat_bot_configuration.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

double vPadding20 = 20.h;

///This class is used to more screen which show profile and we can change language of entire application
class MoreScreen extends StatefulWidget {
  final bool openBottomSheet;
  final bool isFromOrderAndBooking;
  final ScrollController? scrollController;

  const MoreScreen({
    Key? key,
    required this.openBottomSheet,
    this.isFromOrderAndBooking = false,
    this.scrollController,
  }) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  ScrollController newScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final AppModelStateManagement appModelStateManagement =
        context.read<AppModelStateManagement>();
    final MoreTabState moreTabState = MoreTabState(
      isLoyalityActive: appModelStateManagement.isLoyalityActive,
      isLoggedIn: context.read<AppSessionState>().isLoggedIn,
    );

    return ChangeNotifierProxyProvider<AppSessionState, MoreTabState>(
      create: (BuildContext context) => moreTabState,
      update: (
        context,
        appSessionState,
        moreTabState,
      ) =>
          MoreTabState(
        isLoyalityActive: appModelStateManagement.isLoyalityActive,
        isLoggedIn: appSessionState.isLoggedIn,
      ),
      child: Consumer<MoreTabState>(
        builder: (context, value, child) {
          adLog(ProfileSingleton.profileSingleton.isLoggedIn.toString());
          // const int moreScreen = 4;
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,

            /// implement sliver effect on widget
            body: widget.openBottomSheet
                ? _ProfileListWidget(
                    value: value,
                    openBottomSheet: widget.openBottomSheet,
                    isFromOrderAndBooking: widget.isFromOrderAndBooking,
                    scrollController: widget.scrollController,
                  )
                : SafeArea(
                    child: HomeSliverAppBarBaseComponent(
                      pinnedVale: true,
                      titleTextStyle: ADTextStyle700.size32.setTextColor(
                        context.adColors.blackTextColor,
                      ),
                      flexibleTitleTopPadding: 0,
                      flexibleTitleBottomPadding: 0,
                      body: _ProfileListWidget(
                        value: value,
                        openBottomSheet: widget.openBottomSheet,
                        isFromOrderAndBooking: widget.isFromOrderAndBooking,
                      ),
                      title: 'more'.localize(context),
                    ),
                  ),
          );
        },
      ),
    );
  }
}

class _ProfileListWidget extends StatelessWidget {
  final MoreTabState value;
  final bool openBottomSheet;
  final bool isFromOrderAndBooking;
  final ScrollController? scrollController;

  const _ProfileListWidget({
    Key? key,
    required this.value,
    required this.openBottomSheet,
    required this.isFromOrderAndBooking,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      controller: scrollController,
      itemCount: value.moreOptionList.length,
      padding: openBottomSheet ? null : EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return ProfileListTile(
          item: value.moreOptionList[index],
          openBottomSheet: openBottomSheet,
          isFromOrderAndBooking: isFromOrderAndBooking,
        ).paddingBySide(bottom: context.k_6);
      },
    );
  }
}

///Create to show the profile tile which use RichWidget inside
class ProfileListTile extends StatefulWidget {
  final bool openBottomSheet;
  final bool isFromOrderAndBooking;

  const ProfileListTile({
    Key? key,
    required this.item,
    required this.openBottomSheet,
    required this.isFromOrderAndBooking,
  }) : super(key: key);

  final MoreOptionsItemModel item;

  static final kRowHeight = 80.sp;
  static final kProfileHeight = 160.sp;
  static final kOtherRowHeight = 57.sp;
  static final kVersionContainerHeight = 85.sp;

  @override
  State<ProfileListTile> createState() => _ProfileListTileState();
}

class _ProfileListTileState extends State<ProfileListTile> {
  final double percentageHeightOfScreen = 0.9.h;

  final double widthOfLine = 50.h;
  ValueNotifier<bool> logoutNotifier = ValueNotifier(false);

  String getBalance() {
    final AppSessionState appSessionState = context.read<AppSessionState>();
    return appSessionState.loyaltyPoint;
  }

  @override
  Widget build(BuildContext context) {
    final firstName =
        context.read<AppSessionState>().profileModel.personInfo?.firstName ??
            '';
    final lastName =
        context.read<AppSessionState>().profileModel.personInfo?.lastName ?? '';

    final AppModelStateManagement appModelStateManagement =
        context.read<AppModelStateManagement>();

    final String appVersion =
        '${appModelStateManagement.packageInfo?.version} ${'(${appModelStateManagement.packageInfo?.buildNumber})'}';

    final double _profileCircleSize = 80.sp;

    switch (widget.item.type) {
      case MoreOptionsItemType.profile:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ADSizedBox(
              height: context.k_4,
            ),
            InkWell(
              onTap: () => signInOnTap(),
              child: Row(
                children: [
                  ADSizedBox(
                    width: context.k_6,
                  ),
                  AdProfileWithAction(
                    circleSize: _profileCircleSize,
                    iconSize: context.k_20,
                    textStyle: ADTextStyle600.size18
                        .setTextColor(context.adColors.darkGreyTextColor),
                    openBottomSheetOnTap: false,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _displayText(firstName, lastName) ??
                              widget.item.title.localize(context),
                          style: ADTextStyle600.size20
                              .setTextColor(context.adColors.blackColor),
                        ),
                        ADSizedBox(
                          height: ProfileSingleton.profileSingleton.isLoggedIn
                              ? context.k_6
                              : context.k_2,
                        ),
                        if (ProfileSingleton.profileSingleton.isLoggedIn)
                          RichText(
                            text: TextSpan(
                              style: ADTextStyle400.size14,
                              children: [
                                TextSpan(text: widget.item.subTitle ?? ''),
                                WidgetSpan(
                                  child: SvgPicture.asset(
                                    'lib/assets/images/svg/icons/more/verified.svg',
                                    color: context.adColors.greenColor,
                                    width: context.k_16,
                                    height: context.k_16,
                                  ).paddingBySide(left: context.k_6),
                                ),
                              ],
                            ),
                          ),
                        if (!ProfileSingleton.profileSingleton.isLoggedIn)
                          Text(
                            widget.item.subTitle?.localize(context) ?? '',
                            style: ADTextStyle600.size16
                                .setTextColor(
                                  context.adColors.black,
                                )
                                .copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                      ],
                    ),
                  ),
                  if (ProfileSingleton.profileSingleton.isLoggedIn)
                    Icon(
                      Icons.arrow_forward_ios,
                      color: context.adColors.darkGreyTextColor,
                      size: context.k_16,
                    ).paddingBySide(right: context.k_16),
                ],
              ).paddingBySide(
                top: context.k_16,
                bottom: context.k_16,
              ),
            ),
            ADSizedBox(
              height: context.k_8,
            ),
          ],
        );
      case MoreOptionsItemType.main:
        return ListTile(
          contentPadding: EdgeInsets.symmetric(
            vertical: context.k_8,
            horizontal: context.k_16,
          ),
          onTap: (widget.item.isActive ?? true)
              ? () => showNextScreen(context)
              : null,
          minLeadingWidth: context.k_10,
          title: Row(
            children: [
              Text(
                widget.item.title.localize(context),
                style: ADTextStyle400.size18
                    .setTextColor(context.adColors.blackColor),
              ),
              ADSizedBox(
                width: context.k_10,
              ),
              if (widget.item.isActive ?? true)
                const SizedBox.shrink()
              else
                const ComingSoon(),
            ],
          ),
          subtitle: widget.item.subTitle != null
              ? Text(
                  widget.item.subTitle?.localize(context) ?? '',
                  style: ADTextStyle400.size14
                      .setTextColor(context.adColors.darkGreyTextColor),
                  // .copyWith(fontWeight: FontWeight.w300),
                ).paddingBySide(top: context.k_6)
              : null,
          leading: SizedBox(
            height: ProfileListTile.kRowHeight,
            child: SvgPicture.asset(
              '${widget.item.icon}',
              height: context.k_20,
              width: context.k_20,
              color: context.adColors.darkGreyTextColor,
            ),
          ),
        ).paddingBySide();
      case MoreOptionsItemType.loyalty:
        return ListTile(
          contentPadding: EdgeInsets.symmetric(
            vertical: context.k_8,
            horizontal: context.k_16,
          ),
          onTap: (widget.item.isActive ?? true)
              ? () => showNextScreen(context)
              : null,
          minLeadingWidth: context.k_10,
          trailing: IntrinsicWidth(
            child: Row(
              children: [
                ValueListenableBuilder(
                  valueListenable:
                      context.read<AppSessionState>().rewardBalance,
                  builder: (context, num values, child) => RewardBalanceView(
                    balance: int.tryParse(getBalance()) ?? 0,
                    boaderColor: context.adColors.greyTextColor,
                    textColor: context.adColors.blackColor,
                    pending: 0,
                    sidePadding: 0,
                  ),
                ),
              ],
            ),
          ),
          title: Column(
            children: [
              Row(
                children: [
                  Text(
                    widget.item.title.localize(context),
                    style: ADTextStyle400.size18
                        .setTextColor(context.adColors.blackColor),
                  ),
                  ADSizedBox(
                    width: context.k_10,
                  ),
                  if (widget.item.isActive ?? true)
                    const SizedBox.shrink()
                  else
                    const ComingSoon(),
                ],
              ),
            ],
          ),
          subtitle: widget.item.subTitle != null
              ? Text(
                  widget.item.subTitle?.localize(context) ?? '',
                  style: ADTextStyle400.size14
                      .setTextColor(context.adColors.darkGreyTextColor),
                ).paddingBySide(top: context.k_6)
              : null,
          leading: SizedBox(
            height: ProfileListTile.kRowHeight,
            child: SvgPicture.asset(
              '${widget.item.icon}',
              height: context.k_20,
              width: context.k_20,
              color: context.adColors.darkGreyTextColor,
            ),
          ),
        ).paddingBySide();
      case MoreOptionsItemType.otherHeader:
        const double fifteen = 15;
        return Text(
          widget.item.title.localize(context),
          style: ADTextStyle500.size14
              .setTextColor(context.adColors.greyTextColor)
              .copyWith(
                fontSize: fifteen,
              ),
        ).paddingBySide(
          left: context.k_16,
          top: context.k_16,
          bottom: context.k_16,
        );
      case MoreOptionsItemType.other:
        return ListTile(
          onTap: () => {
            if (!DeBounce.isRedundantClick())
              {
                showNextScreen(context),
              },
          },
          minLeadingWidth: context.k_10,
          title: Text(
            widget.item.title.localize(context),
            style:
                ADTextStyle400.size18.setTextColor(context.adColors.blackColor),
          ),
          leading: SizedBox(
            height: ProfileListTile.kRowHeight,
            child: widget.item.icon != null
                ? SvgPicture.asset(
                    '${widget.item.icon}',
                    height: context.k_20,
                    width: context.k_20,
                    color: context.adColors.darkGreyTextColor,
                  )
                : Icon(
                    Icons.logout,
                    color: context.adColors.greyTextColor,
                  ),
          ),
        );
      case MoreOptionsItemType.version:
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.k_16,
            vertical: context.k_20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                '${widget.item.icon}',
                color: context.adColors.darkGreyTextColor,
                alignment: Alignment.topLeft,
                height: context.k_36,
              ),
              ADSizedBox(
                height: context.k_12,
              ),
              Text(
                '${widget.item.title.localize(context)} $appVersion',
                style: ADTextStyle400.size14
                    .setTextColor(context.adColors.greyTextColor),
              ),
            ],
          ),
        );
      case MoreOptionsItemType.language:
        return SizedBox(
          height: ProfileListTile.kOtherRowHeight,
          child: InkWell(
            onTap: () => _showLanguageOptions(context),
            child: ListTile(
              minLeadingWidth: context.k_10,
              title: Text(
                widget.item.title.localize(context),
                style: ADTextStyle400.size18
                    .setTextColor(context.adColors.blackColor),
              ),
              leading: SizedBox(
                height: ProfileListTile.kRowHeight,
                child: SvgPicture.asset(
                  '${widget.item.icon}',
                  height: context.k_22,
                  width: context.k_22,
                  color: context.adColors.darkGreyTextColor,
                ),
              ),
            ),
          ),
        );
    }
  }

  String? _displayText(String firstName, String lastName) {
    if (ProfileSingleton.profileSingleton.isLoggedIn) {
      if ((firstName.isNotEmpty && lastName.isNotEmpty) ||
          (firstName.isNotEmpty)) {
        return 'Hi $firstName!';
      }
    }
    return null;
  }

  void orderAndBookingMove(BuildContext _context) {
    if (ProfileSingleton.profileSingleton.isLoggedIn) {
      navigateToScreenUsingNamedRouteWithArguments(
        _context,
        orderAndBookingsScreen,
        argumentObject: true,
      );
      ProfileGaAnalytics().viewProfileSelectAnalyticsData(
        label: 'orders_and_bookings',
        type: 'profile',
      );
    } else {
      navigateToScreenUsingNamedRouteWithArguments(
        _context,
        signInScreen,
        argumentObject: SignInStatusModel(
          isLoginStatusTap: (value) => adLog(value.toString()),
          isNotFromSplash: true,
          popUpRequired: true,
          currentRouteName: tabRoute,
        ),
      );
      ProfileGaAnalytics()
          .viewProfileSelectAnalyticsData(label: 'login', type: 'profile');
    }
  }

  /// this method is used for moved to save flight
  void moveToSaveFlight(BuildContext _context) {
    if (ProfileSingleton.profileSingleton.isLoggedIn) {
      navigateToScreenUsingNamedRoute(
        context,
        savedFlights,
      );
    } else {
      navigateToScreenUsingNamedRouteWithArguments(
        _context,
        signInScreen,
        argumentObject: SignInStatusModel(
          isLoginStatusTap: (value) => adLog(value.toString()),
          isNotFromSplash: true,
          popUpRequired: true,
          currentRouteName: tabRoute,
        ),
      );
    }
  }

  void showNextScreen(BuildContext _context) {
    switch (widget.item.actionType) {
      case MoreOptionsActionType.orderAndBooking:
        orderAndBookingMove(_context);
        break;
      case MoreOptionsActionType.termsAndCondition:
        navigateToScreenUsingNamedRouteWithArguments(
          _context,
          webViewContainer,
          argumentObject: WebViewModel(
            title: widget.item.title.localize(context),
            url:
                '${Environment.instance.configuration.webBaseUrl}${WebLinks.termsAndConditions}',
          ),
        );
        ProfileGaAnalytics().viewProfileSelectAnalyticsData(
          label: 'terms_and_condition',
          type: 'Others',
        );
        break;
      case MoreOptionsActionType.privacyPolicy:
        navigateToScreenUsingNamedRouteWithArguments(
          _context,
          webViewContainer,
          argumentObject: WebViewModel(
            title: widget.item.title.localize(context),
            url:
                '${Environment.instance.configuration.webBaseUrl}${WebLinks.privacyPolicy}',
          ),
        );
        ProfileGaAnalytics().viewProfileSelectAnalyticsData(
          label: 'privacy_policy',
          type: 'Others',
        );
        break;
      case MoreOptionsActionType.helpAndSupport:
        if (contactDetail != null) {
          Utils.helpBottomSheet(context, contactDetail);
        } else {
          Utils.showContactDetailNotFoundSnackBar(context);
        }
        ProfileGaAnalytics().viewProfileSelectAnalyticsData(
          label: 'help_and_support',
          type: 'Others',
        );
        break;

      case MoreOptionsActionType.adaniRewards:
        _navigate(loyaltyDashboard, _context);
        ProfileGaAnalytics().viewProfileSelectAnalyticsData(
          label: 'adani_rewards',
          type: 'Others',
        );
        break;
      case MoreOptionsActionType.currencyExchange:
        navigateToScreenUsingNamedRouteWithArguments(
          context,
          currencyExchangePoints,
        );
        ProfileGaAnalytics().viewProfileSelectAnalyticsData(
          label: 'convert_reward_points',
          type: 'Others',
        );
        break;
      case MoreOptionsActionType.offersAndDiscount:
        // DeepLinkManager().testDeepLink();
        moveToOfferAndDiscount(_context);
        break;
      case MoreOptionsActionType.savedFlights:
        moveToSaveFlight(_context);
        break;
      case MoreOptionsActionType.referAndEarn:
        navigateToReferScreen(context);
        ProfileGaAnalytics().viewProfileSelectAnalyticsData(
          label: 'refer_and_earn',
          type: 'profile',
        );
        break;
      case MoreOptionsActionType.faqs:
        final faq =
            '${Environment.instance.configuration.cmsBaseUrl}${selectedAirportsData?.airportPrefixName}${WebLinks.faqs}';
        adLog(faq);
        navigateToScreenUsingNamedRouteWithArguments(
          _context,
          webViewContainer,
          argumentObject: WebViewModel(
            title: widget.item.title.localize(context),
            url: faq,
          ),
        );
        ProfileGaAnalytics().viewProfileSelectAnalyticsData(
          label: 'faq',
          type: 'Others',
        );
        break;
      case MoreOptionsActionType.sendFeedBack:
        GaEvent.getInstance().feedbackEvent('Profile');
        ClickEvents.feedback_start
            .logEvent(parameters: GaEvent.getInstance().parameterMap);
        moveToSendFeedBack(_context);
        break;
      case MoreOptionsActionType.rateUs:
        moveToRateUs();
        break;
        //TODO Need to Remove
      case MoreOptionsActionType.train:
        navigateToScreenUsingNamedRoute(
          context,
          trainBooking,
        );
        break;
      case MoreOptionsActionType.share:
        // DeepLinkManager().testDeepLink();
        Share.share(
          'hey! check out this new app $appLink',
        );
        ProfileGaAnalytics().viewProfileSelectAnalyticsData(
          label: 'share',
          type: 'Others',
        );
        break;
      case MoreOptionsActionType.logout:
        showLogoutBottomSheet(context: _context);
        break;
      case MoreOptionsActionType.deleteAccount:
        navigateToScreenUsingNamedRoute(
          _context,
          settings,
        );
        break;
      case MoreOptionsActionType.chatWithUno:
        ProfileGaAnalytics().chatBotOpenAnalyticsData(
          type: 'Others',
        );
        ChatBotConfiguration.startChatBot();
        break;
      default:
    }
  }

  void moveToOfferAndDiscount(BuildContext _context) {
    ProfileGaAnalytics().viewProfileSelectAnalyticsData(
      label: 'offers_and_discount',
      type: 'profile',
    );
    _navigate(offersDashboard, _context);
  }

  void moveToRateUs() {
    Utils.openStore();
    ProfileGaAnalytics().viewProfileSelectAnalyticsData(
      label: 'rateUs',
      type: 'Others',
    );
  }

  void moveToSendFeedBack(BuildContext context) {
    navigateToScreenUsingNamedRoute(context, customerFeedback);
    ProfileGaAnalytics().viewProfileSelectAnalyticsData(
      label: 'send_feedback',
      type: 'Others',
    );
  }

  String get appLink =>
      Platform.isAndroid ? StoreLinks.androidAppLink : StoreLinks.iosAppLink;

  void navigateToReferScreen(
    BuildContext context,
  ) {
    if (ProfileSingleton.profileSingleton.isLoggedIn) {
      navigateToScreenUsingNamedRoute(
        context,
        loyaltyReferEarn,
      );
    } else {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        signInScreen,
        argumentObject: SignInStatusModel(
          isLoginStatusTap: (value) =>
              value ? navigateWithLogin(context) : null,
          popUpRequired: true,
          isNotFromSplash: true,
        ),
      );
    }
  }

  void navigateWithLogin(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 5),
      () => navigateToReferScreen(context),
    );
  }

  /* Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Adani')),
          content: const Text('This feature is under development.'),
          actions: <Widget>[
            Center(
              child: TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        );
      },
    );
  }*/

  void _navigate(String screenRoute, BuildContext _context) {
    if (widget.openBottomSheet) {
      Navigator.pop(_context);
    }
    final CustomTabScaffold customTabScaffold =
        BottomBarState.key.currentWidget as CustomTabScaffold;
    final GlobalKey<NavigatorState> navigatorState =
        HomeBottomAssets.homeBottomPages.keys.toList()[4];
    customTabScaffold.controller?.index = _context.k_4.toInt();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        navigatorState.currentState
            ?.pushNamedAndRemoveUntil(
              screenRoute,
              (route) => route.isFirst,
            )
            .then(
              (value) => adLog(
                value?.toString(),
              ),
            );
      },
    );
  }

  void _showLanguageOptions(BuildContext context) {
    navigateToScreenUsingNamedRoute(context, languageRoute);
  }

  void showLogoutBottomSheet({required BuildContext context}) {
    adShowBottomSheet(
      context: context,
      childWidget: LogoutScreen(
        logoutTap: () => logoutTap(context: context),
        logoutNotifier: logoutNotifier,
      ),
      headerTitle: 'why_leave_so'.localize(context),
    );
    ProfileGaAnalytics()
        .viewProfileSelectAnalyticsData(label: 'sign_out', type: 'Others');
  }

  Future<void> logoutTap({required BuildContext context}) async {
    final bool isLogout =
        await context.read<AppSessionState>().serviceCallForSignOut();
    if (isLogout) {
      ///Perform logout operation
      logoutNotifier.value = true;
      await Utils.logOutTap(context: context);
      adLog('logoutTap');
      logoutNotifier.value = false;

      ///Show logout message
      SnackBarUtil.showSnackBar(
        context,
        'logout_message'.localize(context),
      );

      ///Dismiss bottom sheet once got logout successfully
      Future.delayed(
        const Duration(seconds: 1),
        () => {
          if (widget.openBottomSheet)
            {
              navigatorPopScreen(context),
            },
        },
      );
      FlightBookingGaAnalytics().loginAndLogoutSuccessfulAnalyticsData(
        '',
        label: '',
        type: '',
      );
    } else {
      adLog('log out api fail');
    }
  }

  void signInOnTap() {
    ProfileSingleton.profileSingleton.isLoggedIn
        ? moveToUpdateProfile()
        : moveToSignInScreen();
    FlightBookingGaAnalytics().signInAnalyticsData();
  }

  void moveToUpdateProfile() {
    navigateToScreenUsingNamedRoute(context, updateProfile);
    ProfileGaAnalytics()
        .viewProfileSelectAnalyticsData(label: 'profile', type: 'profile');
  }

  void moveToSignInScreen() {
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      signInScreen,
      argumentObject: SignInStatusModel(
        isLoginStatusTap: (value) => adLog(value.toString()),
        isNotFromSplash: true,
        popUpRequired: true,
        currentRouteName: tabRoute,
      ),
    );
    ProfileGaAnalytics()
        .viewProfileSelectAnalyticsData(label: 'login', type: 'profile');
  }
}
