/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_arrival_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

/// [SortFilterArrivalRightView] is used for create sort Right Arrival Container
/// rightTitleText is used for show Arrival left title
/// descriptionText is used for show Arrival description
/// index in use for get list indexing
class SortFilterArrivalRightView extends StatefulWidget {
  const SortFilterArrivalRightView({
    Key? key,
    required this.index,
    this.filterArrivalModel,
    this.arrivalFilterArrivalModel,
  }) : super(key: key);
  final int index;
  final FilterArrivalModel? filterArrivalModel;
  final FilterArrivalModel? arrivalFilterArrivalModel;

  @override
  State<SortFilterArrivalRightView> createState() =>
      _SortFilterArrivalRightViewState();
}

class _SortFilterArrivalRightViewState
    extends State<SortFilterArrivalRightView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => (widget.filterArrivalModel != null)
              ? setState(
                  () {
                    widget.filterArrivalModel?.filterOptions[widget.index]
                        .isSelected = !(widget.filterArrivalModel
                            ?.filterOptions[widget.index].isSelected ??
                        false);
                    widget.filterArrivalModel?.updateChangeCode();
                  },
                )
              : setState(
                  () {
                    widget.arrivalFilterArrivalModel
                        ?.filterOptions[widget.index].isSelected = !(widget
                            .arrivalFilterArrivalModel
                            ?.filterOptions[widget.index]
                            .isSelected ??
                        false);
                    widget.arrivalFilterArrivalModel?.updateChangeCode();
                  },
                ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.filterArrivalModel != null) ...[
                Expanded(
                  child: Text(
                    ///Set value in Left List Sheet
                    widget.filterArrivalModel?.filterOptions[widget.index]
                            .timeName ??
                        '',
                    textAlign: TextAlign.left,
                    style: (widget.filterArrivalModel
                                ?.filterOptions[widget.index].isSelected ??
                            false)
                        ? ADTextStyle500.size14
                        : ADTextStyle400.size14
                            .setTextColor(context.adColors.black),
                  ),
                ),
                Text(
                  ///Set value in Left List Sheet
                  widget.filterArrivalModel?.filterOptions[widget.index]
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
                  value: widget.filterArrivalModel?.filterOptions[widget.index]
                      .isSelected,
                  onChanged: (bool? value) => setState(
                    () {
                      widget.filterArrivalModel?.filterOptions[widget.index]
                          .isSelected = value ?? false;
                      widget.filterArrivalModel?.updateChangeCode();
                    },
                  ),
                ),
              ] else ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ///Set value in Left List Sheet
                    widget.arrivalFilterArrivalModel
                            ?.filterOptions[widget.index].timeName ??
                        '',
                    textAlign: TextAlign.left,
                    style: (widget.arrivalFilterArrivalModel
                                ?.filterOptions[widget.index].isSelected ??
                            false)
                        ? ADTextStyle500.size14
                        : ADTextStyle400.size14
                            .setTextColor(context.adColors.black),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      ///Set value in Left List Sheet
                      widget.arrivalFilterArrivalModel
                              ?.filterOptions[widget.index].timeDurationName ??
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
                      value: widget.arrivalFilterArrivalModel
                          ?.filterOptions[widget.index].isSelected,
                      onChanged: (bool? value) => setState(
                        () {
                          widget
                              .arrivalFilterArrivalModel
                              ?.filterOptions[widget.index]
                              .isSelected = value ?? false;
                          widget.arrivalFilterArrivalModel?.updateChangeCode();
                        },
                      ),
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
