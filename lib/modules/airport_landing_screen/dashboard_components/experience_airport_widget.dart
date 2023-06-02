/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/coming_soon.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_dashboard_builder.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///TODO Need to Define in Style guide
const pink = 0xffC44963;

///this class is used to handle new Electronic Type View
class ExperienceAirportWidget extends StatelessWidget {
  const ExperienceAirportWidget({
    Key? key,
    required this.item,
    this.onTapHandler,
    this.shouldBeKeptAlive = true,
  }) : super(key: key);

  ///*[item] this is reference of DashboardItem
  ///*[onTapHandler] this is click listener on tab
  ///*[shouldBeKeptAlive] this is used to maintain index of item while scrolling
  final DutyFreeDashboardItem item;
  final ADTapCallbackWithValue? onTapHandler;
  final bool shouldBeKeptAlive;

  @override
  Widget build(BuildContext context) {
    return CreateList(
      itemData: item.widgetItems,
      item: item,
      onTapHandler: onTapHandler,
      shouldBeKeptAlive: shouldBeKeptAlive,
    );
  }
}

class CreateList extends StatefulWidget {
  final DutyFreeDashboardItem item;
  final List<DutyFreeItem>? itemData;
  final ADTapCallbackWithValue? onTapHandler;

  ///this is used to main
  final bool shouldBeKeptAlive;

  const CreateList({
    Key? key,
    required this.item,
    required this.itemData,
    required this.onTapHandler,
    required this.shouldBeKeptAlive,
  }) : super(key: key);

  @override
  State<CreateList> createState() => _CreateListState();
}

class _CreateListState extends State<CreateList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => widget.shouldBeKeptAlive;

  @override
  Widget build(BuildContext context) {
    final Widget superBuild = super.build(context);
    adLog('$superBuild');
    const int maxLine = 2;
    const double defaultHeight = 116;
    const double minusHeightForBackgroundFromTop = 50;
    final itemWidth = (widget.item.subItemWidth ?? 1) * context.widthOfScreen;
    final itemHeight = itemWidth * (widget.item.aspectRatio ?? 1);
    final backgroundHeight =
        itemHeight + defaultHeight.sp - minusHeightForBackgroundFromTop.sp;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ADSizedBox(
          height: widget.item.itemMargin?.top.sp ?? 0,
        ),
        if (widget.item.title?.isNotEmpty ?? false)
          Text(
            widget.item.title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: ADTextStyle700.size22,
            textAlign: TextAlign.left,
          ).paddingBySide(
            left: widget.item.itemMargin?.left.sp ?? 0,
            right: widget.item.itemMargin?.right.sp ?? 0,
          ),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            if (widget.item.gradientConfiguration?.gradientColors.isEmpty ??
                true)
              Container(
                color: const Color(pink),
                height: backgroundHeight,
              ),
            Container(
              decoration: Utils.getGradientBoxDecoration(
                widget.item.gradientConfiguration,
                widget.item.backgroundColor,
                context.adColors.transparentColor,
              ),
              padding: EdgeInsets.only(
                top: widget.item.subItemMargin?.top.sp ?? 0,
                bottom: widget.item.subItemMargin?.bottom.sp ?? 0,
              ),
              height: itemHeight +
                  (widget.item.subItemMargin?.top.sp ?? 0) +
                  (widget.item.subItemMargin?.bottom.sp ?? 0) +
                  context.k_56 +
                  (ADTextStyle700.size18.fontSize ?? 0) +
                  ((ADTextStyle400.size16
                              .copyWith(
                                fontSize: fifteenFontSize,
                                color: context.adColors.whiteTextColor,
                              )
                              .fontSize ??
                          0) *
                      maxLine) +
                  (ADTextStyle400.size16
                          .copyWith(
                            fontSize: fifteenFontSize,
                            color: context.adColors.whiteTextColor,
                            decoration: TextDecoration.underline,
                          )
                          .fontSize ??
                      0) +
                  (ADTextStyle600.size10
                          .copyWith(
                            fontSize: fontSize,
                            height: 1,
                          )
                          .fontSize ??
                      0) +
                  context.k_8,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: context.scaled(widget.item.subItemMargin?.left ?? 0),
                  );
                },
                padding: EdgeInsets.only(
                  right: widget.item.itemMargin?.right.sp ?? 0,
                  left: widget.item.itemMargin?.left.sp ?? 0,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: widget.itemData?.length ?? 0,
                itemBuilder: (context, index) {
                  return TouchableOpacity(
                    onTap: () =>
                        widget.onTapHandler?.call(widget.itemData?[index]),
                    child: SizedBox(
                      width: itemWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              context.scaled(
                                widget.item.subItemRadius ?? 0,
                              ),
                            ),
                            child: Container(
                              width: itemWidth,
                              height: itemHeight,
                              color: context.adColors.containerGreyBg,
                              child: ADCachedImage(
                                imageUrl:
                                    widget.itemData?[index].imageSrc ?? '',
                                height: itemHeight,
                                width: itemWidth,
                              ),
                            ),
                          ),
                          ADSizedBox(
                            height: context.k_20,
                          ),
                          Text(
                            widget.itemData?[index].title ?? '',
                            style: ADTextStyle700.size18.setTextColor(
                              widget.item.subItemColors.titleColor.isNotEmpty
                                  ? Color(
                                      int.tryParse(
                                            widget
                                                .item.subItemColors.titleColor,
                                          ) ??
                                          context.adColors.whiteTextColor.value,
                                    )
                                  : context.adColors.whiteTextColor,
                            ),
                          ),
                          ADSizedBox(
                            height: context.k_10,
                          ),
                          Text(
                            widget.itemData?[index].description ?? '',
                            style: ADTextStyle400.size16
                                .setTextColor(
                                  widget.item.subItemColors.descriptionColor
                                          .isNotEmpty
                                      ? Color(
                                          int.tryParse(
                                                widget.item.subItemColors
                                                    .descriptionColor,
                                              ) ??
                                              context.adColors.whiteTextColor
                                                  .value,
                                        )
                                      : context.adColors.whiteTextColor,
                                )
                                .copyWith(fontSize: fifteenFontSize),
                            overflow: TextOverflow.ellipsis,
                            maxLines: maxLine,
                          ),
                          ADSizedBox(height: context.k_10),
                          if ((widget.itemData?[index].uniqueId.isNotEmpty ??
                                  false) ||
                              (widget.itemData?[index].ctaUrl.isNotEmpty ??
                                  false))
                            Text(
                              widget.itemData?[index].subTitle ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: ADTextStyle400.size16.copyWith(
                                color: widget
                                        .item.subItemColors.ctaColor.isNotEmpty
                                    ? Color(
                                        int.tryParse(
                                              widget
                                                  .item.subItemColors.ctaColor,
                                            ) ??
                                            context
                                                .adColors.whiteTextColor.value,
                                      )
                                    : context.adColors.whiteTextColor,
                                decoration: TextDecoration.underline,
                                fontSize: fifteenFontSize,
                              ),
                            )
                          else if (widget
                                  .itemData?[index].tagName?.name?.isNotEmpty ??
                              false)
                            ComingSoon(
                              tagName: widget.itemData?[index].tagName?.name,
                              textColor:
                                  widget.itemData?[index].tagName?.textColor,
                              backgroundColor: widget
                                  .itemData?[index].tagName?.backgroundColor,
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        ADSizedBox(
          height: widget.item.itemMargin?.bottom.sp ?? 0,
        ),
      ],
    );
  }
}
