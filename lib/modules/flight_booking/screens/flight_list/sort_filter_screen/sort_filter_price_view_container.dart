/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_price.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_sort_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

/// this class is used for manage for Price View Slider in Price Container View
/// [SortFilterPriceViewContainer] class is used for manage for Price View Slider in Price Container View

class SortFilterPriceViewContainer extends StatefulWidget {
  const SortFilterPriceViewContainer({
    Key? key,
    required this.isCheck,
    this.filterSortModel,
    this.outBoundFilterPrice,
    this.inBoundFilterPrice,
  }) : super(key: key);

  final bool isCheck;
  final FilterSortModel? filterSortModel;
  final FilterPrice? outBoundFilterPrice;
  final FilterPrice? inBoundFilterPrice;

  @override
  State<SortFilterPriceViewContainer> createState() =>
      _SortFilterPriceViewContainerState();
}

class _SortFilterPriceViewContainerState
    extends State<SortFilterPriceViewContainer> {
  int sliderValue = 0;
  int maxValue = 0;
  int minValue = 0;

  @override
  void initState() {
    if (widget.outBoundFilterPrice != null) {
      if (widget.filterSortModel?.outBoundFilterPrice.selectedPrice != 0) {
        sliderValue =
            widget.filterSortModel?.outBoundFilterPrice.selectedPrice ?? 0;
        maxValue = widget.filterSortModel?.outBoundFilterPrice.maxPrice ?? 0;
        minValue = widget.filterSortModel?.outBoundFilterPrice.minPrice ?? 0;
      } else {
        sliderValue = widget.filterSortModel?.outBoundFilterPrice.maxPrice ?? 0;
        maxValue = widget.filterSortModel?.outBoundFilterPrice.maxPrice ?? 0;
        minValue = widget.filterSortModel?.outBoundFilterPrice.minPrice ?? 0;
      }
    } else {
      if (widget.filterSortModel?.inBoundFilterPrice.selectedPrice != 0) {
        sliderValue =
            widget.filterSortModel?.inBoundFilterPrice.selectedPrice ?? 0;
        maxValue = widget.filterSortModel?.inBoundFilterPrice.maxPrice ?? 0;
        minValue = widget.filterSortModel?.inBoundFilterPrice.minPrice ?? 0;
      } else {
        sliderValue = widget.filterSortModel?.inBoundFilterPrice.maxPrice ?? 0;
        maxValue = widget.filterSortModel?.inBoundFilterPrice.maxPrice ?? 0;
        minValue = widget.filterSortModel?.inBoundFilterPrice.minPrice ?? 0;
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${'upto'.localize(context)} ${FlightUtils.getPriceFormatWithSymbol(price: sliderValue.roundToDouble())}',
          style: ADTextStyle400.size14,
        ).paddingBySide(top: context.k_20, left: context.k_22),
        SliderTheme(
          data: SliderThemeData(trackHeight: context.k_2),
          child: Slider(
            value: sliderValue.toDouble(),
            min: minValue.toDouble(),
            max: maxValue.toDouble(),
            thumbColor: context.adColors.black,
            activeColor: context.adColors.black,
            inactiveColor: context.adColors.tileBorderColor,
            label: sliderValue.round().toString(),
            onChanged: (double value) => setState(() {
              if (widget.outBoundFilterPrice != null) {
                widget.outBoundFilterPrice?.selectedPrice = value.round();
                if (value.round() == maxValue.round()) {
                  widget.outBoundFilterPrice?.changeCode = '';
                  widget.filterSortModel?.outBoundFilterPrice.filterCount = 0;
                } else {
                  widget.outBoundFilterPrice?.changeCode = '1';
                  widget.filterSortModel?.outBoundFilterPrice.filterCount = 1;
                }
                widget.filterSortModel?.outBoundFilterPrice.selectedPrice =
                    value.round();
                widget.filterSortModel?.outBoundFilterPrice.changeCode =
                    widget.outBoundFilterPrice?.changeCode ?? '';
              } else {
                if (value.round() == maxValue.round()) {
                  widget.inBoundFilterPrice?.changeCode = '';
                  widget.filterSortModel?.inBoundFilterPrice.filterCount = 0;
                } else {
                  widget.filterSortModel?.inBoundFilterPrice.filterCount = 1;
                  widget.inBoundFilterPrice?.changeCode = '1';
                }
                widget.inBoundFilterPrice?.selectedPrice = value.round();
                widget.filterSortModel?.inBoundFilterPrice.selectedPrice =
                    value.round();
                widget.filterSortModel?.inBoundFilterPrice.changeCode =
                    widget.inBoundFilterPrice?.changeCode ?? '';
              }

              sliderValue = value.round();
            }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                FlightUtils.getPriceFormatWithSymbol(
                  price: minValue.roundToDouble(),
                ),
                style: ADTextStyle400.size14,
              ),
            ),
            Expanded(
              child: Text(
                FlightUtils.getPriceFormatWithSymbol(
                  price: maxValue.roundToDouble(),
                ),
                textAlign: TextAlign.right,
                style: ADTextStyle400.size14,
              ),
            ),
          ],
        ).paddingBySide(left: context.k_22, right: context.k_22),
      ],
    );
  }
}
