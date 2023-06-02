/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/components/coming_soon.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_dashboard_builder.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/scroll_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

ColorFilter greyscale = const ColorFilter.matrix(<double>[
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
]);

class GridServicesTileWidget extends StatelessWidget {
  const GridServicesTileWidget({
    Key? key,
    required this.dashBoardItem,
    required this.onTapHandler,
  }) : super(key: key);

  ///a function in which we will write the click functionality
  final ADTapCallbackWithValue? onTapHandler;

  ///this is used to represent dashboard item
  final DutyFreeDashboardItem dashBoardItem;

  @override
  Widget build(BuildContext context) {
    return ScrollGridView(
      content: dashBoardItem,
      children:
          (dashBoardItem.widgetItems ?? [] as List<DutyFreeItem>).map((data) {
        final width = 90.sp;
        const maxLines = 2;
        return TouchableOpacity(
          onTap: () => {
            onTapHandler?.call(data),
            HapticFeedback.lightImpact(),
          },
          child: Column(
            children: [
              Visibility(
                visible: data.tagName?.name?.isNotEmpty ?? false,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: ComingSoon(
                  tagName: data.tagName?.name,
                  textColor: data.tagName?.textColor,
                  backgroundColor: data.tagName?.backgroundColor,
                ),
              ).paddingBySide(bottom: context.k_6),
              Container(
                width: width,
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    color: const Color(0xffEAEBED),

                    ///TODO
                    shape: dashBoardItem.enableCircle ||
                            data.uniqueId.contains('100')
                        ? BoxShape.circle
                        : BoxShape.rectangle,
                  ),
                  height: width,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (data.uniqueId.contains('100'))
                        Center(
                          child: SvgPicture.asset(
                            SvgAssets.bottomBarServices,
                            height: context.k_20,
                            width: context.k_20,
                            color: const Color(0xff555555),
                          ),
                        ),
                      if (!data.uniqueId.contains('100'))
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            ColorFiltered(
                              colorFilter:
                                  data.uniqueId.isEmpty && data.ctaUrl.isEmpty
                                      ? /*greyscale*/ const ColorFilter.mode(
                                          Colors.transparent,
                                          BlendMode.multiply,
                                        )
                                      : const ColorFilter.mode(
                                          Colors.transparent,
                                          BlendMode.multiply,
                                        ),
                              child: ADCachedImage(
                                height: width,
                                width: width,
                                imageUrl: data.imageSrc,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                data.title,
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
                style: ADTextStyle400.size14.copyWith(
                  color: const Color(0xff222222),
                  fontSize: fifteenFontSize,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
