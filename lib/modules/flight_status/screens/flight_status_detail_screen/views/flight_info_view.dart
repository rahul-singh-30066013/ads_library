/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/flight_status_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class returns flight info View for Flight status Detail Screen
class FlightInfoView extends StatelessWidget {
  final FlightStatusSegment flightSegment;
  const FlightInfoView({Key? key, required this.flightSegment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final airlineInfo = FlightUtils.airlineInfo?[flightSegment.airlinecode];
    final iconPadding = 3.sp;
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: context.k_10, // set spacing here
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            width: context.k_24,
            height: context.k_24,
            decoration: BoxDecoration(
              color:
                  airlineInfo?.icon == null ? context.adColors.paleGrey : null,
              borderRadius: BorderRadius.all(
                Radius.circular(context.k_6),
              ),
            ),
            child: airlineInfo?.icon != null
                ? Image.network(
                    airlineInfo?.icon ?? '',
                  )
                : SvgPicture.asset(
                    'lib/assets/images/svg/icons/flight/Flight.svg',
                    color: context.adColors.darkGreyTextColor,
                  ).paddingAllSide(iconPadding),
          ),
          if (airlineInfo?.name != null)
            Text(
              airlineInfo?.name ?? '',
              style: ADTextStyle500.size16.setTextColor(
                context.adColors.neutralInfoMsg,
              ),
            ),
          if (airlineInfo?.name != null)
            ADSizedBox(
              height: context.k_16,
              child: VerticalDivider(
                thickness: 1,
                width: 1,
                color: context.adColors.circleGreyTextColor,
              ),
            ),
          Text(
            flightSegment.flightnumber,
            style: ADTextStyle500.size16.setTextColor(
              context.adColors.neutralInfoMsg,
            ),
          ),
        ],
      ),
    );
  }
}
