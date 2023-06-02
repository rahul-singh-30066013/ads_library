/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/coming_soon.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const maxLines = 2;

/// Builds a widget for grid which has a circular image with title
class ServiceTypeWidget extends StatelessWidget {
  /// title of item
  final DutyFreeItem service;
  final double circleAvatarRadius = 100.sp;

  ///a function in which we will write the click functionality
  final ADTapCallbackWithValue? onTapHandler;

  ServiceTypeWidget({
    Key? key,
    required this.onTapHandler,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () => {
        onTapHandler?.call(service),
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: service.tagName?.name?.isNotEmpty ?? false,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: ComingSoon(
              tagName: service.tagName?.name,
              textColor: service.tagName?.textColor,
              backgroundColor: service.tagName?.backgroundColor,
            ),
          ).paddingBySide(bottom: context.k_6),
          Container(
            width: circleAvatarRadius,
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: context.adColors.paleGrey,
                shape:
                    service.enableCircle ? BoxShape.circle : BoxShape.rectangle,
              ),
              height: circleAvatarRadius,
              width: circleAvatarRadius,
              child: ColorFiltered(
                colorFilter: service.uniqueId.isEmpty && service.ctaUrl.isEmpty
                    ? /*greyscale*/ const ColorFilter.mode(
                        Colors.transparent,
                        BlendMode.multiply,
                      )
                    : const ColorFilter.mode(
                        Colors.transparent,
                        BlendMode.multiply,
                      ),
                child: ADCachedImage(
                  height: circleAvatarRadius,
                  width: circleAvatarRadius,
                  imageUrl: service.imageSrc,
                ),
              ),
            ),
          ),
          ADSizedBox(
            height: context.k_6,
          ),
          Container(
            width: circleAvatarRadius,
            child: Text(
              service.title.validateWithDefaultValue(),
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              style: ADTextStyle400.size14
                  .copyWith(color: context.adColors.blackTextColor),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

///Widget to handle grid or list
class GridWidget extends StatelessWidget {
  /// items to display in list
  final List<DutyFreeItem> items;

  /// bool if grid is selected
  final bool isGrid;

  ///a function in which we will write the click functionality
  final ADTapCallbackWithValue? onTapHandler;
  static const radius = 75;

  const GridWidget({
    Key? key,
    required this.onTapHandler,
    this.items = const [],
    this.isGrid = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isGrid
        ? GridView.builder(
            itemCount: items.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              childAspectRatio: 0.66,
            ),
            itemBuilder: (context, index) {
              return Container(
                color: Colors.white,
                child: ServiceTypeWidget(
                  onTapHandler: onTapHandler,
                  service: items[index],
                ),
              );
            },
          )
        : ListView.builder(
            itemCount: items.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return TouchableOpacity(
                onTap: () => {
                  onTapHandler?.call(items[index]),
                },
                child: Row(
                  children: [
                    Container(
                      width: radius.sp,
                      child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: context.adColors.paleGrey,
                          shape: items[index].enableCircle
                              ? BoxShape.circle
                              : BoxShape.rectangle,
                        ),
                        height: radius.sp,
                        width: radius.sp,
                        child: ColorFiltered(
                          colorFilter: items[index].uniqueId.isEmpty &&
                                  items[index].ctaUrl.isEmpty
                              ? /*greyscale*/ const ColorFilter.mode(
                                  Colors.transparent,
                                  BlendMode.multiply,
                                )
                              : const ColorFilter.mode(
                                  Colors.transparent,
                                  BlendMode.multiply,
                                ),
                          child: ADCachedImage(
                            height: radius.sp,
                            width: radius.sp,
                            imageUrl: items[index].imageSrc,
                          ),
                        ),
                      ),
                    ),
                    ADSizedBox(
                      width: context.k_16,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index].title.validateWithDefaultValue(),
                            style: ADTextStyle500.size16.copyWith(
                              color: context.adColors.blackTextColor,
                            ),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: maxLines,
                          ),
                          if (items[index].tagName?.name?.isNotEmpty ?? false)
                            ADSizedBox(
                              height: context.k_6,
                            ),
                          if (items[index].tagName?.name?.isNotEmpty ?? false)
                            ComingSoon(
                              tagName: items[index].tagName?.name,
                              textColor: items[index].tagName?.textColor,
                              backgroundColor:
                                  items[index].tagName?.backgroundColor,
                            ),
                        ],
                      ),
                    ),
                  ],
                ).paddingBySide(
                  top: context.k_8,
                  bottom: context.k_12,
                  left: context.k_10,
                  right: context.k_10,
                ),
              );
            },
          );
  }
}

///Toggle button to change view into list or grid type
class ToggleButton extends StatelessWidget {
  const ToggleButton({
    Key? key,
    required this.onListTap,
    required this.xAlign,
    required this.listColor,
    required this.gridColor,
  }) : super(key: key);

  /// width of toggle button
  static const double width = 64;

  /// height of toggle button
  static const double height = 32;

  ///initial alignment of toggle button
  ///-1 is left, 1 is right
  final double xAlign;

  ///color of list icon
  final Color listColor;

  ///color of grid icon
  final Color gridColor;

  /// position where menu button is aligned
  static const double menuAlign = -1;

  /// position where grid button is aligned
  static const double gridAlign = 1;

  /// task to perform when list icon is tapped
  final ADTapCallback onListTap;

  static const double _multiplier = 0.5;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onListTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: context.adColors.containerGreyBg,
          borderRadius: BorderRadius.all(
            Radius.circular(context.k_40),
          ),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: Alignment(xAlign, 0),
              duration: const Duration(milliseconds: 300),
              child: Container(
                width: width * _multiplier,
                height: height,
                decoration: BoxDecoration(
                  color: context.adColors.greyTextColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(context.k_40),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-1, 0),
              child: Container(
                width: width * _multiplier,
                color: context.adColors.transparentColor,
                alignment: Alignment.center,
                child: Icon(
                  Icons.menu,
                  size: context.k_16,
                  color: listColor,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(1, 0),
              child: Container(
                width: width * _multiplier,
                color: context.adColors.transparentColor,
                alignment: Alignment.center,
                child: Icon(
                  Icons.grid_view,
                  size: context.k_16,
                  color: gridColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
