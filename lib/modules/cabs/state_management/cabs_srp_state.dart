/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/helping_models/cab_srp_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/request_models/create_cart_request_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/request_models/search_cab_request_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/search_cab_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cabs_booking_repository.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/constants/cab_constants.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_constant_remote.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

bool isCabScheduleDateTimeNeedsToUpdate = false;

class CabsSrpState extends BaseViewModel {
  final CabsBookingRepository cabsBookingRepository = CabsBookingRepository();
  final snackBarDuration = 3000;
  final oneThousand = 1000;

  ///It will contains cab itineraries data, airport pickUp Data and destination data model
  CabSrpNavigateModel? cabSrpNavigateModel;
  int? cabAvailableForLaterTime;
  bool? isCabAvailableForLater;
  int? selectedTripTime;
  String? cabLoyaltyPercentage;
  String? currencyCode;

  bool isShowCabs = false;
  List<CabItineraries> cabItineraries = [];

  ///It will update cabListingState
  ADResponseState _cabListingState = ADResponseState.init();

  ADResponseState get cabListingState => _cabListingState;

  void updateCabItinerariesState(ADResponseState response) {
    selectedCabItinerary = null;
    selectedProviderInfo = null;
    instantBooking = null;

    _cabListingState = response;
    if (response.viewStatus == Status.complete) {
      cabItineraries =
          (response.data as SearchCabResponseModel).cabItineraries ?? [];
      cabAvailableForLaterTime =
          (response.data as SearchCabResponseModel).isCabAvailableLaterTime;
      isCabAvailableForLater =
          (response.data as SearchCabResponseModel).isCabAvailableLater;
      cabLoyaltyPercentage =
          (response.data as SearchCabResponseModel).cabLoyaltyPercentage;
      currencyCode = (response.data as SearchCabResponseModel).currencyCode;
      selectedTripTime = selectedDate != null
          ? ((selectedDate?.millisecondsSinceEpoch ?? 0) / oneThousand).round()
          : ((DateTime.now().millisecondsSinceEpoch) / oneThousand).round();
      isShowCabs = !(isCabAvailableForLater ?? false);
      CabGoogleAnalytics().sendGAParametersViewCart(
        this,
      );
      if (cabItineraries.isNotEmpty) {
        if ((cabItineraries.first.cabItinerary ?? []).isNotEmpty &&
            isShowCabs) {
          updateCabSelectionWith(
            cabItineraries.first.cabItinerary?.first ?? CabItinerary(),
            cabItineraries.first.securityKey,
            cabItineraries.first.isInstantBooking,
            0,
          );
        }
      } else {
        CabGoogleAnalytics()
            .sendGACabNotAvailable(cabSrpNavigateModel, selectedDate);
      }
    }
    notifyListeners();
  }

  void updateOnClickOnShow() {
    isShowCabs = true;
    if (cabItineraries.isNotEmpty) {
      if ((cabItineraries.first.cabItinerary ?? []).isNotEmpty) {
        updateCabSelectionWith(
          cabItineraries.first.cabItinerary?.first ?? CabItinerary(),
          cabItineraries.first.securityKey,
          cabItineraries.first.isInstantBooking,
          0,
        );
      }
    }
    notifyListeners();
  }

  ///It will update createBooking value
  bool _createBooking = false;

  bool get createBooking => _createBooking;

  void updateCreateBooking({required bool createBooking}) {
    _createBooking = createBooking;
    notifyListeners();
  }

  DateTime? selectedDate;
  CabItinerary? selectedCabItinerary;
  SecurityKey? selectedProviderInfo;
  bool? instantBooking;
  DateTime? userSelectedDate;

  void updateCabSelectionWith(
    CabItinerary cabItinerary,
    SecurityKey? providerInfo,
    isInstantBooking,
    int? expandedPosition,
  ) {
    selectedCabItinerary = cabItinerary;
    selectedProviderInfo = providerInfo;
    instantBooking = isInstantBooking;
    if (selectedCabItinerary?.priceInfo?.loyaltyPercentage?.isNotEmpty ??
        false) {
      cabLoyaltyPercentage = selectedCabItinerary?.priceInfo?.loyaltyPercentage;
    }
    if (isCabAvailableForLater ?? false) {
      selectedDate = DateTime.fromMillisecondsSinceEpoch(
        ((cabAvailableForLaterTime ?? 0) * oneThousand).round(),
      );
    }
    CabGoogleAnalytics().sendGAParametersCabSelection(this);
    CabGoogleAnalytics().sendGAParametersAddToCart(
      this,
      expandedPosition,
    );
    notifyListeners();
  }

  void updateScheduleTime(DateTime? timeWithDate) {
    selectedDate = (timeWithDate?.difference(DateTime.now()).isNegative ?? true)
        ? null
        : timeWithDate;
    userSelectedDate = selectedDate;
    getCabItineraries();
  }

  /// this api is use to fetch cab itineraries
  Future<void> getCabItineraries() async {
    updateCabItinerariesState(ADResponseState.loading());
    final pickUpDetails = LocationDetails(
      tripDateTime: selectedDate != null
          ? ((selectedDate?.millisecondsSinceEpoch ?? 0) / oneThousand).round()
          : (DateTime.now().millisecondsSinceEpoch / oneThousand).round(),
      latitude: (cabSrpNavigateModel?.isFromAirport ?? false)
          ? cabSrpNavigateModel?.airportTerminalDetailModel?.latitude ?? ''
          : cabSrpNavigateModel
                  ?.locationAddressDetailModel?.geometry?.location?.lat
                  .toString() ??
              '',
      longitude: (cabSrpNavigateModel?.isFromAirport ?? false)
          ? cabSrpNavigateModel?.airportTerminalDetailModel?.longitude ?? ''
          : cabSrpNavigateModel
                  ?.locationAddressDetailModel?.geometry?.location?.lng
                  .toString() ??
              '',
      locationCode: (cabSrpNavigateModel?.isFromAirport ?? false)
          ? cabSrpNavigateModel
                  ?.airportTerminalDetailModel?.airportAddressDescription ??
              ''
          : cabSrpNavigateModel?.locationAddressDetailModel?.formattedAddress
                  .toString() ??
              '',
      placeId: (cabSrpNavigateModel?.isFromAirport ?? false)
          ? cabSrpNavigateModel?.airportTerminalDetailModel?.placeID ?? ''
          : cabSrpNavigateModel?.locationAddressDetailModel?.placeId ?? '',
    );
    final dropDetails = LocationDetails(
      tripDateTime: 0,
      latitude: !(cabSrpNavigateModel?.isFromAirport ?? false)
          ? cabSrpNavigateModel?.airportTerminalDetailModel?.latitude ?? ''
          : cabSrpNavigateModel
                  ?.locationAddressDetailModel?.geometry?.location?.lat
                  .toString() ??
              '',
      longitude: !(cabSrpNavigateModel?.isFromAirport ?? false)
          ? cabSrpNavigateModel?.airportTerminalDetailModel?.longitude ?? ''
          : cabSrpNavigateModel
                  ?.locationAddressDetailModel?.geometry?.location?.lng
                  .toString() ??
              '',
      locationCode: !(cabSrpNavigateModel?.isFromAirport ?? false)
          ? cabSrpNavigateModel
                  ?.airportTerminalDetailModel?.airportAddressDescription ??
              ''
          : cabSrpNavigateModel?.locationAddressDetailModel?.formattedAddress
                  .toString() ??
              '',
      placeId: !(cabSrpNavigateModel?.isFromAirport ?? false)
          ? cabSrpNavigateModel?.airportTerminalDetailModel?.placeID ?? ''
          : cabSrpNavigateModel?.locationAddressDetailModel?.placeId ?? '',
    );
    final searchCabRequestModel = SearchCabRequestModel(
      pickupDetails: pickUpDetails,
      dropDetails: dropDetails,
      tripDistance: 0,
      tripType: CabConstants.cabTripType,
      preferredVendor: AppConstantRemote()
                  .appConstantRemoteModel
                  ?.preferredVendorList
                  .isNotEmpty ??
              false
          ? AppConstantRemote().appConstantRemoteModel?.preferredVendorList
          : CabConstants.preferredVendorList,
      isRideNow: selectedDate == null,
      isCityToAirport: !(cabSrpNavigateModel?.isFromAirport ?? false),
    );
    final response = await cabsBookingRepository.fetchCabItineraries(
      searchCabRequestModel: searchCabRequestModel,
    );
    updateCabItinerariesState(response);
  }

  /// this api is use to create cab cart
  Future<ADResponseState> createCabCart() async {
    updateCreateBooking(createBooking: true);
    final pickUpDetails = LocationDetails(
      tripDateTime: selectedDate != null
          ? ((selectedDate?.millisecondsSinceEpoch ?? 0) / oneThousand).round()
          : (DateTime.now().millisecondsSinceEpoch / oneThousand).round(),
      latitude: (cabSrpNavigateModel?.isFromAirport ?? false)
          ? cabSrpNavigateModel?.airportTerminalDetailModel?.latitude ?? ''
          : cabSrpNavigateModel
                  ?.locationAddressDetailModel?.geometry?.location?.lat
                  .toString() ??
              '',
      longitude: (cabSrpNavigateModel?.isFromAirport ?? false)
          ? cabSrpNavigateModel?.airportTerminalDetailModel?.longitude ?? ''
          : cabSrpNavigateModel
                  ?.locationAddressDetailModel?.geometry?.location?.lng
                  .toString() ??
              '',
      locationCode: (cabSrpNavigateModel?.isFromAirport ?? false)
          ? cabSrpNavigateModel
                  ?.airportTerminalDetailModel?.airportAddressDescription ??
              ''
          : cabSrpNavigateModel?.locationAddressDetailModel?.formattedAddress
                  .toString() ??
              '',
      placeId: (cabSrpNavigateModel?.isFromAirport ?? false)
          ? cabSrpNavigateModel?.airportTerminalDetailModel?.placeID ?? ''
          : cabSrpNavigateModel?.locationAddressDetailModel?.placeId ?? '',
    );
    final dropDetails = LocationDetails(
      tripDateTime: 0,
      latitude: !(cabSrpNavigateModel?.isFromAirport ?? false)
          ? cabSrpNavigateModel?.airportTerminalDetailModel?.latitude ?? ''
          : cabSrpNavigateModel
                  ?.locationAddressDetailModel?.geometry?.location?.lat
                  .toString() ??
              '',
      longitude: !(cabSrpNavigateModel?.isFromAirport ?? false)
          ? cabSrpNavigateModel?.airportTerminalDetailModel?.longitude ?? ''
          : cabSrpNavigateModel
                  ?.locationAddressDetailModel?.geometry?.location?.lng
                  .toString() ??
              '',
      locationCode: !(cabSrpNavigateModel?.isFromAirport ?? false)
          ? cabSrpNavigateModel
                  ?.airportTerminalDetailModel?.airportAddressDescription ??
              ''
          : cabSrpNavigateModel?.locationAddressDetailModel?.formattedAddress
                  .toString() ??
              '',
      placeId: !(cabSrpNavigateModel?.isFromAirport ?? false)
          ? cabSrpNavigateModel?.airportTerminalDetailModel?.placeID ?? ''
          : cabSrpNavigateModel?.locationAddressDetailModel?.placeId ?? '',
    );
    final TripInfo tripInfo = TripInfo(
      airportName:
          cabSrpNavigateModel?.airportTerminalDetailModel?.airportCity ?? '',
      terminal:
          cabSrpNavigateModel?.airportTerminalDetailModel?.terminalCode ?? '',
      bookingDate: selectedDate != null
          ? ((selectedDate?.millisecondsSinceEpoch ?? 0) / oneThousand).round()
          : (DateTime.now().millisecondsSinceEpoch / oneThousand).round(),
      tripType: CabConstants.cabTripType,
      isRideNow: instantBooking ?? selectedDate == null,
      airportCode:
          cabSrpNavigateModel?.airportTerminalDetailModel?.airportCode ?? '',
      terminalGate:
          cabSrpNavigateModel?.airportTerminalDetailModel?.flightType ?? '',
      isFromAirport: cabSrpNavigateModel?.isFromAirport ?? false,
    );

    final PromoDetails promoDetails =
        PromoDetails(promoCode: '', promoValue: 0);
    final CreateCartRequestModel createCartRequestModel =
        CreateCartRequestModel(
      pickup: pickUpDetails,
      drop: dropDetails,
      tripInfo: tripInfo,
      priceInfo: selectedCabItinerary?.priceInfo,
      vehicleDetails: selectedCabItinerary?.vehicleCategory,
      securityKey: selectedProviderInfo,
      promoDetails: promoDetails,
      cabInfo: selectedCabItinerary?.cabInfo,
      supplier: selectedCabItinerary?.supplier,
    );
    final response = await cabsBookingRepository.createCabCart(
      createCartRequestModel: createCartRequestModel,
    );
    updateCreateBooking(createBooking: false);
    return response;
  }

  Future<void> createCart(BuildContext context) async {
    if (selectedCabItinerary != null && selectedProviderInfo != null) {
      CabGoogleAnalytics().sendGAParametersCabSelectionBook(this);
      final response = await createCabCart();
      if (response.viewStatus == Status.complete) {
        isCabScheduleDateTimeNeedsToUpdate = false;
        await navigateToScreenWithRootNavigatorResult(
          context,
          cabBookingDetailScreen,
        ).then(
          (value) {
            if (isCabScheduleDateTimeNeedsToUpdate) {
              context.read<CabsSrpState>().selectedDate = DateTime.now().add(
                Duration(
                  minutes: (AppConstantRemote()
                              .appConstantRemoteModel
                              ?.scheduleMinimumTimeMinutes ??
                          CabConstants.scheduleMinimumTimeMinutes)
                      .toInt(),
                ),
              );
              isCabScheduleDateTimeNeedsToUpdate = false;
            }
            getCabItineraries();
          },
        );
      } else {
        SnackBarUtil.showSnackBar(
          context,
          response.message ?? '',
          snackBarDuration,
          EdgeInsets.symmetric(
            horizontal: context.k_16,
            vertical: context.k_64 + context.k_30,
          ),
        );
      }
    } else {
      SnackBarUtil.showSnackBar(
        context,
        'please_select_the_cab_from_following_options'.localize(context),
        snackBarDuration,
        EdgeInsets.symmetric(
          horizontal: context.k_16,
          vertical: context.k_64 + context.k_30,
        ),
      );
    }
  }
}
