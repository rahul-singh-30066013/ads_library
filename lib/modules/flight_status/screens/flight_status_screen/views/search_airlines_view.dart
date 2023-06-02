/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_status/state_management/flight_status_state.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class returns Search Airlines View for Flight status Screen View
class SearchAirlinesView extends StatelessWidget {
  final ADTapCallback searchTap;
  final ADTapCallback clearTap;

  const SearchAirlinesView({
    Key? key,
    required this.searchTap,
    required this.clearTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _textFieldHeight = 42.sp;

    return Selector<FlightStatusState, ADResponseState>(
      selector: (context, viewModel) => viewModel.flightStatusState,
      builder: (context, value, Widget? child) {
        return Container(
          margin: EdgeInsets.only(
            left: context.k_16,
            right: context.k_16,
          ),
          height: _textFieldHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(context.k_30),
            ),
            color: context.adColors.paleGrey,
          ),
          child: Selector<FlightStatusState, String>(
            selector: (context, viewModel) => viewModel.searchItem,
            builder: (context, searchItem, Widget? child) {
              return Row(
                children: [
                  ADSizedBox(
                    width: context.k_18,
                  ),
                  ADSizedBox(
                    width: context.k_18,
                    child: Icon(
                      Icons.search,
                      color: context.adColors.searchIconGrey,
                    ),
                  ),
                  ADSizedBox(
                    width: context.k_14,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: searchTap,
                      child: Text(
                        (searchItem.isEmpty)
                            ? 'searchAirlineFlightsOrCity'.localize(context)
                            : searchItem,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: (searchItem.isEmpty)
                            ? ADTextStyle400.size16
                                .setTextColor(context.adColors.greyTextColor)
                            : ADTextStyle500.size16
                                .setTextColor(context.adColors.blackTextColor),
                      ),
                    ),
                  ),
                  ADSizedBox(
                    width: context.k_14,
                  ),
                  if (searchItem.isNotEmpty)
                    ADSizedBox(
                      width: context.k_28,
                      child: IconButton(
                        splashRadius: 1,
                        onPressed: clearTap,
                        icon: Icon(
                          Icons.clear,
                          color: context.adColors.darkGreyTextColor,
                        ),
                      ),
                    ),
                  ADSizedBox(
                    width: context.k_18,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
