/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/views/action_button_with_icon.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// One way trip stateful header section
class OneWayTripHeader extends StatefulWidget {
  const OneWayTripHeader({
    Key? key,
    required this.filterTapCallBack,
    required this.selectedFilterButtonType,
    required this.selectedSortType,
    this.isDomestic = true,
  }) : super(key: key);

  final void Function(FlightSort value) filterTapCallBack;
  final FlightSort selectedFilterButtonType;
  final SortType selectedSortType;
  final bool isDomestic;

  @override
  State<OneWayTripHeader> createState() => _OneWayTripHeaderState();
}

/// One way stateful header

class _OneWayTripHeaderState extends State<OneWayTripHeader> {
  double blankBoxWidth = 84.sp;
  final double domesticBlankBoxWidth = 22.sp;
  @override
  Widget build(BuildContext context) {
    if (!widget.isDomestic) {
      blankBoxWidth = domesticBlankBoxWidth;
    }

    return Container(
      /// header height
      // height: context.k_40.sp,

      /// header width
      width: double.infinity,

      /// header background color
      color: context.adColors.containerGreyBg,
      child: Material(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// time
            // InkWell(
            //   onTap: () => widget.filterTapCallBack(FlightSort.byTime),
            //   child: ActionButtonWithIcon(
            //     type: FlightSort.byTime,
            //     isAscendingOrder: widget.selectedSortType == SortType.des,
            //     showIcon: widget.selectedFilterButtonType == FlightSort.byTime,
            //     paddingBetweenTextAndIcon: context.k_6,
            //   ).paddingBySide(
            //     top: context.k_14,
            //     bottom: context.k_14,
            //     left: context.k_16,
            //     right: context.k_16,
            //   ),
            // ).paddingBySide(left: context.k_14),
            SizedBox(
              width: blankBoxWidth,
            ),
            const Spacer(),

            /// Duration
            InkWell(
              // onTap: () => widget.filterTapCallBack(FlightSort.byDuration),
              onTap: () => widget.filterTapCallBack(FlightSort.byTime),
              child: ActionButtonWithIcon(
                // type: FlightSort.byDuration,
                // paddingBetweenTextAndIcon: context.k_6,
                // isAscendingOrder: widget.selectedSortType == SortType.des,
                // showIcon:
                //     widget.selectedFilterButtonType == FlightSort.byDuration,

                type: FlightSort.byTime,
                isAscendingOrder: widget.selectedSortType == SortType.des,
                showIcon: widget.selectedFilterButtonType == FlightSort.byTime,
                paddingBetweenTextAndIcon: context.k_6,
              ).paddingBySide(
                top: context.k_14,
                bottom: context.k_14,
                right: context.k_16,
                left: context.k_16,
              ),
            ).paddingBySide(
              left: context.k_14,
              right: context.k_14,
            ),
            const Spacer(
              flex: 4,
            ),

            /// Price
            InkWell(
              onTap: () => widget.filterTapCallBack(FlightSort.byPrice),
              child: ActionButtonWithIcon(
                paddingBetweenTextAndIcon: context.k_6,
                isAscendingOrder: widget.selectedSortType == SortType.des,
                showIcon: widget.selectedFilterButtonType == FlightSort.byPrice,
                type: FlightSort.byPrice,
              ).paddingBySide(
                top: context.k_14,
                bottom: context.k_14,
                right: context.k_16,
                left: context.k_16,
              ),
            ).paddingBySide(right: context.k_14),
          ],
        ),
      ),
    );
  }
}
