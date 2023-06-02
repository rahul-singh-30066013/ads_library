/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/catalog/views/ad_duty_free_product.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/city_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/add_cart_item/add_cart_item_request_model/add_cart_item_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/trip_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/request_model/get_flights_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/pranaam_flights.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/service_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/travel_sector_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/repository/pranaam_app_data_repository/pranaam_app_data_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/cart_screen_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/package_service/horizontally_scrollable_column.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/ga_analytics/stand_alone_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/ga_analytics/stand_alone_ga_name.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/models/request/package_detail/package_detail_request.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/models/response/package_detail_response.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/repository/packages/package_repository.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/flight_service_time_column.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_state_management.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/utils/date_time_helper.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/utils/stand_alone_service_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StandAloneServiceBookingStateManagement extends BaseViewModel {
  StandAloneServiceBookingStateManagement(this.standAloneStateManagement);

  final PackageRepository _packageRepository = PackageRepository();
  PackageDetailResponse? packageDetailResponseModel;
  ADResponseState getPackageDetailsState = ADResponseState.init();

  StandAloneStateManagement standAloneStateManagement;
  ServiceModel selectedService =
      ServiceModel(serviceId: 1, serviceTitle: 'Departure');
  TravelSectorModel? selectedTravelSector = TravelSectorModel(
    travelSectorId: 3,
    travelSectorTitle: 'Domestic',
  );
  DateTime? selectedArrivalDepartureDate = DateTime.now();
  DateTime? selectedRoundTripDate =
      DateTime.now().copyWith(day: DateTime.now().day + 1);
  int? porterCount;
  final ValueNotifier<String>? originAirportErrorMsg =
      ValueNotifier<String>('');
  final ValueNotifier<String>? roundTripOriginAirportErrorMsg =
      ValueNotifier<String>('');
  final ValueNotifier<String>? destinationAirportErrorMsg =
      ValueNotifier<String>('');
  final ValueNotifier<String>? porterErrorMsg = ValueNotifier<String>('');
  CityDetailModel? selectedOrigin;
  CityDetailModel? selectedRoundTripOrigin;
  CityDetailModel? selectedDestination;

  PranaamFlights? selectedArrivalDepartureFlight;

  PranaamFlights? selectedRoundTripFlight;

  final arrivalDepartureFlightResponse = ValueNotifier(ADResponseState.init());
  final roundTripFlightResponse = ValueNotifier(ADResponseState.init());

  final ValueNotifier<String>? arrivalDepartureFlightErrorMsg =
      ValueNotifier<String>('');
  final ValueNotifier<String>? roundTripFlightErrorMsg =
      ValueNotifier<String>('');
  bool showBuggyLoader = false;

  Future<void> _triggerArrivalDepartureFlightApi() async {
    if (!validateArrivalDepartureFlight()) {
      return;
    }
    arrivalDepartureFlightResponse
      ..value = ADResponseState.loading()
      ..value = await PranaamAppDataRepository().getFlights(
        _createFlightRequestModel(
          selectedService.serviceId == roundTripServiceId
              ? departureServiceId
              : selectedService.serviceId,
        ),
      );
  }

  Future<void> _triggerRoundTripFlightApi() async {
    if (!validateRoundTripFlight()) {
      return;
    }
    roundTripFlightResponse
      ..value = ADResponseState.loading()
      ..value = await PranaamAppDataRepository().getFlights(
        _createFlightRequestModel(selectedService.serviceId),
      );
  }

  bool validateArrivalDepartureFlight() {
    if (selectedOrigin == null) {
      return false;
    }
    if (selectedDestination == null) {
      return false;
    }
    return true;
  }

  bool validateRoundTripFlight() {
    if (selectedRoundTripOrigin == null) {
      return false;
    }
    if (selectedDestination == null) {
      return false;
    }
    return true;
  }

  Map<String, dynamic> _createFlightRequestModel(int id) {
    final GetFlightsRequestModel getFlightsRequestModel;

    switch (id) {
      case departureServiceId:
        getFlightsRequestModel = GetFlightsRequestModel(
          serviceType: selectedService.serviceId.toString(),
          originAirport: selectedOrigin?.cityCode ?? '',
          destinationAirport: selectedDestination?.cityCode ?? '',
          serviceAirport:
              getServiceAirport(departureServiceId)?.airportCode ?? '',
          serviceDate: formatDateTime(
            dateTimeType: selectedArrivalDepartureDate,
            dateTimeFormat: dataTimeFormatddMMyyyy,
          ),
          tripType: '',
          trip: '1',
          travelSectorType: selectedTravelSector?.travelSectorId,
        );
        break;
      case arrivalTripServiceId:
        getFlightsRequestModel = GetFlightsRequestModel(
          serviceType: selectedService.serviceId.toString(),
          originAirport: selectedOrigin?.cityCode ?? '',
          destinationAirport: selectedDestination?.cityCode ?? '',
          serviceAirport:
              getServiceAirport(arrivalTripServiceId)?.airportCode ?? '',
          serviceDate: formatDateTime(
            dateTimeType: selectedArrivalDepartureDate,
            dateTimeFormat: dataTimeFormatddMMyyyy,
          ),
          tripType: '',
          trip: '1',
          travelSectorType: selectedTravelSector?.travelSectorId,
        );
        break;
      case roundTripServiceId:
        getFlightsRequestModel = GetFlightsRequestModel(
          serviceType: selectedService.serviceId.toString(),
          originAirport: selectedRoundTripOrigin?.cityCode ?? '',
          destinationAirport: selectedOrigin?.cityCode ?? '',
          serviceAirport:
              getServiceAirport(roundTripServiceId)?.airportCode ?? '',
          serviceDate: formatDateTime(
            dateTimeType: selectedRoundTripDate,
            dateTimeFormat: dataTimeFormatddMMyyyy,
          ),
          tripType: '',
          trip: '2',
          travelSectorType: selectedTravelSector?.travelSectorId,
        );
        break;
      default:
        getFlightsRequestModel = GetFlightsRequestModel(
          serviceType: selectedService.serviceId.toString(),
          originAirport: selectedOrigin?.cityCode ?? '',
          destinationAirport: selectedDestination?.cityCode ?? '',
          serviceAirport:
              getServiceAirport(arrivalTripServiceId)?.airportCode ?? '',
          serviceDate: formatDateTime(
            dateTimeType: selectedArrivalDepartureDate,
            dateTimeFormat: dataTimeFormatddMMyyyy,
          ),
          tripType: '',
          trip: '1',
          travelSectorType: selectedTravelSector?.travelSectorId,
        );
    }
    return getFlightsRequestModel.toJson();
  }

  CityDetailModel? getServiceAirport(int serviceId) {
    switch (serviceId) {
      case arrivalTripServiceId:
        return selectedDestination;
      case departureServiceId:
        return selectedOrigin;
      case roundTripServiceId:
        return selectedOrigin;
      default:
        return null;
    }
  }

  bool _isOriginAndDestinationAirportIsSame() {
    if (selectedService.serviceId == departureServiceId ||
        selectedService.serviceId == arrivalTripServiceId) {
      return selectedOrigin?.cityCode == selectedDestination?.cityCode;
    } else if (selectedService.serviceId == roundTripServiceId) {
      return selectedOrigin?.cityCode == selectedDestination?.cityCode ||
          selectedOrigin?.cityCode == selectedRoundTripOrigin?.cityCode;
    }
    return false;
  }

  void handleArrivalDepartureFlightTap(PranaamFlights pranaamFlights) {
    selectedArrivalDepartureFlight = pranaamFlights;
    arrivalDepartureFlightErrorMsg?.value = '';
    notifyListeners();
  }

  void handleRoundTripFlightTap(PranaamFlights pranaamFlights) {
    selectedRoundTripFlight = pranaamFlights;
    roundTripFlightErrorMsg?.value = '';
    notifyListeners();
  }

  void handleTravelSectorTap(TravelSectorModel travelSector) {
    selectedTravelSector = travelSector;
    selectedOrigin = null;
    selectedDestination = null;
    resetFields();
    _resetErrorMsg();
    adLog(travelSector.toString());
    notifyListeners();
  }

  void handleServiceTypeTap(ServiceModel serviceModel) {
    selectedService = serviceModel;
    adLog(serviceModel.toString());
    resetFields();
    _resetErrorMsg();
    notifyListeners();
  }

  void handleOriginAirportTap(CityDetailModel cityModel, BuildContext context) {
    selectedOrigin = cityModel;
    if (_isOriginAndDestinationAirportIsSame()) {
      selectedOrigin = null;
      _showToastMessage(context);
    } else {
      originAirportErrorMsg?.value = '';
      _triggerArrivalDepartureFlightApi();
      adLog(cityModel.toString());
    }
    selectedArrivalDepartureFlight = null;
    notifyListeners();
  }

  void _showToastMessage(BuildContext context) {
    SnackBarUtil.showSnackBar(
      context,
      'Departure and arrival cities can’t be the same',
    );
  }

  void handleRoundTripOriginAirportTap(
    CityDetailModel cityModel,
    BuildContext context,
  ) {
    selectedRoundTripOrigin = cityModel;
    if (_isOriginAndDestinationAirportIsSame()) {
      selectedRoundTripOrigin = null;
      _showToastMessage(context);
    } else {
      roundTripOriginAirportErrorMsg?.value = '';
      _triggerRoundTripFlightApi();
      adLog(cityModel.toString());
    }
    selectedRoundTripFlight = null;
    notifyListeners();
  }

  void handleDestinationAirportTap(
    CityDetailModel cityModel,
    BuildContext context,
  ) {
    selectedDestination = cityModel;
    if (_isOriginAndDestinationAirportIsSame()) {
      selectedDestination = null;
      _showToastMessage(context);
    } else {
      destinationAirportErrorMsg?.value = '';
      _triggerArrivalDepartureFlightApi();
      adLog(cityModel.toString());
    }
    selectedArrivalDepartureFlight = null;
    notifyListeners();
  }

  void handleArrivalDepartureDateSelect(DateTime newDate) {
    selectedArrivalDepartureDate = newDate;
    selectedRoundTripDate = newDate.copyWith(day: newDate.day + 1);
    selectedArrivalDepartureFlight = null;
    _triggerArrivalDepartureFlightApi();
    if (selectedService.serviceId == roundTripServiceId) {
      _triggerRoundTripFlightApi();
    }
    adLog('newDate $newDate');
    notifyListeners();
  }

  void handleRoundTripDateSelect(DateTime newDate) {
    selectedRoundTripDate = newDate;
    selectedRoundTripFlight = null;
    _triggerRoundTripFlightApi();
    adLog('newDate $newDate');
    notifyListeners();
  }

  void update(StandAloneStateManagement _standAloneStateManagement) {
    standAloneStateManagement = _standAloneStateManagement;
    adLog('new Instance of $standAloneStateManagement');
  }

  void handlePorterSelect(int porters) {
    porterCount = porters;
    porterErrorMsg?.value = '';
    adLog('porterCount $porters');
  }

  void resetFields() {
    selectedOrigin = null;
    selectedDestination = null;
    selectedArrivalDepartureFlight = null;
    selectedRoundTripFlight = null;
    selectedRoundTripOrigin = null;
    porterCount = 1;
    showBuggyLoader = false;
    selectedArrivalDepartureDate = DateTime.now();
    selectedRoundTripDate =
        selectedArrivalDepartureDate?.copyWith(day: DateTime.now().day + 1);
    // selectedRoundTripDate = null;
    // selectedArrivalDepartureDate = null;
  }

  void setIntialValues() {
    selectedService = ServiceModel(serviceId: 1, serviceTitle: 'Departure');
    selectedTravelSector = TravelSectorModel(
      travelSectorId: domesticTravelSectorId,
      travelSectorTitle: 'Domestic',
    );
    resetFields();
  }

  // this api is used to get standalone packages
  Future<ADResponseState> getPackagesDetails(
    PackageDetailRequest packageDetailsRequestModel,
    BuildContext context,
  ) async {
    getPackageDetailsState = ADResponseState.loading();
    notifyListeners();
    adLog('stand alone packages called');
    final ADResponseState response =
        await _packageRepository.getStandAlonePackages(
      standAloneStateManagement.getApiModel().getStandAlonPackagesApi.path,
      packageDetailsRequestModel.toJson(),
    );
    getPackageDetailsState = response;
    if (response.viewStatus == Status.complete) {
      packageDetailResponseModel = getPackageDetailsState.data;
    }
    // await GetCartOnUserBasis().clearActiveCart(context);
    // context.read<PranaamAppDataStateManagement>().resetCartData();
    await context.read<AppSessionState>().getActiveGeneralCartWithFuture();
    notifyListeners();
    return response;
  }

  // this api is used to get standalone packages
  Future<ADResponseState> addCartApi(
    AddCartItemRequestModel addCartItemRequestModel,
  ) async {
    showBuggyLoader = true;
    notifyListeners();
    adLog('add cart api called');
    try {
      final ADResponseState response = await _packageRepository.addCartDetails(
        standAloneStateManagement.getApiModel().addCartApi.path,
        addCartItemRequestModel.toJson(),
      );
      getPackageDetailsState = response;
      if (response.viewStatus == Status.complete) {
        packageDetailResponseModel = getPackageDetailsState.data;
      }
      notifyListeners();
      return response;
    } on Exception catch (e) {
      showBuggyLoader = false;
      notifyListeners();
      return ADResponseState.error(e.toString());
    }
  }

  bool validateBookingForm(BuildContext context) {
    bool result = true;
    if (selectedOrigin == null) {
      originAirportErrorMsg?.value = 'select_origin'.localize(context);
      result = false;
    }
    if (selectedDestination == null) {
      destinationAirportErrorMsg?.value =
          'select_destination'.localize(context);
      result = false;
    }
    if (selectedService.serviceId == roundTripServiceId &&
        selectedRoundTripOrigin == null) {
      roundTripOriginAirportErrorMsg?.value = 'select_origin'.localize(context);
      result = false;
    }
    if (porterCount == null) {
      porterErrorMsg?.value = 'select_porter'.localize(context);
      result = false;
    }

    if (selectedArrivalDepartureFlight == null) {
      arrivalDepartureFlightErrorMsg?.value =
          'select_flights'.localize(context);
      result = false;
    }

    if (selectedService.serviceId == roundTripServiceId &&
        selectedRoundTripFlight == null) {
      roundTripFlightErrorMsg?.value = 'select_flights'.localize(context);
      result = false;
    }
    return result;
  }

  void _resetErrorMsg() {
    originAirportErrorMsg?.value = '';
    destinationAirportErrorMsg?.value = '';
    roundTripOriginAirportErrorMsg?.value = '';
    arrivalDepartureFlightErrorMsg?.value = '';
    roundTripFlightErrorMsg?.value = '';
    porterErrorMsg?.value = '';
  }

  AddCartItemRequestModel getAddCartItemRequest(
    StandaloneProductDetails standAloneProduct,
  ) {
    return AddCartItemRequestModel(
      serviceTypeId: selectedService.serviceId,
      serviceType: selectedService.serviceTitle,
      travelSectorId:
          selectedTravelSector?.travelSectorId ?? domesticTravelSectorId,
      travelSector: selectedTravelSector?.travelSectorTitle ?? '',
      cartNumber: '0',
      childCount: 0,
      adultCount: 0,
      infantCount: 0,
      createdBy: '',
      standaloneProductDetails: standAloneProduct,
      pranaamBookingType: 'StandalonePorterBooking',
      tripDetail: TripDetail(
        tripId: 0,
        tripBookingNumber: 'string',
        originAirportId: int.tryParse(selectedOrigin?.airportID ?? '') ?? 0,
        originAirport: selectedOrigin?.cityCode ?? '',
        destinationAirportId:
            int.tryParse(selectedDestination?.airportID ?? '') ?? 0,
        destinationAirport: selectedDestination?.cityCode ?? '',
        serviceAirportId: int.tryParse(
              getServiceAirport(selectedService.serviceId)?.airportID ?? '',
            ) ??
            0,
        // int.parse(
        //   _pranaamAppDataStateManagement?.serviceAirportId ?? '0',
        // ),
        businessUnitId: businessUnitId,
        serviceDateTime: selectedArrivalDepartureFlight?.serviceDateTime ?? '',
        flightName: selectedArrivalDepartureFlight?.flightFinalNumber ?? '',
        flightNumber: selectedArrivalDepartureFlight?.flightNo ?? '',
        flightTerminal: selectedArrivalDepartureFlight?.flightTerminal ?? '',
        flightDate: selectedArrivalDepartureFlight?.flightDate ?? '',
        flightTime: selectedArrivalDepartureFlight?.flightTime ?? '',
        transitDestRoundTripSecOrigin: int.tryParse(
          getServiceAirport(selectedService.serviceId)?.airportID ?? '',
        )??0,
        transitRoundTripSecFlightName:
            selectedRoundTripFlight?.flightFinalNumber ?? '',
        transitRoundTripSecFlightNumber: int.tryParse(
          selectedRoundTripFlight?.flightNo ?? '',
        )??0,
        transitRoundTripSecFlightTerminal:
            selectedRoundTripFlight?.flightTerminal ?? '',
        transitRoundTripSecFlightDate: selectedRoundTripFlight?.flightDate ??'',
        transitRoundTripSecFlightTime: selectedRoundTripFlight?.flightTime ?? '',
        roundTripSecServiceDateTime:
            selectedRoundTripFlight?.serviceDateTime ?? '',
        serviceAirport:
            getServiceAirport(selectedService.serviceId)?.airportCode ?? '',
        travelSector: selectedTravelSector?.travelSectorTitle ?? 'Departure',
        serviceAirportName:
            getServiceAirport(selectedService.serviceId)?.cityName ?? '',
      ),
    );
  }

  void getPackagesDetailApi(BuildContext context) {
    final CustomTabScaffold customTabScaffold =
        BottomBarState.key.currentWidget as CustomTabScaffold;
    customTabScaffold.heightNotifier.value = 0;
    getPackagesDetails(
      PackageDetailRequest(
        travelSectorId: selectedTravelSector?.travelSectorId ?? 0,
        serviceTypeId: selectedService.serviceId,
        serviceAirport:
            getServiceAirport(selectedService.serviceId)?.cityCode ?? '',
        itemCount: porterCount ?? 0,
        standaloneProductType: standAloneStateManagement.currentServiceType ==
                StandAloneServiceType.porter
            ? 1
            : k_2,
      ),
      context,
    ).then((value) {
      _handleGetPackagesDetailResponse(value, context);
    });
  }

  void _handleGetPackagesDetailResponse(
    ADResponseState response,
    BuildContext context,
  ) {
    final Status? responseStatus = response.viewStatus;
    switch (responseStatus) {
      case Status.none:
        break;
      case Status.loading:
        break;
      case Status.complete:
        final PackageDetailResponse packageDetailResponse = response.data;
        if (packageDetailResponse.standAloneProducts.isNotEmpty) {
          final standAloneObj = packageDetailResponse.standAloneProducts.first;
          final standAloneRequest = StandaloneProductDetails(
            itemCount: standAloneObj.count ?? 0,
            id: standAloneObj.id ?? 0,
            description: standAloneObj.description ?? '',
            name: standAloneObj.name ?? '',
            pricingInfo: standAloneObj.pricingInfo,
          );
          final addCartRequest = getAddCartItemRequest(standAloneRequest);
          // checkCart(callback)
          final CartScreenController _cartController = CartScreenController();
          _cartController.callCartPackageOnBasisOfCartExists(
            context,
            dutyFreeYesCallBack: (BuildContext dialogContext) => {
              showBuggyLoader = true,
              StandAloneGaAnalytics().bookNowEvent(
                context,
                StandAloneGaName(context).popUpDisplayName(),
              ),
              notifyListeners(),
              _cartController.clearDutyFreeCartAndAddPackage(
                context: context,
                dialogContext: dialogContext,
                addToCartFunction: () => addCartApi(addCartRequest).then(
                  (value) => _handleAddCartResponse(value, context),
                ),
              ),
            },
            pranaamYesCallBack: (BuildContext dialogContext) => {
              showBuggyLoader = true,
              notifyListeners(),
              StandAloneGaAnalytics().bookNowEvent(
                context,
                StandAloneGaName(context).popUpDisplayName(),
              ),
              _cartController.clearPranaamCartAndAddPackage(
                errorFunction: () => {
                  showBuggyLoader = false,
                  notifyListeners(),
                },
                context: context,
                dialogContext: dialogContext,
                addToCartFunction: () => addCartApi(addCartRequest).then(
                  (value) => _handleAddCartResponse(value, context),
                ),
              ),
            },
            addToCartFunction: () => addCartApi(addCartRequest).then(
              (value) => _handleAddCartResponse(value, context),
            ),
          );
        }
        // addCartApi(addCartRequest).then((value) => _handleAddCartResponse(value));
        break;
      case Status.error:
        StandAloneGaAnalytics().bookNowEvent(
          context,
          StandAloneGaName(context).bookServiceUnavailableName(),
        );
        SnackBarUtil.showSnackBar(
          context,
          response.message ?? 'Something went wrong',
        );
        break;
      default:
        break;
    }
  }

  void _handleAddCartResponse(ADResponseState response, BuildContext context) {
    final Status? responseStatus = response.viewStatus;
    switch (responseStatus) {
      case Status.none:
        break;
      case Status.loading:
        showBuggyLoader = true;
        notifyListeners();
        break;
      case Status.complete:
        adLog('Cart added');
        context.read<AppSessionState>().saveCart(CartType.pranaam.name);
        Navigator.of(context, rootNavigator: true)
            .pushNamed(genericCartScreen)
            .then((value) {
          showBuggyLoader = false;
          notifyListeners();
        });
        break;
      case Status.error:
        showBuggyLoader = false;
        notifyListeners();
        SnackBarUtil.showSnackBar(
          context,
          response.message ?? 'Something went wrong',
        );
        break;
      default:
        break;
    }
  }

  FlightServiceWidgetDetails? getFlightServiceWidgetDetails() {
    switch (selectedService.serviceId) {
      case arrivalTripServiceId:
        if (selectedArrivalDepartureFlight != null) {
          return FlightServiceWidgetDetails(
            firstText: 'Arrival Time',
            firstTimeText: reviewArrivalTime(
              '${selectedArrivalDepartureFlight?.flightTime}:00',
            ),
            secondText: 'Service Time',
            secondTimeText: reviewArrivalTime(
              '${selectedArrivalDepartureFlight?.serviceTime}:00',
            ),
          );
        }
        return null;
      case departureServiceId:
        if (selectedArrivalDepartureFlight != null) {
          return FlightServiceWidgetDetails(
            firstText: 'Departure Time',
            firstTimeText: reviewArrivalTime(
              '${selectedArrivalDepartureFlight?.flightTime}:00',
            ),
            secondText: 'Service Time',
            secondTimeText: reviewArrivalTime(
              '${selectedArrivalDepartureFlight?.serviceTime}:00',
            ),
          );
        }
        return null;
      case roundTripServiceId:
        if (selectedArrivalDepartureFlight != null &&
            selectedRoundTripFlight != null) {
          return FlightServiceWidgetDetails(
            firstText: 'Departure Service Time',
            firstTimeText: reviewArrivalTime(
              '${selectedArrivalDepartureFlight?.serviceTime}:00',
            ),
            secondText: 'Arrival Service Time',
            secondTimeText: reviewArrivalTime(
              '${selectedRoundTripFlight?.serviceTime}:00',
            ),
          );
        }
        return null;
      default:
        return null;
    }
  }
}
