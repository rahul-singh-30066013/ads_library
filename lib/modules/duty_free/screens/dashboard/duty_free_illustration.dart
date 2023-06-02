/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class DutyFreeIllustration extends StatelessWidget {
  const DutyFreeIllustration({
    Key? key,
    required this.contentData,
  }) : super(key: key);

  final DutyFreeDashboardItem contentData;

  @override
  Widget build(BuildContext context) {
    return (contentData.widgetItems?.isNotEmpty ?? false) ? Column(
      children: [
        ADSizedBox(
          height: contentData.itemMargin?.top.sp ?? 0,
        ),
        if (contentData.widgetItems?.first.title.isNotEmpty ?? false)
          Text(
            contentData.widgetItems?.first.title ?? '',
            style: ADTextStyle700.size22
                .setTextColor(context.adColors.blackTextColor),
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
        if (contentData.widgetItems?.first.title.isNotEmpty ?? false)
          ADSizedBox(
            height: context.k_16,
          ),
        if (contentData.widgetItems?.first.description.isNotEmpty ?? false)
          Text(
            contentData.widgetItems?.first.description ?? '',
            style: ADTextStyle400.size16
                .setTextColor(context.adColors.blackTextColor),
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
        if (contentData.widgetItems?.first.title.isNotEmpty ?? false)
          ADSizedBox(
            height: contentData.subItemMargin?.top.sp ?? 0,
          ),
        ADCachedImage(
          imageUrl: contentData.widgetItems?.first.imageSrc ?? '',
          height: context.widthOfScreen * (contentData.aspectRatio ?? 0),
        ),
        ADSizedBox(
          height: contentData.itemMargin?.bottom.sp ?? 0,
        ),
      ],
    ) : const ADSizedBox.shrink();
  }
}
