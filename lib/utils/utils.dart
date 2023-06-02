/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/help_and_support_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/get_cart_on_user_basis.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/user_profile/user_profile_utils.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_tab_nav_keys.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart'
    as duty_free;
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/gradient_configuration.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_dashboard_builder.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/duty_free_remove_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/airport_list_state_management.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/dashboard_view_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/wallet/repository/wallet_state.dart';
import 'package:adani_airport_mobile/network/duty_free/duty_free_api_urls.dart';
import 'package:adani_airport_mobile/network/web_links/web_links.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_constant_remote.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:app_review/app_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Utils {
  static const _decimalPlaces = 2;
  static const dutyFreeProductMaxQty = 10;

  static String removeExtraZeros(String value) => (num.tryParse(value) ?? 0)
      .toStringAsFixed(_decimalPlaces)
      .replaceFirst(RegExp(r'\.?0*$'), '');

  /// this method is used to call
  static Future<void> phoneCall(String number, BuildContext context) async {
    await launchUrl(Uri.parse('tel:$number'))
        .then((value) => adLog(value.toString()));
    navigatorPopScreen(context);
  }

  /// this method is used to email
  static Future<void> email(
    String email,
    BuildContext context, {
    bool? isPopTrue,
  }) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email, //add subject and body here
    );

    // final url = Uri.parse(params.toString());
    await canLaunchUrl(uri).then(
      (value) => value ? launchUrl(uri) : adLog('Email Not Supported'),
    );
    if (isPopTrue == null) {
      navigatorPopScreen(context);
    }
  }

  ///this method is uesd for App review popup
  static Future<void> appReviewMethod() async {
    final isReviewAvailable = await AppReview.isRequestReviewAvailable;
    if (isReviewAvailable) {
      final review = await AppReview.requestReview;
      adLog(review.toString());
    }
  }

  static String convertTimeToAmPm(
    String time,
  ) {
    final List<String> splitTime = time.split(' - ');
    final dateFormat = DateFormat('h:mm a');
    final DateTime initialTime = DateFormat('hh:mm').parse(
      splitTime.first,
    );
    final DateTime finalTime = DateFormat('hh:mm').parse(
      splitTime.last,
    );

    final String convertedInitialTime = dateFormat
        .format(initialTime)
        .toUpperCase(); // you can change the format here
    final String convertedFinalTime = dateFormat
        .format(finalTime)
        .toUpperCase(); // you can change the format here

    return '$convertedInitialTime - $convertedFinalTime';
  }

  static String convertSingleTimeToAmPm(
    String time,
  ) {
    final dateFormat = DateFormat('h:mm a');
    final DateTime initialTime = DateFormat('hh:mm').parse(
      time,
    );

    final String convertedInitialTime = dateFormat
        .format(initialTime)
        .toUpperCase(); // you can change the format here

    return convertedInitialTime;
  }

  static DateTime convertStringDateToDateTime(String date) {
    return DateFormat('dd/MM/yyyy').parse(date);
  }

  static bool isCartContainLiquorAndDobTessThan25(
    DateTime date,
    DutyFreeState dutyFreeState,
    List<AirportItemModel> adaniAirportsList,
  ) {
    final DateTime now = DateTime.now();
    final int airportAge = Utils.getAirportAge(
      adaniAirportsList: adaniAirportsList,
      airportCode: dutyFreeState.dutyFreeCartResponse?.airportCode ?? '',
    );

    final newDate = DateTime(now.year - airportAge, now.month, now.day);
    return dutyFreeState.isCartContainLiquor
        ? newDate.isBefore(date)
        : dutyFreeState.isCartContainLiquor;
  }

  static String dateFormatter() {
    final DateTime now = DateTime.now();
    return DateFormat('yyyy-MM-dd').format(now);
  }

  static void openWallet(
    String id,
    BuildContext context, {
    String baseName = DutyFreeApiUrls.baseName,
  }) {
    WalletState()
        .getApplePassbook('$baseName/api/ApplePass/GetApplePass/$id', context);
  }

  /// this method is used to email and phone
  static Future<void> redirectToPhoneEmail(
    String? content,
  ) async {
    final String? mainContent = (content?.contains('http') ?? false)
        ? content?.trim()
        : (content?.contains(':') ?? false)
            ? content?.split(':')[1].trim()
            : content?.trim();

    if (mainContent?.isNullOrEmpty == false) {
      if (mainContent?.contains('@') ?? false) {
        final Uri uri = Uri(scheme: 'mailto', path: mainContent);
        await canLaunchUrl(uri).then(
          (value) => value ? launchUrl(uri) : adLog('Email Not Supported'),
        );
      } else if (mainContent?.contains('http') ?? false) {
        final uri = Uri.parse(mainContent ?? '');
        await canLaunchUrl(uri).then(
          (value) => value
              ? launchUrl(uri, mode: LaunchMode.externalApplication)
              : adLog('Could not launch ${uri.path}'),
        );
      } else {
        await launchUrl(Uri.parse('tel:$mainContent')).then(
          (value) => value ? adLog('Calling') : adLog('Call Not Supported'),
        );
      }
    }
  }

  ///this method checks if the string contains http
  static bool startsWithHttp(String? str) {
    return str?.startsWith('http') ?? false;
  }

  ///this method refactors the url if it doesn't contain http
  static String validateAndAppendBaseUrl(String url) {
    return url.startsWith('http')
        ? url
        : '${Environment.instance.configuration.cmsImageBaseUrl}$url';
  }

  ///This function is added to compare the version of local and remote and based on that return true if remote version is big.
  static bool isRemoteVersionGreaterThanLocal({
    required String localVersion,
    required String appVersionFromRemote,
  }) {
    final List<String> localVersionNo = localVersion.split('.');
    final List<String> remoteVersionNo = appVersionFromRemote.split('.');
    if (localVersionNo.length == remoteVersionNo.length) {
      for (var index = 0; index < remoteVersionNo.length; index++) {
        if (int.parse(remoteVersionNo[index]) >
            int.parse(localVersionNo[index])) {
          return true;
        }
        if (int.parse(remoteVersionNo[index]) <
            int.parse(localVersionNo[index])) {
          return false;
        }
      }
    }
    return false;
  }

  ///Speeds up scrolling tab screens to top
  static void scrollTabScreensToTop({
    required ScrollController scrollController,
    bool isFromPranaamHome = false,
  }) {
    if (scrollController.positions.isNotEmpty) {
      final int scrollToTopSpeed = scrollController.offset.toInt() * 2;
      const pranaamScrollSpeed = 300;
      scrollController.animateTo(
        0,
        duration: Duration(
          milliseconds:
              isFromPranaamHome ? pranaamScrollSpeed : scrollToTopSpeed,
        ),
        curve: Curves.linear,
      );
    }
  }

  ///Retrieves selected airport from shared preferences
  static Future<void> getSelectedAirport() async {
    await SharedPrefsUtils()
        .getValueFromPrefs(keySelectedAirport)
        .then((value) {
      if (value != null && value.toString().isNotEmpty) {
        final Map<String, dynamic> valueMap = json.decode(value.toString());
        selectedAirportsData = AirportItemModel.fromJson(
          valueMap,
        );
        selectedAirportNotifier.value = selectedAirportsData?.city ?? '';
        lastSelectedAirport = selectedAirportsData?.city ?? '';
      }
    });
  }

  /// This method can be used to rate the application
  static void openStore() {
    String url = StoreLinks.androidAppLink;
    if (Platform.isIOS) {
      url = StoreLinks.iosAppLink;
    }
    launchAppUrl(Uri.parse(url));
  }

  static void deleteAccountEmailHandling() {
    final String email = Uri.encodeComponent('dataprotection@adanione.com');
    final String subject = Uri.encodeComponent('Delete My Account');
    final String body = Uri.encodeComponent(
      'Dear Team Adani One,\n\nI hope this message finds you well.\n\nI no longer require my account on your app and request that you delete it from your system.\n\nThank you for your assistance and support.',
    );
    final Uri mail = Uri.parse('mailto:$email?subject=$subject&body=$body');
    launchAppUrl(mail);
  }

  ///Launches application url on platform specific app store
  static Future<void> launchAppUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication)
          .then((value) => log('$value'));
    } else {
      adLog('Could not launch ${url.path}');
    }
  }

  ///Displays HelpAndSupportBottomSheet
  static void helpBottomSheet(
    BuildContext context,
    duty_free.ContactDetail? contactDetail,
  ) {
    final bottomSheet = showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: context.adColors.whiteTextColor,
      elevation: context.k_8,
      isScrollControlled: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(context.k_22),
        ),
      ),
      context: context,
      builder: (dialogContext) {
        return HelpAndSupportBottomSheet(
          contactDetail: contactDetail,
        );
      },
    );
    adLog('$bottomSheet');
  }

  ///Displays snackbar in case contact detail is not available
  static void showContactDetailNotFoundSnackBar(BuildContext context) {
    SnackBarUtil.showSnackBar(
      context,
      'somethingWentWrong'.localize(context),
    );
  }

  ///Formats double value to not show decimal point if the value is whole number otherwise
  ///shows upto two decimal places
  static String formatDecimal(double value) {
    return value.toStringAsFixed(
      value.truncateToDouble() == value ? 0 : _decimalPlaces,
    );
  }

  static Alignment getAlignmentFromEnum(String alignmentEnum) {
    switch (alignmentEnum) {
      case GradientAlignment.topLeft:
        return Alignment.topLeft;
      case GradientAlignment.topRight:
        return Alignment.topRight;
      case GradientAlignment.topCenter:
        return Alignment.topCenter;
      case GradientAlignment.center:
        return Alignment.center;
      case GradientAlignment.centerLeft:
        return Alignment.centerLeft;
      case GradientAlignment.centerRight:
        return Alignment.centerRight;
      case GradientAlignment.bottomLeft:
        return Alignment.bottomLeft;
      case GradientAlignment.bottomCenter:
        return Alignment.bottomCenter;
      case GradientAlignment.bottomRight:
        return Alignment.bottomRight;
      default:
        return Alignment.topLeft;
    }
  }

  static BoxDecoration getGradientBoxDecoration(
    GradientConfiguration? gradientConfiguration,
    String backgroundColor,
    Color defaultBackgroundColor, {
    List<double>? stops,
  }) {
    return BoxDecoration(
      gradient: (gradientConfiguration?.gradientColors.isNotEmpty ?? false)
          ? LinearGradient(
              stops: stops,
              colors: (gradientConfiguration?.gradientColors ?? [])
                  .map(
                    (e) => Color(
                      int.tryParse(e) ?? defaultBackgroundColor.value,
                    ),
                  )
                  .toList(growable: false),
              begin: getAlignmentFromEnum(
                gradientConfiguration?.gradientBegin ?? '',
              ),
              end: getAlignmentFromEnum(
                gradientConfiguration?.gradientEnd ?? '',
              ),
            )
          : null,
      color: (gradientConfiguration?.gradientColors.isEmpty ?? true)
          ? Color(
              int.tryParse(backgroundColor) ?? defaultBackgroundColor.value,
            )
          : null,
    );
  }

  // /// Method to change status bar color when changing tab based on theme
  // static void changeStatusBarColor({
  //   bool themeBasedStatusBar = true,
  //   AirportItemModel? airportItemModel,
  // }) {
  // SystemChrome.setSystemUIOverlayStyle(
  //   ((airportItemModel?.isTheme ?? false) &&
  //               BottomBarState.currentIndex == 0) &&
  //           themeBasedStatusBar
  //       ? SystemUiOverlayStyle(
  //           statusBarColor: Color(
  //             int.tryParse(
  //                   airportItemModel?.appBarBackgroundColor ?? '',
  //                 ) ??
  //                 Colors.transparent.value,
  //           ),
  //           statusBarIconBrightness: Brightness.light,
  //         )
  //       : const SystemUiOverlayStyle(
  //           statusBarColor: Colors.transparent,
  //           statusBarIconBrightness:
  //               Brightness.dark, // For Android (dark icons)
  //         ),
  // );
  // }

  //Common app bar to set status bar theme for non themed screen.
  static AppBar getGenericAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 0,
      backgroundColor: context.adColors.whiteTextColor,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  static Future<void> removePref() async {
    await SharedPrefsUtils()
        .deleteKeyFromPrefs(SharedPrefUtilsKeys.keyUserProfileData);
    await SharedPrefsUtils()
        .deleteKeyFromPrefs(SharedPrefUtilsKeys.accessToken);
    await SharedPrefsUtils()
        .deleteKeyFromPrefs(SharedPrefUtilsKeys.refreshToken);
  }

  static Future<void> logOutTap({required BuildContext context}) async {
    ProfileSingleton.profileSingleton.userProfile = null;
    await GetCartOnUserBasis().clearActiveCart(context);
    final appSessionState = context.read<AppSessionState>();
    await appSessionState.updateSessionOnLogout(loginStatus: false);
    appSessionState.eraseProfileImage();
    await removePref();
    await UserProfileUtils.createGuestUserProfile();
    final CustomTabScaffold scaffold =
        BottomBarState.key.currentWidget as CustomTabScaffold;
    scaffold.controller?.index = 0;
    (BottomTabNavKeys.homeTabItemKey.currentState ?? NavigatorState())
        .popUntil((route) => route.isFirst);
  }

  static String timeFormat24 = 'h:mm';
  static String timeFormat12 = 'h:mm a';

  static String getFormattedDateOrTime({
    String date = '',
    String existingFormat = 'dd/MM/yyyy',
    String requiredFormat = "'~t'yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  }) {
    final DateTime dateTime = DateFormat(existingFormat).parse(date);
    return DateFormat(requiredFormat).format(dateTime);
  }

  static DateTime getFormattedDateFromString({
    required String dateStr,
  }) {
    const String existingFormat = 'dd-MM-yyyy';
    return DateFormat(existingFormat).parse(dateStr);
  }

  static void clearDutyFreeCartDialog(
    BuildContext context,
    Function(BuildContext context) selectItemCallback,
  ) {
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
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
        return DutyFreeRemoveItem(
          detailString: dutyFreeState.dutyFreeCartResponse?.airportCode !=
                  selectedAirportsData?.airportCode
              ? 'remove_airport_cart'
                  .localize(context)
                  .replaceAll(
                    '#1',
                    context
                            .read<SiteCoreStateManagement>()
                            .adaniAirportsList
                            .singleWhere(
                              (element) =>
                                  element.airportCode ==
                                  (dutyFreeState
                                          .dutyFreeCartResponse?.airportCode ??
                                      ''),
                              orElse: () =>
                                  selectedAirportsData ?? AirportItemModel(),
                            )
                            .city ??
                        '',
                  )
                  .replaceAll(
                    '#2',
                    selectedAirportsData?.city ?? '',
                  )
              : dutyFreeState.dutyFreeCartResponse?.itemDetails.first.storeType
                          .toLowerCase() !=
                      'departure'
                  ? 'remove_arrival_cart'.localize(context)
                  : 'remove_departure_cart'.localize(context),
          titleString: 'cart_change'.localize(context),
          yesCallBack: () => selectItemCallback(dialogContext),
          noCallBack: () => navigatorPopScreen(dialogContext),
          cancelText: 'clear_my_cart'.localize(context),
          confirmText: 'cancel_cart'.localize(context),
        );
      },
    );
    adLog(bottomSheet.toString());
  }

  ///Help desk contact details from remote
  static duty_free.ContactDetail getHelpContactDetail() {
    const defaultMobileNumber = '1800-572-111111';
    const defaultEmailId = 'support@adanione.com';
    final appConstantRemoteModel = AppConstantRemote().appConstantRemoteModel;
    final mobileNumber = appConstantRemoteModel == null
        ? defaultMobileNumber
        : appConstantRemoteModel.supportContact.isNullOrEmpty
            ? defaultMobileNumber
            : appConstantRemoteModel.supportContact;
    final emailId = appConstantRemoteModel == null
        ? defaultEmailId
        : appConstantRemoteModel.supportMail.isNullOrEmpty
            ? defaultEmailId
            : appConstantRemoteModel.supportMail;
    return duty_free.ContactDetail(
      duty_free.ContactAttributes(
        'contactNumber',
        'Contact Number',
        mobileNumber,
      ),
      duty_free.ContactAttributes(
        'contactemail',
        'Email',
        emailId,
      ),
    );
  }

  static String getCityName({
    required List<AirportItemModel> adaniAirportsList,
    required String airportCode,
  }) {
    final List<AirportItemModel> airportsDataList = adaniAirportsList;

    String? cityName;
    for (final element in airportsDataList) {
      if (element.airportCode?.toUpperCase() == airportCode.toUpperCase()) {
        cityName = element.city;
        break;
      }
    }

    return cityName ?? '';
  }

  static int getAirportAge({
    required List<AirportItemModel> adaniAirportsList,
    required String airportCode,
  }) {
    final List<AirportItemModel> airportsDataList = adaniAirportsList;

    int? airportAge;
    for (final element in airportsDataList) {
      if (element.airportCode?.toUpperCase() == airportCode.toUpperCase()) {
        airportAge = element.dutyFreeAgeLimit;
        break;
      }
    }

    return airportAge ?? 0;
  }

  static JavascriptChannel getAirportChangeWebViewBridge(BuildContext context) {
    return JavascriptChannel(
      name: 'Print',
      onMessageReceived: (JavascriptMessage message) {
        debugPrint('airport Codes ${message.message}');

        ///TODO Need to test
        if (selectedAirportsData?.isNonAdaniAirport ?? false) {
          final value = message.message.split(',');
          if (value.isNotEmpty) {
            String airportCode = value.singleWhere(
              (element) => element.contains('airportcode'),
              orElse: () => '',
            );
            airportCode = airportCode.replaceAll('airportcode:', '');
            if (airportCode.isNotEmpty &&
                selectedAirportsData?.airportCode != airportCode) {
              final selectedAirport = context
                  .read<SiteCoreStateManagement>()
                  .adaniAirportsList
                  .singleWhere(
                    (element) => element.airportCode == airportCode,
                    orElse: () => AirportItemModel(),
                  );
              if (selectedAirport.airportCode?.isNotEmpty ?? false) {
                selectedAirportsData = selectedAirport;
                selectedAirportNotifier.value =
                    selectedAirportsData?.city ?? '';
                SharedPrefsUtils().putVarValueInPrefs(
                  keySelectedAirport,
                  selectedAirportsData,
                );
                lastSelectedAirport = selectedAirportsData?.city ?? '';
                context.read<AirportListStateManagement>().airportData =
                    selectedAirportsData;
                context.read<DashBoardViewModel>()
                  ..homeDashBoardState = ADResponseState.loading()
                  ..getDashBoardData(
                    selectedAirportsData?.city ?? '',
                    postFix: '',
                    notify: true,
                  );
              }
            }
          }
        }
      },
    );
  }

  static Offset? getPositionBottomLeft(GlobalKey _widgetKey) {
    final RenderBox? renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.localToGlobal(Offset.zero);
  }
}
