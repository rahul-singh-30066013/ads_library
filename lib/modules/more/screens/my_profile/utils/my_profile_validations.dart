import 'package:adani_airport_mobile/modules/more/screens/my_profile/utils/my_profile_utils.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validations.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

///validations for my profile
class MyProfileValidations {
  /// this method id use for validate user first name with regex
  static String? validateFirstName(String value) {
    const String firstNameRegex = '^[a-zA-Z]{2,27}';
    if (!_validateRegex(firstNameRegex, value.trim()) &&
        !value.trim().isNullOrEmpty) {
      return 'please_valid_first_name';
    }
    return null;
  }

  /// this method id use for validate last name with regex
  static String? validateLastName(String value) {
    const String lastNameRegex = '^[a-zA-Z]{2,27}';
    if (!_validateRegex(lastNameRegex, value.trim()) &&
        !value.trim().isNullOrEmpty) {
      return 'please_valid_middle_last_name';
    }
    return null;
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

  /// this method id use for validating Email id
  static String? validateEmailId(String value) {
    if (value.trim().isNullOrEmpty) {
      return 'enter_email';
    } else if (!_validateRegex(Validations.emailRegex, value)) {
      return 'valid_email_id';
    }
    return null;
  }

  /// this method is use for validating passport
  static String? validatePassport(String value) {
    const int minPassportLength = 8;
    if (!value.trim().isNullOrEmpty && value.length < minPassportLength) {
      return 'please_enter_valid_passport';
    }
    return null;
  }

  /// this method is use for validate pin code
  static String? validatePincode(String value) {
    const minPincodeLength = 5;
    if (value.trim().length < minPincodeLength && !value.trim().isNullOrEmpty) {
      return 'please_enter_valid_pincode';
    }
    return null;
  }

  /// for validating if user's age is equal to or above 18
  static String? validateDOB(String? dob) {
    if (dob == null || dob.isEmpty) {
      return null;
    }
    final currentDate = DateTime.now();
    final birthDate = DateTime.tryParse(
      MyProfileUtils.convertToParsableDateFormat(dob),
    );
    if (birthDate == null) {
      return '';
    }
    const minRequiredAge = 18;
    const eligibleHour = 23;
    const eligibleMin = 59;
    const eligibleSec = 59;
    final eligibleDate = DateTime(
      (currentDate.year) - minRequiredAge,
      currentDate.month,
      currentDate.day,
      eligibleHour,
      eligibleMin,
      eligibleSec,
    );
    if (birthDate.isAtSameMomentAs(eligibleDate) ||
        birthDate.isBefore(eligibleDate)) {
      return null;
    }
    return 'invalid_dob';
  }

  static bool _validateRegex(String pattern, String value) {
    final RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
