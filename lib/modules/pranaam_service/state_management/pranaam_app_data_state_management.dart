/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:collection';
import 'dart:convert';

import 'package:adani_airport_mobile/constants/assets/json_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/city_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/travellers.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/pranaam_banner_model.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/create_booking_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/response/create_booking_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/cart_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/country_master/response_model/country_master_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_cart/get_cart_response_model/get_cart_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/get_flights_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/pranaam_flights.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_packages/api_request_model/get_packages_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_packages/api_response_model/get_packages_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/package_site_core_response/package_site_core_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/package_site_core_response/package_site_core_response.dart'
    as srp_packages;
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/date_of_journey_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/select_package_data.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/service_booking_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/service_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/travel_sector_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/repository/booking_payment_cancellation/booking_payment_cancellation_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/repository/cart_repository/cart_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/repository/pranaam_app_data_repository/pranaam_app_data_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart';
import 'package:adani_airport_mobile/modules/site_core/repositories/site_core_repository.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/utils/stand_alone_service_helper.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/play_sound.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


///this class is used to represent PranaamAppDataStateManagement
class PranaamAppDataStateManagement extends ADBaseViewModel {
  final PranaamAppDataRepository _pranaamAppDataRepository =
      PranaamAppDataRepository();
  final SiteCoreRepository _siteCoreRepository = SiteCoreRepository();
  final BookingPaymentCancellationRepository _travellerDetailsRepository =
      BookingPaymentCancellationRepository();

  srp_packages.Element srpPackagesElement = const srp_packages.Element();

  List<List<bool>> servicesAvailability = [];
  List<String> packageServicesList = [];
  List<PackageDetail> packagesList = [];
  PackageSiteCoreResponse packageSiteCoreResponse =
      const PackageSiteCoreResponse();
  final HashMap<String, List<bool>> hashMapPackageSiteCoreResponse = HashMap();
  int packageMatches = 0;

  ///controllers
  TextEditingController selectedServiceController = TextEditingController();
  TextEditingController selectedTravelSectorController =
      TextEditingController();
  TextEditingController selectedDateOfTravelController =
      TextEditingController();
  TextEditingController selectedOriginCityController = TextEditingController();
  TextEditingController selectedDestinationCityController =
      TextEditingController();
  TextEditingController selectedFlightController = TextEditingController();
  TextEditingController travellersController = TextEditingController();

  TextEditingController goingToController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController flightController = TextEditingController();
  TextEditingController guestsController = TextEditingController();
  TextEditingController transitToController = TextEditingController();
  bool pranaamBookingFormInit = true;

  FocusNode originCityFocusNode = FocusNode();
  FocusNode destinationCityFocusNode = FocusNode();
  FocusNode flightsFocusNode = FocusNode();
  FocusNode transitCityFocusNode = FocusNode();
  FocusNode transitFlightFocusNode = FocusNode();

  ValueNotifier<String> originCityValueNotifier = ValueNotifier('');
  ValueNotifier<String> destinationCityValueNotifier = ValueNotifier('');
  ValueNotifier<String> flightNotifier = ValueNotifier('');
  ValueNotifier<String> transitNotifier = ValueNotifier('');
  ValueNotifier<String> transitFlightNotifier = ValueNotifier('');

  ValueNotifier<String> flightFirstTimeTextLabel = ValueNotifier('');
  ValueNotifier<String> flightSecondTimeTextLabel = ValueNotifier('');

  ValueNotifier<String> flightFirstTimeTextValue = ValueNotifier('');
  ValueNotifier<String> flightSecondTimeTextValue = ValueNotifier('');

  ValueNotifier<double> flightTimeTopSpacing = ValueNotifier(0);

  String? fromCityCode;
  String? toCityCode;
  String? selectedDate;
  String? selectedTime;
  String? transitCityCode;
  String? roundGoingToCode;
  String? selectedTransitDate;
  String? selectedTransitTime;
  String? selectedTravelSectorId;
  String? selectedServiceId;
  PranaamFlights? pranaamADFlights;
  PranaamFlights? roundTripRoundTripFlights;
  DateOfJourneyModel? dateOfJourneyModel;
  ServiceModel? selectedServiceModel;
  TravelSectorModel? selectedTravelSectorModel;
  Travellers travellers = Travellers();
  DateOfJourneyModel? transitDateModel;
  CityDetailModel? departureCityDetailModel;
  CityDetailModel? arrivalCityDetailModel;
  CityDetailModel? transitDetailModel;
  CityDetailModel? roundDetailModel;

  bool isRoundOrTransitDateSelected = false;

  int travelSectorListCount = 0;
  List<TravelSectorModel>? listTravelSector = [];

  /// this is used to define the label of [selectedDestinationCityController]
  ValueNotifier<String> selectionHeading = ValueNotifier('going_to');
  HashMap<String, Object> bookPranaamStartMap = HashMap();

  ADResponseState pranaamDashboardState = ADResponseState.init();
  bool isLoginClicked = false;
  bool isCartProceedClick = false;
  bool isProceedToPayClick = false;
  bool isBookPackageClicked = false;
  bool isPackageBookClicked = false;
  bool isTransitVisible = false;
  bool isRoundTripVisible = false;
  bool isGuestVisible = true;
  bool isClickFirstTime = true;
  bool howItWorksTap = false;
  bool isApplyCouponClick = false;
  bool isRemoveCouponClick = false;
  bool isApplyCouponListClick = false;
  int selectedIndexValue = 0;
  bool isNeedToScroll = false;
  bool isAnimationLoading = false;
  int oldBookingId = 0;
  String oldBookingReferenceId = '';
  final CartRepository cartRepository = CartRepository();

  ADResponseState responseState = ADResponseState.loading();
  String? serviceAirport;
  String? serviceAirportCode;
  String? serviceAirportId;
  UpSellLink? upSellLink;
  SelectPackageData selectPackageData = SelectPackageData.name();
  bool isPorterAdding = false;
  String? travellerSelectedCountryCode;

  void setAnimationLoadingFalse() {
    isAnimationLoading = false;
  }

  void setInitialDataBookingForm() {
    // isAllDepartureFieldSelected();

    adLog('called first time');
    travellersController.text =
        '${travellers.adults + travellers.children + travellers.infants} Guest';
    guestsController.text =
        '${travellers.adults + travellers.children + travellers.infants} Guest';
    flightTimeTopSpacing.value = 0;
    dateOfJourneyModel = null;

    isTransitVisible = upSellLink?.serviceType == 'Transit';
    isGuestVisible = true;
    isRoundTripVisible = upSellLink?.serviceType == 'Round Trip' ||
        upSellLink?.serviceType == 'RoundTrip';

    final serviceId = getServiceType(upSellLink?.serviceType ?? 'Departure');
    selectedServiceModel = ServiceModel(
      serviceId: serviceId,
      serviceTitle: getServiceTitle(serviceId),
    );

    selectedTravelSectorModel = TravelSectorModel(
      travelSectorTitle: (upSellLink?.serviceType ?? 'Departure') == 'Transit'
          ? 'Domestic to Domestic '
          : 'Domestic',
      travelSectorId:
          (upSellLink?.serviceType ?? 'Departure') == 'Transit' ? id_6 : id_3,
    );

    selectedServiceId = selectedServiceModel?.serviceId.toString();
    selectedServiceController.text =
        selectedServiceModel?.serviceTitle as String;
    selectedServiceCheck.value = selectedServiceId ?? '';
    travelSectorList.clear();
    listTravelSector = getTravelSectorListData();
    travelSectorListCount = listTravelSector?.length ?? 0;

    if (selectedServiceModel?.serviceId == id_2) {
      for (int index = 0; index < travelSectorListCount; index++) {
        if (listTravelSector?[index].isTransit == true) {
          travelSectorList.add(
            listTravelSector?[index] ?? TravelSectorModel(),
          );
        }
      }
    } else {
      for (int index = 0; index < travelSectorListCount; index++) {
        if (listTravelSector?[index].isTransit == false) {
          travelSectorList.add(
            listTravelSector?[index] ?? TravelSectorModel(),
          );
        }
      }
    }
    selectedTravelSectorId =
        selectedTravelSectorModel?.travelSectorId.toString();
    selectedTravelSectorController.text =
        selectedTravelSectorModel?.travelSectorTitle as String;
    selectedDateOfTravelController.text = formatDateTime(
      dateTimeType: DateTime.now(),
      dateTimeFormat: dataTimeFormatDayMonth,
    );
    selectedDate = formatDateTime(
      dateTimeFormat: dataTimeFormatddMMyyyy,
      dateString: DateTime.now().toString(),
    );
    selectedOriginCityController.text = '';
    selectedDestinationCityController.text = '';
    fromCityCode = null;
    toCityCode = null;
    if (flightDetailModelList.isNotEmpty) {
      flightDetailModelList.clear();
    }

    selectedFlightController.clear();
    selectedTime = formatTime(DateTime.now().toString());
  }

  void scrollToHowItWorks() {
    howItWorksTap = !howItWorksTap;
    isNeedToScroll = true;
    notifyListeners();
  }

  AirportItemModel? getServiceAirport(BuildContext context) {
    if (upSellLink?.serviceAirport != null) {
      return context
          .read<SiteCoreStateManagement>()
          .adaniAirportsList
          .firstWhereOrNull(
            (element) => element.airportCode == upSellLink?.serviceAirport,
          );
    }
    return null;
  }

  Future<ADResponseState> addPackageToCart(
    Map<String, dynamic> requestJson,
    AppSessionState appSessionState,
  ) async {
    responseState = ADResponseState.loading();
    updateBookPackageClick(value: true);
    responseState = await cartRepository.addPackageToCart(requestJson);
    if (responseState.viewStatus == Status.complete) {
      PlaySound.playAudioSound('add_cart.mp3');
      final GetCartResponseModel addCartAddOnResponseModel = responseState.data;
      cartDataResponse = addCartAddOnResponseModel.cartResponse;
      appSessionState
          .updatePranaamCart(getAddonAddedByUserCount(cartDataResponse));
    }
    updateBookPackageClick(value: false);
    return responseState;
  }

  CartResponse? cartDataResponse;
  List<ServiceModel> servicesList = [];
  ServiceModel selectedService = ServiceModel(
    serviceId: id_1,
    serviceTitle: 'Departure',
  );

  List<TravelSectorModel> travelSectorList = [];

  AirportItemModel? selectedAirportData = selectedAirportsData;

  CountryMasterResponseModel countryMasterResponseModel =
      const CountryMasterResponseModel();

  bool isValidate = false;
  String bookingID = '';

  /// use only for pranaam confirmation
  CreateBookingRequestModel pranaamCreateBooking =
      const CreateBookingRequestModel();

  ///store selected flight
  ///final Map<String, int> selectedFlight = {'flightIndex': 0,};

  bool isSameCheckBox = false;
  bool isSameAdultCheckBox = false;

  ADResponseState flightListState = ADResponseState.loading();
  ADResponseState transitFlightListState = ADResponseState.loading();

  List<PranaamFlights> flightDetailModelList = [];
  List<PranaamFlights> transitFlightDetailModelList = [];
  List<Country> countryCodeDetailModelList = [];
  List<Country> countryListBackup = [];

  PranaamFlights selectedFlightDetailModel = const PranaamFlights(flightNo: '');

  ValueNotifier<String> selectedServiceCheck = ValueNotifier('');
  ValueNotifier<String> selectedCouponNotFound = ValueNotifier('');
  ValueNotifier<String> applyButtonEnableNotifier = ValueNotifier('');
  final TextEditingController applyCouponController = TextEditingController();
  ValueNotifier<String> couponTextChangedNotifier = ValueNotifier('');
  ServiceBookingModel serviceBookingData = ServiceBookingModel();

  ValueNotifier<bool> toucheEffectListener = ValueNotifier(false);

  String getCouponValue = '';
  bool isFieldFilled = true;
  bool isFormFilled = false;
  bool selectedPackageClick = false;

  bool isFromConfirmation = false;

  bool selectedAddOn = false;
  bool isUpgrading = false;
  ADResponseState packagesResponse = ADResponseState.loading();

  PackageDetail selectedPackageDetail = const PackageDetail();
  ADResponseState confirmationResponseState = ADResponseState.loading();
  CreateBookingResponseModel createBookingResponseModel =
      const CreateBookingResponseModel();

  void editForm({required bool value}) {
    isFormFilled = value;
    adLog('isFormFilled editForm $isFormFilled');
    notifyListeners();
  }

  void selectedAddOnService({required bool value}) {
    selectedAddOn = value;
    adLog('SelectedAddOn $selectedAddOn');
    notifyListeners();
  }

  void selectedPackageValue({required bool value}) {
    selectedPackageClick = value;
    notifyListeners();
  }

  void updateServiceBookingData(ServiceBookingModel serviceBookingModel) {
    serviceBookingData = serviceBookingModel;
    adLog('updateServiceBookingData ${serviceBookingData.toString()}');
    selectPackageData = SelectPackageData(
      serviceBookingData,
      servicesAvailability,
      packageMatches,
      packagesList,
      packageServicesList,
    );
    notifyListeners();
  }

  List<ServiceModel> getServiceListData() {
    return _pranaamAppDataRepository.getAllServicesData();
  }

  void updateSelectedAirport(
    AirportItemModel airportsData,
    SiteCoreStateManagement siteCoreStateManagement,
  ) {
    selectedAirportData = airportsData;
    final List<CityDetailModel> citiesList =
        siteCoreStateManagement.airportCityList;
    if (selectedService.serviceId == id_4 ||
        selectedService.serviceId == id_1) {
      fetchCityBySelectedAirport(citiesList, airportsData);
    }
    notifyListeners();
  }

  void fetchCityBySelectedAirport(
    List<CityDetailModel> citiesList,
    AirportItemModel airportsData,
  ) {
    for (final CityDetailModel cityDetail in citiesList) {
      if (cityDetail.cityName == airportsData.city) {
        adLog('updateSelectedAirport');
        //   updateToCityService(cityDetail);
      }
    }
  }

  Future<ADResponseState> createBooking(
    CreateBookingRequestModel createBooking,
  ) async {
    _updateProceedToPayClick(true);
    final ADResponseState responseState =
        await _travellerDetailsRepository.createBooking(createBooking.toJson());
    if (responseState.viewStatus == Status.complete &&
        responseState.data != null) {
      final CreateBookingResponseModel createBookingResponseModel =
          responseState.data;
      adLog('createBooking ${createBookingResponseModel.bookingId}');
      bookingID = createBookingResponseModel.bookingId.toString();
    }
    _updateProceedToPayClick(false);
    return responseState;
  }

  List<TravelSectorModel> getTravelSectorListData() {
    return _pranaamAppDataRepository.getAllTravelSectorData();
  }

  void buildSearchList(
    String userSearchTerm,
    List<PranaamFlights> flightDetailModelList1, {
    bool isTransit = false,
  }) {
    adLog('buildSearchList');
    if (isTransit) {
      transitFlightDetailModelList =
          _pranaamAppDataRepository.getFilteredFlightList(
        flightDetailModelList1,
        userSearchTerm,
      );
      if (transitFlightDetailModelList.isEmpty) {
        final GetFlightsResponseModel getFlightsResponseModel =
            transitFlightListState.data;
        transitFlightDetailModelList =
            getFlightsResponseModel.pranaamFlights ?? [];
      }
    } else {
      flightDetailModelList = _pranaamAppDataRepository.getFilteredFlightList(
        flightDetailModelList1,
        userSearchTerm,
      );

      if (flightDetailModelList.isEmpty) {
        final GetFlightsResponseModel getFlightsResponseModel =
            flightListState.data ?? const GetFlightsResponseModel();
        flightDetailModelList = getFlightsResponseModel.pranaamFlights ?? [];
      }
    }

    notifyListeners();
  }

  void buildSearchCountryList(
    String userSearchTerm,
    List<Country> countryList,
  ) {
    adLog('countryListSearch');
    countryCodeDetailModelList =
        _pranaamAppDataRepository.getFilteredCountryList(
      countryList,
      userSearchTerm,
    );
    notifyListeners();
  }

  Future<ADResponseState> getPackages(
    GetPackagesRequestModel getPackagesRequestModel,
  ) async {
    _updateDashBoardState(true);
    // packagesResponse =
    //     await _pranaamAppDataRepository.fetchPackages(getPackagesRequestModel);
    // adLog('message $packagesResponse');
    await Future.wait([
      _pranaamAppDataRepository.fetchPackages(getPackagesRequestModel),
      Future.delayed(const Duration(seconds: 2)),
    ]).then((value) {
      adLog('getPackages $value');
      packagesResponse = value.first;
      adLog('message ${packagesResponse.data}');
    });

    ///check if packages response  from sitecore is cached or not
    /// if cached no need to hit API
    // if (srpPackagesElement.componentName.isEmpty &&
    //     srpPackagesElement.fields.data.isEmpty) {
    //   final ADResponseState responseState =
    //       await fetchSRPPackagesFromSiteCore();
    //   adLog(
    //     'srpPackagesElement responseState status ${responseState.viewStatus}',
    //   );
    // }
    updatePackages();
    _updateDashBoardState(false);

    return packagesResponse;
  }

  void updatePackages() {
    // clear data before updating data
    if (packagesResponse.data == null) {
      return;
    }
    hashMapPackageSiteCoreResponse.clear();
    servicesAvailability.clear();
    packagesList.clear();
    final Data dataPackageResponse = packagesResponse.data;
    packagesList = dataPackageResponse.packageDetails;
    adLog('dataPackageResponse $packagesList');

    final List<PackageData> data = srpPackagesElement.fields.data;
    packageMatches = apiPackagesMatchesWithSiteCore(data, packagesList);
    List<bool> packageIds = [];
    for (final PackageData datum in data) {
      if (packagesList
          .where(
            (package) {
              return package.packageId.toString() == datum.packageId;
            },
          )
          .toList()
          .isNotEmpty) {
        final List<ServicesList> servicesList = datum.servicesList;
        for (final ServicesList services in servicesList) {
          if (services.name.isNotEmpty) {
            packageIds = hashMapPackageSiteCoreResponse
                    .containsKey(services.name)
                ? hashMapPackageSiteCoreResponse[services.name] ?? []
                : []
              ..add(services.value);

            hashMapPackageSiteCoreResponse[services.name] = packageIds;
          }
        }
      }
    }

    if (hashMapPackageSiteCoreResponse.isNotEmpty) {
      servicesAvailability = hashMapPackageSiteCoreResponse.values.toList();
      packageServicesList = hashMapPackageSiteCoreResponse.keys.toList();
    }

    selectPackageData = SelectPackageData(
      serviceBookingData,
      servicesAvailability,
      packageMatches,
      packagesList,
      packageServicesList,
    );

    notifyListeners();
  }

  void _updateDashBoardState(bool value) {
    isLoginClicked = value;
    notifyListeners();
  }

  void _updateCartClickProceedState(bool value) {
    isCartProceedClick = value;
    notifyListeners();
  }

  void updateApplyCouponState({required bool value}) {
    isApplyCouponClick = value;
    notifyListeners();
  }

  void updateRemoveCouponState({required bool value}) {
    isRemoveCouponClick = value;
    notifyListeners();
  }

  void _updateProceedToPayClick(bool value) {
    isProceedToPayClick = value;
    notifyListeners();
  }

  void updateBookPackageClick({required bool value}) {
    isBookPackageClicked = value;
    selectedPackageValue(value: false);
    notifyListeners();
  }

  void updateapplyListClick({required bool value}) {
    isApplyCouponListClick = value;
    //selectedPackageValue(value: false);
    notifyListeners();
  }

  Future<void> getFlights(
    Map<String, dynamic> flightRequestModel, [
    int id_1 = 0,
  ]) async {
    selectedFlightDetailModel = const PranaamFlights();
    if (id_1 == 1 || id_1 == id_4) {
      flightListState.viewStatus = Status.loading;
      final ADResponseState adResponseState =
          await _pranaamAppDataRepository.getFlights(flightRequestModel);
      flightListState = adResponseState;
      if (flightListState.data != null) {
        final GetFlightsResponseModel getFlightsResponseModel =
            flightListState.data;
        if (flightDetailModelList.isNotEmpty) {
          flightDetailModelList.clear();
        }
        flightDetailModelList = getFlightsResponseModel.pranaamFlights ?? [];
        adLog('Arrival Depature Get Flights');
      }
    } else {
      transitFlightListState.viewStatus = Status.loading;
      final ADResponseState adResponseState =
          await _pranaamAppDataRepository.getFlights(flightRequestModel);
      transitFlightListState = adResponseState;
      if (transitFlightListState.data != null) {
        GetFlightsResponseModel getFlightsResponseModel =
            transitFlightListState.data;
        if (transitFlightDetailModelList.isNotEmpty) {
          transitFlightDetailModelList.clear();
        }
        //filter round trip flights
        if (id_1 == roundTripServiceId) {
          const int serviceHoursDiffrence = 2;
          final filteredList =
              getFlightsResponseModel.pranaamFlights?.where((element) {
            try {
              if (DateFormat('yyyy-MM-dd hh:mm:ss')
                      .parse(element.serviceDateTime)
                      .difference(
                        DateFormat('yyyy-MM-dd hh:mm:ss')
                            .parse(pranaamADFlights?.serviceDateTime ?? ''),
                      )
                      .inHours >
                  serviceHoursDiffrence) {
                return true;
              }
            } catch (e) {
              return false;
            }
            return false;
          }).toList();
          getFlightsResponseModel =
              getFlightsResponseModel.copyWith(pranaamFlights: filteredList);
          transitFlightListState.data = getFlightsResponseModel;
        }
        transitFlightDetailModelList =
            getFlightsResponseModel.pranaamFlights ?? [];
        adLog(' transit roundtrip Get Flights');
      }
    }

    notifyListeners();
  }

  Future<ADResponseState> cartAddOnItem(
    Map<String, dynamic> requestJson,
    AppSessionState appSessionState,
  ) async {
    // responseState = ADResponseState.loading();
    isPorterAdding = true;
    notifyListeners();
    responseState = await cartRepository.addPackageAddOnToCart(requestJson);
    if (responseState.viewStatus == Status.complete) {
      final GetCartResponseModel addCartAddOnResponseModel = responseState.data;
      cartDataResponse = addCartAddOnResponseModel.cartResponse;
      appSessionState
          .updatePranaamCart(getAddonAddedByUserCount(cartDataResponse));

    }
    isPorterAdding = false;
    notifyListeners();
    return responseState;
  }

  void updateCartDataResponse(ADResponseState adResponseState) {
    responseState = adResponseState;
    if (responseState.viewStatus == Status.complete) {
      final GetCartResponseModel addCartItemResponseModel = responseState.data;
      adLog(
        'validateCoupon AddCartItemResponseModel'
        ' cartResponse :${addCartItemResponseModel.cartResponse}',
        className: this,
      );
      cartDataResponse = addCartItemResponseModel.cartResponse;
    }

    notifyListeners();
  }

  Future<void> validateCoupon(
    Map<String, dynamic> requestJson,
  ) async {
    responseState = ADResponseState.loading();

    notifyListeners();
    responseState = await cartRepository.validateCoupon(requestJson);
    adLog(
      'validateCoupon responseState : $responseState',
      className: this,
    );
    if (responseState.viewStatus == Status.complete) {
      final GetCartResponseModel addCartItemResponseModel = responseState.data;
      adLog(
        'validateCoupon AddCartItemResponseModel'
        ' cartResponse :${addCartItemResponseModel.cartResponse}',
        className: this,
      );
      cartDataResponse = addCartItemResponseModel.cartResponse;
    }
    notifyListeners();
  }

  Future<ADResponseState> removeCoupon(
    Map<String, dynamic> requestJson, {
    bool isShowProgress = false,
  }) async {
    if (isShowProgress) {
      notifyListeners();
    }
    responseState = await cartRepository.removeCoupon(requestJson);
    adLog(
      'removeCoupon responseState : $responseState',
      className: this,
    );
    if (responseState.viewStatus == Status.complete) {
      final GetCartResponseModel addCartItemResponseModel = responseState.data;
      adLog(
        'removeCoupon AddCartItemResponseModel'
        ' cartResponse :${addCartItemResponseModel.cartResponse}',
        className: this,
      );
      cartDataResponse = addCartItemResponseModel.cartResponse;
    }
    if (isShowProgress) {
      notifyListeners();
    }
    return responseState;
  }

  void resetCartData() {
    cartDataResponse = null;
    notifyListeners();
  }

  Future<ADResponseState> callDeleteCart({
    required AppSessionState appSessionState,
  }) async {
    //responseState = ADResponseState.loading();
    //notifyListeners();
    updateBookPackageClick(value: true);
    await cartRepository.deleteCart().then((value) {
      responseState = value;
      if (responseState.viewStatus == Status.complete) {
        cartDataResponse = null;
        appSessionState.updatePranaamCart(0);
      }

      updateBookPackageClick(value: false);
      selectedPackageValue(value: false);
    });
    return responseState;
  }

  Future<ADResponseState> getUserCart(
    AppSessionState appSessionState,
    String oldUserAgentId, {
    bool guestLogIn = false,
    bool isFromContinue = false,
  }) async {
    ADResponseState adResponseState = ADResponseState.loading();
    if (!isFromContinue) {
      notifyListeners();
      responseState = await _initGetCartApi(
        responseState,
        oldUserAgentId,
        guestLogIn,
        appSessionState,
      );
      notifyListeners();
      return responseState;
    } else {
      // means we need to show progress dot on continue button
      _updateCartClickProceedState(true);
      adResponseState = await _initGetCartApi(
        adResponseState,
        oldUserAgentId,
        guestLogIn,
        appSessionState,
      );
      _updateCartClickProceedState(false);
      return adResponseState;
    }
  }

  Future<ADResponseState> _initGetCartApi(
    ADResponseState adResponseState,
    String oldUserAgentId,
    bool guestLogIn,
    AppSessionState appSessionState,
  ) async {
    adResponseState = await cartRepository.fetchCartDetails(
      oldUserAgentId: oldUserAgentId,
      isGuestLogin: guestLogIn,
    );
    if (adResponseState.viewStatus == Status.complete &&
        adResponseState.data != null) {
      final GetCartResponseModel getCartResponseModel = adResponseState.data;
      cartDataResponse = getCartResponseModel.cartResponse;
      appSessionState
          .updatePranaamCart(getAddonAddedByUserCount(cartDataResponse));
    }
    return adResponseState;
  }

  void updateIsTransitVisible({required bool value}) {
    isTransitVisible = value;
    notifyListeners();
  }

  void updateIsRoundTripVisible({required bool value}) {
    isRoundTripVisible = value;
    notifyListeners();
  }

  void updateIsGuestVisible({required bool value}) {
    isGuestVisible = value;
    notifyListeners();
  }

  Future<ADResponseState> fetchSRPPackagesFromSiteCore() async {
    final Map<String, String> queryParams = {
      'item': SiteCoreApiUrls.pranaamSRPPackages,
      'sc_lang': 'en',
      'sc_apikey': SiteCoreApiUrls.siteCoreApiKey,
      'isApp': 'true',
    };
    final ADResponseState responseState =
        await _siteCoreRepository.fetchSRPPackages(
      queryParams,
    );
    if (responseState.viewStatus == Status.complete) {
      _updateSRPPackages(responseState);
    }
    return responseState;
  }

  void _updateSRPPackages(ADResponseState response) {
    if (response.viewStatus == Status.complete) {
      srpPackagesElement = response.data;
    } else {
      fetchPranaamPackageServices();
    }

    _updateDashBoardState(false);
  }

  Future<void> fetchPranaamPackageServices() async {
    final jsonString =
        await rootBundle.loadString(JsonAssets.siteCorePranaamPackageServices);
    final parsed = json.decode(jsonString);
    final PackageSiteCoreResponse packageSiteCoreResponse =
        PackageSiteCoreResponse.fromJson(parsed);
    adLog('packageSiteCoreResponse ${packageSiteCoreResponse.toString()}');
    if (packageSiteCoreResponse.elements.isNotEmpty) {
      srpPackagesElement = packageSiteCoreResponse.elements.first;
    }
  }

  void updateIsFromConfirmation({required bool value}) {
    isFromConfirmation = value;
    notifyListeners();
  }

  void cancelIconClick() {
    toucheEffectListener.value = false;
    couponTextChangedNotifier.value = '';
    applyCouponController.clear();
    selectedCouponNotFound.value = '';
    applyButtonEnableNotifier.value = '';
  }
}
