/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/screens/select_destination_screen/views/destination_search_widget.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/select_destination_state.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class SelectDestinationHeaderWidget extends StatelessWidget {
  final SelectDestinationState? viewModel;
  final ADTapCallback sourceTap;
  final ADTapCallback destinationTap;

  const SelectDestinationHeaderWidget({
    Key? key,
    this.viewModel,
    required this.sourceTap,
    required this.destinationTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double spaceFromLeft = 23;
    return SizedBox(
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Column(
            children: [
              DestinationSearchWidget(
                viewModel: viewModel,
                onTapAirport: sourceTap,
                onTapOtherLocations: destinationTap,
                isAirportField:
                    // ignore: avoid_bool_literals_in_conditional_expressions
                    viewModel?.selectDestinationNavigateModel?.isFromAirport ??
                            true
                        ? true
                        : false,
                // ignore: avoid_bool_literals_in_conditional_expressions
                isIconsSourceLocations: true,
              ).paddingBySide(
                bottom: context.k_12,
              ),
              DestinationSearchWidget(
                viewModel: viewModel,
                onTapAirport: sourceTap,
                onTapOtherLocations: destinationTap,
                isAirportField:
                    // ignore: avoid_bool_literals_in_conditional_expressions
                    viewModel?.selectDestinationNavigateModel?.isFromAirport ??
                            false
                        ? false
                        : true,
                isIconsSourceLocations: false,
              ).paddingBySide(
                bottom: context.k_6,
              ),
            ],
          ),
          Container(
            width: 1,
            height: context.k_28,
            color: context.adColors.neutralInfoMsg,
          ).paddingBySide(
            top: context.k_34,
            left: spaceFromLeft,
          ),
        ],
      ),
    ).paddingBySide(bottom: context.k_12);
  }
}
