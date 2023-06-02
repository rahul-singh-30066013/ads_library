/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

const mediumPink = Color(0xffed5a6b);
const white = Color(0xfff9f9f9);
final double constant_48 = 48.sp;

///This class is for creating circle with a notification badge.
///it requires
///item of type Item
///aspectRatio for creating circle accordingly.
class CircleWithLeftNotification extends StatelessWidget {
  final WidgetItem item;
  final double aspectRatio;
  final ADTapCallback adTapCallback;

  const CircleWithLeftNotification({
    Key? key,
    required this.item,
    required this.aspectRatio,
    required this.adTapCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final dynamicSize = context.widthOfScreen * aspectRatio;
    return GestureDetector(
      onTap: adTapCallback,
      child: SizedBox(
        height: dynamicSize,
        width: dynamicSize,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: context.k_12),
                  height: dynamicSize,
                  width: dynamicSize,
                  child: Image.network(
                    item.imgSrc,
                  ),
                ),
                // Positioned(
                //   left: context.k_4,
                //   top: context.k_10,
                //   child: CircleAvatar(
                //     radius: context.k_14,
                //     backgroundColor: mediumPink,
                //     child: Text(
                //       item.value.toString(),
                //       style: ADTextStyle400.size14
                //           .setTextColor(context.adColors.whiteTextColor),
                //     ),
                //   ),
                // ),
              ],
            ),
            Text(
              '${'Step'.toUpperCase()} ${item.value}',
              style: ADTextStyle400.size12,
            ),
            Expanded(
              child: Text(
                item.title,
                style: ADTextStyle500.size16
                    .setTextColor(context.adColors.blackTextColor),
                textAlign: TextAlign.center,
              ).paddingBySide(
                left: context.k_12,
                right: context.k_10,
                top: context.k_8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
