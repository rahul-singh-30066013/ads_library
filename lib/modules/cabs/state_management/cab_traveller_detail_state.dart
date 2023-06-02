/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/request_models/update_cab_cart_request_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_cart_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/postal_code_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cabs_booking_repository.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_traveller_details_screen/views/cab_booking_form_builder.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/cab_traveller_form_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/travellers_details/traveller_detail_navigate_model.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

class CabTravellerDetailState extends BaseViewModel {
  final CabsBookingRepository cabsBookingRepository = CabsBookingRepository();
  CabCartDetailResponseModel? cabCartDetailResponseModel;
  bool isRewardPointsAvailable = false;
  bool _isUserInformationUpdated = false;
  String selectedState = '';
  String selectedCity = '';
  UpdateBillingModel? defaultBillingAddress;
  bool isBillingAddressUpdate = true;
  bool fetchingCityState = false;
  bool isUpdatePinCode = true;
  bool isUpdateAfterEditing = true;
  bool isBillingDetailsExpend = false;

  bool get isUserInformationUpdated => _isUserInformationUpdated;
  BillingAddress? billingAddressModel = BillingAddress();
  List<BillingAddress>? updateBillingAddress = [];

  /// this is use for check gst, we have set default value
  bool checkForGst = false;

  CabBookingFormBuilder? updateCabBookingFormBuilder;

  void updateBillingDetailAfterEdit() {
    isBillingAddressUpdate = !isBillingAddressUpdate;
    notifyListeners();
  }

  void resetStateCity() {
    selectedState = '';
    selectedCity = '';
    updateCabBookingFormBuilder?.updateTravellerForm.state.controller.text = '';
    updateCabBookingFormBuilder?.updateTravellerForm.city.controller.text = '';
    notifyListeners();
  }

  bool checkBillingFormValidate() {
    return defaultBillingAddress != null &&
        CabFormFieldsValidation.validateAddressName(
          updateCabBookingFormBuilder
                  ?.updateTravellerForm.gstAddress.controller.text ??
              '',
        ).isNullOrEmpty &&
        (CabFormFieldsValidation.countryName?.isNotEmpty ?? false) &&
        CabFormFieldsValidation.validatePinCode(
          updateCabBookingFormBuilder
                  ?.updateTravellerForm.pinCode.controller.text ??
              '',
        ).isNullOrEmpty &&
        CabFormFieldsValidation.validateStateName(
          updateCabBookingFormBuilder
                  ?.updateTravellerForm.state.controller.text ??
              '',
        ).isNullOrEmpty &&
        CabFormFieldsValidation.validateCityName(
          updateCabBookingFormBuilder
                  ?.updateTravellerForm.city.controller.text ??
              '',
        ).isNullOrEmpty;
  }

  void checkForGstValue({
    required bool value,
  }) {
    if (checkBillingFormValidate()) {
      defaultBillingAddress = UpdateBillingModel(
        updateCabBookingFormBuilder
                ?.updateTravellerForm.gstAddress.controller.text
                .trim() ??
            '',
        updateCabBookingFormBuilder?.updateTravellerForm.country.controller.text
                .trim() ??
            '',
        updateCabBookingFormBuilder?.updateTravellerForm.pinCode.controller.text
                .trim() ??
            '',
        updateCabBookingFormBuilder?.updateTravellerForm.city.controller.text
                .trim() ??
            '',
        updateCabBookingFormBuilder?.updateTravellerForm.state.controller.text
                .trim() ??
            '',
      );
      isBillingDetailsExpend = value;
    }

    updateCabBookingFormBuilder?.updateTravellerForm.gstAddress.placeHolder =
        value ? 'billing_address' : 'address';
    updateCabBookingFormBuilder?.updateTravellerForm.gstNumber.controller.text =
        '';
    updateCabBookingFormBuilder
        ?.updateTravellerForm.gstCompanyName.controller.text = '';
    checkForGst = value;
    notifyListeners();
  }

  Future<ADResponseState> updateCabCartDetail() async {
    userInformationUpdated(value: true);
    userBillingAddress();
    final UpdateCabCartRequestModel updateCabCartRequestModel =
        UpdateCabCartRequestModel(
      category: updateCabBookingFormBuilder
          ?.updateTravellerForm.title.controller.text
          .toString()
          .trim(),
      firstName: updateCabBookingFormBuilder
          ?.updateTravellerForm.firstName.controller.text
          .toString()
          .trim(),
      lastName: updateCabBookingFormBuilder
          ?.updateTravellerForm.lastName.controller.text
          .toString()
          .trim(),
      email: updateCabBookingFormBuilder
          ?.updateTravellerForm.emailAddress.controller.text
          .toString()
          .trim(),
      mobileNumber: updateCabBookingFormBuilder
          ?.updateTravellerForm.contactNumber.controller.text
          .toString()
          .trim(),
      countryCode: updateCabBookingFormBuilder
          ?.updateTravellerForm.countryCode.controller.text
          .toString()
          .trim(),
      gstNumber: updateCabBookingFormBuilder
          ?.updateTravellerForm.gstNumber.controller.text
          .toString()
          .trim(),
      address: updateCabBookingFormBuilder
          ?.updateTravellerForm.gstAddress.controller.text
          .toString()
          .trim(),
      companyName: updateCabBookingFormBuilder
          ?.updateTravellerForm.gstCompanyName.controller.text
          .toString()
          .trim(),
      nationality: updateCabBookingFormBuilder
          ?.updateTravellerForm.country.controller.text
          .toString()
          .trim(),
      pinCode: updateCabBookingFormBuilder
          ?.updateTravellerForm.pinCode.controller.text
          .toString()
          .trim(),
      state: updateCabBookingFormBuilder
          ?.updateTravellerForm.state.controller.text
          .toString()
          .trim(),
      city: updateCabBookingFormBuilder
          ?.updateTravellerForm.city.controller.text
          .toString()
          .trim(),
      billingAddress: updateBillingAddress,
    );
    final response = await cabsBookingRepository.updateCabCartDetail(
      updateCabCartRequestModel: updateCabCartRequestModel,
    );
    userInformationUpdated(value: false);
    return response;
  }

  void userInformationUpdated({required bool value}) {
    _isUserInformationUpdated = value;
    notifyListeners();
  }

  void userBillingAddress() {
    updateBillingAddress?.clear();
    billingAddressModel?.addressLine = updateCabBookingFormBuilder
            ?.updateTravellerForm.gstAddress.controller.text
            .trim() ??
        '';
    billingAddressModel?.country?.countryName = updateCabBookingFormBuilder
            ?.updateTravellerForm.country.controller.text
            .trim() ??
        '';

    billingAddressModel?.stateProv = StateProv(
      stateName: updateCabBookingFormBuilder
              ?.updateTravellerForm.state.controller.text
              .trim() ??
          '',
    );

    billingAddressModel?.city = City(
      cityName: updateCabBookingFormBuilder
              ?.updateTravellerForm.city.controller.text
              .trim() ??
          '',
    );
    billingAddressModel?.country = Country(
      countryName: updateCabBookingFormBuilder
              ?.updateTravellerForm.country.controller.text
              .trim() ??
          '',
    );
    billingAddressModel?.postalCode = updateCabBookingFormBuilder
            ?.updateTravellerForm.pinCode.controller.text
            .trim() ??
        '';
    billingAddressModel?.isPrimary = true;
    updateBillingAddress?.add(billingAddressModel ?? BillingAddress());
  }

  Future<ADResponseState> searchPinCodeData(String pinCode) async {
    fetchingCityState = true;
    updateCabBookingFormBuilder?.updateTravellerForm.state.controller.text = '';
    updateCabBookingFormBuilder?.updateTravellerForm.city.controller.text = '';
    notifyListeners();
    final value = await cabsBookingRepository.fetchPostalCodeData(
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

      locality?.forEach((element) {
        if ((element.types ?? []).any(
          (ele) =>
              ele?.toLowerCase().contains('administrative_area_level_3') ??
              false,
        )) {
          selectedCity = element.longName ?? '';
          updateCabBookingFormBuilder
              ?.updateTravellerForm.city.controller.text = selectedCity;
        } else if ((element.types ?? []).any(
          (ele) => ele?.toLowerCase().contains('locality') ?? false,
        )) {
          if (selectedCity.isEmpty) {
            selectedCity = element.longName ?? '';
            updateCabBookingFormBuilder
                ?.updateTravellerForm.city.controller.text = selectedCity;
          }
        } else if ((element.types ?? []).any(
          (ele) =>
              ele?.toLowerCase().contains('administrative_area_level_1') ??
              false,
        )) {
          selectedState = element.longName ?? '';
          updateCabBookingFormBuilder
              ?.updateTravellerForm.state.controller.text = selectedState;
        }
      });
      if (selectedCity.isEmpty) {
        updateCabBookingFormBuilder?.updateTravellerForm.city.controller.text =
            addressDetailModel.postcodeLocalities?.first ?? '';
      }
      updateCabBookingFormBuilder?.updateTravellerForm.city.enable = true;
      updateCabBookingFormBuilder?.updateTravellerForm.city.readonly = false;

      updateCabBookingFormBuilder?.updateTravellerForm.state.enable = true;
      updateCabBookingFormBuilder?.updateTravellerForm.state.readonly = false;
    } else {
      selectedCity = '';
      selectedState = '';
      updateCabBookingFormBuilder?.updateTravellerForm.city.enable = false;
      updateCabBookingFormBuilder?.updateTravellerForm.state.enable = false;
      fetchingCityState = false;
    }
    fetchingCityState = false;
    notifyListeners();
    return value;
  }

  void resetPinCode({
    required String? countryName,
  }) {
    updateCabBookingFormBuilder?.updateTravellerForm
        .pinCodeUpdateOnSelectCountry(countryName ?? 'INDIA');
    isUpdatePinCode = !isUpdatePinCode;
    notifyListeners();
  }

  Future<ADResponseState> fetchCabCartDetail() async {
    userInformationUpdated(value: true);
    final response = await cabsBookingRepository.fetchCabCartDetail();
    if (response.viewStatus == Status.complete) {
      cabCartDetailResponseModel = response.data as CabCartDetailResponseModel;
      isRewardPointsAvailable =
          (cabCartDetailResponseModel?.cartDetail?.priceInfo?.loyalty ?? 0) > 0;
    }
    userInformationUpdated(value: false);
    return response;
  }
}
