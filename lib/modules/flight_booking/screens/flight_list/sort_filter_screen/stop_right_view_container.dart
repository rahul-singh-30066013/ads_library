/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_stop_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/sort_filter_screen/sort_filter_view_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

/// Right View Stops Widget
class StopRightViewContainer extends StatefulWidget {
  const StopRightViewContainer({
    Key? key,
    required this.rightTitleText,
    required this.index,
    required this.sortFilterViewModel,
    this.filterStopModel,
    this.arrivalFilterStopModel,
  }) : super(key: key);
  final String rightTitleText;
  final int index;
  final SortFilterViewModel sortFilterViewModel;
  final FilterStopModel? filterStopModel;
  final FilterStopModel? arrivalFilterStopModel;
  @override
  State<StopRightViewContainer> createState() => _StopRightViewContainerState();
}

class _StopRightViewContainerState extends State<StopRightViewContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.filterStopModel != null) ...[
          CheckboxListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: context.k_16,
              vertical: context.k_4,
            ),
            title: Text(
              ///Set value in Left List Sheet
              widget.rightTitleText,
              textAlign: TextAlign.left,
              style: (widget.filterStopModel?.filterOptions[widget.index]
                          .isSelected ??
                      false)
                  ? ADTextStyle500.size14
                  : ADTextStyle400.size14.setTextColor(context.adColors.black),
            ),
            key: Key(
              '${FlightAutomationKeys.checkBox}${widget.index}',
            ),
            checkColor: context.adColors.whiteTextColor,
            activeColor: context.adColors.black,
            value:
                widget.filterStopModel?.filterOptions[widget.index].isSelected,
            onChanged: (bool? value) => setState(
              () {
                widget.filterStopModel?.filterOptions[widget.index].isSelected =
                    value ?? false;
                widget.filterStopModel?.updateChangeCode();
              },
            ),
          ),
        ] else ...[
          CheckboxListTile(
            title: Text(
              ///Set value in Left List Sheet
              widget.rightTitleText,
              textAlign: TextAlign.left,
              style: (widget.arrivalFilterStopModel?.filterOptions[widget.index]
                          .isSelected ??
                      false)
                  ? ADTextStyle500.size14
                  : ADTextStyle400.size14.setTextColor(context.adColors.black),
            ),
            key: Key(
              '${FlightAutomationKeys.checkBox}${widget.index}',
            ),
            checkColor: context.adColors.whiteTextColor,
            activeColor: context.adColors.black,
            value: widget
                .arrivalFilterStopModel?.filterOptions[widget.index].isSelected,
            onChanged: (bool? value) => setState(
              () {
                widget.arrivalFilterStopModel?.filterOptions[widget.index]
                    .isSelected = value ?? false;
                widget.arrivalFilterStopModel?.updateChangeCode();
              },
            ),
          ),
        ],
        Divider(
          height: context.scaled(1),
          color: context.adColors.dividerColor,
        ).paddingBySide(left: context.k_16, right: context.k_16),
      ],
    );
  }
}
