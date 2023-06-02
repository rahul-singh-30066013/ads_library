/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/deal_product_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/catalog_list_response_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/coupon_response/coupon_list_response.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/airport_list_state_management.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/modules/offers/repositories/offer_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

class OffersStateManagement extends ADBaseViewModel {
  bool _isAbsorbing = false;
  ADResponseState offerSiteCoreState = ADResponseState.loading();
  ADResponseState offersState = ADResponseState.loading();
  ADResponseState offersDetailState = ADResponseState.loading();
  final OfferRepository _offerRepository = OfferRepository();
  CatalogListResponseModel? pdpPageResponse;
  List<WidgetItem> filteredOfferList = List.empty();
  String allOffers = 'All Offers';
  String selectedTab = '';
  String? airportName = '';
  bool isInStoreAirportClicked = false;

  bool get isAbsorbing => _isAbsorbing;

  ///It will fetch banner offer data
  Future<void> fetchDashBoardHome({String? airport}) async {
    offerSiteCoreState = ADResponseState.loading();
    airportName =
        airport == null ? airportPrefixName().toString() : airport.toString();

    adLog('Rahul Singh ${selectedAirportsData?.airportPrefixName}');
    final Map<String, String> queryParams = {
      'item': SiteCoreApiUrls.offers,
      'sc_lang': 'en',
      'sc_apptype': 'app',
      'sc_storeType': '',
      'sc_location':
          airport == null ? airportPrefixName().toString() : airport.toString(),
      'sc_apikey': SiteCoreApiUrls.siteCoreApiKey,
    };

    _isAbsorbing = true;
    notifyListeners();
    final responseState = await _offerRepository.fetchOfferHomeData(
      path: SiteCoreApiUrls.siteCoreLayoutBaseUrl,
      queryParams: queryParams,
    );
    _isAbsorbing = false;
    offerSiteCoreState = responseState;
    notifyListeners();
  }

  ///It will fetch grid offer data
  Future<void> getAllOffers({String? airportName}) async {
    offersState = ADResponseState.loading();
    final Map<String, String> queryParameters = {
      'language': 'en',
      'StoreType': '',
      'appType': 'app',
      'AirportCode': airportName == null
          ? airportPrefixName().toString()
          : airportName.toString(),
    };

    final value = await _offerRepository.fetchOffers(
      queryParameters: queryParameters,
    );
    offersState = value;
    filteredOfferList = (offersState.data as OfferItems).result;
    notifyListeners();
  }

  ///It will fetch particular offer data
  Future<void> getOfferDetail(
    String offerUniqueID, {
    bool isUnlockOffer = false,
    bool fetchDataFromPromoCode = false,
    String? airportPrefixNameValue,
  }) async {
    final Map<String, Object> queryParameters = {
      'language': 'en',
      'StoreType': '',
      'appType': 'app',
      'isUnlockOffer': isUnlockOffer,
      fetchDataFromPromoCode ? 'Code' : 'offerUniqueID': offerUniqueID,
      'AirportCode': airportPrefixNameValue ?? airportPrefixName().toString(),
    };

    final value = await _offerRepository.fetchOffers(
      queryParameters: queryParameters,
    );
    offersDetailState = value;
    notifyListeners();
  }

  String? airportPrefixName() {
    return selectedAirportsData?.airportPrefixName?.isNullOrEmpty == false
        ? selectedAirportsData?.airportPrefixName
        : 'adani-one-airport';
  }

  ///Returned searched data, locally
  Future<void> searchedOffersList({String searchTerm = ''}) async {
    filteredOfferList = searchTerm.isEmpty && selectedTab.isEmpty
        ? (offersState.data as OfferItems).result
        : List.of(
            (offersState.data as OfferItems).result.where(
                  (element) =>
                      (element.tabTitle == selectedTab ||
                          selectedTab.isEmpty) &&
                      (element.title
                              .toLowerCase()
                              .contains(searchTerm.toLowerCase()) ||
                          element.promotionDescription
                              .toLowerCase()
                              .contains(searchTerm.toLowerCase()) ||
                          element.promotionCode
                              .toLowerCase()
                              .contains(searchTerm.toLowerCase())),
                ),
          );
    notifyListeners();
  }

  void updateAirport(BuildContext context, WidgetItem item) {
    final airportData = context
        .read<SiteCoreStateManagement>()
        .adaniAirportsList
        .singleWhere(
          (element) => element.airportPrefixName == item.offerUniqueID,
          orElse: () =>
              context.read<SiteCoreStateManagement>().adaniAirportsList.first,
        );

    selectedAirportsData = airportData;
    SharedPrefsUtils().putVarValueInPrefs(
      keySelectedAirport,
      selectedAirportsData,
    );
    context.read<AirportListStateManagement>().updateData(airportData, context);
    if (selectedAirportsData?.airportCode?.isNotEmpty ?? false) {
      context.read<DutyFreeState>().getDutyFreeTerminalList();
    }
    context.read<DutyFreeState>().ageAbove25 = false;
    selectedAirportNotifier.value = airportData.city ?? '';
  }

  ///Returned selected tabs data, locally
  void tabsOfferList({required String tab}) {
    selectedTab = tab != allOffers ? tab : '';
    filteredOfferList = tab == allOffers
        ? (offersState.data as OfferItems).result
        : List.of(
            (offersState.data as OfferItems).result.where(
                  (element) => element.tabTitle == tab,
                ),
          );
    notifyListeners();
  }

  void navigate(BuildContext context, WidgetItem item) {
    if (airportName == 'adani-one-airport' &&
        item.promotionType
                .replaceAll(' ', '')
                .replaceAll('-', '')
                .toLowerCase() ==
            PromotionTypeEnum.instoreoffer.name) {
      isInStoreAirportClicked = true;
      updateAirport(context, item);
      fetchDashBoardHome(airport: item.offerUniqueID);
      getAllOffers(airportName: item.offerUniqueID);
    } else {
      if (item.skuCode.isNotEmpty && !item.tcEnable) {
        navigateToScreenUsingNamedRouteWithArguments(
          context,
          productDetailDutyFreeScreen,
          rootNavigator: false,
          argumentObject: DealProductModel(
            item: pdpPageResponse?.result.first,
            // index: 0,
            from: 'cart',
            skuCode: item.skuCode,
            timeStamp: pdpPageResponse?.result.first.timeStamp,
          ),
        );
      } else if (item.categoryFilter.isNotEmpty && !item.tcEnable) {
        context.read<DutyFreeState>().catalogListTitle = item.categoryFilter;
        context.read<DutyFreeState>().materialGroupCode = item.categoryFilter;
        navigateToScreenUsingNamedRouteWithArguments(
          context,
          dutyFreeCatalogScreen,
          rootNavigator: false,
        );
      } else {
        navigateToScreenUsingNamedRouteWithArguments(
          context,
          offerDetail,
          rootNavigator: false,
          argumentObject: OfferKeyModel(
            id: item.offerUniqueID,
            title: item.offerTitle,
            airportPrefixName: airportName,
          ),
        );
      }
    }
  }

  void fileGAEvent(
    WidgetItem item,
    CouponDetails itemForCoupon,
  ) {
    ///GA event for view offer
    GaEvent.getInstance().offersAndDiscountEvent();
    final map = GaEvent.getInstance().parameterMap;
    if (item.promotionCode.isNotEmpty) {
      map[Parameters.type.name] = item.promotionCode;
      map[Parameters.label.name] = item.title;
      map[Parameters.date.name] = item.isExpired
          ? 'Expired'
          : FlightUtils.eventDateYYYYMMDDFormat(
              item.effectiveTo,
              Constant.dateFormat17,
              Constant.dateFormat21,
            );
      map['text'] = item.promotionDescription;
    }
    if (itemForCoupon.couponCode.isNotEmpty) {
      map[Parameters.type.name] = itemForCoupon.couponCode;
      map[Parameters.label.name] = itemForCoupon.promoName;
      map[Parameters.date.name] = FlightUtils.eventDateYYYYMMDDFormat(
        itemForCoupon.endDate,
        Constant.dateFormat17,
        Constant.dateFormat21,
      );
      map['text'] = itemForCoupon.description;
    }
    ClickEvents.view_banner.logEvent(parameters: map);
  }

  String dateFormatter(String dateTime) {
    final newDateTimeObj2 = DateFormat(Constant.dateFormat16).parse(dateTime);
    return DateFormat(Constant.dateFormat20).format(newDateTimeObj2).toString();
  }

  void redirection(BuildContext context, WidgetItem item) {
    final promotionType = PromotionTypeEnum.values
        .byName(item.promotionType.toLowerCase().replaceAll(' ', ''));
    if (item.tcEnable) {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        offerDetail,
        rootNavigator: false,
        argumentObject: OfferKeyModel(
          id: item.offerUniqueID,
          title: item.offerTitle,
        ),
      );
    } else if (item.skuCode.isNotEmpty) {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        productDetailDutyFreeScreen,
        rootNavigator: false,
        argumentObject: DealProductModel(
          item: pdpPageResponse?.result.first,
          // index: 0,
          from: 'cart',
          skuCode: item.skuCode,
        ),
      );
    } else if (item.categoryFilter.isNotEmpty) {
      context.read<DutyFreeState>().catalogListTitle = item.categoryFilter;
      context.read<DutyFreeState>().materialGroupCode = item.categoryFilter;
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        dutyFreeCatalogScreen,
        rootNavigator: false,
      );
    } else if (promotionType == PromotionTypeEnum.flightbooking) {
      navigateToScreenUsingNamedRoute(
        context,
        flightBooking,
      );
    } else if (promotionType == PromotionTypeEnum.pranaam) {
      navigateToScreenUsingNamedRoute(
        context,
        pranaamService,
        rootNavigator: false,
      );
    } else if (promotionType == PromotionTypeEnum.dutyfree) {
      navigateToScreenUsingNamedRoute(
        context,
        dutyFreeScreen,
        rootNavigator: false,
      );
    } else {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        offerDetail,
        rootNavigator: false,
        argumentObject: OfferKeyModel(
          id: item.offerUniqueID,
          title: item.offerTitle,
        ),
      );
    }
  }
}
