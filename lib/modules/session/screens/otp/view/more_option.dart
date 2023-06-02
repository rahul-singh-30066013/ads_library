/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screen_helper/automation_keys/duty_free_cart_automation_keys.dart';
import 'package:adani_airport_mobile/modules/session/state_management/otp_state.dart';
import 'package:adani_airport_mobile/network/web_links/web_links.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// This class is used to show the bottom sheet dialog for send otp medium
class MoreOption extends StatefulWidget {
  ///This is to get the callback on click of reset
  final void Function(String, String, OtpType) resendOtpCallBack;

  final String countryCode;
  final String mobileNumber;
  final OtpState otpState;
  final OtpType otpType;

  const MoreOption({
    Key? key,
    required this.resendOtpCallBack,
    required this.countryCode,
    required this.mobileNumber,
    required this.otpState,
    required this.otpType,
  }) : super(key: key);

  @override
  State<MoreOption> createState() => _MoreOptionState();
}

class _MoreOptionState extends State<MoreOption> {
  final ValueNotifier<OtpType> otpTypeListener =
      ValueNotifier<OtpType>(OtpType.sms);

  @override
  void initState() {
    super.initState();
    otpTypeListener.value = widget.otpType;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.k_20,
          ),
          Text(
            'choose_other_way'
                .localize(context)
                .replaceAll('COUNTRY_CODE', widget.countryCode)
                .replaceAll('MOBILE_NUMBER', widget.mobileNumber),
            textAlign: TextAlign.left,
            style: ADTextStyle400.size16.setTextColor(context.adColors.black),
            key: const Key(
              DutyFreeCartAutomationKeys.dutyFreeRemoveDescriptionTitle,
            ),
          ).paddingBySide(left: context.k_14, right: context.k_16),
          SizedBox(
            height: context.k_10,
          ),
          Text(
            'make_sure_your_notifications_are_turned_on'.localize(context),
            textAlign: TextAlign.left,
            style: ADTextStyle400.size14
                .setTextColor(context.adColors.greyTextColor),
            key: const Key(
              DutyFreeCartAutomationKeys.dutyFreeRemoveDescriptionTitle,
            ),
          ).paddingBySide(left: context.k_16, right: context.k_16),
          SizedBox(
            height: context.k_24,
          ),
          ValueListenableBuilder<OtpType>(
            valueListenable: otpTypeListener,
            builder: (context, otpType, child) => Column(
              children: [
                InkWell(
                  onTap: () => otpTypeListener.value = OtpType.sms,
                  child: Container(
                    child: Row(
                      children: [
                        const Icon(Icons.message_outlined),
                        SizedBox(
                          width: context.k_20,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'text_message_sms'.localize(context),
                                  style: ADTextStyle500.size16
                                      .setTextColor(context.adColors.black),
                                ),
                              ),
                              SizedBox(
                                height: context.k_6,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'we_will_text_you_a_code'.localize(
                                    context,
                                  ),
                                  style: ADTextStyle400.size14
                                      .setTextColor(context.adColors.black),
                                ),
                              ),
                            ],
                          ).paddingBySide(
                            top: context.k_22,
                            bottom: context.k_22,
                          ),
                        ),
                        ADSizedBox(
                          width: context.k_18,
                          child: Radio<OtpType>(
                            fillColor: MaterialStateColor.resolveWith((
                              states,
                            ) {
                              return context.adColors.black;
                            }),
                            value: OtpType.sms,
                            groupValue: otpType,
                            onChanged: (OtpType? value) =>
                                otpTypeListener.value = OtpType.sms,
                          ),
                        ),
                      ],
                    ).paddingBySide(
                      left: context.k_16,
                      right: context.k_16,
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: context.adColors.lightGreyGridSeparatorColor,
                ).paddingBySide(
                  left: context.k_16,
                  right: context.k_16,
                ),
                InkWell(
                  onTap: () => otpTypeListener.value = OtpType.whatsApp,
                  child: Container(
                    child: Row(
                      children: [
                        const Icon(Icons.whatsapp),
                        SizedBox(
                          width: context.k_20,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'whatsApp'.localize(context),
                                  style: ADTextStyle500.size16
                                      .setTextColor(context.adColors.black),
                                ),
                              ),
                              SizedBox(
                                height: context.k_6,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  text: TextSpan(
                                    style: ADTextStyle400.size14.setTextColor(
                                      context.adColors.greyTextColor,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            'byWhatsAppText'.localize(context),
                                      ),
                                      WidgetSpan(
                                        child: InkWell(
                                          child: Text(
                                            'privacyPolicy'.localize(context),
                                            style: ADTextStyle400.size14
                                                .setTextColor(
                                                  context
                                                      .adColors.greyTextColor,
                                                )
                                                .copyWith(
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                          ),
                                          onTap: () =>
                                              navigateToScreenUsingNamedRouteWithArguments(
                                            context,
                                            webViewContainer,
                                            argumentObject: WebViewModel(
                                              title: 'privacyPolicy'.localize(
                                                context,
                                              ),
                                              url:
                                                  '${Environment.instance.configuration.cmsBaseUrl}${WebLinks.privacyPolicy}',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ).paddingBySide(
                            top: context.k_22,
                            bottom: context.k_22,
                          ),
                        ),
                        ADSizedBox(
                          width: context.k_18,
                          child: Radio<OtpType>(
                            fillColor: MaterialStateColor.resolveWith((states) {
                              return context.adColors.black;
                            }),
                            value: OtpType.whatsApp,
                            groupValue: otpType,
                            onChanged: (OtpType? value) =>
                                otpTypeListener.value = OtpType.whatsApp,
                          ),
                        ),
                      ],
                    ).paddingBySide(
                      left: context.k_16,
                      right: context.k_16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.k_30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: context.adColors.blueColor,
              shape: const StadiumBorder(),
            ),
            onPressed: () => _onTap(context),
            child: Center(
              child: Text(
                'resend_otp'.localize(context),
                style: ADTextStyle700.size18.setTextColor(
                  context.adColors.whiteTextColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ).paddingBySide(
              top: context.k_16,
              bottom: context.k_18,
            ),
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            bottom: context.k_30,
          ),
        ],
      ),
    );
  }

  void _onTap(BuildContext context) {
    widget.otpState.moreOptionResendState = ADResponseState.loading();
    widget.resendOtpCallBack(
      widget.mobileNumber,
      widget.countryCode,
      otpTypeListener.value,
    );
    navigatorPopScreen(context);
  }
}
