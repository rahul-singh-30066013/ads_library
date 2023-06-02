/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/status_info_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/flight_status_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_detail_screen/views/flight_detail_status_item.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class returns flight status View for Flight status Detail Screen
class FlightStatusView extends StatelessWidget {
  final FlightStatusSegment flightSegment;
  final Future<void> Function() pullRefresh;
  final ADTapCallback addFlightTap;
  final ADTapCallback removeFlightTap;

  const FlightStatusView({
    Key? key,
    required this.flightSegment,
    required this.pullRefresh,
    required this.addFlightTap,
    required this.removeFlightTap,
  }) : super(key: key);
  static const int crossAxisCount = 2;

  @override
  Widget build(BuildContext context) {
    const Color addedColor = Color(0xff018849);
    final List<StatusInfoModel> statusList = [
      StatusInfoModel(
        typeKey: 'date'.localize(context),
        typeValue: DateFormat(Constant.dateFormat9).format(
          DateFormat(Constant.dateFormat5).parse(flightSegment.scheduledate),
        ),
      ),
      StatusInfoModel(
        typeKey: 'status'.localize(context),
        typeValue: flightSegment.remarkes.isNotEmpty
            ? flightSegment.remarkes
            : flightSegment.status.isNotEmpty
                ? flightSegment.status
                : '-',
      ),
      StatusInfoModel(
        typeKey: 'scheduled'.localize(context),
        typeValue: flightSegment.scheduletime.isNotEmpty
            ? flightSegment.scheduletime
            : '-',
      ),
      StatusInfoModel(
        typeKey: 'estimated'.localize(context),
        typeValue: flightSegment.estimatedtime.isNotEmpty
            ? flightSegment.estimatedtime
            : '-',
      ),
      StatusInfoModel(
        typeKey: flightSegment.flightkind == 'Arrival'
            ? 'baggage_Belt'.localize(context)
            : 'check_in_row'.localize(context),
        typeValue: flightSegment.flightkind == 'Arrival'
            ? flightSegment.carousel.isNotEmpty
                ? flightSegment.carousel.map((e) => e.carousel).join(',')
                : '-'
            : flightSegment.checkInCounter.isNotEmpty
                ? flightSegment.checkInCounter
                    .map((e) => e.checkincounter)
                    .join(',')
                : '-',
      ),
      StatusInfoModel(
        typeKey: 'departure_gate'.localize(context),
        typeValue: flightSegment.gates.isNotEmpty
            ? flightSegment.gates.map((e) => e.gate).join(',')
            : '-',
      ),
    ];
    const int two = 2;
    const int three = 3;
    const int four = 4;
    const int five = 5;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlightDetailStatusItem(
              statusInfoModel: statusList.first,
            ),
            ADSizedBox(
              width: context.k_24,
            ),
            FlightDetailStatusItem(
              statusInfoModel: statusList[1],
            ),
          ],
        ),
        ADSizedBox(
          height: context.k_24,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlightDetailStatusItem(
              statusInfoModel: statusList[two],
            ),
            ADSizedBox(
              width: context.k_24,
            ),
            FlightDetailStatusItem(
              statusInfoModel: statusList[three],
            ),
          ],
        ),
        ADSizedBox(
          height: context.k_24,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlightDetailStatusItem(
              statusInfoModel: statusList[four],
            ),
            ADSizedBox(
              width: context.k_24,
            ),
            if (flightSegment.flightkind != 'Arrival')
              FlightDetailStatusItem(
                statusInfoModel: statusList[five],
              ),
          ],
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        Container(
          width: double.infinity,
          height: context.k_48,
          child: OutlinedButton(
            onPressed: addFlightTap,
            style: OutlinedButton.styleFrom(
              primary: context.adColors.brownishGrey,
              side: BorderSide(
                color: flightSegment.isFlightAdded
                    ? addedColor
                    : context.adColors.blackTextColor,
              ),
              shape: const StadiumBorder(),
              backgroundColor: flightSegment.isFlightAdded
                  ? addedColor
                  : context.adColors.transparentColor,
            ),
            child: flightSegment.isFlightAdded
                ? RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.check,
                            size: context.k_18,
                            color: context.adColors.whiteTextColor,
                          ),
                        ),
                        TextSpan(
                          text: 'flight_added'.localize(context),
                          style: ADTextStyle700.size16.setTextColor(
                            context.adColors.whiteTextColor,
                          ),
                        ),
                      ],
                    ),
                  )
                : flightSegment.isFlightAdding
                    ? const ADDotProgressView()
                    : Text(
                        'add_flight'.localize(context),
                        style: ADTextStyle400.size16.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                      ),
          ),
        ),
        if (flightSegment.isFlightAdded)
          Column(
            children: [
              ADSizedBox(
                height: context.k_20,
              ),
              InkWell(
                onTap: removeFlightTap,
                child: ADSizedBox(
                  height: context.k_20,
                  child: flightSegment.isFlightAdding
                      ? const ADDotProgressView()
                      : Text(
                          'remove'.localize(context),
                          style: ADTextStyle400.size16
                              .setTextColor(context.adColors.blackTextColor)
                              .copyWith(
                                decoration: TextDecoration.underline,
                              ),
                          textAlign: TextAlign.right,
                        ),
                ),
              ),
              ADSizedBox(
                height: context.k_30,
              ),
            ],
          ),
      ],
    );
  }
}
