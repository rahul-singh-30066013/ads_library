import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_arrival_nearby_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_departure_nearby_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class SortFilterNearbyRightView extends StatefulWidget {
  const SortFilterNearbyRightView({
    Key? key,
    required this.descriptionText,
    required this.descriptionVisibility,
    required this.index,
    this.arrivalNearbyModel,
    this.departureNearbyModel,
    required this.viewType,
  }) : super(key: key);
  final String descriptionText;
  final bool descriptionVisibility;
  final int index;
  final FilterArrivalNearbyModel? arrivalNearbyModel;
  final FilterDepartureNearbyModel? departureNearbyModel;
  // viewType =0 Arrival
  // viewType=1 departure
  final int viewType;

  @override
  State<SortFilterNearbyRightView> createState() =>
      _SortFilterNearbyRightViewState();
}
class _SortFilterNearbyRightViewState extends State<SortFilterNearbyRightView> {

@override
  void initState() {
  widget.arrivalNearbyModel?.arrivalFilterOptions.sort(
      (b,a)=> b.airportName.compareTo(a.airportName),
  );
  widget.departureNearbyModel?.departureFilterOptions.sort(
        (b,a)=> b.airportName.compareTo(a.airportName),
  );
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => widget.viewType == 0
              ? setState(
                  () {
                    widget
                        .arrivalNearbyModel
                        ?.arrivalFilterOptions[widget.index]
                        .isSelected = !(widget.arrivalNearbyModel
                            ?.arrivalFilterOptions[widget.index].isSelected ??
                        false);
                    widget.arrivalNearbyModel?.updateArrivalChangeCode();
                  },
                )
              : setState(
                  () {
                    widget
                        .departureNearbyModel
                        ?.departureFilterOptions[widget.index]
                        .isSelected = !(widget.departureNearbyModel
                            ?.departureFilterOptions[widget.index].isSelected ??
                        false);
                    widget.departureNearbyModel?.updateDepartureChangeCode();
                  },
                ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.viewType == 0) ...[
                Expanded(
                  child: Text(
                    ///Set value in Left List Sheet
                    '${widget.arrivalNearbyModel?.arrivalFilterOptions[widget.index].airportName ?? ''}, ${widget.arrivalNearbyModel?.arrivalFilterOptions[widget.index].cityName ?? ''}',
                    textAlign: TextAlign.left,
                    maxLines: context.k_2.toInt(),
                    style: (widget
                                .arrivalNearbyModel
                                ?.arrivalFilterOptions[widget.index]
                                .isSelected ??
                            false)
                        ? ADTextStyle500.size14
                        : ADTextStyle400.size14
                            .setTextColor(context.adColors.black),
                  ).paddingBySide(right: context.k_6),
                ),
              ] else ...[
                Expanded(
                  child: Text(
                    ///Set value in Left List Sheet
                    '${widget.departureNearbyModel?.departureFilterOptions[widget.index].airportName ?? ''}, ${widget.departureNearbyModel?.departureFilterOptions[widget.index].cityName ?? ''}',
                    textAlign: TextAlign.left,
                    maxLines: context.k_2.toInt(),
                    style: (widget
                                .departureNearbyModel
                                ?.departureFilterOptions[widget.index]
                                .isSelected ??
                            false)
                        ? ADTextStyle500.size14
                        : ADTextStyle400.size14
                            .setTextColor(context.adColors.black),
                  ).paddingBySide(right: context.k_6),
                ),
              ],
              if (widget.viewType == 0) ...[
                Visibility(
                  visible: widget.descriptionVisibility,
                  child: Text(
                    ///Set value in Left List Sheet
                    (widget.arrivalNearbyModel?.arrivalNearByAirportMap?[widget
                                    .arrivalNearbyModel
                                    ?.arrivalFilterOptions[widget.index]
                                    .airportCode ??
                                ''] ??
                            0)
                        .toString(),
                    textAlign: TextAlign.right,
                    style: ADTextStyle400.size10
                        .setTextColor(context.adColors.greyTextColor),
                  ),
                ),
              ] else ...[
                Visibility(
                  visible: widget.descriptionVisibility,
                  child: Text(
                    ///Set value in Left List Sheet
                    (widget.departureNearbyModel?.departureNearByAirportMap?[
                                widget
                                        .departureNearbyModel
                                        ?.departureFilterOptions[widget.index]
                                        .airportCode ??
                                    ''] ??
                            0)
                        .toString(),
                    textAlign: TextAlign.right,
                    style: ADTextStyle400.size10
                        .setTextColor(context.adColors.greyTextColor),
                  ),
                ),
              ],
              if (widget.viewType == 0) ...[
                Checkbox(
                  key: Key(
                    '${FlightAutomationKeys.checkBox}${widget.index}',
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  checkColor: context.adColors.whiteTextColor,
                  activeColor: context.adColors.black,
                  value: widget.arrivalNearbyModel
                      ?.arrivalFilterOptions[widget.index].isSelected,
                  onChanged: (bool? value) => setState(
                    () {
                      widget
                          .arrivalNearbyModel
                          ?.arrivalFilterOptions[widget.index]
                          .isSelected = value ?? false;
                      widget.arrivalNearbyModel?.updateArrivalChangeCode();
                    },
                  ),
                ),
              ] else ...[
                Checkbox(
                  key: Key(
                    '${FlightAutomationKeys.checkBox}${widget.index}',
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  checkColor: context.adColors.whiteTextColor,
                  activeColor: context.adColors.black,
                  value: widget.departureNearbyModel
                      ?.departureFilterOptions[widget.index].isSelected,
                  onChanged: (bool? value) => setState(
                    () {
                      widget
                          .departureNearbyModel
                          ?.departureFilterOptions[widget.index]
                          .isSelected = value ?? false;
                      widget.departureNearbyModel?.updateDepartureChangeCode();
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
