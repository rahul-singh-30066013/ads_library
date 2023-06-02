/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/pranaam_flights.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///
///This class is used to construct view for rows of flight list.
///[index] is of type [int] and it is the index at which row has to build.
///[flightList] is of type List<FlightDetailsModel>.
///
class ShowFilteredFlights extends StatelessWidget {
  ///
  /// usage
  /// ShowFilteredAirports(
  ///     index = 1,
  ///     flightListState=[],
  ///   );
  ///
  const ShowFilteredFlights({
    Key? key,
    required this.index,
    required this.flightList,
    required this.selectedFlight,
  }) : super(key: key);

  final int index;
  final List<PranaamFlights> flightList;
  final String selectedFlight;

  @override
  Widget build(BuildContext context) {
    final PranaamFlights flightDetailsModel = flightList[index];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(context.k_4),
          child: ADCachedImage(
            imageUrl: FlightUtils
                    .airlineInfo?[flightDetailsModel.airlineCode]?.icon ??
                '',
            width: context.k_28,
            height: context.k_28,
          ),
        ).paddingBySide(
          left: context.k_16,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                flightDetailsModel.flightFinalNumber,
                style: flightDetailsModel.flightFinalNumber == selectedFlight
                    ? ADTextStyle500.size16
                        .setTextColor(context.adColors.filterBlackText)
                    : ADTextStyle400.size16
                        .setTextColor(context.adColors.blackTextColor),
              ),
              if (flightDetailsModel.flightFinalNumber == selectedFlight)
                Icon(
                  Icons.check,
                  size: context.k_22,
                  color: context.adColors.filterBlackText,
                )
              else
                const ADSizedBox.shrink(),
            ],
          ).paddingBySide(
            left: context.k_10,
            right: context.k_16,
          ),
        ),
      ],
    ).paddingBySide(
      top: context.k_10,
      bottom: context.k_10,
    );
  }

  String getAirlineLogo(String airlineCode) {
    if (airlineCode == '6E') {
      return 'lib/assets/images/common/indigo.png';
    } else if (airlineCode == 'AI') {
      return 'lib/assets/images/common/air-india.png';
    } else if (airlineCode == 'G8') {
      return 'lib/assets/images/common/go-first.png';
    } else if (airlineCode == 'SG') {
      return 'lib/assets/images/common/spice-jet.png';
    } else if (airlineCode == 'UK') {
      return 'lib/assets/images/common/vistra.png';
    } else {
      return 'lib/assets/images/common/air-asia.png';
    }
  }
}
