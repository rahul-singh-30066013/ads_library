import 'package:adani_airport_mobile/modules/more/state_management/feedback_state_management.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/validations.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

class FeedBackValidation {
  static String? validateName(
    String value,
    FeedbackStateManagement feedBackState,
  ) {
    const String firstNameRegex = '^[A-Za-z]{2,27}';
    if (value.trim().isNullOrEmpty) {
      return feedBackState.elementsField?.firstNameRequired ?? '';
    } else if (!_validateRegex(firstNameRegex, value)) {
      return feedBackState.elementsField?.firstNameIncorrect ?? '';
    } else {
      return null;
    }
  }

  static String? validateLastName(
    String value,
    FeedbackStateManagement feedBackState,
  ) {
    const String lastNameRegex = '^[A-Za-z ]{2,27}';
    if (value.trim().isNullOrEmpty) {
      return feedBackState.elementsField?.lastNameRequired ?? '';
    } else if (!_validateRegex(lastNameRegex, value.trim())) {
      return feedBackState.elementsField?.lastNameIncorrect ?? '';
    } else {
      return null;
    }
  }

  static String? validateMobile(
    String? value,
    FeedbackStateManagement feedBackState,
  ) {
    const String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    final RegExp regExp = RegExp(pattern);
    final String? removeBlankSpaceValue = value?.trim();
    if (value.isNullOrEmpty) {
      return feedBackState.elementsField?.mobileNoRequired ?? '';
    } else if (!regExp
        .hasMatch(removeBlankSpaceValue.validateWithDefaultValue())) {
      return feedBackState.elementsField?.mobileNoIncorrect ?? '';
    } else {
      return null;
    }
  }

  static String? validateForMobileIsEmptyOrNot(String? value) {
    return value.isNullOrEmpty ? 'please_enter_phone_number' : null;
  }

  static String? validateEmail(
    String value,
    FeedbackStateManagement feedBackState,
  ) {
    if (value.isNullOrEmpty) {
      return feedBackState.elementsField?.emailIdRequired ?? '';
    } else if (!_validateRegex(Validations.emailRegex, value)) {
      return feedBackState.elementsField?.emailIdIncorrect ?? '';
    } else {
      return null;
    }
  }

  static bool _validateRegex(String pattern, String value) {
    final RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  /// this method is use for validate airport required
  static String? validatedForAirportRequired(
    String value,
    FeedbackStateManagement feedBackState,
  ) {
    return value.isNullOrEmpty
        ? feedBackState.elementsField?.airportRequired ?? ''
        : null;
  }

  /// this method is use for validate Issue Type required
  static String? validatedForIssueType(
    String value,
    FeedbackStateManagement feedBackState,
  ) {
    return value.isNullOrEmpty
        ? feedBackState.elementsField?.issueTypeRequired ?? ''
        : null;
  }
}
