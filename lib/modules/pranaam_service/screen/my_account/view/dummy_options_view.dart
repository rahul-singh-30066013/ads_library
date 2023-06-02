/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///Options view which will have options to download invoice, reschedule and cancel
class DummyOptionsView extends StatelessWidget {
  const DummyOptionsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 1,
          color: context.adColors.tileBorderColor,
        ),
        Container(
          color: Colors.transparent,
          margin: EdgeInsets.symmetric(vertical: context.k_16),
          child: Row(
            children: [
              SvgPicture.asset(
                SvgAssets.bottomBarMyOrder,
                color: context.adColors.greyReviewShade,
                height: context.k_16,
                width: context.k_16,
              ).paddingBySide(left: context.k_2),
              ADSizedBox(
                width: context.k_12,
              ),
              Text(
                'downloadInvoice'.localize(context),
                style: ADTextStyle500.size16.setTextColor(
                  context.adColors.greyReviewShade,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: context.k_18,
                color: context.adColors.greyReviewShade,
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          color: context.adColors.tileBorderColor,
        ),
        Column(
          children: [
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.symmetric(vertical: context.k_16),
              child: Row(
                children: [
                  Icon(
                    Icons.refresh_outlined,
                    size: context.k_20,
                    color: context.adColors.greyReviewShade,
                  ),
                  ADSizedBox(
                    width: context.k_12,
                  ),
                  Text(
                    'reschedule'.localize(context),
                    style: ADTextStyle500.size16.setTextColor(
                      context.adColors.greyReviewShade,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: context.k_16,
                    color: context.adColors.greyReviewShade,
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: context.adColors.tileBorderColor,
            ),
            //upgrade
            Row(
              children: [
                Icon(
                  Icons.upgrade_sharp,
                  size: context.k_20,
                  color: context.adColors.greyReviewShade,
                ),
                ADSizedBox(
                  width: context.k_12,
                ),
                Text(
                  'upgrade'.localize(context),
                  style: ADTextStyle500.size16.setTextColor(
                    context.adColors.greyReviewShade,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: context.k_16,
                  color: context.adColors.greyReviewShade,
                ),
              ],
            ).paddingBySide(top: context.k_16, bottom: context.k_16),
            Divider(
              height: 1,
              color: context.adColors.tileBorderColor,
            ),
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.symmetric(vertical: context.k_16),
              child: Row(
                children: [
                  Icon(
                    Icons.cancel_outlined,
                    size: context.k_20,
                    color: context.adColors.greyReviewShade,
                  ),
                  ADSizedBox(
                    width: context.k_12,
                  ),
                  Text(
                    'cancel'.localize(context),
                    style: ADTextStyle500.size16.setTextColor(
                      context.adColors.greyReviewShade,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: context.k_16,
                    color: context.adColors.greyReviewShade,
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: context.adColors.tileBorderColor,
            ),
          ],
        ),
      ],
    ).paddingBySide(left: context.k_16, right: context.k_16);
  }
}
