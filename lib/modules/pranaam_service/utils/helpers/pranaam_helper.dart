/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_tab_nav_keys.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/confirmation_gif_align_value.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/add_ons_list_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/cart_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_addon.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_detail.dart'
    as package_detail_pre_booking;
import 'package:adani_airport_mobile/modules/pranaam_service/model/package_site_core_response/package_site_core_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/local_cart_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_order_status.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/utils/stand_alone_service_helper.dart';
import 'package:adani_airport_mobile/modules/wallet/repository/wallet_state.dart';
import 'package:adani_airport_mobile/network/pranaam_api/pranaam_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

String dataTimeFormatddMMyyyy = 'dd-MM-yyyy';
String dataTimeFormatDayMonth = 'd MMM';
String dateConfirmationFormat = 'd MMM';
String dataTimeFormatDateMonthDay = 'd MMM, EEE';
String dataTimeFormatDateMonthTime = 'd MMM, HH:mm';
String dateTimeFormatDayMonthYear = 'd MMM y';

const adultPassengerCode = 'ADT';
const childPassengerCode = 'CHD';
const infantPassengerCode = 'INF';

const int validTimeDifferenceForSecondFlightInTransit = 360;

String formatDate(String dateTime) {
  try {
    return DateFormat('dd-MM-yyyy').format(stringToDateTime(dateTime));
  } catch (e) {
    // adLog(' currentDateUdit${DateFormat('dd-MM-yyyy').format(DateTime.now())}');
    return '-';
  }
}

String convertDateTimeToIso({
  required String? inCommingFormat,
  required String? dateString,
}) {
  try {
    return DateFormat(inCommingFormat)
        .parse(dateString ?? '')
        .toIso8601String();
  } catch (e) {
    return '-';
  }
}

String dateFormatter(String dateTime, {String? format}) {
  return DateFormat(format ?? Constant.dateFormat3)
      .format(DateTime.parse(dateTime))
      .toString();
}

String timeFormatter12Hour(String dateTime, {String? format}) {
  return DateFormat(format ?? Constant.dateFormat15)
      .format(DateTime.parse(dateTime))
      .toString();
}

String timeFormatter(String dateTime, {String? format}) {
  return DateFormat(format ?? Constant.dateFormat7)
      .format(DateTime.parse(dateTime).toLocal())
      .toString();
}

String formatFlightServiceDate(String dateTime) {
  try {
    return DateFormat('dd MMM yyyy')
        .format(DateFormat('MM/dd/yyyy hh:mm:ss aa').parse(dateTime));
  } catch (e) {
    return '-';
  }
}

String formatDateTimeFlightServiceDate(DateTime? dateTime) {
  try {
    if (dateTime != null) {
      return DateFormat('dd MMM yyyy').format(dateTime);
    }
    return '-';
  } catch (e) {
    return '-';
  }
}

String formatFlightServiceTime(String dateTime) {
  try {
    return DateFormat('hh:mm')
        .format(DateFormat('MM/dd/yyyy hh:mm:ss aa').parse(dateTime));
  } catch (e) {
    return '-';
  }
}

String formatFlightService12Time(String dateTime) {
  try {
    return DateFormat('hh:mm a')
        .format(DateFormat('MM/dd/yyyy hh:mm:ss aa').parse(dateTime));
  } catch (e) {
    return '-';
  }
}

String formatDateTimeFlightService12Time(DateTime? dateTime) {
  try {
    if (dateTime != null) {
      return DateFormat('hh:mm a').format(dateTime);
    }
    return '-';
  } catch (e) {
    return '-';
  }
}

String formatServiceTimeForUpgrade(String dateTime) {
  try {
    return DateFormat('dd-MM-yyyy')
        .format(DateFormat('yyyy-MM-dd hh:mm:ss').parse(dateTime));
  } catch (e) {
    return '-';
  }
}

String formatToBuggyAnimationTime(String dateTime) {
  try {
    return DateFormat('yyyy-MM-dd hh:mm:ss')
        .format(DateFormat('yyyy-MM-dd hh:mm:ss').parse(dateTime));
  } catch (e) {
    return '-';
  }
}

String formatPaymentServiceTime(String dateTime) {
  try {
    return DateFormat('hh:mm a')
        .format(DateFormat('yyyy-MM-dd hh:mm:ss').parse(dateTime));
  } catch (e) {
    adLog(e.toString());
    return '-';
  }
}

String formatFlightDetailRowServiceTime(String dateTime) {
  try {
    return DateFormat('hh:mm a')
        .format(DateFormat('yyyy-MM-dd hh:mm:ss').parse(dateTime));
  } catch (e) {
    adLog(e.toString());
    return '-';
  }
}

String formatPranaamOrderServiceTime(String dateTime) {
  try {
    return DateFormat('hh:mm a')
        .format(DateFormat('yyyy-MM-dd hh:mm:ss').parse(dateTime));
  } catch (e) {
    adLog(e.toString());
    return '-';
  }
}

String formatPranaamRoundTripServiceTime(String dateTime) {
  try {
    return DateFormat('hh:mm a').format(DateFormat('hh:mm:ss').parse(dateTime));
  } catch (e) {
    adLog(e.toString());
    return '-';
  }
}

String formatServiceTime(String dateTime) {
  try {
    return DateFormat('HH:mm')
        .format(DateFormat('yyyy-MM-dd hh:mm:ss').parse(dateTime));
  } catch (e) {
    return '-';
  }
}


String formatCouponDate(String dateTime) {
  try {
    return DateFormat('dd MMM yyyy')
        .format(DateFormat('yyyy-MM-dd').parse(dateTime));
  } catch (e) {
    return '-';
  }
}

String formatGaDate(String dateTime) {
  try {
    return DateFormat("'~t'yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        .format(DateFormat('yyyy-MM-dd').parse(dateTime));
  } catch (e) {
    return '-';
  }
}

String universalDateFormatter({
  String? inCommingFormat,
  required String requiredFormat,
  String? dateString,
  DateTime? dateTimeObject,
}) {
  try {
    return DateFormat(requiredFormat).format(
      dateTimeObject ?? DateFormat(inCommingFormat).parse(dateString ?? ''),
    );
  } catch (e) {
    adLog(e.toString());
    return '-';
  }
}

DateTime? formatFlightDateForCartScreen(String date) {
  try {
    return DateFormat('yyyy-MM-dd').parse(date);
  } catch (e) {
    return null;
  }
}

String formatTime(String dateTime) {
  try {
    return DateFormat('HH:mm').format(stringToDateTime(dateTime));
  } catch (e) {
    return '-';
  }
}

String formatTimeForUpgrade(String dateTime) {
  try {
    return DateFormat('HH:mm')
        .format(DateFormat('yyyy-MM-dd hh:mm:ss').parse(dateTime));
  } catch (e) {
    adLog(e.toString());
    return '-';
  }
}

String reviewServiceTime(String dateTime) {
  try {
    return DateFormat('hh:mm a').format(stringToDateTime(dateTime));
  } catch (e) {
    return '-';
  }
}

String reviewArrivalTime(String dateTime) {
  try {
    return DateFormat('hh:mm a').format(DateFormat('HH:mm').parse(dateTime));
  } catch (e) {
    return '-';
  }
}

String formatTimeFromTimeString(String dateTime, String incomingFormat) {
  try {
    return DateFormat('HH:mm')
        .format(DateFormat(incomingFormat).parse(dateTime));
  } catch (e) {
    return '-';
  }
}

String formatTimeHHMMSS(String dateTime) {
  try {
    return DateFormat('HH:mm:ss').format(stringToDateTime(dateTime));
  } catch (e) {
    return '-';
  }
}

String flightServiceTime(String serviceTime) {
  final flightServiceTime = serviceTime.split(':');
  return '${flightServiceTime.first}' ':${flightServiceTime[1]}';
}

String getBookedDate(String bookDate) {
  final bookedDate = bookDate.split('T');
  return bookedDate.first;
}

DateTime stringToDateTime(String date) {
  try {
    return DateFormat('yyyy-MM-dd hh:mm:ss').parse(date);
  } catch (e) {
    rethrow;
    // return null;
  }
}

DateTime stringToTime(String date) {
  try {
    return DateFormat('hh:mm:ss').parse(date);
  } catch (e) {
    rethrow;
  }
}

DateTime? stringToDateTimeNew({
  required String date,
  String? incomingDateFormat,
}) {
  try {
    return DateFormat(incomingDateFormat ?? 'yyyy-MM-dd hh:mm:ss').parse(date);
  } catch (e) {
    return null;
  }
}

String formatDateForDateTimeDataType(DateTime dateTime, String dateTimeFormat) {
  try {
    return DateFormat(dateTimeFormat).format(dateTime);
  } catch (e) {
    return '-';
  }
}

String formatDateTime({
  DateTime? dateTimeType,
  String? dateString,
  required String dateTimeFormat,
}) {
  try {
    if (dateTimeType != null) {
      DateTime dateTimeInput;
      dateTimeInput = dateTimeType;
      return DateFormat(dateTimeFormat).format(dateTimeInput);
    }
    if (dateString != null && dateString.isNotEmpty) {
      DateTime dateTimeInput;
      dateTimeInput = stringToDateTime(dateString);
      return DateFormat(dateTimeFormat).format(dateTimeInput);
    }
    return '-';
  } catch (e) {
    return '-';
  }
}

String formatFlightDetailRowDate(String dateTime) {
  try {
    return DateFormat('dd MMM, yyyy')
        .format(DateFormat('dd/mm/yyyy').parse(dateTime));
  } catch (e) {
    return '-';
  }
}

List<LocalCartModel> getCartAdded(CartResponse? cartResponse) {
  final List<LocalCartModel> listLocalCartModel = [];
  if (cartResponse == null) {
    return listLocalCartModel;
  } else {
    /// case 1 : check for package detail
    final LocalCartModel localCartModel = LocalCartModel(
      cartResponse.packageDetail.packageId,
      cartResponse.packageDetail.name,
      cartResponse.packageDetail.pricingInfo.totalFare.amount,
      0,
      packageImage: cartResponse.packageDetail.packageImage,
    );
    listLocalCartModel.add(localCartModel);
    final List<PackageAddOn> packageAddOnList = cartResponse.packageAddOn;
    final int size = packageAddOnList.length;
    for (int index = 0; index < size; index++) {
      if (packageAddOnList[index].qty > 0) {
        adLog('packageAddOnList qty $packageAddOnList[index].qty');
        listLocalCartModel.add(
          LocalCartModel(
            cartResponse.packageAddOn[index].packageId,
            cartResponse.packageAddOn[index].addOnServiceName,
            cartResponse.packageAddOn[index].price.toDouble(),
            cartResponse.packageAddOn[index].qty,
            isCartAddOn: true,
            packageAddOn: cartResponse.packageAddOn[index],
            packageImage: cartResponse.packageDetail.packageImage,
          ),
        );
      }
    }
  }
  return listLocalCartModel;
}

double getCartTotalPrice(CartResponse? cartResponse) {
  double totalPrice = 0;
  if (cartResponse == null) {
    return 0;
  } else {
    /// case 1 : check for package detail
    totalPrice =
        totalPrice + cartResponse.packageDetail.pricingInfo.totalFare.amount;
    final List<PackageAddOn> packageAddOnList = cartResponse.packageAddOn;
    final int size = packageAddOnList.length;
    for (int index = 0; index < size; index++) {
      if (packageAddOnList[index].qty > 0) {
        adLog(
          'packageAddOnList total price ${cartResponse.packageAddOn[index].price}',
        );
        totalPrice = totalPrice +
            cartResponse.packageAddOn[index].price *
                cartResponse.packageAddOn[index].qty;
      }
    }
  }
  return totalPrice;
}

double getAddOnTotalPrice(List<AddOnsListModel> packageAddOnList) {
  double totalPrice = 0;
  final int size = packageAddOnList.length;
  for (int index = 0; index < size; index++) {
    if (packageAddOnList[index].quantity > 0) {
      adLog(
        'packageAddOnList total price ${packageAddOnList[index].unitPrice}',
      );
      totalPrice = totalPrice + packageAddOnList[index].baseTotalPrice;
    }
  }
  return totalPrice;
}

double getAddOnTotalPricePostBooking(List<AddOnService> packageAddOnList) {
  double totalPrice = 0;
  final int size = packageAddOnList.length;
  for (int index = 0; index < size; index++) {
    if (packageAddOnList[index].quantity > 0) {
      adLog(
        'packageAddOnList total price ${packageAddOnList[index].unitPrice}',
      );
      totalPrice = totalPrice + packageAddOnList[index].unitPrice;
    }
  }
  return totalPrice;
}

double getAddOnItemTotalPrice(AddOnsListModel packageAddOnItem) {
  double totalPrice = 0;
  if (packageAddOnItem.quantity > 0) {
    adLog(
      'packageAddOnItem total price ${packageAddOnItem.unitPrice}',
    );
    totalPrice = packageAddOnItem.baseTotalPrice;
  }
  return totalPrice;
}

double getAddOnItemTotalPricePostBooking(AddOnService packageAddOnItem) {
  double totalPrice = 0;
  if (packageAddOnItem.quantity > 0) {
    adLog(
      'packageAddOnItem total price ${packageAddOnItem.unitPrice}',
    );
    totalPrice = packageAddOnItem.unitPrice;
  }
  return totalPrice;
}

String getCityName(
  String airportCode,
  SiteCoreStateManagement siteCoreStateManagement,
) {
  return siteCoreStateManagement.airportCityMap[airportCode]?.cityName ?? '';
}

String getAirportCodeFromAirportId(
  String airportId,
  SiteCoreStateManagement siteCoreStateManagement,
) {
  return siteCoreStateManagement.airportIdMap[airportId]?.airportCode ?? '';
}

int getServiceName(
  PranaamAppDataStateManagement pranaamAppDataStateManagement,
) {
  return getServiceType(
    pranaamAppDataStateManagement.cartDataResponse?.tripDetail.serviceType,
  );
}

int getServiceType(String? serviceType) {
  switch (serviceType?.toLowerCase()) {
    case 'departure':
      return departureServiceId;
    case 'arrival':
      return arrivalTripServiceId;
    case 'round trip':
    case 'roundtrip':
    case 'Round Trip':
      return roundTripServiceId;
    case 'transit':
      return transitServiceId;
  }
  return 0;
}

String getServiceNameFromServiceTypeId(
  int serviceTypeId,
) {
  switch (serviceTypeId) {
    case id_1:
      return 'Departure';
    case id_4:
      return 'Arrival';
    case id_3:
      return 'Round Trip';
    case id_2:
      return 'Transit';
    default:
      return '';
  }
}

String getServiceTitle(int? serviceType) {
  switch (serviceType) {
    case id_1:
      return 'Departure';
    case id_4:
      return 'Arrival';
    case id_3:
      return 'Round Trip';
    case id_2:
      return 'Transit';
  }
  return 'Departure';
}

double getPorterPrice(CartResponse? cartResponse) {
  if (cartResponse == null) {
    return 0;
  } else {
    final List<PackageAddOn> packageAddOnList = cartResponse.availiableAddOn;
    final int size = packageAddOnList.length;
    for (int index = 0; index < size; index++) {
      if (packageAddOnList[index].addOnServiceName == 'Porter') {
        return packageAddOnList[index].price;
      }
    }
  }
  return 0;
}

PackageAddOn getPorterAddon(CartResponse? cartResponse) {
  if (cartResponse == null) {
    return const PackageAddOn();
  } else {
    final List<PackageAddOn> packageAddOnList = cartResponse.packageAddOn;
    final int size = packageAddOnList.length;
    for (int index = 0; index < size; index++) {
      if (packageAddOnList[index].addOnServiceName == 'Porter') {
        adLog('getPorterAddon ${packageAddOnList[index]}');
        return packageAddOnList[index];
      }
    }
  }
  return const PackageAddOn();
}

PackageAddOn getPorterAvailableAddon(CartResponse? cartResponse) {
  if (cartResponse == null) {
    return const PackageAddOn();
  } else {
    final List<PackageAddOn> packageAddOnList = cartResponse.availiableAddOn;
    final int size = packageAddOnList.length;
    for (int index = 0; index < size; index++) {
      if (packageAddOnList[index].addOnServiceName == 'Porter') {
        adLog('getPorterAvailableAddon ${packageAddOnList[index]}');
        return packageAddOnList[index];
      }
    }
  }
  return const PackageAddOn();
}

PackageAddOn getPorterAddonFromPackageAddOnOrAvailableAddOn(
  CartResponse? cartResponse,
) {
  if (cartResponse == null) {
    return const PackageAddOn();
  } else {
    List<PackageAddOn> packageAddOnList = cartResponse.packageAddOn;
    int size = packageAddOnList.length;
    for (int index = 0; index < size; index++) {
      if (packageAddOnList[index].addOnServiceName == 'Porter') {
        adLog('getPorterAddon ${packageAddOnList[index]}');
        return packageAddOnList[index];
      }
    }
    packageAddOnList = cartResponse.availiableAddOn;
    size = packageAddOnList.length;
    for (int index = 0; index < size; index++) {
      if (packageAddOnList[index].addOnServiceName == 'Porter') {
        adLog('getPorterAvailableAddon ${packageAddOnList[index]}');
        return packageAddOnList[index];
      }
    }
  }
  return const PackageAddOn();
}

double getAddonsTotalPrice(CartResponse? cartResponse) {
  double totalPrice = 0;
  if (cartResponse == null) {
    return 0;
  } else {
    /// case 1 : check for package detail
    final List<PackageAddOn> packageAddOnList = cartResponse.packageAddOn;
    final int size = packageAddOnList.length;
    for (int index = 0; index < size; index++) {
      if (packageAddOnList[index].qty > 0) {
        totalPrice = totalPrice +
            cartResponse.packageAddOn[index].basePrice *
                cartResponse.packageAddOn[index].qty;
      }
    }
  }
  return totalPrice;
}

double getAddonItemTotalPrice(PackageAddOn addOnItem) {
  double totalPrice = 0;

  /// case 1 : check for package detail

  if (addOnItem.qty > 0) {
    totalPrice = addOnItem.basePrice * addOnItem.qty;
  }
  return totalPrice;
}

double getAddonItemTotalPricePostBooking(PackageAddOn addOnItem) {
  double totalPrice = 0;

  /// case 1 : check for package detail

  if (addOnItem.qty > 0) {
    totalPrice = addOnItem.basePrice * addOnItem.qty;
  }
  return totalPrice;
}

int getAddonAddedByUserCount(CartResponse? addCartAddOnResponseModel) {
  int count = 0;
  /*final CartResponse? addCartAddOnResponseModel =
      pranaamAppDataStateManagement.cartDataResponse;*/
  if (addCartAddOnResponseModel == null) {
    return count;
  }
  final List<PackageAddOn> packageAddOnList =
      addCartAddOnResponseModel.packageAddOn;
  final int size = packageAddOnList.length;

  // Means Add Cart API
  if (size == 0) {
    return 1;
  }
  // means ADD cart Add On API
  for (int index = 0; index < size; index++) {
    if (packageAddOnList[index].qty > 0) {
      count += packageAddOnList[index].qty;
    }
  }
  // Add 1 for package data
  return count + 1;
}

int getTotalPassengers(CartResponse? cartResponse) {
  int totalPassengersCount = 0;
  adLog('passengerSize : ${cartResponse.toString()}');
  final package_detail_pre_booking.PricingInfo? pricingInfo =
      cartResponse?.packageDetail.pricingInfo;
  final int passengerSize = pricingInfo?.passengerTypeQuantity.length ?? 0;
  adLog('passengerSize : ${pricingInfo.toString()}');
  for (int index = 0; index < passengerSize; index++) {
    final passengerType = pricingInfo?.passengerTypeQuantity[index];
    final int count = passengerType?.quantity ?? 0;
    totalPassengersCount = totalPassengersCount + count;
  }

  return totalPassengersCount;
}

int getTotalPassengersByType(CartResponse? cartResponse, String passengerType) {
  int totalPassengersCount = 0;
  adLog('getTotalPassengersByType : ${cartResponse.toString()}');
  final package_detail_pre_booking.PricingInfo? pricingInfo =
      cartResponse?.packageDetail.pricingInfo;
  final int passengerSize = pricingInfo?.passengerTypeQuantity.length ?? 0;
  adLog('getTotalPassengersByType : ${pricingInfo.toString()}');
  for (int index = 0; index < passengerSize; index++) {
    if (pricingInfo?.passengerTypeQuantity[index].code == passengerType) {
      final passengerType = pricingInfo?.passengerTypeQuantity[index];
      final int count = passengerType?.quantity ?? 0;
      totalPassengersCount = totalPassengersCount + count;
    }
  }
  adLog('getTotalPassengersByType count: $totalPassengersCount');
  return totalPassengersCount;
}

int isPorterRequiredAsPerBaggageCount(
  int baggageCount,
  int allowedBags,
  int maxBaggageAllowed,
) {
  /// If baggage count is more than 3'
  // const numberOfBaggage = 3;

  final int remainingCount = baggageCount - allowedBags;
  final double value = remainingCount / maxBaggageAllowed;
  return value.ceil();
}

// /// Save Data to Preference
// void saveToPreference(String key, String data) {
//   final dataObj = <String, Object>{
//     'key': key,
//     'dataType': 'string',
//     'value': data,
//   };
//   // AdaniMobilePlugin.writeSharedPref(dataObj);
//   SharedPrefsUtils().putVarValueInPrefs(key, data);
// }

List<Salutation> getSalutationsByCategory(
  String category,
  List<Salutation> salutationMaster,
) {
  if (category == 'adult') {
    return salutationMaster.where(
      (salutation) {
        return salutation.isAdult == '1';
      },
    ).toList();
  } else if (category == 'child') {
    return salutationMaster.where(
      (salutation) {
        return salutation.isChild == '1';
      },
    ).toList();
  } else {
    return salutationMaster.where(
      (salutation) {
        return salutation.isInfant == '1';
      },
    ).toList();
  }
}

bool popUntil() {
  final BuildContext? context = BottomTabNavKeys.homeTabItemKey.currentContext;
  if (context == null) {
    return false;
  }
  final CustomTabScaffold scaffold =
      BottomBarState.key.currentWidget as CustomTabScaffold;
  scaffold.controller?.index = 0;

  // Navigator.of(context).popUntil((route) => route.isFirst);

  Navigator.of(context)
      .popUntil((route) => route.settings.name == pranaamService);

  return true;
}

bool isDataRowColumnIsEqual(
  List<DataRow> packagesCheckboxes,
  List<DataColumn> packageColumn,
) {
  // return
  //   packagesCheckboxes.isEmpty
  //     ? false
  //     : (packageColumn.length * packagesCheckboxes.length ==
  //         packagesCheckboxes.first.cells.length * packagesCheckboxes.length);
  if (packagesCheckboxes.isEmpty) {
    return false;
  } else if (packageColumn.length * packagesCheckboxes.length ==
      packagesCheckboxes.first.cells.length * packagesCheckboxes.length) {
    return true;
  } else {
    return false;
  }
}

int apiPackagesMatchesWithSiteCore(
  List<PackageData> siteCoreData,
  List<package_detail_pre_booking.PackageDetail> packagesList,
) {
  int count = 0;
  final int length = siteCoreData.length;
  final int innerLength = packagesList.length;
  for (int index = 0; index < length; index++) {
    for (int innerIndex = 0; innerIndex < innerLength; innerIndex++) {
      if (siteCoreData[index].packageId ==
          packagesList[innerIndex].packageId.toString()) {
        count = count + 1;
      }
    }
  }

  return count;
}

String getSalutationsTitleById(
  String id,
  List<Salutation> salutationMaster,
) {
  final list = salutationMaster.where(
    (salutation) {
      return salutation.id.toString() == id;
    },
  ).toList();

  return list.isNotEmpty ? list.first.label : '';
}

void openWebView({
  required String title,
  required String url,
  required BuildContext context,
}) {
  final WebViewModel model = WebViewModel(
    title: title,
    url: url,
  );

  if (model.url.isNotEmpty) {
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      webViewContainer,
      argumentObject: model,
    );
  }
}

void openWebViewWithPranaamBook({
  required String title,
  required String url,
  required BuildContext context,
}) {
  final WebViewModel model = WebViewModel(
    title: title,
    url: url,
  );

  if (model.url.isNotEmpty) {
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      webViewContainerPranaamBook,
      argumentObject: model,
    );
  }
}

Duration? getDurationBetweenDateTimes({
  required DateTime? laterDateTime,
  required DateTime? earlierDateTime,
}) {
  if (earlierDateTime != null) {
    return laterDateTime?.difference(earlierDateTime);
  }
  return null;
}

bool isCountryIndiaSelected(
  TextEditingController controller,
) {
  adLog('isCountryIndiaSelected value ${controller.text}');
  return controller.text == 'India';
}

void addToWallet(
  BuildContext context,
  String bookingId,
  String tripBookingId,
) {
  // final BookingAndCancellationState bookingState =
  //     context.read<BookingAndCancellationState>();
  ///TODO: FIX THIS
  // PranaamBookingGaAnalytics().addToWalletEvent(
  //   ClickEvents.add_to_wallet,
  //   bookingState.bookingDetailsResponse?.createBooking,
  // );
  HapticFeedback.heavyImpact();
  WalletState().getApplePassbook(
    '${PranaamApiUrls.getApplePassBook}/$bookingId/$tripBookingId',
    context,
  );
}

bool isUpgradeBooking(String bookingType) {
  return bookingType.toLowerCase() == 'upgradebooking';
}

const String wheelChairBookingType = 'standalonewheelchairbooking';

///use lowercased
const String porterBookingType = 'standaloneporterbooking';

///use lowercased

bool isStandAloneService(String bookingType) {
  switch (bookingType.toLowerCase()) {
    case 'standalonewheelchairbooking':
      return true;
    case 'standaloneporterbooking':
      return true;
    default:
      return false;
  }
}

String getBookingTitle(String bookingType, BuildContext context) {
  switch (bookingType.toLowerCase()) {
    case 'standalonewheelchairbooking':
      return 'wheelchair_title'.localize(context);
    case 'standaloneporterbooking':
      return 'porter_title'.localize(context);
    default:
      return 'pranaam_title'.localize(context);
  }
}

Color getBackgroundBookingStatusColor(
  String statusString,
  BuildContext context,
) {
  Color bookingTypeColor = context.adColors.greenColor;
  final status = PranaamOrderStatus.getStatus(statusString);
  if (status == null) {
    bookingTypeColor = context.adColors.greenColor;
  } else {
    if (status == PranaamOrderStatus.CONFIRMED) {
      bookingTypeColor = context.adColors.greenColor;
    } else if (status.isPendingGetter) {
      const opac = 0.1000000014901161;
      bookingTypeColor = const Color(0xffeb9845).withOpacity(opac);
    } else if (status == PranaamOrderStatus.FAILED ||
        status == PranaamOrderStatus.CANCELLED ||
        status == PranaamOrderStatus.CANCELLATION_INITIATED ||
        status == PranaamOrderStatus.RESCHEDULE_FAILED ||
        status == PranaamOrderStatus.UPGRADE_FAILED) {
      bookingTypeColor = const Color(0xffdc464b);
    }
  }
  return bookingTypeColor;
}

Color getBookingStatusTextColor(String statusString, BuildContext context) {
  final status = PranaamOrderStatus.getStatus(statusString.toUpperCase());
  Color bookingTypeColor = context.adColors.greenColor;
  final bool pendingGetter = status?.isPendingGetter ?? false;
  if (status == PranaamOrderStatus.CONFIRMED) {
    bookingTypeColor = context.adColors.greenColor;
  } else if (statusString == 'Partially Cancelled') {
    bookingTypeColor = context.adColors.orangeColor;
  } else if (pendingGetter) {
    bookingTypeColor = const Color(0xffeb9845);
  } else if (status == PranaamOrderStatus.FAILED ||
      status == PranaamOrderStatus.CANCELLED ||
      status == PranaamOrderStatus.CANCELLATION_INITIATED ||
      status == PranaamOrderStatus.RESCHEDULE_FAILED ||
      status == PranaamOrderStatus.UPGRADE_FAILED) {
    bookingTypeColor = const Color(0xffdc464b);
  } else {
    bookingTypeColor = context.adColors.greenColor;
  }
  return bookingTypeColor;
}

Color getForegroundBookingStatusColor(
  String statusString,
  BuildContext context,
) {
  Color bookingTypeColor = context.adColors.whiteTextColor;
  final status = PranaamOrderStatus.getStatus(statusString);
  if (status == null) {
    bookingTypeColor = context.adColors.whiteTextColor;
  } else {
    if (status.isPendingGetter) {
      bookingTypeColor = Colors.black;
    }
  }
  return bookingTypeColor;
}

String getBookingStatusTypeLottie(
  String statusString, {
  bool isStandAlone = false,
}) {
  final status = PranaamOrderStatus.getStatus(statusString);
  String bookingTypeLottie =
      'lib/assets/gif/lottie/booking_confirmation_pranaam.json';
  if (status == null) {
    bookingTypeLottie =
        'lib/assets/gif/lottie/booking_confirmation_pranaam.json';
  } else {
    if (status == PranaamOrderStatus.CONFIRMED) {
      bookingTypeLottie = isStandAlone
          ? 'lib/assets/gif/lottie/booking_successful.json'
          : 'lib/assets/gif/lottie/booking_confirmation_pranaam.json';
    } else if (status.isPendingGetter) {
      bookingTypeLottie =
          'lib/assets/gif/lottie/booking_partially_cancelled.json';
    } else if (status == PranaamOrderStatus.FAILED ||
        status == PranaamOrderStatus.CANCELLED ||
        status == PranaamOrderStatus.CANCELLATION_INITIATED ||
        status == PranaamOrderStatus.RESCHEDULE_FAILED ||
        status == PranaamOrderStatus.UPGRADE_FAILED) {
      bookingTypeLottie = 'lib/assets/gif/lottie/booking_cancelled.json';
    }
  }
  return bookingTypeLottie;
}

ConfirmationGifAlignValue getBookingStatusAlign(
  String statusString, {
  bool isStandAlone = false,
  bool isRoundTrip = false,
}) {
  final double positionedTopPadding = -16.sp;
  final roundTripBottomPadding = 275.sp;
  final bottomPadding = 250.sp;
  final rightPadding = 10.sp;
  final status = PranaamOrderStatus.getStatus(statusString);
  if (status == null) {
    return ConfirmationGifAlignValue();
  }
  if (isStandAlone && status == PranaamOrderStatus.CONFIRMED) {
    return ConfirmationGifAlignValue(
      top: positionedTopPadding,
      right: rightPadding,
    );
  }
  if (status == PranaamOrderStatus.CONFIRMED ||
      status == PranaamOrderStatus.UPGRADED ||
      status == PranaamOrderStatus.RESCHEDULED) {
    return ConfirmationGifAlignValue(
      bottom: isRoundTrip ? roundTripBottomPadding : bottomPadding,
      right: rightPadding,
    );
  } else if (status.isPendingGetter) {
    final pendingTopPosition = -39.sp;
    return ConfirmationGifAlignValue(
      top: pendingTopPosition,
      right: -rightPadding.sp,
    );
  } else if (status == PranaamOrderStatus.FAILED ||
      status == PranaamOrderStatus.CANCELLED ||
      status == PranaamOrderStatus.CANCELLATION_INITIATED ||
      status == PranaamOrderStatus.RESCHEDULE_FAILED ||
      status == PranaamOrderStatus.UPGRADE_FAILED) {
    return ConfirmationGifAlignValue(
      top: positionedTopPadding,
      right: rightPadding,
    );
  }
  return ConfirmationGifAlignValue();
}

String getBookingStatusTitle(
  String statusString,
) {
  final status = PranaamOrderStatus.getStatus(statusString);
  String title = 'Booking Confirmed,\nThank you!';
  if (status == null) {
    title = 'Booking Confirmed,\nThank you!';
  } else {
    if (status == PranaamOrderStatus.CONFIRMED) {
      title = 'Booking Confirmed,\nThank you!';
    }
    if (status == PranaamOrderStatus.UPGRADED) {
      title = 'Booking Upgraded,\nThank you!';
    }
    if (status == PranaamOrderStatus.RESCHEDULED) {
      title = 'Reschedule \nConfirmed. Thank you!';
    } else if (status == PranaamOrderStatus.PENDING) {
      title = 'Booking Pending!';
    } else if (status == PranaamOrderStatus.RESCHEDULE_PENDING) {
      title = 'Reschedule Pending!';
    } else if (status == PranaamOrderStatus.UPGRADE_PENDING) {
      title = 'Upgrade Pending!';
    } else if (status == PranaamOrderStatus.FAILED) {
      title = 'Booking Failed!';
    }
  }
  return title;
}

String getBookingStatusSubtitle(String statusString, String pendingStatus) {
  String title = 'A confirmation email has been sent to';
  final status = PranaamOrderStatus.getStatus(statusString);
  if (status == null) {
    title = 'A confirmation email has been sent to';
  } else {
    if (status == PranaamOrderStatus.CONFIRMED) {
      title = 'A confirmation email has been sent to';
    }
    if (status.isPendingGetter) {
      title = '$pendingStatus Details sent via mail to';
    }
    if (status == PranaamOrderStatus.FAILED) {
      title = 'Details sent via email to';
    }
  }
  return title;
}

String getPhoneNumberOnTheBasisOfBookingType({
  required String bookingType,
  required CommonOrderDetailBaseResponse? bookingDetailsResponseModel,
}) {
  switch (bookingType.toLowerCase()) {
    case 'standaloneporterbooking':
      return '+${bookingDetailsResponseModel?.orderDetail?.pranaamDetail?.travelers?.first.nationalityCountryId}-${bookingDetailsResponseModel?.orderDetail?.pranaamDetail?.travelers?.first.spocPhone}';
    case 'upgradebooking':
      return '${bookingDetailsResponseModel?.orderDetail?.pranaamDetail?.billingInfo?.countryDialCode ?? ''} ${bookingDetailsResponseModel?.orderDetail?.pranaamDetail?.billingInfo?.mobile}';
    default:
      return '${bookingDetailsResponseModel?.orderDetail?.pranaamDetail?.billingInfo?.countryDialCode}-${bookingDetailsResponseModel?.orderDetail?.pranaamDetail?.billingInfo?.mobile}';
  }
}

String getEmailOnTheBasisOfBookingType({
  required String bookingType,
  required CommonOrderDetailBaseResponse? bookingDetailsResponseModel,
}) {
  switch (bookingType.toLowerCase()) {
    case 'standaloneporterbooking':
      return bookingDetailsResponseModel
              ?.orderDetail?.pranaamDetail?.billingInfo?.email ??
          '';
    case 'upgradebooking':
      return bookingDetailsResponseModel
              ?.orderDetail?.pranaamDetail?.billingInfo?.email ??
          '';
    case 'reschedulebooking':
      return bookingDetailsResponseModel
              ?.orderDetail?.pranaamDetail?.billingInfo?.email ??
          '';
    default:
      return bookingDetailsResponseModel
              ?.orderDetail?.pranaamDetail?.billingInfo?.email ??
          'NA';
  }
}

bool isReschedule(String bookingType) {
  return bookingType.toLowerCase() == 'reschedulebooking';
}

int getServiceTypeId(
  String serviceName,
) {
  switch (serviceName.toLowerCase()) {
    case 'departure':
      return id_1;
    case 'arrival':
      return id_4;
    case 'round trip':
      return id_3;
    case 'transit':
      return id_2;
  }

  return 0;
}

double getReschedulePrice(RescheduleCharges rescheduleDetail) {
  return rescheduleDetail.rescheduleAdultCharges +
      rescheduleDetail.rescheduleChildCharges +
      rescheduleDetail.rescheduleInfantCharges +
      rescheduleDetail.rescheduleAdultChargesCGST +
      rescheduleDetail.rescheduleAdultChargesSGST +
      rescheduleDetail.rescheduleChildChargesCGST +
      rescheduleDetail.rescheduleChildChargesSGST +
      rescheduleDetail.rescheduleInfantChargesCGST +
      rescheduleDetail.rescheduleInfantChargesSGST;
}

int getMaxBaggageCount(
  PranaamAppDataStateManagement? pranaamAppDataStateManagement,
) {
  final int maxAllowedBaggagePerPorter = pranaamAppDataStateManagement
          ?.cartDataResponse?.packageDetail.maxAllowedBaggagePerPorter ??
      0;
  final int freeAllowedPorter = pranaamAppDataStateManagement
          ?.cartDataResponse?.packageDetail.freeAllowedPorter ??
      0;
  return freeAllowedPorter * maxAllowedBaggagePerPorter;
}
