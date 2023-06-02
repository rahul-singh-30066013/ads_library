/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class RemoveSaveFlightView extends StatelessWidget {
  final void Function(bool isRemoved) removeFlight;

  const RemoveSaveFlightView({
    Key? key,
    required this.removeFlight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'are_you_sure_flight'.localize(context),
          style: ADTextStyle400.size16,
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
        ),
        ADSizedBox(
          height: context.k_30,
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    context.adColors.whiteTextColor,
                  ),
                  side: MaterialStateProperty.all(
                    BorderSide(
                      color: context.adColors.neutralInfoMsg,
                    ),
                  ),
                ),
                onPressed: () =>
                    removeFlightTap(context: context, isRemoved: false),
                child: Text(
                  'cancel'.localize(context),
                  style: ADTextStyle400.size16,
                ).paddingBySide(bottom: context.k_14, top: context.k_14),
              ),
            ),
            ADSizedBox(
              width: context.k_10,
            ),
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    context.adColors.neutralInfoMsg,
                  ),
                ),
                onPressed: () =>
                    removeFlightTap(context: context, isRemoved: true),
                child: Text(
                  'remove'.localize(context),
                  style: ADTextStyle700.size16
                      .setTextColor(context.adColors.whiteTextColor),
                ).paddingBySide(bottom: context.k_14, top: context.k_14),
              ),
            ),
          ],
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
        ),
      ],
    );
  }

  void removeFlightTap({
    required BuildContext context,
    required bool isRemoved,
  }) {
    navigatorPopScreen(context);
    removeFlight(isRemoved);
  }
}
