/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class FlightBannerView extends StatelessWidget {
  const FlightBannerView({
    Key? key,
    required this.contentData,
    required this.onTapHandler,
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
        GestureDetector(
          onTap: () => onTapHandler?.call(contentData),
          child: Stack(
            children: [
              CustomBanner(
                contentData: contentData,
              ),
              if ((contentData.widgetItems?.first.title.isNotEmpty ?? false) ||
                  (contentData.widgetItems?.first.description.isNotEmpty ??
                      false) ||
                  (contentData.widgetItems?.first.subTitle.isNotEmpty ?? false))
                Positioned(
                  top: context.k_24,
                  left: context.k_24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contentData.widgetItems?.first.title ?? '',
                        style: ADTextStyle700.size28
                            .setTextColor(context.adColors.blackTextColor),
                      ),
                      ADSizedBox(
                        height: context.k_10,
                      ),
                      Text(
                        contentData.widgetItems?.first.description ?? '',
                        style: ADTextStyle400.size16
                            .setTextColor(context.adColors.blackTextColor),
                      ),
                      ADSizedBox(
                        height: context.k_10,
                      ),
                      ElevatedButton(
                        onPressed: () => onTapHandler?.call(contentData),
                        style: ElevatedButton.styleFrom(
                          primary: context.adColors.blackTextColor,
                          shape: const StadiumBorder(),
                        ),
                        child: Center(
                          child: Text(
                            contentData.widgetItems?.first.subTitle ??
                                'view_more'.localize(context),
                            style: ADTextStyle700.size16.setTextColor(
                              context.adColors.whiteTextColor,
                            ),
                          ).paddingAllSide(context.k_12),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        ADSizedBox(
          height: contentData.itemMargin?.bottom.sp ?? 0,
        ),
      ],
    );
  }
}

class CustomBanner extends StatelessWidget {
  const CustomBanner({
    Key? key,
    required this.contentData,
  }) : super(key: key);

  final DutyFreeDashboardItem contentData;

  double _itemWidthBasedOnType(BuildContext context) {
    return context.widthOfScreen -
        ((contentData.itemMargin?.left ?? 0) +
            (contentData.itemMargin?.right ?? 0) +
            (contentData.subItemMargin?.left ?? 0) +
            (contentData.subItemMargin?.right ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    final itemWidth = _itemWidthBasedOnType(context);
    final itemHeight = itemWidth * (contentData.aspectRatio ?? 0); //1.07

    if (contentData.widgetItems != null &&
        (contentData.widgetItems ?? []).isNotEmpty) {
      final item = (contentData.widgetItems ?? []).first;
      return Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: context.adColors.containerGreyBg,
          borderRadius: BorderRadius.circular(
            context.scaled(
              contentData.subItemRadius ?? 0,
            ),
          ),
          boxShadow: [
            BoxShadow(color: context.adColors.lightGreyGridSeparatorColor),
          ],
        ),
        width: itemWidth,
        height: itemHeight,
        margin: EdgeInsets.all(contentData.subItemMargin?.left.sp ?? 0),
        child: Utils.startsWithHttp(item.imageSrc)
            ? ADCachedImage(
                imageUrl: item.imageSrc,
              )
            : Image.asset(
                item.imageSrc,
                fit: BoxFit.cover,
              ),
      );
    } else {
      return const SizedBox();
    }
  }
}
