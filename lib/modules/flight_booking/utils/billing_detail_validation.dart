import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

class BillingDetailValidation {
  static String? countryName;

  static void setCountryName(String value) {
    countryName = value;
  }

  /// this method is use for validate pin code
  static String? validatePincode(
    String value,
  ) {
    const minPincodeLengthForIndia = 6;
    const minPincodeLengthForOther = 3;
    if (countryName == 'India') {
      if (value.trim().isNullOrEmpty) {
        return 'please_enter_pin';
      } else if (value.length < minPincodeLengthForIndia) {
        return 'please_valid_pincode';
      }
    } else {
      if (value.trim().isNullOrEmpty) {
        return 'please_enter_pin';
      } else if (value.length < minPincodeLengthForOther) {
        return 'please_valid_pincode';
      }
    }

    return null;
  }

  /// this method id use for validate company address
  static String? isValidateForCompanyAddress(String value) {
    const int addressLength = 3;
    if (value.trim().isNullOrEmpty) {
      return 'please_enter_address';
    } else if (value.length < addressLength) {
      return 'please_enter_valid_address';
    }
    return null;
  }

  /// this method id use for validate country code
  static String? validateCountryCode(String value) {
    return value.isNullOrEmpty ? 'please_enter_country_code' : null;
  }

  /// this method id use for validate state
  static String? validateState(String value) {
    return value.isNullOrEmpty ? 'please_enter_state' : null;
  }

  /// this method id use for validate city
  static String? validateCity(String value) {
    return value.isNullOrEmpty ? 'please_enter_city' : null;
  }
}
