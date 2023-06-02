/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/sliver_app_bar_base_component.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_password_editable_text.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/constant/constants.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/signup_automation_keys.dart';
import 'package:adani_airport_mobile/modules/session/screens/sign_up/views/tf_type_enum.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// Signup screen statefull widget
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // final _formKey = GlobalKey<FormState>();
  static const double _signInBottomPadding = 44;
  static const double _heightOfSubmitButton = 54;
  bool _isSignupButtonActive = false;

  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  String errorMessageForMobileNumber = '',
      errorMessageForEmailId = '',
      errorMessageForPassword = '',
      errorMessageForName = '';

  bool isValidate = false;

  void refreshAndValidate(isValidate) {
    if (isValidate != _isSignupButtonActive) {
      setState(() {
        _isSignupButtonActive = isValidate;
      });
    }
  }

  bool isValidateAll() {
    return mobileNumberController.text.isNotEmpty &&
        emailIdController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  void signupButtonAction() {
    ///TODO: long functionality

    setState(() {
      if (validateMobile() &&
          validateEmailId() &&
          validateName() &&
          validatePassword()) {
        navigateToScreenUsingNamedRouteWithArguments(
          context,
          otp,
          argumentObject: mobileNumberController.text,
        );
      }
    });
  }

  void forgotButtonAction() {
    ///TODO: long functionality
  }

  @override
  Widget build(BuildContext context) {
    adLog('building signup screen');
    return Scaffold(
      backgroundColor: context.adColors.whiteTextColor,
      body: SafeArea(
        child: SliverAppBarBaseComponent(
          body: ListView(
            children: [
              ADSizedBox(
                height: context.k_32,
              ),
              editFormOfPhoneNumber(),
              ADSizedBox(
                height: context.k_20,
              ),
              editFormOfEmailId(),
              ADSizedBox(
                height: context.k_20,
              ),
              editFromOfName(),
              ADSizedBox(
                height: context.k_20,
              ),
              editFromOfPassword(),
              const ADSizedBox(
                height: _signInBottomPadding,
              ),

              Text(
                'veryOtpSignup'.localize(context),
                style: ADTextStyle400.size12
                    .setTextColor(context.adColors.greyTextColor),
              ),

              ADSizedBox(
                height: context.k_10,
              ),
              RichText(
                text: TextSpan(
                  style: ADTextStyle400.size12
                      .setTextColor(context.adColors.greyTextColor),
                  children: [
                    TextSpan(
                      text: 'bySigningText'.localize(context),
                    ),
                    WidgetSpan(
                      child: InkWell(
                        key: const Key(SignupAutomationKeys.termsButtonKey),
                        child: Text(
                          'T_C'.localize(context),
                          style: ADTextStyle600.size12
                              .setTextColor(context.adColors.greyTextColor),
                        ),
                        onTap: () => adLog('T_C'),
                      ),
                    ),
                    TextSpan(
                      text: 'and'.localize(context),
                    ),
                    WidgetSpan(
                      child: InkWell(
                        key: const Key(SignupAutomationKeys.policyButtonKey),
                        child: Text(
                          'privacyPolicy'.localize(context),
                          style: ADTextStyle600.size12
                              .setTextColor(context.adColors.greyTextColor),
                        ),
                        onTap: () => adLog('privacyPolicy'),
                      ),
                    ),
                    TextSpan(
                      text: '.',
                      style: ADTextStyle600.size12.setTextColor(
                        context.adColors.neutralInfoMsg,
                      ),
                    ),
                  ],
                ),
              ),
              ADSizedBox(
                height: context.k_40,
              ),

              /// Submit button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: context.adColors.blueColor,
                  // elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(context.k_28),
                  ),
                  minimumSize: const Size(
                    double.infinity,
                    _heightOfSubmitButton,
                  ), //////// HERE
                ),
                onPressed: isValidate ? signupButtonAction : null,
                key: const Key(SignupAutomationKeys.signupButtonKey),
                child: Text(
                  'sign_up'.localize(context),
                  style: ADTextStyle700.size18
                      .setTextColor(context.adColors.whiteTextColor),
                ),
              ),
            ],
          ).paddingAllSide(context.k_14),
          title: 'sign_up'.localize(context),
          leadingTitleTextStyle: ADTextStyle700.size22
              .setTextColor(context.adColors.blackTextColor),
          flexibleTitleTopPadding: context.k_8,
        ),
      ),
    );
  }

  bool validateRegex(String pattern, String value) {
    final RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  /// this widget will return of countryCode
  /// where user set data for countryCode

  Widget editFormOfPhoneNumber() {
    const mobileNumberLength = 10;
    return ADEditableText(
      componentData: ADEditableTextModel(
        controller: mobileNumberController,
        type: ADEditableTextType.defaultTextField,
        readonly: false,
        keyBoardType: TextInputType.number,
        length: mobileNumberLength,
        onChange: () => setState(() {
          isValidate = isValidateAll();
          if (validateRegex(
            phoneNumberPattern,
            mobileNumberController.text,
          )) {
            errorMessageForMobileNumber = '';
          }
        }),
        onClearTextAction: () => setState(() {
          isValidate = isValidateAll();
        }),
        placeHolder: TFTypeEnum.mobileNo.name.localize(context),
        errorMessageColor: context.adColors.importantInfoMsg,
        errorMsgWidget: errorMessageForMobileNumber.isNotEmpty
            ? Text(
                errorMessageForMobileNumber,
                style: ADTextStyle400.size12
                    .setTextColor(context.adColors.importantInfoMsg),
              )
            : null,
        textButtonAction: () => adLog('textButtonAction'),
        onTap: () => adLog('onTap'),
        imageTapped: () => adLog('imageTapped'),
      ),
    );
  }

  Widget editFormOfEmailId() {
    return ADEditableText(
      componentData: ADEditableTextModel(
        controller: emailIdController,
        type: ADEditableTextType.defaultTextField,
        readonly: false,
        onTap: () => adLog('tap'),
        onChange: () => setState(() {
          isValidate = isValidateAll();
          if (validateRegex(emailIdPattern, emailIdController.text)) {
            errorMessageForEmailId = '';
          }
        }),
        onClearTextAction: () => setState(() {
          isValidate = isValidateAll();
        }),
        placeHolder: TFTypeEnum.emailID.name.localize(context),
        errorMessageColor: context.adColors.importantInfoMsg,
        errorMsgWidget: errorMessageForEmailId.isNotEmpty
            ? Text(
                errorMessageForEmailId,
                style: ADTextStyle400.size12
                    .setTextColor(context.adColors.importantInfoMsg),
              )
            : null,
        textButtonAction: () => adLog('textButtonAction'),
        imageTapped: () => adLog('imageTapped'),
      ),
    );
  }

  Widget editFromOfName() {
    return ADEditableText(
      componentData: ADEditableTextModel(
        controller: nameController,
        type: ADEditableTextType.defaultTextField,
        readonly: false,
        onChange: () => setState(() {
          isValidate = isValidateAll();
        }),
        onClearTextAction: () => setState(() {
          isValidate = isValidateAll();
        }),
        placeHolder: TFTypeEnum.fullName.name.localize(context),
        errorMessageColor: context.adColors.importantInfoMsg,
        errorMsgWidget: errorMessageForName.isNotEmpty
            ? Text(
                errorMessageForName,
                style: ADTextStyle400.size12
                    .setTextColor(context.adColors.importantInfoMsg),
              )
            : null,
        textButtonAction: () => adLog('textButtonAction'),
        onTap: () => adLog('onTap'),
        imageTapped: () => adLog('imageTapped'),
      ),
    );
  }

  Widget editFromOfPassword() {
    return ADPasswordEditableText(
      componentData: ADEditableTextModel(
        controller: passwordController,
        type: ADEditableTextType.defaultTextField,
        readonly: false,
        onChange: () => setState(() {
          isValidate = isValidateAll();
          if (validateRegex(
            passwordPattern2,
            passwordController.text,
          )) {
            errorMessageForPassword = '';
          }
        }),
        onClearTextAction: () => setState(() {
          isValidate = isValidateAll();
        }),
        placeHolder: TFTypeEnum.password.name.localize(context),
        errorMessageColor: context.adColors.importantInfoMsg,
        errorMsgWidget: errorMessageForPassword.isNotEmpty
            ? Text(
                errorMessageForPassword,
                style: ADTextStyle400.size12
                    .setTextColor(context.adColors.importantInfoMsg),
              )
            : null,
        textButtonAction: () => adLog('textButtonAction'),
        onTap: () => adLog('onTap'),
        imageTapped: () => adLog('imageTapped'),
      ),
    );
  }

  /// Validations
  bool validateMobile() {
    if (!validateRegex(phoneNumberPattern, mobileNumberController.text)) {
      errorMessageForMobileNumber = 'Please enter valid mobile number';
      return false;
    } else {
      errorMessageForMobileNumber = '';
      return true;
    }
  }

  bool validateEmailId() {
    if (!validateRegex(emailIdPattern, emailIdController.text)) {
      errorMessageForEmailId = 'valid_email_id'.localize(context);
      return false;
    } else {
      errorMessageForEmailId = '';
      return true;
    }
  }

  bool validateName() {
    const String pattern = r'^[a-z A-Z,.\-]+$';
    if (!validateRegex(pattern, nameController.text)) {
      errorMessageForName = 'Please enter valid name';
      return false;
    } else {
      errorMessageForName = '';
      return true;
    }
  }

  bool validatePassword() {
    const String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    if (!validateRegex(pattern, passwordController.text)) {
      errorMessageForPassword =
          'Your password must be at least 8 characters long, one special character, one number and one uppercase.';
      return false;
    } else {
      errorMessageForPassword = '';
      return true;
    }
  }
}
