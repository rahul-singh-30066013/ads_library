/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_status/state_management/flight_status_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class BorderedTextWithIconView extends StatelessWidget {
  final ADTapCallback onTap;
  final String text;
  final IconData? iconData;
  final String? svgAssets;

  const BorderedTextWithIconView({
    Key? key,
    required this.onTap,
    required this.text,
    this.iconData,
    this.svgAssets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.adColors.whiteTextColor,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(context.k_28),
          ),
          border: Border.all(
            color: context.adColors.textFieldBorderGrey,
          ),
        ),
        child: InkWell(
          customBorder: const StadiumBorder(),
          onTap: onTap,
          child: ADSizedBox(
            height: context.k_32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Selector<FlightStatusState, DateTime>(
                  selector: (context, viewModel) => viewModel.date,
                  builder: (context, date, Widget? child) {
                    return Text(
                      text,
                      style: ADTextStyle400.size14.setTextColor(
                        context.adColors.neutralInfoMsg,
                      ),
                    );
                  },
                ),
                ADSizedBox(
                  width: context.k_6,
                ),
                SvgPicture.asset(
                  svgAssets ?? 'ib/assets/images/svg/icons/flight/calendar.svg',
                  color: context.adColors.darkGreyTextColor,
                  width: iconData == null ? context.k_18 : context.k_14,
                ),
              ],
            ).paddingBySide(
              left: context.k_12,
              right: context.k_12,
            ),
          ),
        ),
      ),
    );
  }
}
