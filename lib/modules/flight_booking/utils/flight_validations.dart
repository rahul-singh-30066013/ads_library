/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validations.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:libphonenumber/libphonenumber.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

//this class is used for complete validation of passenger/Traveller form screen
class FlightValidations {
  static String? countryName;

  static void setCountryName(String value) {
    countryName = value;
  }

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
    const int ten = 10;
    const int two = 2;
    const int twelve = 12;
    final bool? isValid = await PhoneNumberUtil.isValidPhoneNumber(
      phoneNumber: s,
      isoCode: isoCode ?? 'IN',
    );
    final subString = s.substring(0, two);
    if ((isValid ?? false) &&
        isoCode == 'IN' &&
        s.length == ten &&
        subString == '91') {
      return true;
    } else if ((isValid ?? false) &&
        isoCode == 'IN' &&
        s.length == twelve &&
        subString == '91') {
      return false;
    } else if (isValid ?? false) {
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

  static bool _validateRegex(String pattern, String value) {
    final RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  /// this method id use for validate user name with regex
  static String? validateLastName(String value) {
    const String lastNameRegex = '^[A-Za-z]{2,27}';
    if (value.trim().isNullOrEmpty) {
      return 'please_last_name';
    } else if (!_validateRegex(lastNameRegex, value.trim())) {
      return 'please_valid_last_name';
    }
    return null;
  }

  /// this method is use for validate gender
  static String? validateGender(String value) {
    return value.isNullOrEmpty ? 'please_select_gender' : null;
  }

  /// this method is use for validate adult gender
  static String? validateSalutation(String value) {
    return value.isNullOrEmpty ? 'please_select_salutation' : null;
  }

  /// this method is use for validate dob
  static String? validatedForDob(String value) {
    return value.isNullOrEmpty ? 'please_select_dob' : null;
  }

  /// this method is use for validate dob
  static String? validatedForExpiryDate(String value) {
    return value.isNullOrEmpty ? 'please_select_expiry_date' : null;
  }

  /// this method is use for validate dob
  static String? validatedForIssueDate(String value) {
    return value.isNullOrEmpty ? 'please_select_issue_date' : null;
  }

  /// this method is use for validate nationality
  static String? validatedForNationality(String value) {
    return value.isNullOrEmpty ? 'please_select_nationality' : null;
  }

  /// this method is use for validate country of residence
  static String? validateCountry(String value) {
    return value.isNullOrEmpty ? 'please_select_country_of_residence' : null;
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

  /// this method is use for validate nationality
  static String? validatedForIssuedCountryName(String value) {
    return value.isNullOrEmpty ? 'please_select_issued_country_name' : null;
  }

  /// this method is use for validate mobile number
  static String? validateMobile(String value) {
    const String pattern = r'(^(?:[+0]9)?[0-9]{10,14555}$)';
    if (value.trim().isNullOrEmpty) {
      return 'please_enter_valid_phone';
    } else if (!_validateRegex(pattern, value)) {
      return 'please_enter_valid_phone';
    }
    return null;
  }

  /// this method is use for validate passport
  static String? validatePassport(String value) {
    const int minPassportLength = 8;
    if (value.trim().isNullOrEmpty) {
      return 'please_enter_valid_passport';
    } else if (value.length < minPassportLength) {
      return 'please_enter_valid_passport';
    }
    return null;
  }

  /// this method id use for validate user last name with regex
  static String? validateFirstName(String value) {
    const String firstNameRegex = '^[A-Za-z ]{2,27}';
    if (value.trim().isNullOrEmpty) {
      return 'please_middle_first_name';
    } else if (!_validateRegex(firstNameRegex, value.trim())) {
      return 'please_valid_middle_first_name';
    }
    return null;
  }

  /// this method id use for validate gst number
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

  /// this method id use for validate company name
  static String? validateCompanyName(String value) {
    //const String gstNameRegex = '^[A-Za-z][A-Za-z0-9_]{7,29}';
    if (value.trim().isNullOrEmpty) {
      return 'enter_com_name';
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

  static String? validateEmailId(String value) {
    if (value.trim().isNullOrEmpty) {
      return 'enter_email';
    } else if (!_validateRegex(Validations.emailRegex, value)) {
      return 'valid_email_id';
    }
    return null;
  }

  static String? validateEmailIdForChangeEmail(
    String value,
    String exitingEmail,
  ) {
    if (exitingEmail.isNotEmpty) {
      return 'email_id_already_taken';
    }
    if (value.trim().isNullOrEmpty) {
      return 'enter_email';
    } else if (!_validateRegex(Validations.emailRegex, value)) {
      return 'valid_email_id';
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

  /// this method is for showing initial date for calender
  static DateTime validInitialCalenderDate({
    required String paxType,
    required DateTime journeyStartingDate,
  }) {
    if (paxType == PaxType.adult.name) {
      return DateTime(
        journeyStartingDate.year - 12,
        journeyStartingDate.month,
        journeyStartingDate.day,
      );
    } else if (paxType == PaxType.child.name) {
      return DateTime(
        journeyStartingDate.year - 2,
        journeyStartingDate.month,
        journeyStartingDate.day,
      );
    } else {
      //case of Infant at least 1 day old at the time of journey
      return DateTime(
        journeyStartingDate.year,
        journeyStartingDate.month,
        journeyStartingDate.day - 1,
      );
    }
  }

  /// this method is for showing staring date of passenger according to child and infant
  static DateTime validFirstCalenderDate({
    required String paxType,
    required DateTime journeyStartingDate,
  }) {
    if (paxType == PaxType.adult.name) {
      return DateTime(
        journeyStartingDate.year - 150,
        journeyStartingDate.month,
        journeyStartingDate.day,
      );
    } else if (paxType == PaxType.child.name) {
      return DateTime(
        journeyStartingDate.year - 12,
        journeyStartingDate.month,
        journeyStartingDate.day + 1,
      );
    } else {
      //case of Infant at least 1 day old at the time of journey
      return DateTime(
        journeyStartingDate.year - 2,
        journeyStartingDate.month,
        journeyStartingDate.day + 1,
      );
    }
  }

  /// this method is for showing last date of passenger according to child and infant
  static DateTime validLastCalenderDate({
    required String paxType,
    required DateTime journeyStartingDate,
  }) {
    if (paxType == PaxType.adult.name) {
      return DateTime(
        journeyStartingDate.year - 12,
        journeyStartingDate.month,
        journeyStartingDate.day,
      );
    } else if (paxType == PaxType.child.name) {
      return DateTime(
        journeyStartingDate.year - 2,
        journeyStartingDate.month,
        journeyStartingDate.day,
      );
    } else {
      //case of Infant at least 1 day old at the time of journey
      return DateTime(
        journeyStartingDate.year,
        journeyStartingDate.month,
        journeyStartingDate.day - 1,
      );
    }
  }
}
