/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/mini_rule_display_model.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

/// In this class, we are making a baggage component
/// route of the flight is defined here and
/// we have check in weight and cabin weight and type of person
class BaggageItemView extends StatelessWidget {
  final BaggageInfo baggageInfoItem;
  const BaggageItemView({
    Key? key,
    required this.baggageInfoItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String fromCityCode =
        baggageInfoItem.fromLocationCode.validateWithDefaultValue();
    final String toCityCode =
        baggageInfoItem.toLocationCode.validateWithDefaultValue();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '$fromCityCode - $toCityCode | ',
                style: ADTextStyle500.size16,
              ),
              TextSpan(
                text:
                    '${baggageInfoItem.airlineName.validateWithDefaultValue()} ${baggageInfoItem.airlineCode.validateWithDefaultValue()}',
                style: ADTextStyle400.size16,
              ),
            ],
          ),
        ),
        SizedBox(
          height: context.k_8,
        ),
        if ((baggageInfoItem.baggageInfoNote ?? '').isEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'adult'.localize(context),
                style: ADTextStyle400.size14
                    .setTextColor(context.adColors.greyTextColor),
              ),
              SizedBox(
                width: context.k_12,
              ),
              Expanded(
                child: Text(
                  '${'check_in'.localize(context)} ${(baggageInfoItem.checkingAllowedWeight ?? '').isNotEmpty ? baggageInfoItem.checkingAllowedWeight.validateWithDefaultValue().toLowerCase() : 'NA'}',
                  style: ADTextStyle400.size14
                      .setTextColor(context.adColors.greyTextColor),
                ),
              ),
              SizedBox(
                width: context.k_12,
              ),
              Expanded(
                child: Text(
                  '${'cabin'.localize(context)} ${(baggageInfoItem.cabinAllowedWeight ?? '').isNotEmpty ? baggageInfoItem.cabinAllowedWeight.validateWithDefaultValue().toLowerCase() : 'NA'}',
                  style: ADTextStyle400.size14
                      .setTextColor(context.adColors.greyTextColor),
                ),
              ),
            ],
          ).paddingBySide(right: context.k_8)
        else
          Text(
            baggageInfoItem.baggageInfoNote ?? '',
            style: ADTextStyle400.size14.setTextColor(
              context.adColors.darkGreyTextColor,
            ),
          ).paddingBySide(
            bottom: context.k_16,
          ),
      ],
    ).paddingBySide(
      left: context.k_20,
      right: context.k_8,
      bottom: context.k_24,
    );
  }
}
