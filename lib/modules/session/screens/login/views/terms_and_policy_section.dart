/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/network/web_links/web_links.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class TermsAndPolicySection extends StatelessWidget {
  const TermsAndPolicySection({Key? key}) : super(key: key);
  static const double textHeight = 1.3;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style:
            ADTextStyle400.size14.setTextColor(context.adColors.blackTextColor),
        children: [
          TextSpan(
            text: 'bySigningText'.localize(context),
          ),
          WidgetSpan(
            child: InkWell(
              // key: const Key(SignupAutomationKeys.termsButtonKey),
              child: Text(
                'T_C'.localize(context),
                style: ADTextStyle600.size14
                    .setTextColor(context.adColors.blackTextColor)
                    .copyWith(
                      decoration: TextDecoration.underline,
                    ),
              ),
              onTap: () => navigateToScreenUsingNamedRouteWithArguments(
                context,
                webViewContainer,
                argumentObject: WebViewModel(
                  title: 'terms_and_condition'.localize(context),
                  url:
                      '${Environment.instance.configuration.cmsBaseUrl}${WebLinks.termsAndConditions}',
                ),

                ///TODO for temporary,
              ),
            ),
          ),
          TextSpan(
            text: 'and'.localize(context),
          ),
          WidgetSpan(
            child: InkWell(
              // key: const Key(SignupAutomationKeys.policyButtonKey),
              child: Text(
                'privacyPolicy'.localize(context),
                style: ADTextStyle600.size14
                    .setTextColor(context.adColors.blackTextColor)
                    .copyWith(
                      decoration: TextDecoration.underline,
                      height: textHeight,
                    ),
              ),
              onTap: () => navigateToScreenUsingNamedRouteWithArguments(
                context,
                webViewContainer,
                argumentObject: WebViewModel(
                  title: 'privacyPolicy'.localize(context),
                  url:
                      '${Environment.instance.configuration.cmsBaseUrl}${WebLinks.privacyPolicy}',
                ),

                ///TODO for temporary,
              ),
            ),
          ),
          TextSpan(
            text: '.',
            style: ADTextStyle600.size14.setTextColor(
              context.adColors.blackTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
