/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';

import 'package:adani_airport_mobile/main/configuration/base_config.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_screen/views/flight_status_loading_video_player.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/enum/masters_enum.dart';
import 'package:adani_airport_mobile/modules/splash/screens/views/dynamic_splash.dart';
import 'package:adani_airport_mobile/modules/splash/utils/splash_changer.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/initial_launch_screen.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///This class is used to show a SplashScreen of Airport app
/// Base on some certain business logic navigate to Landing or HomeScreen
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool storedTheme = false;
  ValueNotifier<bool> showSplash = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    final initialTimeStamp = DateTime.now().millisecondsSinceEpoch;

    ///get selected airport from shared preference
    //PlaySound.playSound('splash.mp3');

    //Empty all image cache
    DefaultCacheManager().emptyCache();
    apiNameNotifier.value = 'start fetchAirlineList';
    Utils.getSelectedAirport().then((value) {
      context.read<SiteCoreStateManagement>().fetchAirlineList();

      ///TODO:- 1, fetchAirlineList Api is In compute with mechanism

      ///check login state, fetch initial data from sitecore and move to respective initial page
      apiNameNotifier.value = 'start fetchMastersFromSiteCore';

      context.read<SiteCoreStateManagement>().fetchMastersFromSiteCore([
        MastersEnum.all.name,
      ]);

      apiNameNotifier.value = 'start fetchListAdaniAirports';
      final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
      final siteCoreManagement = context.read<SiteCoreStateManagement>();
      siteCoreManagement.fetchListAdaniAirports().then((value) {
        if (siteCoreManagement.adaniAirportsList.isNotEmpty &&
            selectedAirportsData != null) {
          selectedAirportsData =
              siteCoreManagement.adaniAirportsList.firstWhere(
            (element) => element.city == selectedAirportsData?.city,
          );
        }

        ///TODO:- 3 , fetchListAdaniAirports Api is following mechanism but not in compute.
        dutyFreeState.getDutyFreeTerminalList();
        adLog('AirportList ${value.toString()}');
      });
    });

    ///TODO:- 2, fetchMastersFromSiteCore Api is In compute with mechanism

    ///fetch airport from sitecore

    // apiNameNotifier.value = 'start fetchCitiesDataFromSiteCore';
    // context.read<SiteCoreStateManagement>().fetchCitiesDataFromSiteCore('IN');

    ///TODO:- 4, fetchCitiesDataFromSiteCore Api is In compute with mechanism

    apiNameNotifier.value = 'start getDutyFreeTermsCondition';

    // context.read<SiteCoreStateManagement>().getDutyFreeTermsCondition();

    ///TODO:- 5 , getDutyFreeTermsCondition Api is not following background mechanism  // need to Move to home

    ProfileSingleton.profileSingleton.getDeviceId();
    ProfileSingleton.profileSingleton.getFirebaseAppInstanceId();

    //This is to check internet connection if app is launched offline or online
    //Check device is rooted or not
    //Check if we need to show upgrade dialog
    final InitialLaunchScreen initialLaunchScreen =
        InitialLaunchScreen(context);
    if (kReleaseMode) {
      apiNameNotifier.value = 'start Firebase initialLaunchFlow';
      initialLaunchScreen.initialLaunchFlow().then(
        (value) {
          showSplash.value = true;
          switch (value) {
            case LaunchType.jailBlock:
              {
                ///TODO: //commented, to give stage build to qa for automation testing
                if (Environment.instance.configuration.appFlavor ==
                        AppFlavor.prod ||
                    Environment.instance.configuration.appFlavor ==
                        AppFlavor.staging) {
                  initialLaunchScreen.showDialogForRootedDevices();
                  break;
                } else {
                  continue pass;
                }
              }
            case LaunchType.force:
              {
                initialLaunchScreen.showForceUpgradeDialog(
                  lastTimeStamp: initialTimeStamp,
                );
                break;
              }
            case LaunchType.maintenance:
              {
                initialLaunchScreen.showDialogForMaintenance(
                  lastTimeStamp: initialTimeStamp,
                );
                break;
              }
            case LaunchType.noInternet:
              {
                navigateToScreenUsingNamedRoute(context, noDataFound);
                break;
              }
            pass:
            default:
              initialLaunchScreen.checkAndFetchInitialDataSetAndMove(
                lastTimeStamp: initialTimeStamp,
              );
          }
        },
        onError: (err) {
          showSplash.value = true;
        },
      );
    } else {
      showSplash.value = true;
      initialLaunchScreen.checkAndFetchInitialDataSetAndMove(
        lastTimeStamp: initialTimeStamp,
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    apiNameNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Update color after 26 jan release
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: ValueListenableBuilder<bool>(
          valueListenable: showSplash,
          builder: (context, value, _) {
            if (value) {
              SplashChanger().initialize();
            }
            return value
                ? const DynamicSplash(
                    defaultWidget: FlightStatusLoadingVideoPlayer(
                      videoUrl: 'lib/assets/videos/adani_one_splash_screen.mp4',
                    ),
                  )
                : const ADSizedBox.shrink();
          },
        ),
      ),
    );
  }

  Future<bool> getTheme() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getBool('isThemeEnabled') ?? false;
  }
}
