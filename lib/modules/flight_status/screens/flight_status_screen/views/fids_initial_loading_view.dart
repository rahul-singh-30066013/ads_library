/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/fids_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_screen/views/flight_status_loading_video_player.dart';
import 'package:adani_airport_mobile/modules/flight_status/state_management/flight_status_state.dart';
import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_type.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class FidsInitialLoadingView extends StatelessWidget {
  final FidsModel fidsModel;

  const FidsInitialLoadingView({
    Key? key,
    required this.fidsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _circleRadius = 2;
    const double bottomPadding = 180;

    return Material(
      child: Stack(
        children: [
          const FlightStatusLoadingVideoPlayer(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'give_us_a_moment'.localize(context),
                  style: ADTextStyle700.size16.setTextColor(
                    context.adColors.neutralInfoMsg,
                  ),
                ),
                ADSizedBox(height: context.k_10),
                Text(
                  'getting_your_flight_status'.localize(context),
                  style: ADTextStyle400.size12.setTextColor(
                    context.adColors.greyTextColor,
                  ),
                ),
                ADSizedBox(height: context.k_20),
                Container(
                  height: context.k_2,
                  width: context.k_30,
                  decoration: BoxDecoration(
                    gradient: adGradientColorType3,
                  ),
                ),
                ADSizedBox(height: context.k_20),
                Text(
                  (fidsModel.airportItemModel?.city ?? '')
                              .trim()
                              .toLowerCase() ==
                          'Other'.toLowerCase()
                      ? 'Mumbai'
                      : fidsModel.airportItemModel?.city ?? '',
                  style: ADTextStyle700.size16.setTextColor(
                    context.adColors.neutralInfoMsg,
                  ),
                ),
                ADSizedBox(height: context.k_10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.read<FlightStatusState>().flightType ==
                              FlightType.arrival
                          ? 'arrivals_flight_status'.localize(context)
                          : 'departure_flight_status'.localize(context),
                      style: ADTextStyle400.size12.setTextColor(
                        context.adColors.greyTextColor,
                      ),
                    ),
                    CircleAvatar(
                      radius: _circleRadius,
                      backgroundColor: context.adColors.greyTextColor,
                    ).paddingBySide(
                      left: context.k_4,
                      right: context.k_4,
                    ),
                    Text(
                      DateFormat(Constant.dateFormat18).format(
                        context.read<FlightStatusState>().date,
                      ),
                      style: ADTextStyle400.size12.setTextColor(
                        context.adColors.greyTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ).paddingBySide(
              bottom: bottomPadding,
            ),
          ),
        ],
      ),
    );
  }
}
