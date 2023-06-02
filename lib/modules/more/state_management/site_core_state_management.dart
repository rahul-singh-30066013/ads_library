/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:adani_airport_mobile/api_client/ad_api_client.dart';
import 'package:adani_airport_mobile/constants/assets/json_assets.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/city_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/api_header_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/payment/utils/enums/payment_mode.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/package_site_core_response/package_site_core_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/repository/pranaam_app_data_repository/pranaam_app_data_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/constants/pranaam_service_contants.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/enum/masters_enum.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/site_core_master_util.dart';
import 'package:adani_airport_mobile/modules/site_core/model/airline/airline_info.dart';
import 'package:adani_airport_mobile/modules/site_core/model/airline/site_core_airline_response.dart';
import 'package:adani_airport_mobile/modules/site_core/model/avatars/avatars_model.dart';
import 'package:adani_airport_mobile/modules/site_core/model/city_list/city_list_model.dart'
    as city_list;
import 'package:adani_airport_mobile/modules/site_core/model/city_response.dart';
import 'package:adani_airport_mobile/modules/site_core/model/county_code/country_code_item.dart';
import 'package:adani_airport_mobile/modules/site_core/model/county_code/sitecore_country_code_base_response.dart';
import 'package:adani_airport_mobile/modules/site_core/model/flightinformation/important_info.dart';
import 'package:adani_airport_mobile/modules/site_core/model/insurance/site_core_insurance_data_response.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core;
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/payment_fields.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/payment_type_list.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/sample/option.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/site_core_payment_parent_response.dart';
import 'package:adani_airport_mobile/modules/site_core/repositories/site_core_repository.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

const int _maxDateDiffInMinutes = 300;

class SiteCoreStateManagement extends ADBaseViewModel {
  final SiteCoreRepository _siteCoreRepository = SiteCoreRepository();

  /// Initiate loading state for api hit
  ADResponseState siteCoreApiResponseState = ADResponseState.loading();
  SiteCoreApiResponseState allAirportListFetchState =
      SiteCoreApiResponseState.loading;
  SiteCoreApiResponseState masterDataFetchState =
      SiteCoreApiResponseState.loading;
  SiteCoreApiResponseState airlineListFetchState =
      SiteCoreApiResponseState.loading;

  List<AirportItemModel> adaniAirportsList = [];
  List<CityDetailModel> airportCityList = [];
  List<CityDetailModel> domesticPopular = [];
  List<CityDetailModel> domesticOtherAirportCityList = [];
  List<CityDetailModel> internationAirportCityList = [];
  List<CityDetailModel> pranaamAirportCityList = [];
  List<CityDetailModel> pranaamInternationAirportCityList = [];
  List<CountryCodeItem> countryCodeItem = [];
  List<CountryCodeData> countryCodeFinalData = [];
  List<CityDetailModel> airportCityFromApiPranaamList = [];
  List<CityDetailModel> airportPranaamCityList = [];
  CountryCodeData countryCodeIndia = CountryCodeData();

  CityDetailModel prannamCityDetailModel = const CityDetailModel(
    cityCode: '0',
    airportName: 'NA',
    countryName: 'NA',
    cityName: 'NA',
    cityPlaceholder: 'NA',
  );

  Map<String, AirLineInfo?> airlineInfo = {};

  Map<String, CityDetailModel> airportCityMap = {};
  Map<String, CityDetailModel> internationalAirportCityMap = {};

  Map<String, CityDetailModel> airportIdMap = {};
  PaymentFields? paymentFields;
  List<PaymentTypeList>? paymentTypeList;
  Map<String, int> departureFlightCountMap = {};
  Map<String, int> arrivalFlightCountMap = {};
  PackageSiteCoreResponse packageSiteCoreResponse =
      const PackageSiteCoreResponse();

  site_core.SiteCoreMasters _siteCoreMasters =
      const site_core.SiteCoreMasters();

  List<site_core.Country> country = [];
  List<site_core.Nationality> nationality = [];
  List<site_core.BookingStatus> bookingStatus = [];
  List<site_core.BookingStatus> flyingClass = [];
  List<site_core.BookingStatus> passengerType = [];
  List<site_core.BookingStatus> serviceType = [];
  List<site_core.Salutation> salutation = [];
  List<site_core.State> state = [];
  List<site_core.State> filteredStatesList = [];
  List<site_core.State> statesListByCountry = [];

  List<site_core.TravelSector> travelSector = [];
  List<city_list.Result> citiesListData = [];
  List<city_list.Result> citiesListPranaam = [];

  List<city_list.Result> citiesListDataByState = [];
  List<city_list.Result> filteredCitiesList = [];
  bool changeValue = true;
  String defaultCard = '';
  String? contactEmailId;
  String? contactNumber;
  String? contactEmailIdTitle;
  String? contactNumberTitle;
  ImportantInfo? flightInformationPoliciesResponse;
  AvatarsModel? avatars;

  SiteCoreInsuranceDataResponse? insuranceData;

  /// start fetching List Of Airports City from site core or local
  Future<void> fetchListOfAirports() async {
    allAirportListFetchState = SiteCoreApiResponseState.loading;

    final Map<String, String> queryParams = {
      itemKey: SiteCoreApiUrls.airportListItem,
      siteCoreLanguageKey: siteCoreDefaultLanguageValue,
      siteCoreApiKey: SiteCoreApiUrls.siteCoreApiKey,
    };
    final isNeedsToUpdate = await isNeedsToUpdateSiteCoreData(
      SharedPreferenceKeys.keyAirportListLastTimeStamp,
    );
    final String cityResponse = await ProfileSingleton.profileSingleton
        .readDataModelFromSharedPreferences(
      SharedPreferenceKeys.keyListOfAirports,
    );
    if (isNeedsToUpdate || cityResponse.isEmpty) {
      final listOfAirportsResponse = await _siteCoreRepository.fetchAirportList(
        queryParams,
      );
      if (listOfAirportsResponse.viewStatus == Status.complete) {
        await _updateAirportListState(
          needsToUpdate: true,
          data: listOfAirportsResponse.data,
        );
      } else {
        await _airportLocalData();
      }
    } else {
      await _updateAirportListState(
        data: CityResponse.fromJson(json.decode(cityResponse.toString())),
        needsToUpdate: false,
      );
    }
  }

  Future<void> _updateAirportListState({
    required CityResponse data,
    required bool needsToUpdate,
  }) async {
    if (data.fields?.listAirportApp == null) {
      await _airportLocalData();
    } else {
      if (needsToUpdate) {
        final bool isSuccessfullyWrite = await ProfileSingleton.profileSingleton
            .writeDataModelToSharedPreferences(
          SharedPreferenceKeys.keyListOfAirports,
          data,
        );
        adLog('isSuccessfullyWrite : $isSuccessfullyWrite');
      }
      _updateAllAirportLists(data);
    }
  }

  Future<void> _airportLocalData() async {
    adLog(
      'fetchAirportLocalData ',
      className: this,
    );
    final jsonString =
        await rootBundle.loadString(JsonAssets.siteCoreAirportCity);
    final parsed = json.decode(jsonString);
    final CityResponse data = CityResponse.fromJson(parsed);
    _updateAllAirportLists(data);
  }

  void _updateAllAirportLists(
    CityResponse data,
  ) {
    adLog(
      'addPranaamAirportList ',
      className: this,
    );
    if (data.fields == null) {
      allAirportListFetchState = SiteCoreApiResponseState.error;
      return;
    }
    allAirportListFetchState = SiteCoreApiResponseState.success;
    final allAirports = data.getCityDetails(AirportListType.all);
    final int airPortListLength = allAirports.length;
    adLog(
      'airPortListLength $airPortListLength ',
      className: this,
    );
    airportPranaamCityList = [];
    for (int index = 0; index < airPortListLength; index++) {
      final listAirportAppData = allAirports[index];
      if (listAirportAppData.isPranaam ?? false) {
        airportPranaamCityList.add(
          listAirportAppData,
        );
      }
      if (listAirportAppData.isDomestic == false &&
          listAirportAppData.isPranaamMasterAirport == true) {
        pranaamInternationAirportCityList.add(listAirportAppData);
      }
    }

    createAirportCodeAndValueMapping(allAirports);
    airportCityList = data.getCityDetails(AirportListType.popular);

    domesticPopular =
        airportCityList.where((element) => element.isDomestic == true).toList();
    internationAirportCityList =
        data.getCityDetails(AirportListType.international);
    createInternationalAirportCodeAndValueMapping(internationAirportCityList);
    pranaamAirportCityList = data.getCityDetails(AirportListType.pranaam);
    domesticOtherAirportCityList = data.getCityDetails(AirportListType.other);
    adLog(
      'pranaam airport found length ${airportPranaamCityList.length}',
      className: this,
    );
  }

  void createAirportCodeAndValueMapping(List<CityDetailModel> _allAirports) {
    for (int index = 0; index < _allAirports.length; index++) {
      final CityDetailModel element = _allAirports[index];
      airportCityMap[element.airportCode ?? ''] = element;

      /// TODO: remove bellow code when backend will add key in Api
      airportIdMap[element.airportID ?? ''] = element;
    }
  }

  void createInternationalAirportCodeAndValueMapping(
    List<CityDetailModel> _internationalAirports,
  ) {
    for (int index = 0; index < _internationalAirports.length; index++) {
      final CityDetailModel element = _internationalAirports[index];
      internationalAirportCityMap[element.airportCode ?? ''] = element;
    }
    FlightUtils.internationalAirportMap = internationalAirportCityMap;
  }

  ///
  /// end fetching List Of Airports City from site core or local

  /// start fetching List Of Adani Airports from site core or local
  ///
  Future<ADResponseState> fetchListAdaniAirports() async {
    final Map<String, String> queryParams = {
      itemKey: SiteCoreApiUrls.adaniAirportList,
      siteCoreLanguageKey: siteCoreDefaultLanguageValue,
      siteCoreApiKey: SiteCoreApiUrls.siteCoreApiKey,
    };
    // final String adaniAirportsResponse = await ProfileSingleton.profileSingleton
    //     .readDataModelFromSharedPreferences(
    //   SharedPreferenceKeys.keyListOfAdaniAirports,
    // );

    ///TODO: isNeedsToUpdate check always true for time being as theme need to update with no delay.

    // final isNeedsToUpdate = await isNeedsToUpdateSiteCoreData(
    //   SharedPreferenceKeys.keyAdaniAirportListLastTimeStamp,
    // );
    //if (isNeedsToUpdate || adaniAirportsResponse.isEmpty) {

    final response = await _siteCoreRepository.fetchAdaniAirportList(
      queryParams,
    );
    if (response.viewStatus == Status.complete) {
      final AdaniAirportsElement? data = response.data;
      return _updateAdaniAirportList(
        data: data,
        needsToUpdate: true,
      );
    } else {
      return response;
    }

    // else {
    //   return _updateAdaniAirportList(
    //     data: AdaniAirportsElement.fromJson(
    //       json.decode(adaniAirportsResponse.toString()),
    //     ),
    //     needsToUpdate: false,
    //   );
    // }
  }

  Future<ADResponseState> _updateAdaniAirportList({
    required AdaniAirportsElement? data,
    required bool needsToUpdate,
  }) async {
    if (data != null) {
      if (needsToUpdate) {
        final bool isSuccessfullyWrite = await ProfileSingleton.profileSingleton
            .writeDataModelToSharedPreferences(
          SharedPreferenceKeys.keyListOfAdaniAirports,
          data,
        );
        adLog('isSuccessfullyWrite : $isSuccessfullyWrite');
      }
      if (data.fields?.listOfAirports?.isNotEmpty ?? false) {
        adaniAirportsList = data.fields?.listOfAirports ?? [];

        final airportItemModel = adaniAirportsList.firstWhere(
          (element) => element.city == (selectedAirportsData?.city ?? ''),
          orElse: () => AirportItemModel(),
        );

        if ((airportItemModel.city?.isEmpty ?? true) &&
            selectedAirportsData?.city != 'Other') {
          selectedAirportsData = null;
          selectedAirportNotifier.value = '';
        }

        ///updating the selected airport object with latest api object
        final airportItem = adaniAirportsList
            .where((element) => element.city == lastSelectedAirport)
            .toList();
        if (airportItem.isNotEmpty) {
          selectedAirportsData = airportItem.first;
          await SharedPrefsUtils()
              .putVarValueInPrefs(keySelectedAirport, selectedAirportsData);
        }

        return ADResponseState.completed(adaniAirportsList);
      } else {
        return ADResponseState.error('Something went wrong', '');
      }
    } else {
      return ADResponseState.error('Something went wrong', '');
    }
  }

  ///
  /// end fetching List Of Adani Airports from site core or local

  /// start fetching List Of Airline from site core or local
  ///
  Future<void> fetchAirlineList() async {
    airlineListFetchState = SiteCoreApiResponseState.loading;
    final Map<String, String> queryParams = {
      'item': SiteCoreApiUrls.airlineListItem,
      'sc_apikey': SiteCoreApiUrls.siteCoreApiKey,
      'fields': 'all',
    };
    final isNeedsToUpdate = await isNeedsToUpdateSiteCoreData(
      SharedPreferenceKeys.keyAirLineListLastTimeStamp,
    );
    final String airlineResponse = await ProfileSingleton.profileSingleton
        .readDataModelFromSharedPreferences(
      SharedPreferenceKeys.keyListOfAirLines,
    );
    if (isNeedsToUpdate || airlineResponse.isEmpty) {
      final listOfAirlinesResponse = await _siteCoreRepository.fetchAirlineList(
        queryParams,
      );
      if (listOfAirlinesResponse.viewStatus == Status.complete) {
        await _updateAirlineListState(
          data: listOfAirlinesResponse.data,
          needsToUpdate: true,
        );
      } else {
        await _airlineLocalData();
      }
    } else {
      await _updateAirlineListState(
        data: SiteCoreAirlineResponse.fromJson(
          json.decode(airlineResponse.toString()),
          Environment.instance.configuration.cmsImageBaseUrl,
        ),
        needsToUpdate: false,
      );
    }
  }

  Future<void> _updateAirlineListState({
    required SiteCoreAirlineResponse? data,
    required bool needsToUpdate,
  }) async {
    if (data != null) {
      if (needsToUpdate) {
        final bool isSuccessfullyWrite = await ProfileSingleton.profileSingleton
            .writeDataModelToSharedPreferences(
          SharedPreferenceKeys.keyListOfAirLines,
          data,
        );
        adLog('isSuccessfullyWrite : $isSuccessfullyWrite');
      }
      _updateAirlineInfo(data);
    } else {
      await _airlineLocalData();
    }
  }

  Future<void> _airlineLocalData() async {
    final jsonString =
        await rootBundle.loadString(JsonAssets.siteCoreUpdateAirlineInfo);
    final parsed = json.decode(jsonString);
    final SiteCoreAirlineResponse data = SiteCoreAirlineResponse.fromJson(
      parsed,
      Environment.instance.configuration.cmsImageBaseUrl,
    );
    _updateAirlineInfo(data);
  }

  void _updateAirlineInfo(SiteCoreAirlineResponse data) {
    if (data.fields == null) {
      airlineListFetchState = SiteCoreApiResponseState.error;
      return;
    }
    airlineListFetchState = SiteCoreApiResponseState.success;
    final int length = data.fields?.results?.length ?? 0;
    for (int index = 0; index < length; index++) {
      final AirLineInfo? element = data.fields?.results?[index];
      airlineInfo[element?.airlineCode ?? ''] = element;
      departureFlightCountMap[element?.airlineCode ?? ''] = 0;
      arrivalFlightCountMap[element?.airlineCode ?? ''] = 0;
    }
    FlightUtils.airlineInfo = airlineInfo;
    FlightUtils.departureFlightCountMap = departureFlightCountMap;
    FlightUtils.arrivalFlightCountMap = arrivalFlightCountMap;
    FlightUtils.loyaltyParams = data.params;
  }

  ///
  /// end fetching List Of Airline from site core or local

  /// start fetching List Of cities from site core or local
  ///

  Future<void> fetchCitiesDataFromSiteCore(String countryCode) async {
    final Map<String, String> queryParams = {
      itemKey: SiteCoreApiUrls.pranaamCitiesData,
      countryCodeKey: countryCode,
      stateCodeKey: '',
      siteCoreLanguageKey: siteCoreDefaultLanguageValue,
      siteCoreApiKey: SiteCoreApiUrls.siteCoreApiKey,
      isCallFromAppKey: isCallFromAppValue,
    };
    final isNeedsToUpdate = await isNeedsToUpdateSiteCoreData(
      SharedPreferenceKeys.keyCitiesDataLastTimeStamp,
    );
    final String countryCodeResponse = await ProfileSingleton.profileSingleton
        .readDataModelFromSharedPreferences(
      SharedPreferenceKeys.keyCitiesData,
    );
    if (isNeedsToUpdate || countryCodeResponse.isEmpty) {
      final ADResponseState response =
          await _siteCoreRepository.fetchAllCitiesData(
        queryParams,
      );
      adLog('fetchCitiesDataFromSiteCore ${response.data}');
      if (response.viewStatus == Status.complete) {
        await _updateCitiesListData(
          data: response.data,
          needsToUpdate: true,
        );
      } /*else {
        await _citiesLocalData();
      }*/
    } else {
      await _updateCitiesListData(
        data: city_list.Element.fromJson(
          json.decode(countryCodeResponse.toString()),
        ),
        needsToUpdate: false,
      );
    }
  }

  Future<ADResponseState> fetchCitiesDataFromSiteCoreUsingStateCode(
    String stateCode,
    String countryCode,
  ) async {
    final Map<String, String> queryParams = {
      itemKey: SiteCoreApiUrls.pranaamCitiesData,
      countryCodeKey: countryCode,
      stateCodeKey: stateCode,
      siteCoreLanguageKey: siteCoreDefaultLanguageValue,
      siteCoreApiKey: SiteCoreApiUrls.siteCoreApiKey,
      isCallFromAppKey: isCallFromAppValue,
    };
    adLog('StateCodesds $queryParams');

    final ADResponseState response =
        await _siteCoreRepository.fetchAllCitiesData(
      queryParams,
    );
    adLog('fetchCitiesDataFromSiteCoreUsingStateCode ${response.data}');
    if (response.viewStatus == Status.complete) {
      final city_list.Element element = response.data;
      citiesListDataByState = element.fields.results;
      adLog('cities from $citiesListDataByState');
    }

    notifyListeners();
    return response;
  }

  Future<void> _updateCitiesListData({
    required city_list.Element? data,
    required bool needsToUpdate,
  }) async {
    if (data != null) {
      if (needsToUpdate) {
        final bool isSuccessfullyWrite = await ProfileSingleton.profileSingleton
            .writeDataModelToSharedPreferences(
          SharedPreferenceKeys.keyCitiesData,
          data,
        );
        adLog('isSuccessfullyWrite : $isSuccessfullyWrite');
      }
      final city_list.Element element = data;
      citiesListData = element.fields.results;
      adLog('citiesListData length ${citiesListData.length}');
    } /*else {
      await _citiesLocalData();
    }*/
  }

  // Future<void> _citiesLocalData() async {
  //   final jsonString =
  //       await rootBundle.loadString(JsonAssets.siteCoreCitiesData);
  //   final parsed = json.decode(jsonString);
  //   final city_list.CityListModel cityListModel =
  //       city_list.CityListModel.fromJson(parsed);
  //   citiesListData = cityListModel.elements.first.fields.results;
  //   adLog('citiesListData length ${citiesListData.length}');
  // }

  ///
  /// end fetching List Of cities from site core or local

  /// start fetching List Of CountryCode from site core or local
  ///
  Future<void> fetchCountryCode() async {
    final Map<String, String> queryParams = {
      'item': SiteCoreApiUrls.countryCodeItem,
      'sc_lang': 'en',
      'sc_apikey': SiteCoreApiUrls.siteCoreApiKey,
    };
    final isNeedsToUpdate = await isNeedsToUpdateSiteCoreData(
      SharedPreferenceKeys.keyCountryCodeListLastTimeStamp,
    );
    final String countryCodeResponse = await ProfileSingleton.profileSingleton
        .readDataModelFromSharedPreferences(
      SharedPreferenceKeys.keyListOfCountryCodes,
    );
    if (isNeedsToUpdate || countryCodeResponse.isEmpty) {
      final listOfCountryCodeResponse =
          await _siteCoreRepository.fetchCountryCode(
        queryParams,
      );
      if (listOfCountryCodeResponse.viewStatus == Status.complete) {
        await _updateCountryCodeData(
          needsToUpdate: true,
          data: listOfCountryCodeResponse.data,
        );
      } else {
        await _countryCodeLocalData();
      }
    } else {
      await _updateCountryCodeData(
        needsToUpdate: false,
        data: SitecoreCountryCodeBaseResponse.fromJson(
          json.decode(countryCodeResponse.toString()),
        ),
      );
    }
  }

  Future<void> _updateCountryCodeData({
    required SitecoreCountryCodeBaseResponse? data,
    required bool needsToUpdate,
  }) async {
    if (needsToUpdate) {
      final bool isSuccessfullyWrite = await ProfileSingleton.profileSingleton
          .writeDataModelToSharedPreferences(
        SharedPreferenceKeys.keyListOfCountryCodes,
        data,
      );
      adLog('isSuccessfullyWrite : $isSuccessfullyWrite');
    }
    if (data != null) {
      _updateCountryCodeInfo(data);
    } else {
      await _countryCodeLocalData();
    }
  }

  Future<void> _countryCodeLocalData() async {
    final jsonString =
        await rootBundle.loadString(JsonAssets.siteCoreCountryCode);
    final parsed = json.decode(jsonString);
    final SitecoreCountryCodeBaseResponse data =
        SitecoreCountryCodeBaseResponse.fromJson(
      parsed,
    );
    _updateCountryCodeInfo(data);
  }

  void _updateCountryCodeInfo(
    SitecoreCountryCodeBaseResponse data,
  ) {
    countryCodeItem = data.fields?.items ?? [];
    final int length = countryCodeItem.length;
    for (int index = 0; index < length; index++) {
      final CountryCodeItem element = countryCodeItem[index];
      final CountryCodeData data = CountryCodeData(
        name: element.name ?? '',
        callingCode: element.fields?.callingCode?.value ?? '',
        countryCode: element.fields?.countryCode?.value ?? '',
        flag: element.fields?.countryFlag?.value?.src ?? '',
        max: element.fields?.maxLength?.value,
        min: element.fields?.minLength?.value,
      );
      if (data.callingCode == '+91') {
        countryCodeIndia = data;
      }
      countryCodeFinalData.add(data);
    }
  }

  ///
  /// end fetching List Of CountryCode from site core or local
  /// start fetching Master data from site core or local
  ///
  Future<void> fetchMastersFromSiteCore(List<String> masterObjects) async {
    ///
    /// lists : It is basically a comma separated String, you need to pass array of string
    /// example if you want only country master just pass [country]
    /// and if you want two master pass like service type and travel sector pass ['serviceType', 'travelSector']
    /// likewise if you want all masters pass an empty array []
    ///
    masterDataFetchState = SiteCoreApiResponseState.loading;
    final Map<String, String> queryParams = {
      listsKey: masterObjects.isEmpty
          ? MastersEnum.all.name
          : masterObjects.length == 1
              ? masterObjects.first
              : masterObjects.join(','),
      itemKey: SiteCoreApiUrls.pranaamMasterData,
      siteCoreLanguageKey: siteCoreDefaultLanguageValue,
      siteCoreApiKey: SiteCoreApiUrls.siteCoreApiKey,
    };
    final isNeedsToUpdate = await isNeedsToUpdateSiteCoreData(
      SharedPreferenceKeys.keyMasterDataLastTimeStamp,
    );
    final String masterDataResponse = await ProfileSingleton.profileSingleton
        .readDataModelFromSharedPreferences(
      SharedPreferenceKeys.keyMasterData,
    );
    if (isNeedsToUpdate || masterDataResponse.isEmpty) {
      final fetchMastersResponse = await _siteCoreRepository.fetchMasters(
        queryParams,
      );
      if (fetchMastersResponse.viewStatus == Status.complete) {
        await _parseAndPopulateMasterLists(
          needsToUpdate: true,
          siteCoreMasters: fetchMastersResponse.data,
        );
      } else {
        await _fetchLocalDataForMasters();
      }
    } else {
      await _parseAndPopulateMasterLists(
        needsToUpdate: false,
        siteCoreMasters: site_core.Element.fromJson(
          json.decode(masterDataResponse.toString()),
        ),
      );
    }
  }

  Future<void> _parseAndPopulateMasterLists({
    required site_core.Element siteCoreMasters,
    required bool needsToUpdate,
  }) async {
    if (siteCoreMasters.componentName == 'Master List') {
      if (needsToUpdate) {
        final bool isSuccessfullyWrite = await ProfileSingleton.profileSingleton
            .writeDataModelToSharedPreferences(
          SharedPreferenceKeys.keyMasterData,
          siteCoreMasters,
        );
        adLog('isSuccessfullyWrite : $isSuccessfullyWrite');
      }
      _updateMasterList(siteCoreMasters: siteCoreMasters);
    } else {
      await _fetchLocalDataForMasters();
    }
  }

  Future<void> _fetchLocalDataForMasters() async {
    final jsonString = await rootBundle.loadString(JsonAssets.siteCoreMasters);
    final parsed = json.decode(jsonString);
    _siteCoreMasters = site_core.SiteCoreMasters.fromJson(parsed);

    if (_siteCoreMasters.elements.isNotEmpty) {
      _updateMasterList(siteCoreMasters: _siteCoreMasters.elements.first);
    } else {
      masterDataFetchState = SiteCoreApiResponseState.error;
    }
  }

  void _updateMasterList({
    required site_core.Element siteCoreMasters,
  }) {
    masterDataFetchState = SiteCoreApiResponseState.success;
    final site_core.Fields fields = siteCoreMasters.fields;
    country = fields.country.isNotEmpty ? fields.country : [];
    nationality = fields.nationality.isNotEmpty ? fields.nationality : [];
    bookingStatus = fields.bookingStatus.isNotEmpty ? fields.bookingStatus : [];
    flyingClass = fields.flyingClass.isNotEmpty ? (fields.flyingClass) : [];
    flyingClass.sort((a, b) => a.order.compareTo(b.order));
    passengerType = fields.passengerType.isNotEmpty ? fields.passengerType : [];
    serviceType = fields.serviceType.isNotEmpty ? fields.serviceType : [];
    serviceType.sort((a, b) => a.order.compareTo(b.order));
    salutation = fields.salutation.isNotEmpty ? fields.salutation : [];
    salutation.sort((a, b) => a.order.compareTo(b.order));
    state = fields.state.isNotEmpty ? fields.state : [];
    travelSector = fields.travelSector.isNotEmpty ? fields.travelSector : [];
    travelSector.sort((a, b) => a.order.compareTo(b.order));
    adLog('parseAndPopulateMasterLists ${country.length}');
  }

  ///
  /// start fetching Master data from site core or local
  Future<void> fetchPaymentFromSiteCore() async {
    final Map<String, String> queryParams = {
      'channeltype': Platform.isAndroid ? 'Android' : 'ios',
    };

    await _siteCoreRepository
        .fetchPaymentDetail(
      queryParams,
    )
        .then((value) {
      _updatePaymentData(value);
    });
  }

  void _updatePaymentData(ADResponseState response) {
    if (response.viewStatus == Status.complete) {
      if (response.data != null) {
        final SiteCorePaymentParentResponse data = response.data;
        defaultCard = data.fields?.cardDetail?.cardImageSmall ?? '';
        paymentTypeList = data.fields?.paymentTypeList;
        paymentFields = data.fields;
        paymentFields?.upiImageList = [];
        final int length = paymentTypeList?.length ?? 0;

        for (int index = 0; index < length; index++) {
          final PaymentTypeList? element = paymentTypeList?[index];
          if (element?.type == 'UPI' ||
              element?.type == 'Android UPI' ||
              element?.type == 'IOS UPI') {
            paymentFields?.upiImageList
                ?.addAll(element?.options ?? List.empty());
            // element?.options?.clear();
            // element?.options?.add(upiOptions);
          }
        }
        print('dst');
      } else {
        paymentFromLocal();
      }
    } else {
      paymentFromLocal();
    }
  }

  Future<void> paymentFromLocal() async {
    final jsonString = await rootBundle.loadString(JsonAssets.siteCorePayment);
    final parsed = json.decode(jsonString);
    final SiteCorePaymentParentResponse data =
        SiteCorePaymentParentResponse.fromJson(parsed);
    paymentTypeList = data.fields?.paymentTypeList;
    paymentFields = data.fields;
    paymentFields?.upiImageList = [];
    final int length = paymentTypeList?.length ?? 0;
    final Option upiOptions = Option(
      paymentOptionType: PaymentOptionType.addNew,
      mode: PaymentMode.upi,
    );
    for (int index = 0; index < length; index++) {
      final PaymentTypeList? element = paymentTypeList?[index];
      if (element?.type == 'UPI') {
        paymentFields?.upiImageList?.addAll(element?.options ?? List.empty());
        element?.options?.clear();
        element?.options?.add(upiOptions);
      }
    }
  }

  /*Future<void> fetchPranaamPackageServices() async {
    final jsonString =
        await rootBundle.loadString(JsonAssets.siteCorePranaamPackageServices);
    final parsed = json.decode(jsonString);
    packageSiteCoreResponse = PackageSiteCoreResponse.fromJson(parsed);
  }*/

  bool clearPranaamAirportData() {
    airportPranaamCityList.clear();
    airportCityFromApiPranaamList.clear();
    return true;
  }

  /// method that returns bool value to tell sitecore data needs to update or not.
  Future<bool> isNeedsToUpdateSiteCoreData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getInt(key);
    if (value == null) {
      final int timestamp = DateTime.now().millisecondsSinceEpoch;
      final isSuccessfullyStored = await prefs.setInt(key, timestamp);
      adLog('currentDateDiffInHours: $isSuccessfullyStored');
      return true;
    } else {
      final int currentDateDiffInMinutes =
          (DateTime.now().millisecondsSinceEpoch - value) ~/ 60000;
      adLog('currentDateDiffInMinutes: $currentDateDiffInMinutes');
      return currentDateDiffInMinutes > _maxDateDiffInMinutes;
    }
  }

  Future<ADResponseState> fetchTermsAndConditionsFromSiteCore(
    String serviceAirportCode,
  ) async {
    final PranaamAppDataRepository _pranaamAppDataRepository =
        PranaamAppDataRepository();
    final Map<String, String> queryParams = {
      itemKey: SiteCoreApiUrls.termsAndConditions,
      siteCoreLanguageKey: siteCoreDefaultLanguageValue,
      siteCoreApiKey: SiteCoreApiUrls.siteCoreApiKey,
      isCallFromAppKey: isCallFromAppValue,
      // cityCode: serviceAirportCode,
    };
    adLog(serviceAirportCode);
    final ADResponseState responseState =
        await _pranaamAppDataRepository.fetchTermsAndConditions(
      queryParams,
    );
    return responseState;
  }

  Future<ADResponseState> fetchCancellationPoliciesFromSiteCore() async {
    final PranaamAppDataRepository _pranaamAppDataRepository =
        PranaamAppDataRepository();
    final Map<String, String> queryParams = {
      'item': SiteCoreApiUrls.cancellationPolicies,
      'sc_lang': 'en',
      'sc_apikey': SiteCoreApiUrls.siteCoreApiKey,
      'isApp': 'true',
    };
    final ADResponseState responseState =
        await _pranaamAppDataRepository.fetchCancellationPolicies(
      queryParams,
    );
    return responseState;
  }

  Future<ADResponseState> fetchImportantInformationFromSiteCore({
    required String infoType,
    required String item,
  }) async {
    final PranaamAppDataRepository _pranaamAppDataRepository =
        PranaamAppDataRepository();
    final Map<String, String> queryParams = {
      'item': item,
      'sc_lang': 'en',
      'sc_apikey': SiteCoreApiUrls.siteCoreApiKey,
      'isApp': 'true',
      'infotype': infoType,
    };
    final ADResponseState responseState =
        await _pranaamAppDataRepository.fetchImportantInformation(
      queryParams,
    );
    return responseState;
  }

  void updateStateOnCountryBasis(List<site_core.State> updatedState) {
    statesListByCountry = updatedState;
    filteredCitiesList = [];
    filteredStatesList = [];
    citiesListDataByState = [];
    notifyListeners();
  }

  void updateCityOnStateBasis(List<city_list.Result> updatedState) {
    citiesListDataByState = updatedState;
    notifyListeners();
  }

  void buildSearchStatesList(
    String userSearchTerm,
  ) {
    adLog('buildSearchStatesList');
    filteredStatesList = [];
    filteredStatesList = stateSearchFromList(
      statesListByCountry,
      userSearchTerm,
    );
    notifyListeners();
  }

  void buildSearchCitiesList(
    String userSearchTerm,
  ) {
    adLog('buildSearchCitiesList');
    filteredCitiesList = [];
    adLog('buildSearchCitiesList $citiesListDataByState');
    filteredCitiesList = citySearchFromList(
      citiesListDataByState,
      userSearchTerm,
    );
    notifyListeners();
  }

  Future<void> getDutyFreeTermsCondition(String cityName) async {
    final ADApiClient adApiClient =
        ADApiClient(baseUrl: Environment.instance.configuration.cmsBaseUrl);

    final ADResponseState value = await adApiClient.get(
      path:
          'sitecore/api/layout/placeholder/jss?placeholderName=main&item=/sitecore/content/AirportHome/DutyfreeAirports/$cityName/TermsandConditions&sc_lang=en&sc_apikey=${SiteCoreApiUrls.siteCoreApiKey}&isApp=false',
      header: APIHeaderUtils.siteCoreHeader(),
      siteCore: true,
    );

    if (value.viewStatus == Status.complete) {
      final response = value.data as List;
      if (response.isNotEmpty) {
        for (final Map element in response) {
          if (element['fields'] != null) {
            final Map<String, dynamic> fields =
                element['fields'] as Map<String, dynamic>;
            if (fields['contentItems'] != null) {
              final List<dynamic> contentItems = fields['contentItems'];
              for (final Map item in contentItems) {
                if (item['name'] != null &&
                    (item['name'] as String == 'contactemail')) {
                  contactEmailId = item['richText'] as String;
                  contactEmailIdTitle = item['title'] as String;
                } else if (item['name'] != null &&
                    (item['name'] as String == 'contactnumber')) {
                  contactNumber = item['richText'] as String;
                  contactNumberTitle = item['title'] as String;
                }
              }
            }
          }
        }
      }
    }
  }

  String getFlag() {
    final countryFlag = countryCodeFinalData.where(
      (element) =>
          '${element.callingCode}' ==
          ProfileSingleton.profileSingleton.countryCodeData.callingCode,
    );
    return countryFlag.isNotEmpty
        ? countryFlag.first.flag ??
            '${Environment.instance.configuration.cmsImageBaseUrl}-/media/Feature/Adani/CountryFlags/flags/in.png?h=39&iar=0&w=60&hash=5190E21452F6BADC10EE1257FEF2F7F7'
        : '${Environment.instance.configuration.cmsImageBaseUrl}-/media/Feature/Adani/CountryFlags/flags/in.png?h=39&iar=0&w=60&hash=5190E21452F6BADC10EE1257FEF2F7F7';
  }

  CountryCodeData getCountryCodeDataWithCountryCode(String callingCode) {
    final countryObject = countryCodeFinalData.where(
      (element) => element.callingCode == callingCode,
    );
    return countryObject.isEmpty
        ? ProfileSingleton.profileSingleton.countryCodeData
        : countryObject.first;
  }

  Future<void> fetchInsuranceData() async {
    final Map<String, String> queryParams = {
      itemKey: SiteCoreApiUrls.insuranceAndZeroCancellationData,
      siteCoreLanguageKey: siteCoreDefaultLanguageValue,
      siteCoreApiKey: SiteCoreApiUrls.siteCoreApiKey,
    };
    final insuranceDataResponse = await _siteCoreRepository.fetchInsuranceData(
      queryParams,
    );
    if (insuranceDataResponse.viewStatus == Status.complete) {
      insuranceData = insuranceDataResponse.data;
    }
    notifyListeners();
  }

  ///Fetch avatars list
  Future<void> fetchAvatars() async {
    unawaited(
      _siteCoreRepository.fetchAvatars().then((value) {
        adLog('Avatars $value');
        _updateAvatarsList(value);
      }),
    );
  }

  void _updateAvatarsList(ADResponseState response) {
    if (response.viewStatus == Status.complete) {
      if (response.data != null) {
        avatars = response.data;
      }
    }
  }
}

enum SiteCoreApiResponseState { loading, success, error }
