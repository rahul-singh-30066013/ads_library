/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/home_bottom_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/deal_product_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_age_confirmation.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/home_screen/home_screen.dart'
    as home_screen;
import 'package:adani_airport_mobile/modules/flight_booking/screens/home_screen/home_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/airport_list_state_management.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/fids_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/deep_linking/deeplink_amenity.dart';
import 'package:adani_mobile_utility/app_utils/deep_linking/deeplinking.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart' as af;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:webengage_flutter/PushPayload.dart';
import 'package:webengage_flutter/webengage_flutter.dart';

part 'deep_link_type.dart';

const int one = 1;
const int two = 2;
const int three = 3;
const int four = 4;
const int five = 5;
const int six = 6;

class DeepLinkManager {
  static final DeepLinkManager _deepLinkManager = DeepLinkManager._internal();

  factory DeepLinkManager() => _deepLinkManager;

  DeepLinkManager._internal();

  final ValueNotifier<DeepLink?> _deepLinkData = ValueNotifier<DeepLink?>(null);

  //Event Channel creation
  static const stream = EventChannel('poc.deeplink.flutter.dev/events');

  //Method channel creation
  static const platform = MethodChannel('poc.deeplink.flutter.dev/channel');

  final StreamController<String> _stateController = StreamController();

  DeepLinkType? _deepLinkDataType;
  DeepLinkSource? _deepLinkSource;

  static String referCode = '';

  StreamSubscription<PushPayload>? _webEngagePushListener;

  bool get hasDeepLink =>
      !(_deepLinkData.value?.link.toString().isNullOrEmpty ?? true);

  Map<String, dynamic>? get deepLink =>
      _deepLinkData.value?.link?.queryParameters ?? {};

  void startChatBotRouting({required String route}) {
    _deepLinkSource = DeepLinkSource.chatBot;
    _saveLinkAndLinkType(
      deepLink: DeepLink(
        link: Uri.parse(
          route,
        ),
      ),
    );
  }

  /// Native  Deep Linking Method
  void handleNativeDeepLink() {
    if (Platform.isAndroid) {
      //Checking application start by deep link
      startUri().then(_onRedirected);
      //Checking broadcast stream, if deep link was clicked in opened application
      stream
          .receiveBroadcastStream()
          .listen((d) => _onRedirected(d))
          .onDone(() {
        adLog('Done');
      });
    } else {
      const MethodChannel('deepLinkNative')
          .setMethodCallHandler(deepLinkNativeHandler);
    }
  }

  void _onRedirected(String? uri) {
    // Here can be any uri analysis
    if (uri != null) {
      DeepLinkManager().nativeDeepLink(route: uri);
    }
  }

  Future<String?> startUri() async {
    try {
      return platform.invokeMethod('initialLink');
    } on PlatformException catch (e) {
      return "Failed to Invoke: '${e.message}'.";
    }
  }

  static Future<dynamic> deepLinkNativeHandler(MethodCall methodCall) async {
    switch (methodCall.method) {
      case 'deepLinkNativeMethod':
        adLog(methodCall.arguments as String);
        DeepLinkManager().nativeDeepLink(route: methodCall.arguments as String);
        break;
      default:
        adLog('default');
    }
  }

  void nativeDeepLink({required String route}) {
    adLog('iOSDeepLink: $route');
    _deepLinkSource = DeepLinkSource.native;
    _saveLinkAndLinkType(
      deepLink: DeepLink(
        link: Uri.parse(
          route,
        ),
      ),
    );
  }

  Future<void> startWebEngagePushUtil() async {
    final WebEngagePlugin _webEngagePlugin = WebEngagePlugin();
    _webEngagePushListener = _webEngagePlugin.pushStream.listen(
      (event) {
        _deepLinkSource = DeepLinkSource.webEngage;
        _saveLinkAndLinkType(
          deepLink: DeepLink(
            link: Uri.parse(
              event.deepLink ?? '',
            ),
          ),
        );
      },
    );
  }

  Future<void> disposeListener() async {
    await _webEngagePushListener?.cancel();
    final controller = await _stateController.close();
    debugPrint('$controller');
  }

  Future<void> startAppsFlyerDeepLinkUtil({
    required af.AppsflyerSdk sdk,
  }) async {
    sdk.onDeepLinking((af.DeepLinkResult result) {
      _deepLinkSource = DeepLinkSource.appsflyer;
      _saveLinkAndLinkType(
        deepLink: DeepLink(
          link: Uri.parse(
            result.deepLink?.deepLinkValue ?? '',
          ),
        ),
      );
    });
  }

  /// Start Deep Link Util
  Future<void> startDeepLinkUtil() async {
    /// Handle Initial DeepLink
    final DeepLink _deepLink = await DeepLinking().initialLink;
    if (_deepLink.link != null) {
      _deepLinkSource = DeepLinkSource.firebase;
      _saveLinkAndLinkType(
        deepLink: _deepLink,
      );
    }

    /// Handle DeepLink InApp
    await DeepLinking().onLink(
      onData: (DeepLink _data) {
        _deepLinkSource = DeepLinkSource.firebase;
        _saveLinkAndLinkType(
          deepLink: _data,
        );
      },
      onError: (error) => adLog('Deep Link Error ------> $error'),
    );
  }

  // DeepLink_Params
  /// Call this method anywhere to test deep link functionality.
  void testDeepLink() {
    //Modify According to Link For Testing
    _deepLinkSource = DeepLinkSource.appsflyer;
    _saveLinkAndLinkType(
      deepLink: DeepLink(
        //Modify Source before changing link.
        link: Uri.parse(
          'adanione://deeplink?lob=tm',
        ),
      ),
    );
  }

  void _saveLinkAndLinkType({
    required DeepLink deepLink,
  }) {
    adLog(deepLink.toString());

    /// Log Event for Successfully receiving deepLink
    _logDeepLinkSelectEvent(deepLink: deepLink);
    if (!deepLink.link.toString().isNullOrEmpty) {
      final Map<String, dynamic> params = deepLink.link?.queryParameters ?? {};
      try {
        if (params.containsKey(lineOfBusinessKey)) {
          _handleLobFormat(deepLink, params);
        } else {
          _handleWebsiteUrlFormat(deepLink, params);
        }
      } catch (e) {
        _logDeepLinkFailureEvent('Error parsing link -> ${e.toString()}');
      }
    } else {
      _logDeepLinkSuccessEvent();
    }
  }

  void _handleWebsiteUrlFormat(
    DeepLink deepLink,
    Map<String, dynamic> params,
  ) {
    String pathPrefix = deepLink.link?.path ?? '';
    if (pathPrefix.contains('/my-account/orders/')) {
      pathPrefix = '/my-account/orders';
    }
    adLog('Deep Link Params ----> $pathPrefix');
    if (firebaseRoutesMap[pathPrefix] != null) {
      final DeepLinkType? firebaseLinkType = firebaseRoutesMap[pathPrefix];
      if (firebaseLinkType == DeepLinkType.referCode) {
        final String code = params[referralCode] ?? '';
        referCode = code;
      }
      _deepLinkDataType = firebaseLinkType;
      _deepLinkData.value = deepLink;
    } else {
      _logDeepLinkFailureEvent('Incorrect Web Url DeepLink');
    }
  }

  void _handleLobFormat(
    DeepLink deepLink,
    Map<String, dynamic> params,
  ) {
    final String? lob = params[lineOfBusinessKey];
    if (!lob.isNullOrEmpty) {
      switch (lobsMap[lob]) {
        case DeepLinkType.referCode:

          /// save referCode in Data Model
          final code = params[linkDataKey];
          referCode = code;
          _deepLinkDataType = lobsMap[lob];
          _deepLinkData.value = deepLink;
          break;
        default:

          /// Default action for every link
          /// Save link type and link for further use
          _deepLinkDataType = lobsMap[lob];
          _deepLinkData.value = deepLink;
          break;
      }
    } else {
      _deepLinkDataType = DeepLinkType.homepage;
      _deepLinkData.value = deepLink;
    }
  }

  void handleDeepLinkRoute({
    required BuildContext context,
  }) {
    /// initial Route
    if (_deepLinkData.value != null) {
      adLog('---------------->> INITIAL ROUTE');
      handleRouting(context: context);
    }

    /// on in app link
    _deepLinkData.addListener(() {
      adLog('---------------->> LISTENER ROUTE');
      handleRouting(context: context);
    });
  }

  /// Handle data in link and route to respective Screens
  /// Use [context] to save data in models
  void handleRouting({
    required BuildContext context,
  }) {
    final Map<String, dynamic> queryParams =
        _deepLinkData.value?.link?.queryParameters ?? {};
    final String? deeplinkAirportCode = queryParams[airportCodeKey];
    if (deeplinkAirportCode != null &&
        deeplinkAirportCode != selectedAirportsData?.airportCode) {
      /// Change Airport to Airport Code from DeepLink Logic.
      // navigate to tab Route before airport change if app is open.
      if (!isTheSameRoute(context, tabRoute)) {
        navigatorPopScreenUntil(
          context,
          ModalRoute.withName(
            tabRoute,
          ),
        );
      }

      final CustomTabScaffold customTabScaffold =
          BottomBarState.key.currentWidget as CustomTabScaffold;
      BottomBarState.currentIndex = 0;
      customTabScaffold.controller?.index = 0;

      final String airportCode = queryParams[airportCodeKey] ?? 'AMD';
      final airportData = context
          .read<SiteCoreStateManagement>()
          .adaniAirportsList
          .singleWhere(
            (element) => element.airportCode == airportCode,
            orElse: () =>
                context.read<SiteCoreStateManagement>().adaniAirportsList.first,
          );

      selectedAirportsData = airportData;
      SharedPrefsUtils().putVarValueInPrefs(
        keySelectedAirport,
        selectedAirportsData,
      );
      context
          .read<AirportListStateManagement>()
          .updateData(airportData, context);
      if (selectedAirportsData?.airportCode?.isNotEmpty ?? false) {
        context.read<DutyFreeState>().getDutyFreeTerminalList();
      }
      context.read<DutyFreeState>().ageAbove25 = false;
      selectedAirportNotifier.value = airportData.city ?? '';
    }

    /// Switch-Case for actions after DashBoard is Loaded.
    adLog(_deepLinkDataType.toString());
    switch (_deepLinkDataType) {
      case DeepLinkType.homepage:
        adLog('DeepLinkType.homepage');
        continue logEvent;
      case DeepLinkType.staticPages:
        final Map<String, dynamic> params =
            _deepLinkData.value?.link?.queryParameters ?? {};
        final Map<String, dynamic>? data =
            json.decode(params[linkDataKey]) as Map<String, dynamic>?;
        if (data != null && data['url'] != null) {
          final WebViewModel model = WebViewModel(
            title: data['title'] ?? 'services'.localize(context),
            url:
                '${data['url']}&app_id=${ProfileSingleton.profileSingleton.appInstanceId}',
          );
          navigateToScreenUsingNamedRouteWithArguments(
            context,
            webViewContainer,
            argumentObject: model,
          );
        }
        continue logEvent;
      case DeepLinkType.trainman:
        navigateToScreenUsingNamedRoute(
          context,
          trainBooking,
        );
        continue logEvent;
      case DeepLinkType.profile:
        loginBeforeRouting(context: context, route: updateProfile);
        continue logEvent;
      case DeepLinkType.orders:
        final String orderId =
            _deepLinkData.value?.link?.path.split('/my-account/orders/').last ??
                '';
        {
          ///to know the lob for routing
          final DeepLinkType lob =
              orderLobsMap[_deepLinkData.value?.link?.queryParameters['lob']] ??
                  DeepLinkType.none;
          if (lob == DeepLinkType.flightBooking) {
            loginBeforeRouting(
              context: context,
              route: flightBookingItemDetails,
              onNavigation: () {
                ///to change bottom tab to orders tab
                _switchTabToOrders();
                navigateToScreenUsingNamedRouteWithArguments(
                  context,
                  flightBookingItemDetails,
                  argumentObject: orderId,
                );
              },
            );
          } else if (lob == DeepLinkType.dutyFree) {
            loginBeforeRouting(
              context: context,
              route: dutyFreeConfirmationOrder,
              onNavigation: () {
                ///to change bottom tab to orders tab
                _switchTabToOrders();
                navigateToScreenUsingNamedRouteWithArguments(
                  context,
                  dutyFreeConfirmationOrder,
                  argumentObject: orderId,
                );
              },
            );
          } else if (lob == DeepLinkType.pranaam) {
            final bool isRoundTrip =
                (_deepLinkData.value?.link?.queryParameters['serviceType'] ??
                        'roundtripDeparture') ==
                    'roundtripDeparture';
            loginBeforeRouting(
              context: context,
              route: myAccountView,
              onNavigation: () {
                ///to change bottom tab to orders tab
                _switchTabToOrders();
                navigateToScreenUsingNamedRouteWithArguments(
                  context,
                  myAccountView,
                  argumentObject: [orderId, false, isRoundTrip],
                );
              },
            );
          } else {
            loginBeforeRouting(
              context: context,
              route: '',
              onNavigation: () {
                _switchTabToOrders();
              },
            );
          }
        }
        continue logEvent;
      case DeepLinkType.flightBooking:
        if (!isTheSameRoute(context, flightBooking)) {
          final Map<String, dynamic> params =
              _deepLinkData.value?.link?.queryParameters ?? {};
          if (params[linkDataKey] == null) {
            navigateToScreenUsingNamedRoute(context, flightBooking);
          } else {
            final data =
                json.decode(params[linkDataKey]) as Map<String, dynamic>;
            navigateToScreenUsingNamedRouteWithArguments(
              context,
              flightBooking,
              argumentObject: FlightBookingDeepLinkModel.fromJson(data),
            );
          }
        }
        continue logEvent;
      case DeepLinkType.feedback:
        if (!isTheSameRoute(context, customerFeedback)) {
          navigateToScreenUsingNamedRoute(context, customerFeedback);
        }
        continue logEvent;
      case DeepLinkType.referCode:
        if (ProfileSingleton.profileSingleton.isLoggedIn) {
          if (!isTheSameRoute(context, loyaltyDashboard)) {
            navigateToScreenUsingNamedRoute(context, loyaltyDashboard);
          }
        } else {
          final Map<String, dynamic> params =
              _deepLinkData.value?.link?.queryParameters ?? {};
          final String? code = params[
              (params[referralCode] != null) ? referralCode : linkDataKey];
          referCode = code ?? '';
          if (!isTheSameRoute(context, signInScreen)) {
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
          }
        }
        continue logEvent;
      case DeepLinkType.dutyFree:
        final Map<String, dynamic> params =
            _deepLinkData.value?.link?.queryParameters ?? {};
        adLog('DeepLink_Params: $params');
        dutyFreeRoutingCases(
          context: context,
          params: params,
        );
        continue logEvent;
      case DeepLinkType.pranaam:
        if (!isTheSameRoute(context, pranaamService)) {
          navigateToPranaamScreen(context);
        }
        continue logEvent;
      case DeepLinkType.porter:
        if (!isTheSameRoute(context, standAloneDashboard)) {
          navigateToStandAloneScreen(context, StandAloneServiceType.porter);
        }
        continue logEvent;
      case DeepLinkType.cart:
        if (!isTheSameRoute(context, genericCartScreen)) {
          navigateToScreenUsingNamedRoute(context, genericCartScreen);
        }
        continue logEvent;
      case DeepLinkType.referAndEarn:
        loginBeforeRouting(context: context, route: loyaltyReferEarn);
        continue logEvent;
      case DeepLinkType.flightStatus:
        if (!isTheSameRoute(context, flightStatusScreen)) {
          navigateToScreenUsingNamedRouteWithArguments(
            context,
            flightStatusScreen,
            argumentObject: FidsModel(airportItemModel: selectedAirportsData),
          );
        }
        continue logEvent;
      case DeepLinkType.republic:
        if (!isTheSameRoute(context, republicReward)) {
          navigateToScreenUsingNamedRoute(context, republicReward);
        }
        continue logEvent;
      case DeepLinkType.offers:
        final Map<String, dynamic> params =
            _deepLinkData.value?.link?.queryParameters ?? {};
        final String? offersRoute = params[linkRouteKey].toString();
        if (!isTheSameRoute(context, offersDashboard)) {
          navigateToScreenUsingNamedRouteWithArguments(
            context,
            offersDashboard,
            argumentObject: OfferDashKeyModel(
              selectedOffersTabTitle: offersRoute ?? '',
            ),
          );
        }
        continue logEvent;
      case DeepLinkType.offerDetail:
        final Map<String, dynamic> params =
            _deepLinkData.value?.link?.queryParameters ?? {};
        final String? id = params[uniqueId] ?? '';
        final String? offerTitle = params[title].toString();
        if (!isTheSameRoute(context, offerDetail)) {
          navigateToScreenUsingNamedRouteWithArguments(
            context,
            offerDetail,
            argumentObject: OfferKeyModel(
              id: id,
              title: offerTitle ?? 'Offer Details',
            ),
          );
        }
        continue logEvent;
      case DeepLinkType.cabs:
        if (!isTheSameRoute(context, cabBookingHomeScreen)) {
          navigateToScreenUsingNamedRouteWithArguments(
            context,
            cabBookingHomeScreen,
          );
        }
        break;
      logEvent:
      case DeepLinkType.logDeepLinkEvent:
        _logDeepLinkSuccessEvent();
        break;
      default:
        break;
    }
  }

  void _switchTabToOrders() {
    const int ordersTabIndex = 2;

    final CustomTabScaffold customTabScaffold =
        BottomBarState.key.currentWidget as CustomTabScaffold;
    customTabScaffold.controller?.index = ordersTabIndex;
  }

  void _logDeepLinkSuccessEvent() {
    final utmParams = UtmParamsModel.fromJson(
      _deepLinkData.value?.link?.queryParameters ?? {},
    );
    ClickEvents.deeplink_success.logEvent(
      parameters: {
        Parameters.category.name: _deepLinkDataType.toString().split('.').last,
        Parameters.sub_category.name:
            _deepLinkSource.toString().split('.').last,
        Parameters.source.name: utmParams.utmSource,
        Parameters.medium.name: utmParams.utmMedium,
        Parameters.campaign_name.name: utmParams.utmCampaign,
        Parameters.destination.name:
            _deepLinkDataType.toString().split('.').last,
        Parameters.business_unit.name: 'common',
        Parameters.deeplink.name: _deepLinkData.value?.link.toString() ?? 'NA',
      },
    );
  }

  void _logDeepLinkSelectEvent({
    required DeepLink deepLink,
  }) {
    final utmParams = UtmParamsModel.fromJson(
      deepLink.link?.queryParameters ?? {},
    );
    ClickEvents.deeplink_select.logEvent(
      parameters: {
        Parameters.sub_category.name:
            _deepLinkSource.toString().split('.').last,
        Parameters.deeplink.name: deepLink.link.toString(),
        Parameters.source.name: utmParams.utmSource,
        Parameters.medium.name: utmParams.utmMedium,
        Parameters.campaign_name.name: utmParams.utmCampaign,
      },
    );
  }

  void _logDeepLinkFailureEvent([
    String error = 'Deep Link Error',
  ]) {
    adLog(error);
    ClickEvents.deeplink_fail.logEvent(
      parameters: {
        Parameters.deeplink.name: _deepLinkData.value?.link.toString() ?? 'NA',
        Parameters.error_text.name: error,
      },
    );
  }
}

void loginBeforeRouting({
  required BuildContext context,
  required String route,
  void Function()? onNavigation,
}) {
  if (ProfileSingleton.profileSingleton.isLoggedIn) {
    if (!isTheSameRoute(context, route)) {
      if (onNavigation != null) {
        onNavigation.call();
      } else {
        navigateToScreenUsingNamedRouteWithArguments(
          context,
          route,
          argumentObject: true,
        );
      }
    }
  } else {
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      signInScreen,
      argumentObject: SignInStatusModel(
        isLoginStatusTap: (value) => value
            ? Future.delayed(
                const Duration(milliseconds: 5),
                () {
                  if (!isTheSameRoute(context, route)) {
                    if (onNavigation != null) {
                      onNavigation.call();
                    } else {
                      navigateToScreenUsingNamedRouteWithArguments(
                        context,
                        route,
                        argumentObject: true,
                      );
                    }
                  }
                },
              )
            : null,
        isNotFromSplash: true,
        popUpRequired: true,
        currentRouteName: tabRoute,
      ),
    );
  }
}

void dutyFreeRoutingCases({
  required BuildContext context,
  required Map<String, dynamic> params,
}) {
  final data = json.decode(params[linkDataKey]) as Map<String, dynamic>;
  final linkData = DutyFreeDeepLinkDataModel.fromJson(data);
  if (linkData.materialGroup?.toLowerCase() == 'liquor') {
    openAgeConsentBottomSheet(context, deepLinkParams: params);
  } else {
    navigateToTheRoute(context, params);
  }
}

void navigateToTheRoute(BuildContext context, Map<String, dynamic> params) {
  final String airportCode = params[airportCodeKey];
  final String lob = params[lineOfBusinessKey];
  final String route = params[linkRouteKey];
  final data = json.decode(params[linkDataKey]) as Map<String, dynamic>;
  final linkData = DutyFreeDeepLinkDataModel.fromJson(data);

  switch (dutyFreeRoutesMap[params[linkRouteKey].toString()]) {
    case DutyFreeRoutes.dashBoard:
      if (!isTheSameRoute(context, dutyFreeScreen)) {
        context.read<DutyFreeState>().getDutyFreeTerminalList(
              storeType: linkData.storeType,
            );
        home_screen.navigateToDutyFreeScreen(context);
      }
      break;
    case DutyFreeRoutes.productCatalogPage:
      if (!isTheSameRoute(context, dutyFreeCatalogScreen)) {
        navigateToDutyFreeScreen(
          context,
          linkData: linkData,
        );
      }
      break;
    case DutyFreeRoutes.productPage:
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        productDetailDutyFreeScreen,
        rootNavigator: false,
        argumentObject: DealProductModel(
          airportCode: airportCode,
          catalogType: 'skuCode',
          skuCode: linkData.skuCode,
          storeType: linkData.storeType,
          timeStamp: '',
        ),
      );
      break;
    default:
  }
  final airportData =
      context.read<SiteCoreStateManagement>().adaniAirportsList.singleWhere(
            (element) => element.airportCode == airportCode,
            orElse: () =>
                context.read<SiteCoreStateManagement>().adaniAirportsList.first,
          );

  selectedAirportsData = airportData;
  SharedPrefsUtils().putVarValueInPrefs(
    keySelectedAirport,
    selectedAirportsData,
  );
  context.read<AirportListStateManagement>().updateData(airportData, context);
}

/// Returns true is the current Route == [routeToCheck]
bool isTheSameRoute(
  BuildContext context,
  String routeToCheck,
) {
  bool isSame = false;
  Navigator.of(context).popUntil((route) {
    isSame = route.settings.name == routeToCheck;
    return true;
  });
  return isSame;
}

void openAgeConsentBottomSheet(
  BuildContext context, {
  required Map<String, dynamic> deepLinkParams,
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
          deepLinkParams: deepLinkParams,
        ),
        noCallBack: () => openDutyFreeScreen(
          context,
          dialogContext,
          isAgeAbove25: false,
          deepLinkParams: deepLinkParams,
        ),
      );
    },
  );
  adLog('bottomSheet: $bottomSheet');
}

void navigateToDutyFreeScreen(
  BuildContext context, {
  bool isAgeAbove25 = false,
  required DutyFreeDeepLinkDataModel linkData,
}) {
  if (isAgeAbove25) {
    navigatorPopScreen(context);
  }

  final CustomTabScaffold customTabScaffold =
      BottomBarState.key.currentWidget as CustomTabScaffold;
  final GlobalKey<NavigatorState> navigatorState =
      HomeBottomAssets.homeBottomPages.keys.toList()[1];
  BottomBarState.currentIndex = 1;
  customTabScaffold.controller?.index = 1;
  context
      .read<DutyFreeState>()
      .getDutyFreeTerminalList(storeType: linkData.storeType);
  context.read<DutyFreeState>()
    ..setFilters(
      data: DutyFreeItem(
        materialGroup: linkData.materialGroup ?? '',
      ),
    )
    ..catalogListTitle = linkData.materialGroupTitle ?? '';

  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    navigatorState.currentState?.pushNamedAndRemoveUntil(
      dutyFreeCatalogScreen,
      (route) => route.isFirst,
      arguments: ['', linkData.slug ?? ''],
    ).then((value) => adLog(value?.toString()));
  });
}

void openDutyFreeScreen(
  BuildContext context,
  BuildContext dialogContext, {
  required bool isAgeAbove25,
  required Map<String, dynamic> deepLinkParams,
}) {
  context.read<DutyFreeState>().ageAbove25 = isAgeAbove25;
  context
      .read<DutyFreeState>()
      .dutyFreeEventState
      .ageConfirmationEvent(isAgeAbove: isAgeAbove25);
  if (!isAgeAbove25) {
    navigatorPopScreen(dialogContext);
    if (!isTheSameRoute(context, dutyFreeScreen)) {
      //// to change storeType @ duty free dashboard for NO case in age consent
      // final data =
      //     json.decode(deepLinkParams[linkDataKey]) as Map<String, dynamic>;
      // final linkData = DutyFreeDeepLinkDataModel.fromJson(data);
      // context.read<DutyFreeState>().getDutyFreeTerminalList(
      //       storeType: linkData.storeType,
      //     );
      navigateToScreenUsingNamedRoute(context, dutyFreeScreen);
    }
  } else {
    navigatorPopScreen(dialogContext);
    navigateToTheRoute(context, deepLinkParams);
  }
}
