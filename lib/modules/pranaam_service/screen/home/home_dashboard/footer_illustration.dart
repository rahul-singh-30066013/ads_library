/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart'
    as pranaam_dashboard;
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class FooterIllustration extends StatelessWidget {
  const FooterIllustration({
    Key? key,
    required this.contentData,
    this.onTapHandler,
  }) : super(key: key);

  final pranaam_dashboard.DashboardItem contentData;
  final ADTapCallbackWithValue? onTapHandler;
  @override
  Widget build(BuildContext context) {
    return contentData.widgetItems.isNotEmpty
        ? Column(
            children: [
              ADSizedBox(
                height: contentData.itemMargin.top.sp,
              ),
              GestureDetector(
                //onTap: () => onTapHandler?.call(contentData),
                child: Stack(
                  children: [
                    _CustomBanner(
                      contentData: contentData,
                    ),
                    if ((contentData.widgetItems.first.title.isNotEmpty) ||
                        (contentData
                            .widgetItems.first.description.isNotEmpty) ||
                        (contentData.widgetItems.first.subTitle.isNotEmpty))
                      Positioned(
                        top: context.k_24,
                        left: context.k_24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              contentData.widgetItems.first.title,
                              style: ADTextStyle700.size28.setTextColor(
                                context.adColors.blackTextColor,
                              ),
                            ),
                            ADSizedBox(
                              height: context.k_10,
                            ),
                            Text(
                              contentData.widgetItems.first.description,
                              style: ADTextStyle400.size16.setTextColor(
                                context.adColors.blackTextColor,
                              ),
                            ),
                            ADSizedBox(
                              height: context.k_10,
                            ),
                            ElevatedButton(
                              onPressed: () => onTapHandler?.call(contentData),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: context.adColors.blackTextColor,
                                shape: const StadiumBorder(),
                              ),
                              child: Center(
                                child: Text(
                                  contentData.widgetItems.first.subTitle,
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
                height: contentData.itemMargin.bottom.sp,
              ),
            ],
          )
        : const ADSizedBox.shrink();
  }
}

class _CustomBanner extends StatelessWidget {
  const _CustomBanner({
    Key? key,
    required this.contentData,
  }) : super(key: key);

  final pranaam_dashboard.DashboardItem contentData;

  double _itemWidthBasedOnType(BuildContext context) {
    return context.widthOfScreen -
        ((contentData.itemMargin.left) +
            (contentData.itemMargin.right) +
            (contentData.subItemMargin.left) +
            (contentData.subItemMargin.right));
  }

  @override
  Widget build(BuildContext context) {
    final itemWidth = _itemWidthBasedOnType(context);
    final itemHeight = itemWidth * (contentData.aspectRatio); //1.07

    if ((contentData.widgetItems).isNotEmpty) {
      final item = (contentData.widgetItems).first;
      return Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: context.adColors.containerGreyBg,
          borderRadius: BorderRadius.circular(
            context.scaled(
              contentData.subItemRadius,
            ),
          ),
          boxShadow: [
            BoxShadow(color: context.adColors.lightGreyGridSeparatorColor),
          ],
        ),
        width: itemWidth,
        height: itemHeight,
        margin: EdgeInsets.all(contentData.subItemMargin.left.sp),
        child: Utils.startsWithHttp(item.imageSrc)
            ? ADCachedImage(
                imageUrl: item.mobileImage,
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
