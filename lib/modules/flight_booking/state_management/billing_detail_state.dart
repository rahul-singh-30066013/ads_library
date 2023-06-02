import 'package:adani_airport_mobile/modules/cabs/models/google_places_models/destination_address_details_location_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/traveller_detail/display_model/billing_detail_builder.dart';
import 'package:adani_airport_mobile/modules/flight_booking/repositories/flight_booking_repository.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/cupertino.dart';

class BillingDetailState extends ADBaseViewModel {
  String selectedState = '';
  String selectedCity = '';
  bool fetchingCityState = false;
  BillingDetailBuilder? billingDetailBuilder;

  String? oldPinValue;

  final FlightBookingRepository _flightBookingRepository =
      FlightBookingRepository();

  Future<ADResponseState> searchStateCityByPinCode(
    String pinCode,
  ) async {
    fetchingCityState = true;
    oldPinValue = pinCode;
    notifyListeners();
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

          billingDetailBuilder?.billingDetailForm.city.controller.text =
              selectedCity;
        } else if ((element.types ?? []).any(
          (ele) => ele?.toLowerCase().contains('locality') ?? false,
        )) {
          if (selectedCity.isEmpty) {
            selectedCity = element.longName ?? '';

            billingDetailBuilder?.billingDetailForm.city.controller.text =
                selectedCity;
          }
        } else if ((element.types ?? []).any(
          (ele) =>
              ele?.toLowerCase().contains('administrative_area_level_1') ??
              false,
        )) {
          selectedState = element.longName ?? '';

          billingDetailBuilder?.billingDetailForm.state.controller.text =
              selectedState;
        }
      });
      if (selectedCity.isEmpty) {
        billingDetailBuilder?.billingDetailForm.city.controller.text =
            addressDetailModel.postcodeLocalities?.first ?? '';
      }
    } else {
      selectedCity = '';
      selectedState = '';
      billingDetailBuilder?.billingDetailForm.city.controller.clear();
      billingDetailBuilder?.billingDetailForm.state.controller.clear();
      fetchingCityState = false;
    }
    fetchingCityState = false;
    notifyListeners();
    return value;
  }

  void resetStateCity() {
    selectedState = '';
    selectedCity = '';
    notifyListeners();
  }
}
