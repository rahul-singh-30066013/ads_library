/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

class LabelCheckbox extends StatelessWidget {
  final String title;
  final String travellerFirstName;
  final String travellerLastName;
  final String typeOfTraveller;
  final bool value;
  final Function(bool) onTap;
  final Color activeColor;
  final double gap;
  final bool isInternational;

  const LabelCheckbox({
    Key? key,
    required this.title,
    required this.travellerFirstName,
    required this.travellerLastName,
    required this.typeOfTraveller,
    required this.value,
    required this.onTap,
    required this.activeColor,
    this.gap = 0,
    required this.isInternational,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String nameToDisplay = '$title $travellerFirstName $travellerLastName';
    const int maxLength = 35;
    return InkWell(
      onTap: !isInternational ? () => onTap(!value) : null,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (!isInternational)
              Checkbox(
                value: value,
                splashRadius: context.k_34,
                activeColor: activeColor,
                visualDensity: VisualDensity.compact,
                onChanged: (val) => onTap(val ?? false),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      context.k_4,
                    ),
                  ),
                ),
              ),
            SizedBox(
              width: gap,
              height: isInternational ? context.k_32 : 0,
            ), // you can control gap between checkbox and label with this field
            if (nameToDisplay.length > maxLength)
              Expanded(
                child: Text(
                  nameToDisplay,
                  style: ADTextStyle400.size16
                      .setTextColor(context.adColors.black),
                ),
              )
            else
              Text(
                nameToDisplay,
                style:
                    ADTextStyle400.size16.setTextColor(context.adColors.black),
              ),
            SizedBox(
              width: context.k_10,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                typeOfTraveller == kAdultCode
                    ? kAdult.localize(context)
                    : typeOfTraveller == kChildCode
                        ? kChild.localize(context)
                        : kInfant.localize(context),
                style:
                    ADTextStyle400.size12.setTextColor(context.adColors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
