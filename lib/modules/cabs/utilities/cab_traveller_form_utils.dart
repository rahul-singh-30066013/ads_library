/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/session/screens/login/views/validations.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:libphonenumber/libphonenumber.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

class CabTravellerFormUtils {
  ///this converts the string back to title salutation
  static TitleSalutation convertToTitleSalutation(String titleSalutation) {
    switch (titleSalutation) {
      case 'Mrs.':
        return TitleSalutation.missus;
      case 'Ms.':
        return TitleSalutation.miss;
      default:
        return TitleSalutation.mister;
    }
  }
}

///this enum defines all the possible title salutation values
enum TitleSalutation { mister, missus, miss }

///this converts enum to normal string abbreviation
extension TitleAbbr on TitleSalutation {
  String get titleAbbr {
    switch (this) {
      case TitleSalutation.missus:
        return 'Mrs.';
      case TitleSalutation.miss:
        return 'Ms.';
      default:
        return 'Mr';
    }
  }
}

///validations for Cab Traveller Form
class CabFormFieldsValidation {
  static String? countryName = 'India';

  static Future<String?>? validateMobileLib(
    String? value,
    String? isoCode,
  ) async {
    return checkCountryValidation(value ?? '', isoCode).then((isPhoneNumValid) {
      adLog('isPhoneNumValid ');
      adLog(isPhoneNumValid.toString());
      adLog(value.toString());
      if (value.isNullOrEmpty) {
        return 'please_enter_phone_number';
      } else if (!isPhoneNumValid) {
        return 'please_enter_valid_phone';
      }
      return null;
    });
  }

  static Future<bool> checkCountryValidation(String s, String? isoCode) async {
    adLog('isoCode:');
    adLog(isoCode.toString());
    final bool? isValid = await PhoneNumberUtil.isValidPhoneNumber(
      phoneNumber: s,
      isoCode: isoCode ?? 'IN',
    );
    if (isValid ?? false) {
      final PhoneNumberType phoneNumberType =
          await PhoneNumberUtil.getNumberType(
        phoneNumber: s,
        isoCode: isoCode ?? 'IN',
      );
      return (phoneNumberType == PhoneNumberType.mobile ||
              phoneNumberType == PhoneNumberType.personalNumber ||
              phoneNumberType == PhoneNumberType.fixedLineOrMobile) &&
          (isValid ?? false);
    }
    return isValid ?? false;
  }

  /// this method is use for validate user first name with regex
  static String? validateFirstName(String value) {
    const String firstNameRegex = '^[A-Za-z ]{2,27}';
    if (value.trim().isNullOrEmpty) {
      return 'please_enter_first_name';
    } else if (!_validateRegex(firstNameRegex, value.trim())) {
      return 'please_valid_first_name';
    }
    return null;
  }

  /// this method is use for validate last name with regex
  static String? validateLastName(String value) {
    const String lastNameRegex = '^[a-zA-Z]{2,27}';
    if (value.trim().isNullOrEmpty) {
      return 'please_enter_middle_last_name';
    } else if (!_validateRegex(lastNameRegex, value.trim())) {
      return 'please_valid_middle_last_name';
    }

    return null;
  }

  /// this method is use for validate mobile number
  static String? validateMobile(String value) {
    const String pattern = r'(^(?:[+0]9)?[0-9]{6,14555}$)';
    if (value.trim().isNullOrEmpty) {
      return 'please_enter_mobile_number';
    } else if (!_validateRegex(pattern, value)) {
      return 'please_enter_valid_phone';
    }
    return null;
  }

  /// this method is use for validating Email id
  static String? validateEmailId(String value) {
    if (value.trim().isNullOrEmpty) {
      return 'enter_email';
    } else if (!_validateRegex(Validations.emailRegex, value)) {
      return 'valid_email_id';
    }
    return null;
  }

  static bool _validateRegex(String pattern, String value) {
    final RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static String? validatePinCode(
    String value,
  ) {
    const pinCodeLengthForIndia = 6;
    const pinCodeLengthForOther = 3;
    if (value.isNotEmpty) {
      if (countryName?.toUpperCase() == 'INDIA' &&
          value.length < pinCodeLengthForIndia) {
        return 'please_enter_valid_pincode';
      } else if (value.length < pinCodeLengthForOther) {
        return 'please_enter_valid_pincode';
      }
      return null;
    } else {
      return 'please_enter_pincode';
    }
  }

  static String? validateStateName(String value) {
    if (value.trim().isNullOrEmpty) {
      return 'please_enter_valid_state';
    }
    return null;
  }

  static String? validateCityName(String value) {
    if (value.trim().isNullOrEmpty) {
      return 'please_enter_valid_city';
    }
    return null;
  }

  static int addressLength = 3;

  static String? validateAddressName(String value) {
    if (value.trim().isNotEmpty) {
      if (value.length < addressLength) {
        return 'please_enter_valid_address';
      }
      return null;
    } else {
      return 'please_enter_address';
    }
  }

  /// this method is use for validate gst number
  static String? validateGstNumber(String value) {
    const String gstNumberRegex =
        '^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}';
    if (value.trim().isNullOrEmpty) {
      return 'please_enter_gst_number';
    } else if (!_validateRegex(gstNumberRegex, value)) {
      return 'enter_gst_number';
    }
    return null;
  }

  /// this method is use for validate company name
  static String? validateCompanyName(String value) {
    //const String gstNameRegex = '^[A-Za-z][A-Za-z0-9_]{7,29}';
    if (value.trim().isNullOrEmpty) {
      return 'enter_com_name';
    }
    return null;
  }
}
