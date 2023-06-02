/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_status/models/response_models/flight_status_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_detail_screen/views/dashed_line_view.dart';
import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_type.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class returns flight location View for Flight status Detail Screen
class FlightLocationView extends StatelessWidget {
  final FlightStatusSegment flightSegment;
  final FlightType flightType;

  const FlightLocationView({
    Key? key,
    required this.flightSegment,
    required this.flightType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final siteCore = context.read<SiteCoreStateManagement>();
    final fromAirportCode = flightType == FlightType.arrival
        ? flightSegment.iataroutecode
        : flightSegment.iatalocalairportcode;
    final toAirportCode = flightType == FlightType.arrival
        ? flightSegment.iatalocalairportcode
        : flightSegment.iataroutecode;

    final fromAirportName =
        siteCore.airportCityMap[fromAirportCode]?.airportName ?? '-';
    final toAirportName =
        siteCore.airportCityMap[toAirportCode]?.airportName ?? '-';

    const Color yellowColor = Color(0xffffcf09);
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    fromAirportCode,
                    style: ADTextStyle600.size24.setTextColor(
                      context.adColors.neutralInfoMsg,
                    ),
                  ),
                  ADSizedBox(
                    width: context.k_10,
                  ),
                  if (flightType == FlightType.departure)
                    Container(
                      width: context.k_28,
                      height: context.k_28,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.2),
                        ),
                        color: yellowColor,
                      ),
                      child: Center(
                        child: Text(
                          flightType == FlightType.arrival
                              ? '-'
                              : flightSegment.terminal,
                          style: ADTextStyle600.size12.setTextColor(
                            context.adColors.neutralInfoMsg,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Row(
              children: [
                ADSizedBox(
                  width: context.k_18,
                  child: DashedLineView(
                    color: context.adColors.circleGreyTextColor,
                    dashWidth: context.k_4,
                  ),
                ),
                ADSizedBox(
                  width: context.k_24,
                  height: context.k_24,
                  child: SvgPicture.asset(
                    'lib/assets/images/svg/icons/flight/Flight.svg',
                    color: context.adColors.darkGreyTextColor,
                  ),
                ).paddingBySide(left: context.k_6, right: context.k_4),
                ADSizedBox(
                  width: context.k_18,
                  child: DashedLineView(
                    color: context.adColors.circleGreyTextColor,
                    dashWidth: context.k_4,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    toAirportCode,
                    style: ADTextStyle600.size24.setTextColor(
                      context.adColors.neutralInfoMsg,
                    ),
                  ),
                  if (flightType == FlightType.arrival)
                    Row(
                      children: [
                        ADSizedBox(
                          width: context.k_10,
                        ),
                        Container(
                          width: context.k_28,
                          height: context.k_28,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(3.2),
                            ),
                            color: yellowColor,
                          ),
                          child: Center(
                            child: Text(
                              flightType == FlightType.arrival
                                  ? flightSegment.terminal
                                  : '-',
                              style: ADTextStyle600.size12.setTextColor(
                                context.adColors.neutralInfoMsg,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
        ADSizedBox(
          height: context.k_12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                '$fromAirportName\n${flightType == FlightType.arrival ? flightSegment.iataroute : flightSegment.iatalocalairport}',
                style: ADTextStyle400.size12.setTextColor(
                  context.adColors.greyTextColor,
                ),
              ),
            ),
            ADSizedBox(
              width: context.k_64,
            ),
            Expanded(
              child: Text(
                '$toAirportName\n${flightType == FlightType.arrival ? flightSegment.iatalocalairport : flightSegment.iataroute}',
                style: ADTextStyle400.size12.setTextColor(
                  context.adColors.greyTextColor,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
