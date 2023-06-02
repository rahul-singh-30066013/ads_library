/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/widget_type.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class DutyFreeADBannerView extends StatelessWidget {
  const DutyFreeADBannerView({
    Key? key,
    required this.bannerType,
    required this.contentData,
    required this.onTapHandler,
  }) : super(key: key);

  final DutyFreeDashboardItem contentData;

  final ADTapCallbackWithValue onTapHandler;

  final WidgetType bannerType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: contentData.itemMargin?.left.sp ?? 0,
        right: contentData.itemMargin?.right.sp ?? 0,
      ),
      child: Column(
        children: [
          ADSizedBox(
            height: contentData.itemMargin?.top.sp ?? 0,
          ),
          CustomBanner(
            contentData: contentData,
            onTapHandler: onTapHandler,
          ),
          ADSizedBox(
            height: contentData.itemMargin?.bottom.sp ?? 0,
          ),
        ],
      ),
    );
  }
}

class CustomBanner extends StatelessWidget {
  const CustomBanner({
    Key? key,
    required this.contentData,
    required this.onTapHandler,
  }) : super(key: key);

  final DutyFreeDashboardItem contentData;
  final ADTapCallbackWithValue? onTapHandler;

  static const kBannerSide = 2;

  double _itemWidthBasedOnType(BuildContext context) {
    final width = context.widthOfScreen -
        ((contentData.itemMargin?.left ?? 0) +
            (contentData.itemMargin?.right ?? 0));
    return width -
        ((contentData.subItemMargin?.left ?? 0) * CustomBanner.kBannerSide);
  }

  @override
  Widget build(BuildContext context) {
    final itemWidth = _itemWidthBasedOnType(context);
    final itemHeight = itemWidth * (contentData.aspectRatio ?? 0);

    if (contentData.widgetItems != null &&
        (contentData.widgetItems ?? []).isNotEmpty) {
      final item = (contentData.widgetItems ?? []).first;
      return TouchableOpacity(
        onTap: () => onTapHandler?.call(item),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(contentData.subItemRadius?.sp ?? 0),
            boxShadow: [
              BoxShadow(
                color: context.adColors.lightGreyGridSeparatorColor,
              ),
            ],
          ),
          width: itemWidth,
          height: itemHeight,
          margin: EdgeInsets.only(
            left: contentData.subItemMargin?.left.sp ?? 0,
            top: contentData.subItemMargin?.top.sp ?? 0,
            right: contentData.subItemMargin?.right.sp ?? 0,
            bottom: contentData.subItemMargin?.bottom.sp ?? 0,
          ),
          child: DefaultImageWidget(
            item: item,
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}

class DefaultImageWidget extends StatelessWidget {
  const DefaultImageWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final DutyFreeItem item;

  @override
  Widget build(BuildContext context) {
    return Utils.startsWithHttp(item.imageSrc)
        ? ADCachedImage(
            imageUrl: item.imageSrc,
          )
        : Image.asset(
            item.imageSrc,
            fit: BoxFit.cover,
          );
  }
}
