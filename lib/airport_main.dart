/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:io';

import 'package:adani_airport_mobile/main/configuration/app_build_config.dart';
import 'package:adani_airport_mobile/main/configuration/base_config.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/tab_data.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/airport_list_state_management.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/dashboard_view_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_common_state.dart';
import 'package:adani_airport_mobile/modules/more/state_management/app_model_state_management.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_reschedule_state_management.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_dashboard_state_management.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_review_detail_state_management.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_service_booking_state_management.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/apps_flyer/apps_flyer_manager.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/deep_link_manager/deep_link_manager.dart';
import 'package:adani_airport_mobile/utils/enums/home_identifier.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations_delegate.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/all_router.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart'
    as routes;
import 'package:adani_mobile_utility/app_utils/analytics/mixpanel.dart';
import 'package:adani_mobile_utility/app_utils/connectivity/network_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http_proxy/http_proxy.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_theme.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

void runMainWith(AppBuildConfig buildConfig) {
  adLog('buildConfig ${buildConfig.appEnvironment}');

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  ///api logs are always open in debug mode we can stop mixpanel and appFlyer logs by setting [LogsIdentifier.api]
  const LogsIdentifier logsIdentifier = LogsIdentifier.api;

  runZonedGuarded<Future<void>>(
    () async {
      final WidgetsBinding widgetsBinding =
          WidgetsFlutterBinding.ensureInitialized();

      String? _path;
      if (kReleaseMode) {
        if (buildConfig.appEnvironment.configuration.appFlavor ==
            AppFlavor.prod) {
          _path = 'assets/ca/cert.pem';
        }
        // else if (buildConfig.appEnvironment.configuration.appFlavor ==
        //     AppFlavor.staging) {
        //   _path = 'assets/ca/cert_uat.pem';
        // }
      }

      if (_path != null) {
        // Load certificate file
        final ByteData data = await rootBundle.load(_path);
        // Trust the certificate
        SecurityContext.defaultContext.setTrustedCertificatesBytes(
          data.buffer.asUint8List(),
        );
      } else {
        HttpOverrides.global = await HttpProxy.createHttpProxy();
      }

      /// Initialize Mixpanel
      adLog('widgetsBinding init $widgetsBinding');
      adLog(
        'Initialize Mixpanel for ${buildConfig.appEnvironment.configuration.appFlavor}',
      );
      await MixpanelManager().initialize(
        mixPanelToken: buildConfig.appEnvironment.configuration.mixpanelToken,
        enableLogging: kDebugMode &&
            (logsIdentifier == LogsIdentifier.mixPanel ||
                logsIdentifier == LogsIdentifier.all),
      );

      /// Initialize Appsflyer
      adLog(
        'Initialize AppsFlyer for ${buildConfig.appEnvironment.configuration.appFlavor}',
      );
      await AppsFlyerManager().initialize(
        devKey: buildConfig.appEnvironment.configuration.appsflyerToken,
        debugMode: kDebugMode &&
            (logsIdentifier == LogsIdentifier.appFlyer ||
                logsIdentifier == LogsIdentifier.all),
      );

      /// Initialize Firebase
      final FirebaseApp firebaseApp = await Firebase.initializeApp();
      adLog('firebaseApp init ${firebaseApp.name}');

      /// Initialize WebEngage Deep Link Util
      adLog(
        'Initialize WebEngage Deep Link Util for ${buildConfig.appEnvironment.configuration.appFlavor}',
      );
      await DeepLinkManager().startWebEngagePushUtil();

      if (buildConfig.appEnvironment.configuration.appFlavor !=
          AppFlavor.prod) {
        FlutterError.onError = (FlutterErrorDetails details) {
          FirebaseCrashlytics.instance.recordFlutterError(details);
          adLog('FlutterErrorDetails : $details');
          // if (!kReleaseMode && details.context?.level == DiagnosticLevel.error) {
          //   exit(1);
          // }
        };
      }
      // }

      runApp(
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            adLog(
              'screen width = ${constraints.maxWidth}  screen Height = ${constraints.maxHeight}',
            );
            ADSizeConfig.init(constraints);
            adLog(' ${ADSizeConfig().textScaleFactor}');
            return const AirportMain();
          },
        ),
      );
    },
    (error, stack) {
      if (buildConfig.appEnvironment.configuration.appFlavor !=
          AppFlavor.prod) {
        FirebaseCrashlytics.instance.recordError(error, stack);
      }
      // if (!kReleaseMode) {
      //   exit(1);
      // }
    },
  );
}

/// Main App Screen which have all app level configuration like route,
/// localization, theme etc.
class AirportMain extends StatefulWidget {
  const AirportMain({Key? key}) : super(key: key);

  @override
  State<AirportMain> createState() => _AirportMainState();
}

class _AirportMainState extends State<AirportMain> {
  final TabData _tabData = TabData();
  final FlightCommonState _flightCommonModel = FlightCommonState();
  final AppModelStateManagement _appModel = AppModelStateManagement();
  final SiteCoreStateManagement _siteCoreStateManagement =
      SiteCoreStateManagement();
  final PranaamAppDataStateManagement _pranaamAppDataStateManagement =
      PranaamAppDataStateManagement();
  final BookingAndCancellationState _bookingAndCancellationState =
      BookingAndCancellationState();
  final StandAloneStateManagement _standAloneStateManagement =
      StandAloneStateManagement();
  final standAloneReviewDetailStateManagement =
      StandAloneReviewDetailStateManagement();

  @override
  void dispose() {
    DeepLinkManager().disposeListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    adLog(
      ' App Configuration - ${Environment.instance.configuration.apiBaseUrl}',
    );
    return MultiProvider(
      providers: [
        StreamProvider<ConnectivityStatus>(
          initialData: ConnectivityStatus.mobile,
          create: (context) =>
              ConnectivityUtils().connectionStatusController.stream,
        ),
        ChangeNotifierProvider<TabData>(
          create: (_) => _tabData,
        ),
        ChangeNotifierProvider<FlightCommonState>(
          create: (_) => _flightCommonModel,
        ),
        ChangeNotifierProvider<AppModelStateManagement>(
          create: (_) => _appModel,
        ),
        ChangeNotifierProvider<PranaamAppDataStateManagement>(
          create: (_) => _pranaamAppDataStateManagement,
        ),
        ChangeNotifierProvider<BookingAndCancellationState>(
          create: (_) => _bookingAndCancellationState,
        ),
        ChangeNotifierProvider<DutyFreeState>(
          create: (_) => DutyFreeState(),
        ),
        ChangeNotifierProvider<SiteCoreStateManagement>(
          create: (_) => _siteCoreStateManagement,
        ),
        ChangeNotifierProvider<AppSessionState>(
          create: (_) => AppSessionState(),
        ),
        ChangeNotifierProvider<DutyFreeOrderState>(
          create: (_) => DutyFreeOrderState(),
        ),
        ChangeNotifierProvider<DashBoardViewModel>(
          create: (_) => DashBoardViewModel(),
        ),
        ChangeNotifierProvider<AirportListStateManagement>(
          create: (_) => AirportListStateManagement(
            isLoggedIn: ProfileSingleton.profileSingleton.isLoggedIn,
          ),
        ),
        ChangeNotifierProvider<StandAloneStateManagement>(
          create: (context) => _standAloneStateManagement,
        ),
        ChangeNotifierProxyProvider<StandAloneStateManagement,
            StandAloneDashboardStateManagement>(
          create: (context) =>
              StandAloneDashboardStateManagement(_standAloneStateManagement),
          update: (
            context,
            _standAloneStateManagement,
            standAloneDashboardStateManagement,
          ) =>
              standAloneDashboardStateManagement ??
                  StandAloneDashboardStateManagement(_standAloneStateManagement)
                ..update(_standAloneStateManagement),
        ),
        ChangeNotifierProxyProvider<StandAloneStateManagement,
            StandAloneServiceBookingStateManagement>(
          create: (context) => StandAloneServiceBookingStateManagement(
            _standAloneStateManagement,
          ),
          update: (
            context,
            _standAloneStateManagement,
            standAloneServiceBookingStateManagement,
          ) =>
              standAloneServiceBookingStateManagement ??
                  StandAloneServiceBookingStateManagement(
                    _standAloneStateManagement,
                  )
                ..update(_standAloneStateManagement),
        ),
        ChangeNotifierProvider<StandAloneReviewDetailStateManagement>(
          create: (_context) => standAloneReviewDetailStateManagement,
        ),
        ChangeNotifierProxyProvider<BookingAndCancellationState,
            PranaamRescheduleStateManagement>(
          create: (BuildContext context) => PranaamRescheduleStateManagement(
            _bookingAndCancellationState,
          ),
          update: (
            BuildContext context,
            bookingAndCancellationState,
            pranaamRescheduleStateManagement,
          ) =>
              (pranaamRescheduleStateManagement ??
                  PranaamRescheduleStateManagement(
                    bookingAndCancellationState,
                  ))
                ..updateAppData(bookingAndCancellationState),

          // PranaamRescheduleStateManagement(pranaamAppDataStateManagement),
        ),
      ],
      child: Consumer<AppModelStateManagement>(
        builder: (context, appNotifier, child) {
          return MaterialApp(
            // TODO locale : 'en' dynamic value defined later
            localizationsDelegates: const [
              AppTranslationsDelegate(),
              GlobalCupertinoLocalizations.delegate,
              //provides localised strings
              GlobalMaterialLocalizations.delegate,
            ],
            theme: ADAppTheme.lightTheme.copyWith(
              appBarTheme: ADAppTheme.lightTheme.appBarTheme
                  .copyWith(systemOverlayStyle: SystemUiOverlayStyle.dark),
            ),
            locale: appNotifier.locale,
            supportedLocales: supportedLocalesList,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AllRouter.generateRoute,
            initialRoute: routes.splashRoute,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: child ?? const SizedBox.shrink(),
              );
            },
            navigatorObservers: [routeObserver],
          );
        },
      ),
    );
  }
}
