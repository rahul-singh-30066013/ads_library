/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_editable_text_type.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/ad_password_editable_text.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_validations.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/utils/verify_email_call_back_model.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/views/change_profile_template.dart';
import 'package:adani_airport_mobile/modules/more/state_management/change_email_state.dart';
import 'package:adani_airport_mobile/modules/session/models/request/send_email_otp_request.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen({
    Key? key,
    required this.emailId,
    this.fromChangeScreen,
    required this.verifyEmail,
    required this.fromBottomSheet,
  }) : super(key: key);

  final String emailId;
  final bool? fromChangeScreen;
  final bool? fromBottomSheet;
  final ADTapCallbackWithValue verifyEmail;

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  ChangeEmailState changeState = ChangeEmailState();

  @override
  void initState() {
    ClickEvents.email_change.logEvent(
      parameters: {
        Parameters.category.name: 'profile',
        Parameters.sub_category.name: 'email_verify',
      },
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget(
      viewModel: changeState,
      child: Selector<ChangeEmailState, ADResponseState>(
        selector: (context, viewModel) => viewModel.changeResponseState,
        builder: (context, valueParent, Widget? child) {
          return AbsorbPointer(
            absorbing: valueParent.viewStatus == Status.loading,
            child: ChangeProfileTemplate(
              title: 'change_email_id'.localize(context),
              subtitle: 'new_email_otp'.localize(context),

              ///TODO:Add email textfield
              child: Form(
                key: _formKey,
                child: Selector<ChangeEmailState, String?>(
                  selector: (context, stateClass) =>
                      stateClass.errorMessageEmailAlreadyExit,
                  builder: (
                    BuildContext context,
                    resultValue,
                    Widget? child,
                  ) {
                    return ADEditableText(
                      componentData: ADEditableTextModel(
                        controller: emailController..text,
                        placeHolder: 'email_id_capital',
                        errorMessage: 'enter_email',
                        onChange: () => {
                          context.read<ChangeEmailState>()
                            ..errorMessageEmailAlreadyExit = ''
                            ..notifyListeners(),
                        },
                        onClearTextAction: () {
                          //TODO
                        },
                        readonly: false,
                        style: ADTextStyle500.size16,
                        type: ADEditableTextType.defaultTextField,
                        keyBoardType: TextInputType.emailAddress,
                        errorMessageColor: ADColors.red.shade900,
                        textInputAction: TextInputAction.done,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(RegExp(' ')),
                        ],
                        validation: (String? value) =>
                            FlightValidations.validateEmailIdForChangeEmail(
                          value ?? '',
                          context
                              .read<ChangeEmailState>()
                              .errorMessageEmailAlreadyExit,
                        ),
                      ),
                    );
                  },
                ),
              ),
              onTap: () => validateEmailAndContinue(context),
            ),
          );
        },
      ),
    );
  }

  void validateEmailAndContinue(BuildContext context) {
    if (_formKey.currentState?.validate() == true) {
      _emailOtpApiCall(emailController.text, context);
    }
  }

  void _emailOtpApiCall(String email, BuildContext context) {
    context.read<ChangeEmailState>()
      ..errorMessageEmailAlreadyExit = ''
      ..notifyListeners();
    ClickEvents.otp_verification.logEvent(
      parameters: {
        Parameters.category.name: 'profile',
        Parameters.sub_category.name: 'email_verify',
        Parameters.type.name: 'email_change',
      },
    );
    ClickEvents.submit_email.logEvent(
      parameters: {
        Parameters.category.name: 'profile',
        Parameters.sub_category.name: 'email_verify',
        Parameters.type.name: 'email_change',
      },
    );
    final SendEmailOtpRequest request = SendEmailOtpRequest(
      email.trim(),
    );
    changeState
        .sendEmailOtp(
      sendEmailOtpRequest: request,
    )
        .then((value) {
      if (value.viewStatus == Status.complete) {
        String sourceId = '';
        if (value.header != null) {
          final List<String> source = value.header?['source'] ?? [];
          if (source.isNotEmpty) {
            sourceId = source.first;
          }
        }
        navigateToScreenUsingNamedRouteWithArguments(
          context,
          verifyEmail,
          argumentObject: VerifyEmailCallBackModel(
            emailIdControllerValue: emailController.text,
            changeScreenValue: true,
            emailVerify: widget.verifyEmail,
            sourceId: sourceId,
            fromBottomSheet: widget.fromBottomSheet,
          ),
        );
        ClickEvents.submit_email_success.logEvent(
          parameters: {
            Parameters.category.name: 'profile',
            Parameters.sub_category.name: 'email_verify',
            Parameters.type.name: 'email_change',
          },
        );
      } else {
        if (value.errorCode == 'IDTOTPEmail03') {
          changeState
            ..errorMessageEmailAlreadyExit = value.message ?? ''
            ..notifyListeners();
          final data = _formKey.currentState?.validate() == true;
          adLog(data.toString());
        } else {
          showToast(
            context,
            context.adColors.black,
            '',
            Text(
              value.message ?? '',
              style: ADTextStyle600.size14.copyWith(color: ADColors.white),
            ),
          );
        }
      }
    });
  }

  void showToast(
    BuildContext context,
    Color? color,
    String? iconPath,
    Widget textWidget, {
    int? toastDuration,
  }) {
    Widget text;
    text = textWidget is Text
        ? Text(
            textWidget.data ?? '',
            style: ADTextStyle400.size14.copyWith(color: ADColors.white),
          )
        : textWidget;

    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.k_8),
      ),
      margin: EdgeInsets.only(
        bottom: context.k_60,
        left: context.k_16,
        right: context.k_16,
      ),
      backgroundColor: color,
      duration: Duration(seconds: toastDuration ?? 3),
      content: Row(
        children: [
          IconFromAsset(
            iconPath: iconPath ?? SvgAssets.icCircleSuccess,
            height: context.scaled(20),
            width: context.scaled(20),
          ),
          ADSizedBox(
            width: context.k_10,
          ),
          // getSizedBoxWithWidth(context.scaled(12)),
          Expanded(child: text),
        ],
      ),
    );
    final valueOfSnack = ScaffoldMessenger.of(context).showSnackBar(snackBar);
    adLog(valueOfSnack.toString());
  }
}
