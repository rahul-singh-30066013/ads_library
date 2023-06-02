/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_departure_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

/// [SortFilterDepartureRightView] is used for create sort Right Arrival Container
/// rightTitleText is used for show Arrival left title
/// descriptionText is used for show Arrival description
/// index in use for get list indexing
class SortFilterDepartureRightView extends StatefulWidget {
  const SortFilterDepartureRightView({
    Key? key,
    required this.index,
    this.filterDepartureModel,
    this.arrivalFilterDepartureModel,
  }) : super(key: key);
  final int index;
  final FilterDepartureModel? filterDepartureModel;
  final FilterDepartureModel? arrivalFilterDepartureModel;

  @override
  State<SortFilterDepartureRightView> createState() =>
      _SortFilterDepartureRightViewState();
}

class _SortFilterDepartureRightViewState
    extends State<SortFilterDepartureRightView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => widget.filterDepartureModel != null
              ? setState(
                  () {
                    widget.filterDepartureModel?.filterOptions[widget.index]
                        .isSelected = !(widget.filterDepartureModel
                            ?.filterOptions[widget.index].isSelected ??
                        false);
                    widget.filterDepartureModel?.updateChangeCode();
                  },
                )
              : setState(() {
                  widget.arrivalFilterDepartureModel
                      ?.filterOptions[widget.index].isSelected = !(widget
                          .arrivalFilterDepartureModel
                          ?.filterOptions[widget.index]
                          .isSelected ??
                      false);
                  widget.arrivalFilterDepartureModel?.updateChangeCode();
                }),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.filterDepartureModel != null) ...[
                Expanded(
                  child: Text(
                    ///Set value in Left List Sheet
                    widget.filterDepartureModel?.filterOptions[widget.index]
                            .timeName ??
                        '',
                    textAlign: TextAlign.left,
                    style: (widget.filterDepartureModel
                                ?.filterOptions[widget.index].isSelected ??
                            false)
                        ? ADTextStyle500.size14
                        : ADTextStyle400.size14
                            .setTextColor(context.adColors.black),
                  ),
                ),
                Text(
                  ///Set value in Left List Sheet
                  widget.filterDepartureModel?.filterOptions[widget.index]
                          .timeDurationName ??
                      '',
                  textAlign: TextAlign.right,
                  style: ADTextStyle400.size10
                      .setTextColor(context.adColors.greyTextColor),
                ),
                Checkbox(
                  key: Key(
                    '${FlightAutomationKeys.checkBox}${widget.index}',
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  checkColor: context.adColors.whiteTextColor,
                  activeColor: context.adColors.black,
                  value: widget.filterDepartureModel
                      ?.filterOptions[widget.index].isSelected,
                  onChanged: (bool? value) => setState(() {
                    widget.filterDepartureModel?.filterOptions[widget.index]
                        .isSelected = value ?? false;
                    widget.filterDepartureModel?.updateChangeCode();
                  }),
                ),
              ] else ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ///Set value in Left List Sheet
                    widget.arrivalFilterDepartureModel
                            ?.filterOptions[widget.index].timeName ??
                        '',
                    textAlign: TextAlign.left,
                    style: (widget.arrivalFilterDepartureModel
                                ?.filterOptions[widget.index].isSelected ??
                            false)
                        ? ADTextStyle500.size14
                        : ADTextStyle400.size14
                            .setTextColor(context.adColors.black),
                  ),
                ),
                Row(
                  children: [
                    Visibility(
                      child: Text(
                        ///Set value in Left List Sheet
                        widget
                                .arrivalFilterDepartureModel
                                ?.filterOptions[widget.index]
                                .timeDurationName ??
                            '',
                        textAlign: TextAlign.right,
                        style: ADTextStyle400.size10
                            .setTextColor(context.adColors.greyTextColor),
                      ),
                    ),
                    Checkbox(
                      key: Key(
                        '${FlightAutomationKeys.checkBox}${widget.index}',
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      checkColor: context.adColors.whiteTextColor,
                      activeColor: context.adColors.black,
                      value: widget.arrivalFilterDepartureModel
                          ?.filterOptions[widget.index].isSelected,
                      onChanged: (bool? value) => setState(() {
                        widget
                            .arrivalFilterDepartureModel
                            ?.filterOptions[widget.index]
                            .isSelected = value ?? false;
                        widget.arrivalFilterDepartureModel?.updateChangeCode();
                      }),
                    ),
                  ],
                ),
              ],
            ],
          ).paddingBySide(
            left: context.k_16,
            top: context.k_8,
            bottom: context.k_8,
            right: context.k_12,
          ),
        ),
        Divider(
          height: context.scaled(1),
          color: context.adColors.dividerColor,
        ).paddingBySide(left: context.k_16, right: context.k_16),
      ],
    );
  }
}
