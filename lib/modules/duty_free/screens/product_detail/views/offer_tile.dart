/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/duty_free_offers_terms_condition.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///creates a tile for offer description with an icon
class OfferTile extends StatelessWidget {
  /// this is used to show the text.
  final String text;
  final List<String>? termsAndCondition;

  const OfferTile({Key? key, this.termsAndCondition, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'lib/assets/images/svg/icons/duty_free/tag.svg',
          color: context.adColors.darkGreyTextColor,
        ).paddingBySide(right: context.k_8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: ADTextStyle400.size16.setTextColor(
                context.adColors.blackTextColor,
              ),
              children: [
                TextSpan(text: text),
                if (termsAndCondition?.isNotEmpty ?? false)
                  WidgetSpan(
                    child: InkWell(
                      onTap: () => tCBottomsSheet(
                        context,
                        termsAndCondition ?? [],
                      ),
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.k_6,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'T_C'.localize(context),
                                    style: ADTextStyle600.size16
                                        .setTextColor(
                                          context.adColors.blackTextColor,
                                        )
                                        .copyWith(
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                  // TextSpan(
                                  //   text: '.',
                                  //   style: ADTextStyle600.size16.setTextColor(
                                  //     context.adColors.blackTextColor,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    ).paddingBySide(top: context.k_10, bottom: context.k_10);
  }

  void tCBottomsSheet(BuildContext context, List<String> terms) =>
      BottomSheetUtils.showDraggableBottomSheetDialog(
        context,
        // ReschedulePage(),
        DutyFreeOffersTermsCondition(
          terms: terms,
        ),
        'terms_and_condition'.localize(context),
      );
}
