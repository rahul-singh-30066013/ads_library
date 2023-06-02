/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class HelpUsImproveWidget extends StatelessWidget {
  const HelpUsImproveWidget({
    Key? key,
    required this.contentData,
    this.onTapHandler,
  }) : super(key: key);

  final DutyFreeDashboardItem contentData;

  final ADTapCallbackWithValue? onTapHandler;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ADSizedBox(
          height: contentData.itemMargin?.top.sp ?? 0,
        ),
        Container(
          color: context.adColors.containerGreyBg,
          child: Padding(
            padding: EdgeInsets.only(
              left: contentData.subItemMargin?.left.sp ?? 0,
              right: contentData.subItemMargin?.right.sp ?? 0,
              top: contentData.subItemMargin?.top.sp ?? 0,
              bottom: contentData.subItemMargin?.bottom.sp ?? 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contentData.widgetItems?.first.title ?? '',
                  style: ADTextStyle700.size22
                      .setTextColor(context.adColors.blackTextColor),
                ),
                ADSizedBox(
                  height: context.k_10,
                ),
                GestureDetector(
                  onTap: () =>
                      onTapHandler?.call(contentData.widgetItems?.first),
                  child: Row(
                    children: [
                      Text(
                        contentData.widgetItems?.first.subTitle ?? '',
                        style: ADTextStyle500.size16.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: context.k_20,
                        color: context.adColors.blackTextColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        ADSizedBox(
          height: contentData.itemMargin?.bottom.sp ?? 0,
        ),
      ],
    );
  }
}
