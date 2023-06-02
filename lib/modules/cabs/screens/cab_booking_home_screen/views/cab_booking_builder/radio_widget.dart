/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/utilities/ad_custom_radio_button.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class RadioWidget extends StatelessWidget {
  const RadioWidget({
    key,
    required this.onTapHandler,
    required this.isFromAirport,
    required this.isFromSource,
  }) : super(key: key);
  final void Function(bool) onTapHandler;
  final bool isFromAirport;
  final bool isFromSource;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapHandler(isFromSource),
      borderRadius: BorderRadius.circular(context.k_4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ADSizedBox(
            width: context.k_18,
            child: AdCustomRadioButton(
              key: Key(
                isFromSource
                    ? 'from_airport'.localize(context)
                    : 'to_airport'.localize(context),
              ),
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              fillColor: MaterialStateColor.resolveWith(
                (states) => isFromSource
                    ? isFromAirport
                        ? context.adColors.blackTextColor
                        : context.adColors.greyTextColor
                    : !isFromAirport
                        ? context.adColors.blackTextColor
                        : context.adColors.greyTextColor,
              ),
              value: isFromAirport,
              groupValue: isFromSource,
              onChanged: (value) => onTapHandler(isFromSource),
            ),
          ),
          ADSizedBox(
            width: context.k_8,
          ),
          Text(
            isFromSource
                ? 'from_airport'.localize(context)
                : 'to_airport'.localize(context),
            style: isFromSource
                ? !isFromAirport
                    ? ADTextStyle500.size16
                    : ADTextStyle700.size16
                        .setTextColor(context.adColors.neutralInfoMsg)
                : isFromAirport
                    ? ADTextStyle500.size16
                    : ADTextStyle700.size16
                        .setTextColor(context.adColors.neutralInfoMsg),
          ),
        ],
      ).paddingBySide(
        left: context.k_4,
        right: context.k_4,
        top: context.k_10,
        bottom: context.k_10,
      ),
    );
  }
}
