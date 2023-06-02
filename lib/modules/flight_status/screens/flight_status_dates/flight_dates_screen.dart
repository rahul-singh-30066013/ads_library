/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

/// This Class is used to check and change flight status dates
class FlightDatesScreen extends StatefulWidget {
  final DateTime selectedDate;
  final ADTapCallbackWithValue dateTap;
  final bool isMumbai;

  const FlightDatesScreen({
    Key? key,
    required this.selectedDate,
    required this.dateTap,
    this.isMumbai = false,
  }) : super(key: key);

  @override
  State<FlightDatesScreen> createState() => _FlightDatesScreenState();
}

class _FlightDatesScreenState extends State<FlightDatesScreen> {
  /// used for generating days
  final int _counter = 1;
  int _daysCount = 0;
  final List<String> days = [];

  /// used for checking position 2nd in days count
  final int _k_2 = 2;
  @override
  void initState() {
    _daysCount = _counter * _k_2;

    /// build dynamic days list
    daysList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: days.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () => dateTap(index: index),
        child: Container(
          color: DateFormat(Constant.dateFormat3).format(widget.selectedDate) ==
                  days[index]
              ? context.adColors.lightBlue
              : Colors.transparent,
          child: Row(
            children: [
              Text(
                setText(index),
                style: DateFormat(Constant.dateFormat3)
                            .format(widget.selectedDate) ==
                        days[index]
                    ? ADTextStyle600.size16
                        .setTextColor(context.adColors.blackColor)
                    : ADTextStyle400.size16
                        .setTextColor(context.adColors.blackColor),
              ),
              Expanded(
                child: Visibility(
                  visible: DateFormat(Constant.dateFormat3)
                          .format(widget.selectedDate) ==
                      days[index],
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(
                      SvgAssets.refundableCheck,
                      height: context.k_12,
                      width: context.k_14,
                    ),
                  ),
                ),
              ),
            ],
          ).paddingBySide(
            top: context.k_14,
            bottom: context.k_14,
            left: context.k_16,
            right: context.k_16,
          ),
        ),
      ),
    );
  }

  void dateTap({
    required int index,
  }) {
    widget.dateTap(days[index]);
    navigatorPopScreen(context);
  }

  /// called to setText in list
  String setText(int index) {
    if (widget.isMumbai) {
      if (index == 0) {
        return "${days[index]}, ${'today'.localize(context)}";
      } else if (index == 1) {
        return "${days[index]}, ${'tomorrow'.localize(context)}";
      } else {
        return days[index].toString();
      }
    } else {
      if (index == 0) {
        return "${days[index]}, ${'yesterday'.localize(context)}";
      } else if (index == 1) {
        return "${days[index]}, ${'today'.localize(context)}";
      } else if (index == _k_2) {
        return "${days[index]}, ${'tomorrow'.localize(context)}";
      } else {
        return days[index].toString();
      }
    }
  }

  ///method to add all dates into list
  void daysList() {
    if (widget.isMumbai) {
      for (int numOfDays = 0; numOfDays <= 1; numOfDays++) {
        days.add(
          DateFormat(Constant.dateFormat3).format(
            DateTime.now().add(
              Duration(days: numOfDays),
            ),
          ),
        );
      }
    } else {
      for (int numOfDays = -_counter; numOfDays <= _daysCount; numOfDays++) {
        days.add(
          DateFormat(Constant.dateFormat3).format(
            DateTime.now().add(
              Duration(days: numOfDays),
            ),
          ),
        );
      }
    }
  }
}
