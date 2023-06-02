/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_airline_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

/// [SortFilterAirlineRightView] is used for create sort Right Airline Container
/// rightTitleText is used for show airline name
/// descriptionText is used for show airline description
/// index in use for get list indexing
/// airlineImage is used for airline logo in left
class SortFilterAirlineRightView extends StatefulWidget {
  const SortFilterAirlineRightView({
    Key? key,
    required this.descriptionText,
    required this.descriptionVisibility,
    required this.index,
    this.filterAirlineModel,
    this.arrivalFilterAirlineModel,
  }) : super(key: key);
  final String descriptionText;
  final bool descriptionVisibility;
  final int index;
  final FilterAirlineModel? filterAirlineModel;
  final FilterAirlineModel? arrivalFilterAirlineModel;

  @override
  State<SortFilterAirlineRightView> createState() =>
      _SortFilterAirlineRightViewState();
}

class _SortFilterAirlineRightViewState
    extends State<SortFilterAirlineRightView> {
  @override
  Widget build(BuildContext context) {
    widget.filterAirlineModel?.filterOptions.sort(
      (a, b) =>
          a.airlineName.toUpperCase().compareTo(b.airlineName.toUpperCase()),
    );
    widget.arrivalFilterAirlineModel?.filterOptions.sort(
      (a, b) =>
          a.airlineName.toUpperCase().compareTo(b.airlineName.toUpperCase()),
    );
    return Column(
      children: [
        InkWell(
          onTap: () => (widget.filterAirlineModel != null)
              ? setState(
                  () {
                    widget.filterAirlineModel?.filterOptions[widget.index]
                        .isSelected = !(widget.filterAirlineModel
                            ?.filterOptions[widget.index].isSelected ??
                        false);
                    widget.filterAirlineModel?.updateChangeCode();
                  },
                )
              : setState(
                  () {
                    widget.arrivalFilterAirlineModel
                        ?.filterOptions[widget.index].isSelected = !(widget
                            .arrivalFilterAirlineModel
                            ?.filterOptions[widget.index]
                            .isSelected ??
                        false);
                    widget.arrivalFilterAirlineModel?.updateChangeCode();
                  },
                ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.filterAirlineModel != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(context.k_4),
                  child: Image.network(
                    widget.filterAirlineModel?.filterOptions[widget.index]
                            .airlineLogo ??
                        '',
                    width: context.k_24,
                    height: context.k_24,
                    fit: BoxFit.cover,
                  ),
                ).paddingBySide(right: context.k_12),
                Expanded(
                  child: Text(
                    ///Set value in Left List Sheet
                    widget.filterAirlineModel?.filterOptions[widget.index]
                            .airlineName ??
                        '',
                    textAlign: TextAlign.left,
                    style: (widget.filterAirlineModel
                                ?.filterOptions[widget.index].isSelected ??
                            false)
                        ? ADTextStyle500.size14
                        : ADTextStyle400.size14
                            .setTextColor(context.adColors.black),
                  ),
                ),
              ] else ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(context.k_4),
                  child: Image.network(
                    widget.arrivalFilterAirlineModel
                            ?.filterOptions[widget.index].airlineLogo ??
                        '',
                    width: context.k_24,
                    height: context.k_24,
                    fit: BoxFit.cover,
                  ),
                ).paddingBySide(right: context.k_12),
                Expanded(
                  child: Text(
                    ///Set value in Left List Sheet
                    widget.arrivalFilterAirlineModel
                            ?.filterOptions[widget.index].airlineName ??
                        '',
                    textAlign: TextAlign.left,
                    style: (widget.arrivalFilterAirlineModel
                                ?.filterOptions[widget.index].isSelected ??
                            false)
                        ? ADTextStyle500.size14
                        : ADTextStyle400.size14
                            .setTextColor(context.adColors.black),
                  ),
                ),
              ],
              if (widget.filterAirlineModel != null) ...[
                Visibility(
                  visible: widget.descriptionVisibility,
                  child: Text(
                    ///Set value in Left List Sheet
                    (widget.filterAirlineModel?.departureFlightCountMap?[widget
                                    .filterAirlineModel
                                    ?.filterOptions[widget.index]
                                    .airlineCode ??
                                ''] ??
                            0)
                        .toString(),
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
                  value: widget.filterAirlineModel?.filterOptions[widget.index]
                      .isSelected,
                  onChanged: (bool? value) => setState(
                    () {
                      widget.filterAirlineModel?.filterOptions[widget.index]
                          .isSelected = value ?? false;
                      widget.filterAirlineModel?.updateChangeCode();
                    },
                  ),
                ),
              ] else ...[
                Visibility(
                  visible: widget.descriptionVisibility,
                  child: Text(
                    ///Set value in Left List Sheet
                    (widget.arrivalFilterAirlineModel?.arrivalFlightCountMap?[
                                widget
                                        .arrivalFilterAirlineModel
                                        ?.filterOptions[widget.index]
                                        .airlineCode ??
                                    ''] ??
                            0)
                        .toString(),
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
                  value: widget.arrivalFilterAirlineModel
                      ?.filterOptions[widget.index].isSelected,
                  onChanged: (bool? value) => setState(
                    () {
                      widget
                          .arrivalFilterAirlineModel
                          ?.filterOptions[widget.index]
                          .isSelected = value ?? false;
                      widget.arrivalFilterAirlineModel?.updateChangeCode();
                    },
                  ),
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
