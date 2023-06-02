/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */


import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to handle new Electronic Type View
class ExclusivePartnersWidget extends StatelessWidget {
  const ExclusivePartnersWidget({
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
    return ExclusivePartnersList(
      itemData: item.widgetItems,
      item: item,
      onTapHandler: onTapHandler,
      shouldBeKeptAlive: shouldBeKeptAlive,
    );
  }
}

const defaultAspectRatio = 0.65;

class ExclusivePartnersList extends StatefulWidget {
  final DutyFreeDashboardItem item;
  final List<DutyFreeItem>? itemData;
  final ADTapCallbackWithValue? onTapHandler;
  final bool shouldBeKeptAlive;

  const ExclusivePartnersList({
    Key? key,
    required this.item,
    required this.itemData,
    required this.onTapHandler,
    required this.shouldBeKeptAlive,
  }) : super(key: key);

  @override
  State<ExclusivePartnersList> createState() => _ExclusivePartnersListState();
}

class _ExclusivePartnersListState extends State<ExclusivePartnersList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => widget.shouldBeKeptAlive;

  @override
  Widget build(BuildContext context) {
    final Widget superBuild = super.build(context);
    adLog('$superBuild');
    const int maxLine = 3;
    const double defaultHeightForRatio = 0.56;
    final itemWidth = (widget.item.subItemWidth ?? 1) * context.widthOfScreen;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ADSizedBox(
          height: widget.item.itemMargin?.top.sp ?? 0,
        ),
        Text(
          widget.item.title ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: ADTextStyle700.size22,
          textAlign: TextAlign.left,
        ).paddingBySide(
          left: widget.item.itemMargin?.left.sp ?? 0,
          right: widget.item.itemMargin?.right.sp ?? 0,
          bottom: widget.item.subItemMargin?.top.sp ?? 0,
        ),
        Container(
          height: itemWidth * (widget.item.aspectRatio ?? defaultAspectRatio) +
              itemWidth *
                  (widget.item.aspectRatio ?? defaultAspectRatio) *
                  defaultHeightForRatio,
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
              return GestureDetector(
                onTap: () => widget.onTapHandler?.call(widget.itemData?[index]),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      context.scaled(
                        widget.item.subItemRadius ?? 0,
                      ),
                    ),
                    topRight: Radius.circular(
                      context.scaled(
                        widget.item.subItemRadius ?? 0,
                      ),
                    ),
                  ),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          context.scaled(
                            widget.item.subItemRadius ?? 0,
                          ),
                        ),
                      ),
                      border: Border.all(
                        color: context.adColors.boxShadowColor,
                        width: 1.sp,
                      ),
                    ),
                    width: itemWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(7),
                            topRight: Radius.circular(7),
                          ),
                          child: Container(
                            width: itemWidth,
                            height: itemWidth *
                                (widget.item.aspectRatio ?? defaultAspectRatio),
                            color: context.adColors.containerGreyBg,
                            child: ADCachedImage(
                              imageUrl: widget.itemData?[index].imageSrc ?? '',
                              height: itemWidth.toInt() *
                                  (widget.item.aspectRatio ??
                                      defaultAspectRatio),
                              width: itemWidth,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: context.k_16,
                            right: context.k_16,
                            top: context.k_20,
                            bottom: context.k_20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.itemData?[index].title.split('|').last ??
                                    '',
                                style: ADTextStyle500.size14.setTextColor(
                                  context.adColors.greenTextColor,
                                ),
                              ),
                              ADSizedBox(
                                height: context.k_10,
                              ),
                              Text(
                                widget.itemData?[index].title ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: ADTextStyle600.size16.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                              ),
                              ADSizedBox(
                                height: context.k_10,
                              ),
                              Text(
                                widget.itemData?[index].description ?? '',
                                style: ADTextStyle400.size14.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: maxLine,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        ADSizedBox(
          height: widget.item.itemMargin?.bottom.sp ?? 0,
        ),
      ],
    );
  }
}
