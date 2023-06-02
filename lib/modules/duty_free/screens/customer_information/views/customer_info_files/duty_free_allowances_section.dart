/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/duty_free_important_policies_response.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class DutyfreeAllowancesSection extends StatelessWidget {
  DutyfreeAllowancesSection({Key? key, required this.policiesList})
      : super(key: key);
  static const Color backgroundColour = Color(0xfff2f3f4);
  final verticalPadding = 20.sp;
  final double textHeight = 1.3.sp;
  final List<DutyFreeImportantPoliciesResponse> policiesList;

  @override
  Widget build(BuildContext context) {
    return policiesList.isEmpty
        ? ADSizedBox(
            height: context.k_14,
          )
        : Container(
            padding: EdgeInsets.only(top: context.k_14, bottom: context.k_10),
            margin: EdgeInsets.symmetric(vertical: verticalPadding),
            // height: 215,
            // width: 343,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'importantInformation'.localize(context),
                  style: ADTextStyle700.size22.copyWith(
                    color: context.adColors.black,
                  ),
                  textAlign: TextAlign.left,
                ).paddingBySide(bottom: context.k_20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: policiesList.length,
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
                              text: policiesList[index].line,
                              children: [
                                TextSpan(
                                  text: policiesList[index].linkText,
                                  style: ADTextStyle600.size14
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
                                              title: 'importantInformation'
                                                  .localize(context),
                                              url:
                                                  '${policiesList[index].linkURL}?isapp=true',
                                            ),
                                          ),
                                        },
                                ),
                              ],
                              style: ADTextStyle400.size14
                                  .setTextColor(context.adColors.blackTextColor)
                                  .copyWith(height: textHeight),
                            ),
                          ),
                        ),
                      ],
                    ).paddingBySide(bottom: context.k_20);
                  },
                ),
                // if (showAllowances)
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Container(
                //       margin: EdgeInsets.only(
                //         top: context.k_6,
                //         right: context.k_12,
                //       ),
                //       width: context.k_6,
                //       height: context.k_6,
                //       decoration: BoxDecoration(
                //         color: context.adColors.darkGreyTextColor,
                //         shape: BoxShape.circle,
                //       ),
                //     ),
                //     Expanded(
                //       child: RichText(
                //         text: TextSpan(
                //           text:
                //               '${'destination_dutyfree_allowances_customer_information_page'.localize(context)} ',
                //           children: [
                //             TextSpan(
                //               text: 'dutyfree_allowances_customer_information_page'
                //                   .localize(context),
                //               style: ADTextStyle600.size14
                //                   .setTextColor(context.adColors.blackTextColor)
                //                   .copyWith(decoration: TextDecoration.underline),
                //               recognizer: TapGestureRecognizer()
                //                 ..onTap = () => {
                //                       navigateToScreenUsingNamedRouteWithArguments(
                //                         context,
                //                         webViewContainer,
                //                         argumentObject: WebViewModel(
                //                           title:
                //                               'dutyfree_allowances_customer_information_page'
                //                                   .localize(context),
                //                           url:
                //                               '${Environment.instance.configuration.cmsBaseUrl}${WebLinks.customsAllowanceDutyfree}',
                //                         ),
                //                       ),
                //                     },
                //             ),
                //           ],
                //           style: ADTextStyle400.size14
                //               .setTextColor(context.adColors.blackTextColor),
                //         ),
                //       ),
                //     ),
                //   ],
                // ).paddingBySide(bottom: context.k_20),
                //
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Container(
                //       margin: EdgeInsets.only(
                //         top: context.k_6,
                //         right: context.k_12,
                //       ),
                //       width: context.k_6,
                //       height: context.k_6,
                //       decoration: BoxDecoration(
                //         color: context.adColors.darkGreyTextColor,
                //         shape: BoxShape.circle,
                //       ),
                //     ),
                //     Expanded(
                //       child: RichText(
                //         text: TextSpan(
                //           text:
                //               '${'baggage_rules_customer_information_page'.localize(context)} ',
                //           children: [
                //             TextSpan(
                //               text: 'click_here_customer_information_page'
                //                   .localize(context),
                //               style: ADTextStyle600.size14
                //                   .setTextColor(context.adColors.black)
                //                   .copyWith(decoration: TextDecoration.underline),
                //               recognizer: TapGestureRecognizer()
                //                 ..onTap = () => {
                //                       navigateToScreenUsingNamedRouteWithArguments(
                //                         context,
                //                         webViewContainer,
                //                         argumentObject: WebViewModel(
                //                           title: 'baggage_rules_click_here'
                //                               .localize(context),
                //                          url: '${Platform.isAndroid?'https://drive.google.com/viewerng/viewer?embedded=true&url=':''}${WebLinks.baggageAllowanceDutyfree}',
                //                         ),
                //                       ),
                //                     },
                //             ),
                //           ],
                //           style: ADTextStyle400.size14
                //               .setTextColor(context.adColors.black),
                //
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // ADSizedBox(
                //   height: context.k_20,
                // ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Container(
                //       margin: EdgeInsets.only(
                //         top: context.k_6,
                //         right: context.k_12,
                //       ),
                //       width: context.k_6,
                //       height: context.k_6,
                //       decoration: BoxDecoration(
                //         color: context.adColors.darkGreyTextColor,
                //         shape: BoxShape.circle,
                //       ),
                //     ),
                //     Expanded(
                //       child: RichText(
                //         text: TextSpan(
                //           text:
                //           '${'duty_free_information_data'.localize(context)} ',
                //
                //           style: ADTextStyle400.size14
                //               .setTextColor(context.adColors.blackTextColor),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          );
  }
}
