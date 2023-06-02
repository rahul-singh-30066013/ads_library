/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/flight_listing_screen.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

/// shimmer effect displayed while flights are loading on flight listing screen
class FlightsListingShimmer extends StatelessWidget {
  FlightsListingShimmer({Key? key, this.isDomestic = true}) : super(key: key);
  final bool? isDomestic;
  final double gridHeight = 700;
  final int gridRowCount = 2;
  final int itemCount = 12;

  final double width110 = 110.sp;
  final double width90 = 90.sp;
  final double width80 = 70.sp;
  final double borderWidth = 0.5.sp;

  @override
  Widget build(BuildContext context) {
    return isOneWayTrip || !(isDomestic ?? false)
        ? SizedBox(
            height: gridHeight,
            child: ListView.separated(
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ADShimmerWidget.shimmerShape(
                          rectanglePadding: EdgeInsets.zero,
                          type: ShimmerType.rectangleBox,
                          height: context.k_28,
                          width: context.k_28,
                        ),
                        ADShimmerWidget.shimmerShape(
                          rectanglePadding: EdgeInsets.only(top: context.k_8),
                          type: ShimmerType.rectangleBox,
                          height: context.k_10,
                          width: context.k_48,
                        ),
                      ],
                    ).paddingBySide(left: context.k_10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ADShimmerWidget.shimmerShape(
                            rectanglePadding:
                                EdgeInsets.only(left: context.k_8),
                            type: ShimmerType.rectangleBox,
                            height: context.k_20,
                            width: width110,
                          ),
                          ADShimmerWidget.shimmerShape(
                            rectanglePadding: EdgeInsets.only(
                              top: context.k_8,
                              left: context.k_8,
                            ),
                            type: ShimmerType.rectangleBox,
                            height: context.k_14,
                            width: width80,
                          ),
                        ],
                      ).paddingBySide(left: context.k_48),
                    ),
                    ADShimmerWidget.shimmerShape(
                      rectanglePadding: EdgeInsets.only(right: context.k_12),
                      type: ShimmerType.rectangleBox,
                      height: context.k_20,
                      width: context.k_60,
                    ),
                  ],
                ).paddingAllSide(
                  context.k_16,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  indent: context.k_16,
                  endIndent: isOneWayTrip ? context.k_16 : 0,
                  height: 1,
                  thickness: 1,
                );
              },
            ),
          )
        : SizedBox(
            height: gridHeight,
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: context.k_16),
              itemCount: itemCount,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.6,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.only(
                    top: context.k_16,
                    bottom: context.k_16,
                    left: index.isOdd ? context.k_16 : 0,
                    right: index.isEven ? context.k_16 : 0,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: index.isEven
                            ? context.adColors.dividerColor
                            : context.adColors.transparentColor,
                        width: borderWidth,
                      ),
                      bottom: BorderSide(
                        color: context.adColors.dividerColor,
                        width: borderWidth,
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ADShimmerWidget.shimmerShape(
                            rectanglePadding:
                                EdgeInsets.only(bottom: context.k_4),
                            type: ShimmerType.rectangleBox,
                            height: context.k_28,
                            width: context.k_28,
                          ),
                          ADShimmerWidget.shimmerShape(
                            rectanglePadding:
                                EdgeInsets.symmetric(vertical: context.k_4),
                            type: ShimmerType.rectangleBox,
                            height: context.k_10,
                            width: context.k_48,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ADShimmerWidget.shimmerShape(
                              rectanglePadding:
                                  EdgeInsets.only(left: context.k_8),
                              type: ShimmerType.rectangleBox,
                              height: context.k_24,
                              width: width90,
                            ),
                            ADShimmerWidget.shimmerShape(
                              rectanglePadding: EdgeInsets.only(
                                top: context.k_8,
                                left: context.k_8,
                              ),
                              type: ShimmerType.rectangleBox,
                              height: context.k_14,
                              width: width90,
                            ),
                            Expanded(
                              child: ADShimmerWidget.shimmerShape(
                                rectanglePadding: EdgeInsets.only(
                                  top: context.k_8,
                                  left: context.k_8,
                                  right: context.k_28,
                                ),
                                type: ShimmerType.rectangleBox,
                                height: context.k_20,
                                width: context.k_56,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }
}
