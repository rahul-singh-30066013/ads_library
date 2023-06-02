/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/views/image_with_text.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

const maxLines = 2;

class ImageWithTextList extends StatelessWidget {
  const ImageWithTextList({
    Key? key,
    required this.dutyFreeDashboardItem,
    required this.themeEnabled,
    this.onTapHandler,
    this.onPressed,
  }) : super(key: key);

  ///Data Source
  final DutyFreeDashboardItem dutyFreeDashboardItem;

  ///a function in which we will write the click functionality
  final ADTapCallbackWithValue? onTapHandler;

  final Function()? onPressed;

  final bool themeEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Utils.getGradientBoxDecoration(
        dutyFreeDashboardItem.gradientConfiguration,
        dutyFreeDashboardItem.backgroundColor,
        context.adColors.lightBlue,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: (dutyFreeDashboardItem.subItemMargin?.left.sp ?? 0) == 0
                  ? context.k_16
                  : dutyFreeDashboardItem.subItemMargin?.left.sp ?? 0,
              right: (dutyFreeDashboardItem.subItemMargin?.right.sp ?? 0) == 0
                  ? context.k_16
                  : dutyFreeDashboardItem.subItemMargin?.right.sp ?? 0,
              top: dutyFreeDashboardItem.subItemMargin?.top.sp ?? 0,
            ),
            child: Text(
              dutyFreeDashboardItem.title ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: maxLines,
              style: ADTextStyle700.size22
                  .setTextColor(context.adColors.blackTextColor),
            ),
          ),
          ListView.separated(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: dutyFreeDashboardItem.widgetItems?.length ?? 0,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: context.k_40,
              );
            },
            padding: EdgeInsets.only(
              left: (dutyFreeDashboardItem.subItemMargin?.left.sp ?? 0) == 0
                  ? context.k_16
                  : dutyFreeDashboardItem.subItemMargin?.left.sp ?? 0,
              right: (dutyFreeDashboardItem.subItemMargin?.right.sp ?? 0) == 0
                  ? context.k_16
                  : dutyFreeDashboardItem.subItemMargin?.right.sp ?? 0,
              top: dutyFreeDashboardItem.backgroundColor.isEmpty
                  ? context.k_20
                  : 0,
              bottom: dutyFreeDashboardItem.subItemMargin?.top.sp ?? 0,
            ),
            itemBuilder: (BuildContext context, int index) {
              ///InkWell that will be used to handle the click event in Right List
              return TouchableOpacity(
                onTap: () => onTapHandler
                    ?.call(dutyFreeDashboardItem.widgetItems?[index]),
                child: ImageWithText(
                  titleColor: themeEnabled
                      ? Color(
                          int.tryParse(
                                dutyFreeDashboardItem.subItemColors.titleColor,
                              ) ??
                              context.adColors.blackTextColor.value,
                        )
                      : context.adColors.blackTextColor,
                  backgroundColor: themeEnabled
                      ? Color(
                          int.tryParse(
                                dutyFreeDashboardItem
                                    .subItemColors.backGroundColor,
                              ) ??
                              ADColors.white.value,
                        )
                      : ADColors.white,
                  descriptionColor: themeEnabled
                      ? Color(
                          int.tryParse(
                                dutyFreeDashboardItem
                                    .subItemColors.descriptionColor,
                              ) ??
                              context.adColors.blackTextColor.value,
                        )
                      : context.adColors.blackTextColor,
                  ctaColor: themeEnabled
                      ? Color(
                          int.tryParse(
                                dutyFreeDashboardItem.subItemColors.ctaColor,
                              ) ??
                              context.adColors.blackTextColor.value,
                        )
                      : context.adColors.blackTextColor,
                  tagName: dutyFreeDashboardItem.widgetItems?[index].tagName,
                  uniqueId: dutyFreeDashboardItem.widgetItems?[index].uniqueId,
                  ctaUrl: dutyFreeDashboardItem.widgetItems?[index].ctaUrl,
                  paddingForTextContent: EdgeInsets.only(
                    left:
                        (dutyFreeDashboardItem.subItemMargin?.left.sp ?? 0) == 0
                            ? context.k_16
                            : dutyFreeDashboardItem.subItemMargin?.left.sp ?? 0,
                    right: (dutyFreeDashboardItem.subItemMargin?.right.sp ??
                                0) ==
                            0
                        ? context.k_16
                        : dutyFreeDashboardItem.subItemMargin?.right.sp ?? 0,
                    top: context.k_10,
                    bottom: context.k_30,
                  ),
                  productImageUrl:
                      dutyFreeDashboardItem.widgetItems?[index].imageSrc ?? '',
                  titleText:
                      dutyFreeDashboardItem.widgetItems?[index].title ?? '',
                  descriptionText:
                      dutyFreeDashboardItem.widgetItems?[index].description ??
                          '',
                  aspectRatio: dutyFreeDashboardItem.aspectRatio,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      context.scaled(
                        dutyFreeDashboardItem.subItemRadius ?? 0,
                      ),
                    ),
                  ),
                  innerBorderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      context.scaled(
                        dutyFreeDashboardItem.subItemRadius ?? 0,
                      ),
                    ),
                    topRight: Radius.circular(
                      context.scaled(
                        dutyFreeDashboardItem.subItemRadius ?? 0,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ).paddingBySide(
      top: dutyFreeDashboardItem.itemMargin?.top.sp ?? 0,
      bottom: dutyFreeDashboardItem.itemMargin?.bottom.sp ?? 0,
    );
  }
}
