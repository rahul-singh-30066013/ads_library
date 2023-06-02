/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/duty_free_important_policies_response.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_sheet_header.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class DutyfreeCancellationDateChangePolicies extends StatelessWidget {
  DutyfreeCancellationDateChangePolicies({
    Key? key,
    required this.poiliciesList,
  }) : super(key: key);
  static const Color backgroundColour = Color(0xfff2f3f4);
  final verticalPadding = 20.sp;
  final List<DutyFreeImportantPoliciesResponse> poiliciesList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ADDraggableSheetHeader(
          headerTitle: '',
          closeCallBack: (value) => navigatorPopScreen(context),
        ).paddingBySide(
          left: context.k_4,
          top: context.k_4,
          bottom: context.k_4,
        ),
        Text(
          poiliciesList.first.title,
          style: ADTextStyle700.size22.copyWith(
            color: context.adColors.black,
          ),
          textAlign: TextAlign.left,
        ).paddingBySide(
          bottom: context.k_20,
          left: context.k_20,
          right: context.k_20,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: poiliciesList.length,
          itemBuilder: (context, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: context.k_6,
                    right: context.k_12,
                  ),
                  width: context.k_6,
                  height: context.k_6,
                  decoration: BoxDecoration(
                    color: context.adColors.darkGreyTextColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: poiliciesList[index].line,
                      children: [
                        TextSpan(
                          text: poiliciesList[index].linkText,
                          style: ADTextStyle600.size14
                              .setTextColor(context.adColors.blackTextColor)
                              .copyWith(decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => {
                                  navigateToScreenUsingNamedRouteWithArguments(
                                    context,
                                    webViewContainer,
                                    argumentObject: WebViewModel(
                                      title:
                                          'dutyfree_allowances_customer_information_page'
                                              .localize(context),
                                      url: poiliciesList[index].linkURL,
                                    ),
                                  ),
                                },
                        ),
                      ],
                      style: ADTextStyle400.size16
                          .setTextColor(context.adColors.blackTextColor),
                    ),
                  ),
                ),
              ],
            ).paddingBySide(bottom: context.k_20);
          },
        ).paddingBySide(left: context.k_20, right: context.k_20),
      ],
    );
  }
}
