/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:io';

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/user_profile/user_profile_utils.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/session/utils/enums/login_skip_type.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/deep_link_manager/deep_link_manager.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_config.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_config_model/app_config_model.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_config_model/app_constant_remote_model.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_constant_remote.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/no_data_found_widget.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/remote_config_service.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/offer_banner/offer_banner_remote.dart';
import 'package:adani_airport_mobile/utils/offer_banner/offer_banner_remote_model.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

///This class is used for checking either we need to show force upgrade screen or launch normal flow
class InitialLaunchScreen {
  LaunchType upgradeDialogType = LaunchType.none;
  AppConfigModel? appConfigModel;
  AppConstantRemoteModel? appConstantRemoteModel;
  OfferBannerRemoteModel? offerBannerRemoteModel;

  BuildContext context;

  InitialLaunchScreen(this.context);

  final versionLength = 4;

  Future<LaunchType> initFirebaseRemoteConfig() async {
    //initialising firebase remote config
    await RemoteConfigService().initRemoteConfig();
    //initializing application configuration variables
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      appConfigModel = await AppConfig().init();
      appConstantRemoteModel = await AppConstantRemote().init();
      offerBannerRemoteModel = await OfferBannerRemote().init();
      upgradeDialogType = await checkAppMaintenance(appConfigModel);
    } else {
      upgradeDialogType = LaunchType.noInternet;
    }
    return upgradeDialogType;
  }

  /// This method can be used for open store for download the application
  void openStore() {
    downloadApp(
      Platform.isIOS
          ? appConfigModel?.iosLink ?? ''
          : appConfigModel?.androidLink ?? '',
    );
  }

  Future<void> downloadApp(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication)
          .then((value) => null);
    }
  }

  Future<bool> updatedVersionCheck(String appVersionFromRemote) async {
    bool needToUpdate = false;
    await getAppVersionData().then((value) async {
      needToUpdate = Utils.isRemoteVersionGreaterThanLocal(
        localVersion: value,
        appVersionFromRemote:
            appVersionFromRemote.isEmpty ? value : appVersionFromRemote,
      );
    });
    return needToUpdate;
  }

  Future<LaunchType> checkAppMaintenance(AppConfigModel? configModel) async {
    final value = configModel?.isMaintenance ?? false;
    return value ? LaunchType.maintenance : await checkAppVersion(configModel);
  }

  Future<LaunchType> checkAppVersion(AppConfigModel? configModel) async {
    final value = await updatedVersionCheck(configModel?.appVersion ?? '');
    return value ? LaunchType.force : LaunchType.none;
  }

  //this method is used to check whether device is jailbreak or emulator/simulator
  //if device is rooted or not a real device then app should not run.
  Future<LaunchType> initialLaunchFlow() async {
    bool jailBroken = false;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      jailBroken = await FlutterJailbreakDetection.jailbroken;
    } on PlatformException {
      jailBroken = true;
    }
    return /*jailBroken ? LaunchType.jailBlock : */ await initFirebaseRemoteConfig();
  }

  void showDialogForRootedDevices() {
    showDialog(
      context: context,
      builder: (ok) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: NoDataFoundWidget(
            pageMainDesc: 'Device Non-Compliant',
            pageSubDesc: Platform.isIOS
                ? 'This application is not supported on jailbroken device.'
                : '''It seems your device is rooted. Adani Airport App won't work on rooted device''',
            showButton: !Platform.isIOS,
            buttonText: 'OK, got it!',
            onTapHandler: () => {
              if (Platform.isAndroid) SystemNavigator.pop() else exit(0),
            },
            imageStyle: Image.asset(
              'lib/assets/images/svg/icons/non_compliant.png',
            ),
          ),
        );
      },
    ).then((value) => adLog('dialog value $value'));
  }

  void showDialogForMaintenance({
    required int lastTimeStamp,
  }) {
    showDialog(
      context: context,
      builder: (ok) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: NoDataFoundWidget(
            pageMainDesc: 'Whoops! Something went wrong',
            pageSubDesc: 'Hang tight, we’re on it. Please try again soon.',
            showButton: true,
            buttonText: 'Try Again',
            onTapHandler: () => {
              initFirebaseRemoteConfig().then(
                (value) {
                  if (LaunchType.none == value) {
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                    checkAndFetchInitialDataSetAndMove(
                      lastTimeStamp: lastTimeStamp,
                    );
                  }
                },
              ),
            },
            imageStyle: Image.asset(
              'lib/assets/images/common/internal_server_error.gif',
            ),
          ),
        );
      },
    ).then((value) => adLog('dialog value $value'));
  }

  void showForceUpgradeDialog({required int lastTimeStamp}) {
    showDialog(
      context: context,
      builder: (ok) {
        return WillPopScope(
          onWillPop: () => Future.value(true),
          child: NoDataFoundWidget(
            pageMainDesc: appConfigModel?.title.localize(context),
            pageSubDesc: appConfigModel?.message.localize(context),
            showButton: true,
            showNotNow: !(appConfigModel?.isForceUpgrade ?? false),
            buttonText: appConfigModel?.actionTitle.localize(context),
            onTapHandler: () => {
              openStore(),
            },
            onTapHandlerNotNow: () => {
              Navigator.of(context, rootNavigator: true).pop('dialog'),
              checkAndFetchInitialDataSetAndMove(lastTimeStamp: lastTimeStamp),
            },
            imageStyle: Lottie.asset(
              'lib/assets/gif/app_update_box.json',
            ),
          ),
        );
      },
    ).then((value) => adLog('dialog value $value'));
  }

  Future<void> checkAndFetchInitialDataSetAndMove({
    required int lastTimeStamp,
  }) async {
    ///After fetching all the required data move to respective entry point

    final profileData = await ProfileSingleton.profileSingleton
        .readUserProfile(SharedPrefUtilsKeys.keyUserProfileData);
    adLog('userprofile value : ${profileData.userId}');

    if (profileData.userId.isEmpty) {
      // means guest user, generate random userId
      await UserProfileUtils.createGuestUserProfile();

      ///updating logged-in status from preference
      context.read<AppSessionState>().updateIsLoggedIn(loginStatus: false);

      adLog('userprofile after save data value : ${profileData.userId}');
    } else {
      ProfileSingleton.profileSingleton.userProfile = profileData;

      if (profileData.isLoggedIn) {
        apiNameNotifier.value = 'start getProfileDetails';
        final appSessionState = context.read<AppSessionState>();
        await appSessionState.getProfileDetails();
        await appSessionState.parseProfileImage();
        // final personInfo =
        //     context.read<AppSessionState>().profileModel.personInfo;

        // if (personInfo == null) {
        //   ///delete session related storage when session expired
        //   await Utils.removePref();
        //
        //   final userProfile = UserProfile(
        //     userId: profileData.userId,
        //     countryCodeData: profileData.countryCodeData,
        //   );
        //   await ProfileSingleton.profileSingleton.writeUserProfile(
        //     SharedPrefUtilsKeys.keyUserProfileData,
        //     userProfile,
        //   );
        //   ProfileSingleton.profileSingleton.userProfile = userProfile;
        //
        //   ///updating logged-in status from preference
        //   context.read<AppSessionState>().updateIsLoggedIn(loginStatus: false);
        // } else {
        ///updating logged-in status from preference
        context
            .read<AppSessionState>()
            .updateIsLoggedIn(loginStatus: profileData.isLoggedIn);
        //}
      } else {
        ///updating logged-in status from preference
        context
            .read<AppSessionState>()
            .updateIsLoggedIn(loginStatus: profileData.isLoggedIn);
      }
    }

    /// initialize DeepLink Util
    await DeepLinkManager().startDeepLinkUtil();

    await _fetchInitialDataSet();

    apiNameNotifier.value = 'start _dashboardEntryFlow';

    ///After fetching all the required data move to respective entry point
    _dashboardEntryFlow(lastTimeStamp: lastTimeStamp);
  }

  Future<void> _fetchInitialDataSet() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cartCount = sharedPreferences.getInt(
      SharedPreferenceKeys.keyCartCount,
    );
    if (cartCount != null) {
      context.read<AppSessionState>().updateCartCountFromCache(cartCount);
    }

    apiNameNotifier.value = 'start getCartData';

    ///fetching all the master data from sitecore
    // await GetCartOnUserBasis().getCartData(context);
    //
    // ///TODO:- 6 ,getCartData Api is not following background mechanism

    apiNameNotifier.value = 'start fetchListOfAirports';

    await context.read<SiteCoreStateManagement>().fetchListOfAirports();

    ///TODO:- 7 ,fetchListOfAirports Api is following mechanism but not in compute.

    apiNameNotifier.value = 'start fetchCountryCode';

    await context.read<SiteCoreStateManagement>().fetchCountryCode();

    ///TODO:- 8 ,fetchCountryCode Api is following mechanism but not in compute.
  }

  void _dashboardEntryFlow({required int lastTimeStamp}) {
    final currentTimeStamp = DateTime.now().millisecondsSinceEpoch;
    final int difference = currentTimeStamp - lastTimeStamp;
    const splashDuration = 4000;
    final int delayValue =
        difference > splashDuration ? 0 : splashDuration - difference;
    Future.delayed(Duration(milliseconds: delayValue)).then(
      (value) {
        /// Change value of boolean to make login optional or compulsory.
        /// Can be linked to remote config in the future.
        const bool isLoginOptional = true;
        if (appConfigModel?.isMaintenance ?? false) {
          navigateUsingPushReplacementNamed(
            context,
            maintenance,
          );
        } else if (isLoginOptional) {
          // navigateUsingPushReplacementNamed(
          //   context,
          //   selectedAirportsData != null ? tabRoute : tabRoute,
          // );
          navigateUsingPushReplacementNamed(
            context,
            tabRoute,
          );
        } else {
          if (!ProfileSingleton.profileSingleton.isLoggedIn) {
            navigateUsingPushReplacementNamed(
              context,
              signInScreen,
              argumentsData: SignInStatusModel(
                currentRouteName: tabRoute,
                loginSkipType: LoginSkipType.none,
                isLoginStatusTap: (value) => adLog(value),
              ),
            );
          } else {
            navigateUsingPushReplacementNamed(
              context,
              selectedAirportsData != null ? tabRoute : airportsLandingScreen,
            );
          }
        }
      },
    );
  }
}

enum LaunchType { none, jailBlock, force, noInternet, maintenance }

const int defaultDuration = 500;

/// wrapper class is used to show fade transitions while page got change.
class ADFadePageRoute extends PageRouteBuilder {
  final int? duration;

  ADFadePageRoute({
    this.duration,
    RouteSettings? settings,
    required RoutePageBuilder pageBuilder,
  }) : super(
          maintainState: true,
          settings: settings,
          pageBuilder: pageBuilder,
          transitionDuration:
              Duration(milliseconds: duration ?? defaultDuration),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}

/// wrapper class is used to show fade transitions while page got change.
class ADScalePageRoute extends PageRouteBuilder {
  final int? duration;

  ADScalePageRoute({
    this.duration,
    required RoutePageBuilder pageBuilder,
    RouteSettings? settings,
  }) : super(
          maintainState: true,
          settings: settings,
          pageBuilder: pageBuilder,
          transitionDuration:
              Duration(milliseconds: duration ?? defaultDuration),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        );
}
