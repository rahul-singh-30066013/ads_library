/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/flight_status_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_status.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class returns Flight Status View for Flight status Screen View
class FlightStatusView extends StatelessWidget {
  final FlightStatusSegment flightSegment;
  final ADTapCallback onTap;
  final ADTapCallback onAdd;

  const FlightStatusView({
    Key? key,
    required this.flightSegment,
    required this.onTap,
    required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final airlineInfo = FlightUtils.airlineInfo?[flightSegment.airlinecode];
    final iconPadding = 3.sp;
    const double _circleRadius = 2;
    const Color addedColor = Color(0xff018849);
    Color statusColor = context.adColors.neutralInfoMsg;

    ///TODO:- will replace later with site core color value
    if ((flightSegment.status.toString().toLowerCase() ==
            FlightStatus.landed.name) ||
        (flightSegment.status.toString().toLowerCase() ==
            FlightStatus.departed.name)) {
      statusColor = context.adColors.greenColor;
    } else if (flightSegment.status.toLowerCase() ==
        FlightStatus.cancelled.name) {
      statusColor = context.adColors.mediumPink;
    }
    return InkWell(
      onTap: onTap,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        width: context.k_20,
                        height: context.k_20,
                        decoration: BoxDecoration(
                          color: airlineInfo?.icon == null
                              ? context.adColors.paleGrey
                              : null,
                          borderRadius: BorderRadius.all(
                            Radius.circular(context.k_4),
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
                      ADSizedBox(
                        width: context.k_8,
                      ),
                      Text(
                        airlineInfo?.name ?? '',
                        style: ADTextStyle400.size12.setTextColor(
                          context.adColors.neutralInfoMsg,
                        ),
                      ),
                      CircleAvatar(
                        radius: _circleRadius,
                        backgroundColor: context.adColors.greyTextColor,
                      ).paddingBySide(left: context.k_4, right: context.k_4),
                      Text(
                        flightSegment.flightnumber,
                        style: ADTextStyle400.size12.setTextColor(
                          context.adColors.neutralInfoMsg,
                        ),
                      ),
                      CircleAvatar(
                        radius: _circleRadius,
                        backgroundColor: context.adColors.greyTextColor,
                      ).paddingBySide(left: context.k_4, right: context.k_4),
                      Text(
                        (flightSegment.terminal.characters.isNotEmpty)
                            ? flightSegment.terminal
                            : '',
                        style: ADTextStyle400.size12.setTextColor(
                          context.adColors.neutralInfoMsg,
                        ),
                      ),
                    ],
                  ),
                  ADSizedBox(
                    height: context.k_16,
                  ),
                  Text(
                    '${flightSegment.iataroute} (${flightSegment.iataroutecode})',
                    style: ADTextStyle600.size18
                        .setTextColor(context.adColors.neutralInfoMsg),
                    textAlign: TextAlign.start,
                  ),
                  ADSizedBox(
                    height: context.k_16,
                  ),
                  Row(
                    children: [
                      Text(
                        flightSegment.scheduletime,
                        style: ADTextStyle600.size18
                            .setTextColor(context.adColors.neutralInfoMsg),
                      ),
                      ADSizedBox(
                        width: context.k_12,
                      ),
                      Text(
                        flightSegment.remarkes.isNotEmpty
                            ? flightSegment.remarkes
                            : flightSegment.status.isNotEmpty
                                ? flightSegment.status
                                : '',
                        style: ADTextStyle500.size16.setTextColor(
                          statusColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: onAdd,
                  child: Container(
                    width: context.k_48,
                    height: context.k_38,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(context.k_4)),
                      border: Border.all(
                        color: flightSegment.isFlightAdded
                            ? Colors.transparent
                            : context.adColors.blackTextColor,
                      ),
                      color: flightSegment.isFlightAdded
                          ? addedColor
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: flightSegment.isFlightAdded
                          ? Icon(
                              Icons.check,
                              color: context.adColors.whiteTextColor,
                            )
                          : flightSegment.isFlightAdding
                              ? ADDotProgressView(
                                  size: context.k_4,
                                )
                              : Text(
                                  'add'.localize(context).toUpperCase(),
                                  style: ADTextStyle400.size14.setTextColor(
                                    context.adColors.neutralInfoMsg,
                                  ),
                                ),
                    ),
                  ),
                ),
                // Spacer(),
                Text(
                  'details'.localize(context),
                  style: ADTextStyle400.size14
                      .setTextColor(context.adColors.neutralInfoMsg)
                      .copyWith(
                        decoration: TextDecoration.underline,
                      ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
          top: context.k_20,
          bottom: context.k_20,
        ),
      ),
    );
  }
}
