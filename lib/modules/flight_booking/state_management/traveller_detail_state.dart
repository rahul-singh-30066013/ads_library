/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/google_places_models/destination_address_details_location_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_add_pax_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/traveller_detail/display_model/text_form_builder.dart';
import 'package:adani_airport_mobile/modules/flight_booking/repositories/flight_booking_repository.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/travellers_details/traveller_detail_navigate_model.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core;
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

//this will used for TravellerDetailState to manage all screen component
class TravellerDetailState extends ADBaseViewModel {
  // this is use for create complete form of passenger
  TextFormBuilder? formBuilderObject;

  // this is use for check terms and condition, we have set default value
  bool checkForTermsAndCondition = false;

  // this is use for check whatsapp, we have set default value
  bool checkForWhatsapp = false;

  // this is use for check gst, we have set default value
  bool checkForGst = false;

  // this is use for check all validation filed empty or not, we have set default value
  bool isAllFieldValidated = false;

  /// this is use for default country code
  String? selectedCountryCode;

  String? oldPinValue;

  bool isCheckGst = false;

  String selectedState = '';
  String selectedCity = '';
  bool fetchingCityState = false;
  bool fromBottomSheet = false;
  bool isNeedToUpdatePinCode = true;

  TravellerDetailState({
    this.formBuilderObject,
    required this.checkForTermsAndCondition,
    required this.checkForWhatsapp,
    required this.checkForGst,
    required this.isAllFieldValidated,
    this.selectedCountryCode,
  });

  void setIsCheckGst({required bool value}) {
    isCheckGst = value;
    notifyListeners();
  }

  /// this object is use for call Api from repository class
  final FlightBookingRepository _flightBookingRepository =
      FlightBookingRepository();

  /// Initiate loading state for api hit
  ADResponseState updatePassengerDetailsData = ADResponseState.init();

  /// this method is use for update value of terms and condition
  void checkForConditionValue({required bool value}) {
    checkForTermsAndCondition = value;
    validateAll();
  }

  /// this method is use for update value of gst
  void checkForGstValue({
    required bool value,
    ProfileModel? profileModel,
  }) {
    checkForGst = value;
    formBuilderObject?.gstDetails
        ?.updateValidationIfVisible(isGstVisible: value);
    updateValueViceVersaGstAndBilling();

    formBuilderObject?.updateGstEnable(value: value);
    final addressData =
        (profileModel?.personInfo?.addresses ?? []).firstWhereOrNull(
      (address) => address.type?.toLowerCase() == AddressType.billing.name,
    );
    if (addressData != null) {
      setIsCheckGst(value: isChangeGst());
    }
    validateAll();
  }

  bool isChangeGst() {
    return (formBuilderObject?.gstDetails?.gstAddress.controller.text ?? '')
            .isNotEmpty &&
        (formBuilderObject?.gstDetails?.country.controller.text ?? '')
            .isNotEmpty &&
        (formBuilderObject?.gstDetails?.pinCode.controller.text ?? '')
            .isNotEmpty &&
        (formBuilderObject?.gstDetails?.state.controller.text ?? '')
            .isNotEmpty &&
        (formBuilderObject?.gstDetails?.city.controller.text ?? '').isNotEmpty;
  }

  void updateValueViceVersaGstAndBilling() {
    if (checkForGst) {
      formBuilderObject?.gstDetails?.gstAddress.controller.text =
          formBuilderObject?.billingDetail?.address.controller.text ?? '';
      formBuilderObject?.gstDetails?.country.controller.text =
          formBuilderObject?.billingDetail?.country.controller.text ?? '';
      formBuilderObject?.gstDetails?.pinCode.controller.text =
          formBuilderObject?.billingDetail?.pinCode.controller.text ?? '';
      formBuilderObject?.gstDetails?.city.controller.text =
          formBuilderObject?.billingDetail?.city.controller.text ?? '';
      formBuilderObject?.gstDetails?.state.controller.text =
          formBuilderObject?.billingDetail?.state.controller.text ?? '';
    } else {
      formBuilderObject?.billingDetail?.address.controller.text =
          formBuilderObject?.gstDetails?.gstAddress.controller.text ?? '';
      formBuilderObject?.billingDetail?.country.controller.text =
          formBuilderObject?.gstDetails?.country.controller.text ?? '';
      formBuilderObject?.billingDetail?.pinCode.controller.text =
          formBuilderObject?.gstDetails?.pinCode.controller.text ?? '';
      formBuilderObject?.billingDetail?.city.controller.text =
          formBuilderObject?.gstDetails?.city.controller.text ?? '';
      formBuilderObject?.billingDetail?.state.controller.text =
          formBuilderObject?.gstDetails?.state.controller.text ?? '';
    }
    notifyListeners();
  }

  void checkForWhatsAppValue({required bool value}) {
    checkForWhatsapp = value;
    validateAll();
  }

  bool setValueForTitle(TextEditingController? controller) {
    if ((controller?.text ?? '').isEmpty ||
        controller?.text == 'clickButtonError') {
      controller?.text = 'clickButtonError';
      notifyListeners();
      return false;
    } else {
      notifyListeners();
      return true;
    }
  }

  void countryChangeEmptyController() {
    formBuilderObject?.gstDetails?.pinCode.controller.clear();
    formBuilderObject?.gstDetails?.state.controller.clear();
    formBuilderObject?.gstDetails?.city.controller.clear();
  }

  void resetStateCity() {
    selectedState = '';
    selectedCity = '';
    notifyListeners();
  }

  /// this method is use for validate all field of passenger form
  Future<void> validateAll() async {
    final isFormValidated = await formBuilderObject?.isValidated.call() ?? true;
    // isAllFieldValidated = isFormValidated && checkForTermsAndCondition;
    isAllFieldValidated = isFormValidated;
    notifyListeners();
  }

  ///It will update passenger
  Future<void> updatePassengerDetails(
    List<site_core.Country> country,
    String itineraryId,
    ADTapCallbackWithValue adTapCallbackWithValue,
    String oldUserId,
  ) async {
    if (formBuilderObject != null) {
      updatePassengerDetailsData = ADResponseState.loading();
      notifyListeners();
      final TravellerPassengerDetailRequestModel
          travellerPassengerDetailRequestModel =
          FlightAddPaxRequestModel().createUpdatePaxRequestBody(
        formBuilderObject,
        country,
        checkForGst: checkForGst,
      );
      updatePassengerDetailsData =
          await _flightBookingRepository.updatePassengerDetailsSession(
        travellerPassengerDetailRequestModel,
        itineraryId,
        oldUserId,
      );
      notifyListeners();
      adTapCallbackWithValue(updatePassengerDetailsData);
    }
  }

  Future<ADResponseState> searchStateCityByPinCode(
    String pinCode,
    bool gstChecked,
  ) async {
    fetchingCityState = true;
    oldPinValue = pinCode;
    notifyListeners();
    if (gstChecked) {
      formBuilderObject?.gstDetails?.city.controller.clear();
      formBuilderObject?.gstDetails?.state.controller.clear();
    } else {
      formBuilderObject?.billingDetail?.city.controller.clear();
      formBuilderObject?.billingDetail?.state.controller.clear();
    }
    final value = await _flightBookingRepository.fetchGoogleAddressByPinCode(
      query: pinCode,
    );
    if (value.viewStatus == Status.complete && value.data != null) {
      final AddressDetailModel addressDetailModel = value.data;
      final locality = addressDetailModel.addressComponents?.where(
        (element) => (element.types ?? []).any(
          (ele) =>
              (ele
                      ?.toLowerCase()
                      .contains('administrative_area_level_3') ??
                  false) ||
              (ele?.toLowerCase().contains('administrative_area_level_1') ??
                  false) ||
              (ele?.toLowerCase().contains('locality') ?? false),
        ),
      );
      debugPrint('22');
      final data = locality?.forEach((element) {
        if ((element.types ?? []).any(
          (ele) =>
              ele?.toLowerCase().contains('administrative_area_level_3') ??
              false,
        )) {
          selectedCity = element.longName ?? '';
          if (gstChecked) {
            formBuilderObject?.gstDetails?.city.controller.text = selectedCity;
          } else {
            formBuilderObject?.billingDetail?.city.controller.text =
                selectedCity;
          }
        } else if ((element.types ?? []).any(
          (ele) => ele?.toLowerCase().contains('locality') ?? false,
        )) {
          if (selectedCity.isEmpty) {
            selectedCity = element.longName ?? '';
            if (gstChecked) {
              formBuilderObject?.gstDetails?.city.controller.text =
                  selectedCity;
            } else {
              formBuilderObject?.billingDetail?.city.controller.text =
                  selectedCity;
            }
          }
        } else if ((element.types ?? []).any(
          (ele) =>
              ele?.toLowerCase().contains('administrative_area_level_1') ??
              false,
        )) {
          selectedState = element.longName ?? '';
          if (gstChecked) {
            formBuilderObject?.gstDetails?.state.controller.text =
                selectedState;
          } else {
            formBuilderObject?.billingDetail?.state.controller.text =
                selectedState;
          }
        }
      });
      if (selectedCity.isEmpty) {
        if (gstChecked) {
          formBuilderObject?.gstDetails?.city.controller.text =
              addressDetailModel.postcodeLocalities?.first ?? '';
        } else {
          formBuilderObject?.billingDetail?.city.controller.text =
              addressDetailModel.postcodeLocalities?.first ?? '';
        }
      }
      // if (gstChecked) {
      //   formBuilderObject?.gstDetails?.isEnableForEditAndValidationForGst();
      // } else {
      //   formBuilderObject?.billingDetail
      //       ?.isEnableForEditAndValidationForBilling();
      // }
      formBuilderObject?.gstDetails?.isEnableForEditAndValidationForGst();
      formBuilderObject?.billingDetail
          ?.isEnableForEditAndValidationForBilling();
      enableOfCityAndState(gstChecked);
    } else {
      selectedCity = '';
      selectedState = '';
      fetchingCityState = false;
      if (gstChecked) {
        formBuilderObject?.gstDetails?.city.controller.clear();
        formBuilderObject?.gstDetails?.state.controller.clear();
      } else {
        formBuilderObject?.billingDetail?.city.controller.clear();
        formBuilderObject?.billingDetail?.state.controller.clear();
      }
      formBuilderObject?.gstDetails?.isEnableForEditAndValidationForGst();
      formBuilderObject?.billingDetail
          ?.isEnableForEditAndValidationForBilling();
      enableOfCityAndState(gstChecked);
    }
    fetchingCityState = false;
    notifyListeners();
    return value;
  }

  void enableOfCityAndState(bool gstChecked) {
    if (gstChecked) {
      formBuilderObject?.gstDetails?.city.enable = true;
      formBuilderObject?.gstDetails?.state.enable = true;
    } else {
      formBuilderObject?.billingDetail?.city.enable = true;
      formBuilderObject?.billingDetail?.state.enable = true;
    }
  }

  void setValueFromBootmSheet() {
    fromBottomSheet = false;
    notifyListeners();
  }

  void setBillingEditValue(UpdateBillingModel updateBillingModel) {
    fromBottomSheet = true;
    formBuilderObject?.billingDetail?.address.controller.text =
        updateBillingModel.address;
    formBuilderObject?.billingDetail?.country.controller.text =
        updateBillingModel.country;
    formBuilderObject?.billingDetail?.pinCode.controller.text =
        updateBillingModel.pinCode;
    formBuilderObject?.billingDetail?.city.controller.text =
        updateBillingModel.city;
    formBuilderObject?.billingDetail?.state.controller.text =
        updateBillingModel.state;
    notifyListeners();
  }
}
