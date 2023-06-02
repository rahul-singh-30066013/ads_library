/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/home_bottom_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/home_screen/home_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/fids_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dialog/dialog_view.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/enum/masters_enum.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/app_constants.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/offer_banner/offer_banner_remote.dart';
import 'package:adani_airport_mobile/utils/offer_banner/view/dialogbox_banner.dart';
import 'package:adani_airport_mobile/utils/offer_banner/view/dialogbox_banner_without_button.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/all_router.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this class is used to load loyalty dialog
class LoyaltyDiaglogScreen {
  static bool _isLoading = false;
  static BuildContext? contextT;

  static void closeLoadingDialog(BuildContext? buildContext) {
    if (_isLoading) {
      buildContext = contextT;
      if (buildContext != null) {
        Navigator.of(buildContext).pop();
      }
      _isLoading = false;
    }
  }

  static void showLoadingDialog(
    BuildContext context, {
    required bool buttonRequired,
  }) {
    _isLoading = true;
    Future.delayed(
      const Duration(milliseconds: 10),
      () => showDialog(
        context: context,
        builder: (BuildContext context) {
          if (!buttonRequired) {
            Future.delayed(const Duration(seconds: 4), () {
              Navigator.of(context).pop(true);
            });
          }
          return DialogView(
            buttonRequired: buttonRequired,
          );
        },
      ),
    );
  }

  static void showAPIAlertDialog(
    BuildContext context,
  ) {
    final ValueNotifier<bool> isRetry = ValueNotifier<bool>(false);
    checkSiteCoreAllDataIsFetched(context, isRetry);
  }

  static void checkSiteCoreAllDataIsFetched(
    BuildContext context,
    ValueNotifier<bool> isRetry,
  ) {
    final state = context.read<SiteCoreStateManagement>();
    if (state.allAirportListFetchState == SiteCoreApiResponseState.loading ||
        state.masterDataFetchState == SiteCoreApiResponseState.loading ||
        state.airlineListFetchState == SiteCoreApiResponseState.loading) {
      Future.delayed(
        const Duration(seconds: 1),
        () => {
          checkSiteCoreAllDataIsFetched(context, isRetry),
        },
      );
    } else if (state.allAirportListFetchState ==
            SiteCoreApiResponseState.error ||
        state.masterDataFetchState == SiteCoreApiResponseState.error ||
        state.airlineListFetchState == SiteCoreApiResponseState.error) {
      if (!isAlertVisible) {
        isAlertVisible = true;
        Future.delayed(
          const Duration(milliseconds: 10),
          () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(context.k_20),
                  ),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: context.k_20,
                          top: context.k_20,
                          right: context.k_20,
                          bottom: context.k_20,
                        ),
                        margin: EdgeInsets.only(top: context.k_48),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(context.k_20)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Align(
                              child: Text(
                                'configuration_fetch_error_header'
                                    .localize(context),
                                style: ADTextStyle700.size22
                                    .setTextColor(context.adColors.black),
                                textAlign: TextAlign.center,
                              ).paddingBySide(
                                top: context.k_16,
                              ),
                            ),
                            Align(
                              child: Text(
                                'configuration_fetch_error_message'
                                    .localize(context),
                                style: ADTextStyle400.size14,
                                textAlign: TextAlign.center,
                              ).paddingBySide(
                                top: context.k_16,
                                bottom: context.k_30,
                              ),
                            ),
                            SizedBox(
                              height: context.k_56,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ValueListenableBuilder(
                                      builder: (context, bool value, child) =>
                                          ElevatedButton(
                                        onPressed: () {
                                          isRetry.value = true;
                                          if (state.allAirportListFetchState !=
                                                  SiteCoreApiResponseState
                                                      .loading &&
                                              state.masterDataFetchState !=
                                                  SiteCoreApiResponseState
                                                      .loading &&
                                              state.airlineListFetchState !=
                                                  SiteCoreApiResponseState
                                                      .loading) {
                                            if (state
                                                    .allAirportListFetchState ==
                                                SiteCoreApiResponseState
                                                    .error) {
                                              state.fetchListOfAirports();
                                            }
                                            if (state.masterDataFetchState ==
                                                SiteCoreApiResponseState
                                                    .error) {
                                              state.fetchMastersFromSiteCore([
                                                MastersEnum.all.name,
                                              ]);
                                            }
                                            if (state.airlineListFetchState ==
                                                SiteCoreApiResponseState
                                                    .error) {
                                              state.fetchAirlineList();
                                            }
                                            checkSiteCoreAllDataIsFetched(
                                              context,
                                              isRetry,
                                            );
                                          }
                                        },
                                        style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                            context.adColors.whiteTextColor,
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                            context.adColors.blackTextColor,
                                          ),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(context.k_28),
                                              ),
                                              side: const BorderSide(),
                                            ),
                                          ),
                                        ),
                                        child: value
                                            ? ADDotProgressView(
                                                color: context
                                                    .adColors.whiteTextColor,
                                              )
                                            : Text(
                                                'try_again'.localize(context),
                                                style: ADTextStyle600.size16
                                                    .setTextColor(
                                                  context
                                                      .adColors.whiteTextColor,
                                                ),
                                              ).paddingBySide(
                                                top: context.k_16,
                                                bottom: context.k_16,
                                              ),
                                      ),
                                      valueListenable: isRetry,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      } else {
        isRetry.value = false;
      }
    } else {
      if (isAlertVisible) {
        isAlertVisible = false;
        Navigator.of(context).pop();
      }
    }
  }

  bool get checkNetworkConnectivity => globalResult != ConnectivityResult.none;
  static bool isAlertVisible = false;

  static void showOfferBannerDialog(
    BuildContext context,
  ) {
    _isLoading = true;
    final offerBannerRemoteModel = OfferBannerRemote().offerBannerRemoteModel;

    final Future<Set<void>> imageData = NetworkAssetBundle(
      Uri.parse(
        offerBannerRemoteModel?.widgetItem?.imageSrc ?? '',
      ),
    ).load('').then(
          (imageUrlInByte) => {
            Future.delayed(
              const Duration(milliseconds: 2000),
              () {
                if ((BottomBarState.key.currentWidget as CustomTabScaffold)
                            .controller
                            ?.index ==
                        BottomTabType.home.index &&
                    AllRouter.lastRoute == 'TabBar') {
                  FlightBookingGaAnalytics().homeScreenOfferDialogAnalyticsData(
                    ClickEvents.view_popup_banner,
                    getOfferType(offerBannerRemoteModel?.actionItem),
                    offerBannerRemoteModel?.widgetItem?.imageSrc,
                  );
                  openBottomSheet(context, imageUrlInByte);
                }
              },
            ),
          },
        );
    adLog('message==$imageData');
  }

  static String getOfferType(DutyFreeItem? actionItem) {
    String type = '';
    switch (actionItem?.uniqueId) {
      case '0':
        type = 'flightBooking';
        break;
      case '1':
        type = 'pranaamService';
        break;
      case '2':
        type = 'dutyFree';
        break;
      case '6':
        type = 'flightStatus';
        break;
      case '7':
        type = 'loyaltyDashboard';
        break;
      case '8':
        type = 'cabBooking';
        break;
      case '9':
        type = 'porterService';
        break;
      default:
        type = 'webView';
    }
    return type;
  }

  static void showOfferBannerDialog1(
    BuildContext context,
    ByteData imageData,
  ) {
    _isLoading = true;
    Future.delayed(
      const Duration(milliseconds: 10),
      () => openBottomSheet(context, imageData),
    );
  }

  static void openBottomSheet(
    BuildContext context,
    ByteData imageData,
  ) {
    final offerBannerRemoteModel = OfferBannerRemote().offerBannerRemoteModel;
    final sheet = showAnimatedDialog(
      /*curve: Curves.easeIn,*/
      context: context,
      duration: const Duration(milliseconds: 500),
      builder: (context) =>
          ((offerBannerRemoteModel?.widgetItem?.widgetType ?? 0) == 1)
              ? DialogBoxBanner(
                  imageData: imageData,
                  onTap: (items) => {
                    Navigator.of(context).pop(),
                    _onTapHandler(
                      items,
                      context,
                    ),
                  },
                )
              : ((offerBannerRemoteModel?.widgetItem?.widgetType ??
                          context.k_2.toInt()) ==
                      context.k_2.toInt())
                  ? DialogBoxBannerWithoutButton(
                      imageData: imageData,
                      onTap: (items) => {
                        Navigator.of(context).pop(),
                        _onTapHandler(
                          items,
                          context,
                        ),
                      },
                    )
                  : const ADSizedBox.shrink(),
    );
    adLog('message==$sheet');
  }

  static Future<T?> showAnimatedDialog<T>({
    required BuildContext context,
    bool barrierDismissible = false,
    required WidgetBuilder builder,
/*    animationType = DialogTransitionType.slideFromBottom,
    Curve curve = Curves.ease,*/
    required Duration duration,
  }) {
    assert(debugCheckHasMaterialLocalizations(context));

    final ThemeData theme = Theme.of(context);
    return showGeneralDialog(
      context: context,
      pageBuilder: (
        BuildContext buildContext,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          top: false,
          child: Builder(
            builder: (BuildContext context) {
              return Theme(
                data: theme,
                child: pageChild,
              );
            },
          ),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: const Color(0xCC000000),
      transitionDuration: duration,
/*      transitionBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        switch (animationType) {
          case DialogTransitionType.slideFromBottom:
            return SlideTransition(
              transformHitTests: false,
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).chain(CurveTween(curve: curve)).animate(animation),
              child: child,
            );
          default:
            return FadeTransition(opacity: animation, child: child);
        }
      },*/
    );
  }

  static Future<void> saveCurrentDateTime() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final date = await sharedPreferences.setInt(
      SharedPrefUtilsKeys.todayDate,
      DateTime.now().millisecondsSinceEpoch,
    );
    adLog('date  stored $date');
  }

  static Future<int?> getSavedDateTime() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final date = sharedPreferences.getInt(
      SharedPrefUtilsKeys.todayDate,
    );
    return date;
  }

  static void _onTapHandler(
    DutyFreeItem item,
    BuildContext context,
  ) {
    FlightBookingGaAnalytics().homeScreenOfferDialogAnalyticsData(
      ClickEvents.view_popup_banner_dismiss,
      getOfferType(item),
      item.imageSrc,
    );

    if (item.uniqueId.isEmpty &&
        item.ctaUrl.isNotEmpty &&
        item.ctaUrl.contains('http')) {
      final WebViewModel model = WebViewModel(
        title: 'services'.localize(context),
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
    } else if (selectedAirportsData?.city == 'Other' &&
        (item.uniqueId == '2' ||
            item.uniqueId == '8' ||
            item.uniqueId == '9' ||
            item.uniqueId == '1')) {
      homeScreenKey.currentState?.handlePressed(
        (value) {
          adLog('message$value');
        },
        item: item,
      );
    } else if ((item.uniqueId.isNotEmpty && item.ctaUrl.isEmpty) ||
        (item.uniqueId.isNotEmpty && item.ctaUrl.isNotEmpty)) {
      handleVerticalTap(item.uniqueId, context);
    }
  }

  /// this method is used to perform click listener on circle grid view
  static void handleVerticalTap(
    String objectID,
    BuildContext context,
  ) {
    const String flightBookingFlag = '0';
    const String pranaamServiceId = '1';
    const String dutyFree = '2';
    const String flightStatusFlag = '6';
    const String loyaltyDashboardFlag = '7';
    const String cabBookingFlag = '8';
    const String porterServiceFlag = '9';

    switch (objectID) {
      case flightBookingFlag:
        navigateToScreenUsingNamedRoute(context, flightBooking);
        break;
      case pranaamServiceId:
        navigateToPranaamScreen(
          context,
        );
        break;
      case porterServiceFlag:
        navigateToStandAloneScreen(
          context,
          StandAloneServiceType.porter,
        );
        break;
      case dutyFree:
        ageConfirmation(
          context,
        );
        break;
      case flightStatusFlag:
        navigateToScreenUsingNamedRouteWithArguments(
          context,
          flightStatusScreen,
          argumentObject: FidsModel(airportItemModel: selectedAirportsData),
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
      case loyaltyDashboardFlag:
        navigateToScreenUsingNamedRoute(
          context,
          loyaltyDashboard,
          rootNavigator: false,
        );
        break;
      default:
        adLog('Item Not Found');
    }
  }
}

enum DialogTransitionType {
  ///Slide from bottom animation
  slideFromBottom,
  slideFromTop,
}
