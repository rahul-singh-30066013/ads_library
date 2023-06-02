/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/view/get_flight_bottom_sheet_views/flight_search_list.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class ShowShimmerForFlights extends StatelessWidget {
  ///
  /// usage
  /// ShowShimmerForFlights();
  ///
  ///
  const ShowShimmerForFlights({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: context.adColors.whiteTextColor,
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: context.k_10, top: context.k_10),
          itemCount: padding_10.toInt(),
          itemBuilder: (context, index) {
            return Row(
              children: [
                ADSizedBox(
                  width: context.k_16,
                ),
                ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  width: context.k_28,
                  height: context.k_28,
                ),
                ADSizedBox(
                  width: context.k_10,
                ),
                ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  height: context.k_20,
                  width: context.k_60,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
