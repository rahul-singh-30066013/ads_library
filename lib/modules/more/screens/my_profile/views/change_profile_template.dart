/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/more/state_management/change_email_state.dart';
import 'package:adani_airport_mobile/network/web_links/web_links.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class ChangeProfileTemplate extends StatelessWidget {
  const ChangeProfileTemplate({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Widget child;
  final ADTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.adColors.whiteTextColor,
      appBar: AppBar(
        backgroundColor: context.adColors.whiteTextColor,
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => navigatorPopScreen(context),
          child: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back_outlined,
            size: context.k_20,
          ),
        ).paddingBySide(left: context.k_10, right: context.k_10),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: ADTextStyle700.size32.setTextColor(
              context.adColors.black,
            ),
          ),
          SizedBox(
            height: context.k_10,
          ),
          Text(
            subtitle,
            style: ADTextStyle400.size16.setTextColor(
              context.adColors.black,
            ),
          ),
          SizedBox(
            height: context.k_40,
          ),
          child,
          SizedBox(
            height: context.k_40,
          ),
          Selector<ChangeEmailState, ADResponseState>(
            selector: (context, viewModel) => viewModel.changeResponseState,
            builder: (context, valueParent, Widget? child) {
              return ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  shadowColor: context.adColors.transparentColor,
                  shape: const StadiumBorder(),
                ),
                child: Container(
                  height: context.scaled(context.k_48),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: valueParent.viewStatus == Status.loading
                      ? ADDotProgressView(
                          color: context.adColors.whiteTextColor,
                        )
                      : Text(
                          'send_otp'.localize(context),
                          style: ADTextStyle700.size16
                              .setTextColor(context.adColors.whiteTextColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ).paddingBySide(
                          top: context.k_11,
                          bottom: context.k_11,
                        ),
                ),
              );
            },
          ),
          SizedBox(
            height: context.k_40,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'terms_and_condition_content'.localize(context),
                    style: ADTextStyle400.size12.setTextColor(
                      context.adColors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'termsOfUse'.localize(context),
                    style: ADTextStyle600.size12
                        .setTextColor(
                          context.adColors.blackTextColor,
                        )
                        .copyWith(
                          decoration: TextDecoration.underline,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => {
                            navigateToScreenUsingNamedRouteWithArguments(
                              context,
                              webViewContainer,
                              argumentObject: WebViewModel(
                                title: 'terms_and_condition'.localize(context),
                                url:
                                    '${Environment.instance.configuration.cmsBaseUrl}${WebLinks.termsAndConditions}',
                              ),

                              ///TODO for temporary,
                            ),
                          },
                  ),
                  TextSpan(
                    text: 'and'.localize(context),
                    style: ADTextStyle400.size12.setTextColor(
                      context.adColors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'privacyPolicy'.localize(context),
                    style: ADTextStyle600.size12
                        .setTextColor(
                          context.adColors.blackTextColor,
                        )
                        .copyWith(
                          decoration: TextDecoration.underline,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => {
                            navigateToScreenUsingNamedRouteWithArguments(
                              context,
                              webViewContainer,
                              argumentObject: WebViewModel(
                                title: 'privacyPolicy'.localize(context),
                                url:
                                    '${Environment.instance.configuration.cmsBaseUrl}${WebLinks.privacyPolicy}',
                              ),

                              ///TODO for temporary,
                            ),
                          },
                  ),
                  TextSpan(
                    text: '.',
                    style: ADTextStyle400.size12.setTextColor(
                      context.adColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ).paddingBySide(
        left: context.k_16,
        right: context.k_16,
      ),
    );
  }
}
