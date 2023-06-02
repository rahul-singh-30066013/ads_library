/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

final double _endMargin = 30.sp;
final double _topMargin = 20.sp;

class DashboardCovidBannerView extends StatelessWidget {
  const DashboardCovidBannerView({
    Key? key,
    required this.contentData,
    this.onTapHandler,
  }) : super(key: key);

  final DutyFreeDashboardItem contentData;

  final ADTapCallbackWithValue? onTapHandler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapHandler?.call(contentData.widgetItems?.first),
      child: Container(
        color: context.adColors.containerGreyBg,
        margin: EdgeInsets.only(
          left: contentData.itemMargin?.left ?? 0,
          right: contentData.itemMargin?.right ?? 0,
          top: contentData.itemMargin?.top ?? 0,
          bottom: contentData.itemMargin?.bottom ?? 0,
        ),
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: context.adColors.containerGreyBg,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    context.scaled(
                      contentData.subItemRadius ?? 0,
                    ),
                  ),
                ),
              ),
              width: context.widthOfScreen,
              height: context.widthOfScreen * (contentData.aspectRatio ?? 1),
              child: DefaultImageWidget(
                item: contentData.widgetItems?.first,
              ),
            ),
            PositionedDirectional(
              end: _endMargin,
              top: _topMargin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contentData.widgetItems?.first.title.split('|').first ?? '',
                    style: ADTextStyle700.size16.setTextColor(
                      context.adColors.whiteTextColor,
                    ),
                  ),
                  ADSizedBox(
                    height: context.k_12,
                  ),
                  Text(
                    'knowMore'.localize(context),
                    style: ADTextStyle400.size16
                        .setTextColor(context.adColors.whiteTextColor)
                        .copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DefaultImageWidget extends StatelessWidget {
  const DefaultImageWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final DutyFreeItem? item;

  @override
  Widget build(BuildContext context) {
    return Utils.startsWithHttp(item?.imageSrc)
        ? ADCachedImage(
            maxWidthDiskCache: context.widthOfScreen.toInt(),
            imageUrl: item?.imageSrc ?? '',
          )
        : Image.asset(
            item?.imageSrc ?? '',
            fit: BoxFit.cover,
          );
  }
}
