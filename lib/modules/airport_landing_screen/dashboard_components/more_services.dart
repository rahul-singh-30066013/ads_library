/*
 * Copyright (c) 2022 .
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
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to handle new Electronic Type View
class MoreServices extends StatelessWidget {
  const MoreServices({
    Key? key,
    required this.item,
    this.onTapHandler,
    required this.themeEnabled,
  }) : super(key: key);

  ///*[item] this is reference of DashboardItem
  ///*[onTapHandler] this is click listener on tab
  final DutyFreeDashboardItem item;
  final ADTapCallbackWithValue? onTapHandler;
  final bool themeEnabled;

  @override
  Widget build(BuildContext context) {
    return CreateList(
      itemData: item.widgetItems,
      item: item,
      onTapHandler: onTapHandler,
      themeEnabled: themeEnabled,
    );
  }
}

class CreateList extends StatefulWidget {
  final DutyFreeDashboardItem item;
  final List<DutyFreeItem>? itemData;
  final ADTapCallbackWithValue? onTapHandler;
  final bool shouldBeKeptAlive;
  final bool themeEnabled;

  const CreateList({
    Key? key,
    required this.item,
    required this.itemData,
    required this.themeEnabled,
    this.onTapHandler,
    this.shouldBeKeptAlive = true,
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
    const double defaultHeight = 135;
    final itemWidth = (widget.item.subItemWidth ?? 1) * context.widthOfScreen;

    return Container(
      decoration: Utils.getGradientBoxDecoration(
        widget.item.gradientConfiguration,
        widget.item.backgroundColor,
        ADColors.white,
      ),
      padding: EdgeInsets.only(
        top: widget.item.itemMargin?.top.sp ?? 0,
        bottom: widget.item.itemMargin?.bottom.sp ?? 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Container(
            height:
                itemWidth * (widget.item.aspectRatio ?? 1) + defaultHeight.sp,
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: context.scaled(widget.item.subItemMargin?.left ?? 0),
                );
              },
              padding: EdgeInsets.only(
                top: widget.item.subItemMargin?.top.sp ?? 0,
                left: widget.item.itemMargin?.left.sp ?? 0,
                right: widget.item.itemMargin?.right.sp ?? 0,
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
                            height: itemWidth * (widget.item.aspectRatio ?? 1),
                            width: itemWidth,
                            color: context.adColors.containerGreyBg,
                            child: Utils.startsWithHttp(
                              widget.itemData?[index].imageSrc,
                            )
                                ? ADCachedImage(
                                    height: itemWidth *
                                        (widget.item.aspectRatio ?? 1),
                                    width: itemWidth,
                                    imageUrl:
                                        widget.itemData?[index].imageSrc ?? '',
                                  )
                                : Image.asset(
                                    widget.itemData?[index].imageSrc ?? '',
                                    fit: BoxFit.fitWidth,
                                    height: itemWidth *
                                        (widget.item.aspectRatio ?? 1),
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
                            widget.themeEnabled
                                ? Color(
                                    int.tryParse(
                                          widget.item.subItemColors.titleColor,
                                        ) ??
                                        context.adColors.blackTextColor.value,
                                  )
                                : context.adColors.blackTextColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        ADSizedBox(height: context.k_10),
                        Text(
                          widget.itemData?[index].description ?? '',
                          style: ADTextStyle400.size16
                              .setTextColor(
                                widget.themeEnabled
                                    ? Color(
                                        int.tryParse(
                                              widget.item.subItemColors
                                                  .descriptionColor,
                                            ) ??
                                            context
                                                .adColors.blackTextColor.value,
                                      )
                                    : context.adColors.blackTextColor,
                              )
                              .copyWith(
                                fontSize: fifteenFontSize,
                              ),
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
                              color: widget.themeEnabled
                                  ? Color(
                                      int.tryParse(
                                            widget.item.subItemColors.ctaColor,
                                          ) ??
                                          context.adColors.blackTextColor.value,
                                    )
                                  : context.adColors.blackTextColor,
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
    );
  }
}
