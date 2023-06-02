/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/airport_terminal_detail_model.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/select_destination_screen/views/select_airport_header_view.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/select_destination_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class AirportSelectionView extends StatefulWidget {
  final List<AirportTerminalDetailModel> airportTerminalDetailModel;
  final void Function(AirportTerminalDetailModel) terminalSelect;
  final SelectDestinationState selectDestinationState;

  const AirportSelectionView({
    Key? key,
    required this.airportTerminalDetailModel,
    required this.terminalSelect,
    required this.selectDestinationState,
  }) : super(key: key);

  @override
  State<AirportSelectionView> createState() =>
      _OriginAirportSelectionListScreenState();
}

class _OriginAirportSelectionListScreenState
    extends State<AirportSelectionView> {
  @override
  void initState() {
    widget.selectDestinationState.airportDetailModel =
        widget.airportTerminalDetailModel;
    widget.selectDestinationState.airportDetailModelUnFilteredList =
        widget.airportTerminalDetailModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.selectDestinationState.airportDetailModel.isEmpty)
          Padding(
            padding: EdgeInsets.only(top: context.k_8),
            child: NoDataFoundErrorScreen(
              errorTitle: 'no_airport_found_cab'.localize(context),
              errorMessage:
                  'check_for_spelling_errors_and_try_again'.localize(context),
            ),
          )
        else
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                if (widget
                        .selectDestinationState.recentAirportsList.isNotEmpty &&
                    widget
                        .selectDestinationState.airportController.text.isEmpty)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            SvgAssets.recentAddress,
                            height: context.k_14,
                            width: context.k_14,
                            color: context.adColors.circleGreyTextColor,
                          ),
                          SizedBox(
                            width: context.k_10,
                          ),
                          Text(
                            'recent_searches'.localize(context),
                            style: ADTextStyle500.size12.setTextColor(
                              context.adColors.circleGreyTextColor,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ).paddingBySide(
                        top: context.k_8,
                        bottom: context.k_8,
                        left: context.k_16,
                        right: context.k_16,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget
                            .selectDestinationState.recentAirportsList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SelectAirportHeaderView(
                                airportItemModel: widget.selectDestinationState
                                    .recentAirportsList[index],
                                onTap: () => airportTap(
                                  widget.selectDestinationState
                                      .recentAirportsList[index],
                                ),
                                isRecentSelectedAirport: true,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                if (widget
                    .selectDestinationState.airportController.text.isEmpty)
                  Row(
                    children: [
                      SvgPicture.asset(
                        SvgAssets.popularIcon,
                        height: context.k_14,
                        width: context.k_14,
                        color: context.adColors.circleGreyTextColor,
                      ),
                      SizedBox(
                        width: context.k_10,
                      ),
                      Text(
                        'all_airports'.localize(context),
                        style: ADTextStyle500.size12.setTextColor(
                          context.adColors.circleGreyTextColor,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ).paddingBySide(
                    top: context.k_18,
                    bottom: context.k_8,
                    left: context.k_16,
                    right: context.k_16,
                  ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      widget.selectDestinationState.airportDetailModel.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SelectAirportHeaderView(
                          airportItemModel: widget
                              .selectDestinationState.airportDetailModel[index],
                          onTap: () => {
                            widget.selectDestinationState
                                .setAirportsRecentSearches(
                              widget.selectDestinationState
                                  .airportDetailModel[index],
                            ),
                            airportTap(
                              widget.selectDestinationState
                                  .airportDetailModel[index],
                            ),
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }

  void airportTap(AirportTerminalDetailModel airportTerminalDetailModel) {
    widget.selectDestinationState
        .updateSelectedAirportTerminalDetailModel(airportTerminalDetailModel);
    widget.terminalSelect(airportTerminalDetailModel);
  }
}
