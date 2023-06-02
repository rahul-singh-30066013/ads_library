/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_dashboard_builder.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/auto_text_size/auto_size_text_main.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to handle new Electronic Type View
class DutyFreeNewInElectronics extends StatefulWidget {
  const DutyFreeNewInElectronics({
    Key? key,
    required this.item,
    required this.onTap,
    required this.themeEnabled,
    this.subTitle,
    this.shouldBeKeptAlive = true,
    // this.widgetHeight = 0,
  }) : super(key: key);

  ///*[item] this is reference of DashboardItem
  ///*[shouldBeKeptAlive] this is used to maintain index of item while scrolling
  final DutyFreeDashboardItem item;
  final bool shouldBeKeptAlive;
  final Function(int index) onTap;

  // final double widgetHeight;

  final String? subTitle;

  final bool themeEnabled;

  @override
  _DutyFreeNewInElectronicsState createState() =>
      _DutyFreeNewInElectronicsState();
}

class _DutyFreeNewInElectronicsState extends State<DutyFreeNewInElectronics>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => widget.shouldBeKeptAlive;

  @override
  Widget build(BuildContext context) {
    final Widget superBuild = super.build(context);
    adLog('$superBuild');
    return CreateList(
      itemData: widget.item.widgetItems,
      item: widget.item,
      onTap: widget.onTap,
      // widgetHeight: widget.widgetHeight,
      subTitle: widget.subTitle,
      themeEnabled: widget.themeEnabled,
    );
  }
}

///this class is used to handle _ShimmerWidget Type View
// class _ShimmerWidget extends StatelessWidget {
//   final double shimmerWidth_100 = 100.w;
//   final double shimmerWidth_230 = 230.w;
//   final double shimmerHeight_20 = 20.h;
//   final double shimmerWidth_250 = 250.w;
//   final double shimmerHeight_250 = 250.h;
//   final int shimmerItemCount = 6;
//
//   _ShimmerWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ADShimmerWidget.shimmerShape(
//               type: ShimmerType.rectangleBox,
//               width: shimmerWidth_230,
//               height: shimmerHeight_20,
//             ),
//             ADShimmerWidget.shimmerShape(
//               type: ShimmerType.rectangleBox,
//               width: shimmerWidth_100,
//               height: shimmerHeight_20,
//             ),
//           ],
//         ),
//         SizedBox(
//           height: shimmerHeight_250,
//           child: ADShimmerBuilder(
//             shimmerBuilderType: ShimmerBuilderType.listHorizontal,
//             shimmerWidget: ADShimmerWidget.shimmerShape(
//               type: ShimmerType.rectangleBox,
//               height: shimmerHeight_250,
//               width: shimmerWidth_250,
//             ),
//             itemCount: shimmerItemCount,
//           ),
//         ),
//       ],
//     );
//   }
// }

class CreateList extends StatelessWidget {
  final DutyFreeDashboardItem item;
  final List<DutyFreeItem>? itemData;
  final Function(int index) onTap;

  // final double? widgetHeight;
  final String? subTitle;

  final bool themeEnabled;

  const CreateList({
    Key? key,
    required this.item,
    required this.itemData,
    required this.onTap,
    required this.themeEnabled,
    // this.widgetHeight,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int titleMaxLine = 2;
    const int extraHeight = 54;
    const int maxLine = 2;
    // const double defaultHeight = 156;
    final itemWidth = (item.subItemWidth ?? 0.64) * context.widthOfScreen;

    return Container(
      decoration: Utils.getGradientBoxDecoration(
        item.gradientConfiguration,
        item.backgroundColor,
        ADColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ADSizedBox(
            height: item.itemMargin?.top.sp ?? 0,
          ),
          if (item.title?.isNotEmpty ?? false)
            Text(
              item.title ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: ADTextStyle700.size22,
              textAlign: TextAlign.left,
            ).paddingBySide(
              left: item.itemMargin?.left.sp ?? 0,
              right: item.itemMargin?.right.sp ?? 0,
            ),
          Container(
            height: itemWidth * (item.aspectRatio ?? 1) +
                extraHeight +
                ((ADTextStyle700.size18.fontSize ?? 0) * maxLine) +
                ((ADTextStyle400.size16.fontSize ?? 0) * (maxLine + maxLine)),
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: context.scaled(item.subItemMargin?.left ?? 0),
                );
              },
              padding: EdgeInsets.only(
                top: item.subItemMargin?.top.sp ?? 0,
                left: item.itemMargin?.left.sp ?? 0,
                right: item.itemMargin?.right.sp ?? 0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: itemData?.length ?? 0,
              itemBuilder: (context, index) {
                return TouchableOpacity(
                  onTap: () => {
                    if (!(itemData?[index].disableForAirport ?? false))
                      {
                        onTap(index),
                      },
                  },
                  child: SizedBox(
                    width: itemWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            context.scaled(
                              item.subItemRadius ?? 0,
                            ),
                          ),
                          child: Opacity(
                            opacity:
                                (!(itemData?[index].disableForAirport ?? false))
                                    ? 1
                                    : opacity,
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                (!(itemData?[index].disableForAirport ?? false))
                                    ? Colors.transparent
                                    : const Color(greyBorder).withOpacity(1),
                                // 0 = Colored, 1 = Black & White
                                BlendMode.saturation,
                              ),
                              child: Container(
                                height: itemWidth * (item.aspectRatio ?? 1),
                                width: itemWidth,
                                color: context.adColors.containerGreyBg,
                                child: ADCachedImage(
                                  height: itemWidth * (item.aspectRatio ?? 1),
                                  width: itemWidth,
                                  imageUrl: itemData?[index].imageSrc ?? '',
                                ),
                              ),
                            ),
                          ),
                        ),
                        ADSizedBox(
                          height: context.k_20,
                        ),
                        AutoSizeText(
                          '${itemData?[index].title}',
                          style: ADTextStyle700.size18
                              .setTextColor(
                                themeEnabled
                                    ? Color(
                                        int.tryParse(
                                              item.subItemColors.titleColor,
                                            ) ??
                                            context
                                                .adColors.blackTextColor.value,
                                      )
                                    : context.adColors.blackTextColor,
                              )
                              .copyWith(
                                color: const Color(0xff222222).withOpacity(
                                  (itemData?[index].disableForAirport ?? false)
                                      ? opacity
                                      : 1,
                                ),
                                fontSize: fifteenFontSize,
                              ),
                          maxLines: titleMaxLine,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (itemData?[index].description.isNotEmpty ?? false)
                          ADSizedBox(
                            height: context.k_10,
                          ),
                        if (itemData?[index].description.isNotEmpty ?? false)
                          Text(
                            itemData?[index].description ?? '',
                            style: ADTextStyle400.size16
                                .setTextColor(
                                  themeEnabled
                                      ? Color(
                                          int.tryParse(
                                                item.subItemColors
                                                    .descriptionColor,
                                              ) ??
                                              context.adColors.blackTextColor
                                                  .value,
                                        )
                                      : context.adColors.blackTextColor,
                                )
                                .copyWith(
                                  color: const Color(0xff222222).withOpacity(
                                    (itemData?[index].disableForAirport ??
                                            false)
                                        ? opacity
                                        : 1,
                                  ),
                                  fontSize: fifteenFontSize,
                                ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: maxLine,
                          ),
                        ADSizedBox(height: context.k_10),
                        Text(
                          subTitle ?? 'know_more'.localize(context),
                          overflow: TextOverflow.ellipsis,
                          style: ADTextStyle400.size16
                              .setTextColor(
                                themeEnabled
                                    ? Color(
                                        int.tryParse(
                                              item.subItemColors.ctaColor,
                                            ) ??
                                            context
                                                .adColors.blackTextColor.value,
                                      )
                                    : context.adColors.blackTextColor,
                                // decoration: TextDecoration.underline,
                                // fontSize: fifteenFontSize,
                              )
                              .copyWith(
                                color: const Color(0xff222222).withOpacity(
                                  (itemData?[index].disableForAirport ?? false)
                                      ? opacity
                                      : 1,
                                ),
                                fontSize: fifteenFontSize,
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          ADSizedBox(
            height: item.itemMargin?.bottom.sp ?? 0,
          ),
        ],
      ),
    );
  }
}
