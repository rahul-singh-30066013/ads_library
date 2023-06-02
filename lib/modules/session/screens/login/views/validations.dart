/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/utils/constants/pranaam_service_contants.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:libphonenumber/libphonenumber.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

///To add all vaidations of project
class Validations {
  static const String ageRegex = r'^(1[3-9]|[2-9][0-9]|[1-9][0-0][0-0])$';
  static const String mobileRegex = r'(^(?:[+0]9)?[0-9]{10}$)';
  static const String adultAgeRegex = r'^(1[2-9]|[2-9][0-9]|[1-1][0-0][0-0])$';
  static const String childAgeRegex = r'^([3-9]|1[0,1])$';
  static const String infantAgeRegex = r'^([0-2])$';
  static const String pincodeRegex = r'(^[0-9]{5,10}$)';
  static const String emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const String firstNameRegex = r'^[a-zA-Z][a-zA-Z ]+[a-zA-Z]$';
  static const String lastNameRegex = r'^[a-zA-Z][a-zA-Z ]+[a-zA-Z]$';
  static const String assistanceCodeRegex = r'[a-zA-Z0-9]*$';
  static const String passportNumberRegex = r'\w{8,15}';
  static bool isPhoneNumberValid = false;
  static bool isPinCodeForIndia = false;
  static const int minAssistanceLength = 3;
  // static const String emailRegexForFeedback =
  //     r'^(([^<>()?%[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static String? validateMobile(String? value, BuildContext context) {
    const String pattern = r'(^(?:[+0]9)?[0-9]{6,15}$)';
    final RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value.validateWithDefaultValue())) {
      return 'please_enter_valid_phone'.localize(context);
    }
    return null;
  }

  static String? validatePassportNumber(String? value, BuildContext context) {
    const String pattern = r'\w{8,15}';
    final RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value.validateWithDefaultValue())) {
      return 'enter_a_valid_passport'.localize(context);
    }
    return null;
  }

  static String? validateSalutation(String? value, BuildContext context) {
    if (value?.isEmpty ?? true) {
      return 'please_select_title'.localize(context);
    }
    return null;
  }

  /// this method id use for validate gst number
  static String? validateGstNumber(
    String? value,
    BuildContext context,
    String? stateCode,
  ) {
    const String gstNumberRegex =
        '^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}';
    final RegExp regExp = RegExp(gstNumberRegex);
    final isValidGst = regExp.hasMatch(value.validateWithDefaultValue());
    if (stateCode?.isNotEmpty ?? false) {
      var isValidStateCode = false;
      try {
        const k_2 = 2;
        isValidStateCode = value?.substring(
              0,
              k_2,
            ) ==
            stateCode;
      } catch (e) {
        isValidStateCode = false;
      }
      if (isValidGst && !isValidStateCode) {
        return 'enter_gst_number'.localize(context);
      }
    }
    if (!isValidGst) {
      return 'enter_gst_number'.localize(context);
    }
    return null;
  }

  /// this method id use for validate company name
  static String? validateCompanyName(String? value, BuildContext context) {
    final String? removeBlankSpaceValue = value?.trim();
    if (removeBlankSpaceValue.isNullOrEmpty) {
      return 'please_enter_valid_com_name'.localize(context);
    }
    return null;
  }

  static Future<String?>? validateMobileLib(
    String? value,
    String? isoCode,
    BuildContext context,
  ) {
    return checkCountryValidation(value ?? '', isoCode).then((isPhoneNumValid) {
      adLog('isPhoneNumValid ');
      adLog(isPhoneNumValid.toString());
      adLog(value.toString());
      isPhoneNumberValid = isPhoneNumValid;
      if (!isPhoneNumValid) {
        return 'please_enter_valid_phone'.localize(context);
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

  static String? validatePinCode(
    String? value,
    BuildContext context,
  ) {
    final String pattern =
        isPinCodeForIndia ? pinCodeRegexIndia : pinCodeRegexApartFromIndia;
    final RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value.validateWithDefaultValue())) {
      return 'please_enter_valid_pincode'.localize(context);
    }
    return null;
  }

  static String? validateEmptyField(String? value, BuildContext context) {
    if (value.isNullOrEmpty) {
      return 'enter_a_valid_passport'.localize(context);
    }
    return null;
  }

  static String? validatePassport(String? value, BuildContext context) {
    const String pattern = r'(^[A-Z][0-9]{7,9}$)';
    final RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value.validateWithDefaultValue())) {
      return 'please_enter_valid_passport'.localize(context);
    }
    return null;
  }

  static String? validateName(
    String? value,
    BuildContext context,
    TextEditingController controller,
  ) {
    const String pattern = firstNameRegex;
    final String? removeBlankSpaceValue = value?.trim();
    final RegExp regExp = RegExp(pattern);
    if (controller.text.isEmpty) {
      return 'please_enter_valid_name'.localize(context);
    }
    if (!regExp.hasMatch(removeBlankSpaceValue.validateWithDefaultValue())) {
      return 'please_enter_valid_name'.localize(context);
    }
    return null;
  }

  static String? validateFirstName(
    String? value,
    BuildContext context,
  ) {
    const String pattern = firstNameRegex;
    final String? removeBlankSpaceValue = value?.trim();
    final RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(removeBlankSpaceValue.validateWithDefaultValue())) {
      return 'please_first_name'.localize(context);
    }
    return null;
  }

  static String? validateAssistanceCode(
    String? value,
    BuildContext context,
    TextEditingController controller,
  ) {
    const String pattern = assistanceCodeRegex;
    final String? removeBlankSpaceValue = value?.trim();
    final RegExp regExp = RegExp(pattern);
    if (controller.text.length < minAssistanceLength) {
      return 'please_enter_a_valid_assistance_code'.localize(context);
    } else if (!regExp
        .hasMatch(removeBlankSpaceValue.validateWithDefaultValue())) {
      return 'please_enter_a_valid_assistance_code'.localize(context);
    }
    return null;
  }

  static String? validateLastName(String? value, BuildContext context) {
    const String pattern = lastNameRegex;
    final String? removeBlankSpaceValue = value?.trim();
    final RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(removeBlankSpaceValue.validateWithDefaultValue())) {
      return 'please_enter_valid_last_name'.localize(context);
    }
    return null;
  }

  static String? validateCountry(String? value, BuildContext context) {
    if (value.isNullOrEmpty) {
      return 'please_enter_valid_country'.localize(context);
    }
    return null;
  }

  static String? validateAge(String? value, BuildContext context) {
    const String pattern = r'^(1[2-9]|[2-9][0-9]|[1-1][0-0][0-0])$';
    // const String pattern = r'^(1[3-9]|[2-9][0-9])$';
    final RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value.validateWithDefaultValue())) {
      return 'please_enter_valid_age'.localize(context);
    }
    return null;
  }

  static String? pranaamValidateAge(String? value, BuildContext context) {
    const String pattern = adultAgeRegex;
    final RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value.validateWithDefaultValue())) {
      return 'please_enter_valid_age'.localize(context);
    }
    return null;
  }

  static String? validateChildAge(String? value, BuildContext context) {
    const String pattern = childAgeRegex;
    final RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(value.validateWithDefaultValue())) {
      return 'please_enter_valid_age'.localize(context);
    }
    return null;
  }

  static String? validateInfantAge(String? value, BuildContext context) {
    const String pattern = infantAgeRegex;
    final RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(value.validateWithDefaultValue())) {
      return 'please_enter_valid_age'.localize(context);
    }
    return null;
  }

  static String? validateBaggageCount(String? value, BuildContext context) {
    const String pattern = r'^[0-9]+$';
    final RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value.validateWithDefaultValue())) {
      return 'please_enter_valid_baggage_count'.localize(context);
    }
    return null;
  }

  static String? validateEmail(String? value, BuildContext context) {
    const String pattern = emailRegex;
    final RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value.validateWithDefaultValue())) {
      return 'valid_email_id'.localize(context);
    }
    return null;
  }

  String? validatePassword(String value) {
    return value.isEmpty ? 'Please enter password' : null;
  }

  static String? validatePassportName(String? value, BuildContext context) {
    const String patttern = r'^[a-z A-Z,.\-]+$';

    final RegExp regExp = RegExp(patttern);

    if (!regExp.hasMatch(value.validateWithDefaultValue())) {
      return 'please_enter_valid_Name_on_passport'.localize(context);
    }
    return null;
  }

  static String? validateFullName(String? value, BuildContext context) {
    const String patttern = r'^[a-z A-Z,.\-]+$';

    final RegExp regExp = RegExp(patttern);

    if (value.isNullOrEmpty) {
      return '';
    } else if (!regExp.hasMatch(value.validateWithDefaultValue())) {
      return 'please_enter_name'.localize(context);
    }
    return null;
  }

  static String? validatecancellationReasonDutyfree(
    String? value,
    BuildContext context,
  ) {
    // const String pattern = r'^[a-zA-Z]+$';
    // final RegExp regExp = RegExp(pattern);
    if (value.isNullOrEmpty) {
      return '';
    }
    // else if (!regExp.hasMatch(value.validateWithDefaultValue())) {
    adLog('type_the_reason_for_order_cancellation'.localize(context));
    //   return '';
    // }
    return null;
  }

  static String? validateAddressLine(
    String? value,
    BuildContext context,
  ) {
    if (value.isNullOrEmpty) {
      return 'Please_enter_address_line'.localize(context);
    }
    return null;
  }
}
