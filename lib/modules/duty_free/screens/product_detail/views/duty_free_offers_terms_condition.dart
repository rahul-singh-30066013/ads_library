/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// Help on order detail / confirmation page
class DutyFreeOffersTermsCondition extends StatelessWidget {
  final List<String> terms;
  const DutyFreeOffersTermsCondition({Key? key, required this.terms})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: context.k_30),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: terms.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: context.k_6,
              width: context.k_6,
              margin: EdgeInsets.only(
                left: context.k_16,
                right: context.k_2,
                top: context.k_16,
              ),
              decoration: BoxDecoration(
                color: context.adColors.darkGreyTextColor,
                shape: BoxShape.circle,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.k_16,
                  vertical: context.k_6,
                ),
                margin: const EdgeInsets.symmetric(),
                // color: Colors.blue,
                child: Text(
                  terms[index],
                  style: ADTextStyle400.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
