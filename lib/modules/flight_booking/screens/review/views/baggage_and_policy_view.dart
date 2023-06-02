/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// [BaggageAndPolicyView] is used to draw the view baggage,cancellation policy and coupon code.
class BaggageAndPolicyView extends StatefulWidget {
  const BaggageAndPolicyView({
    required this.title,
    this.icon,
    Key? key,
  }) : super(key: key);

  /// title of the tile
  final String title;

  /// icon of the tile
  final IconData? icon;

  @override
  State<BaggageAndPolicyView> createState() => _BaggageAndPolicyViewState();
}

class _BaggageAndPolicyViewState extends State<BaggageAndPolicyView> {
  final double containerHeight = 70.sp;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key(FlightAutomationKeys.couponAndPolicyKey),
      children: [
        Container(
          height: containerHeight,
          padding: EdgeInsets.symmetric(
            horizontal: context.k_16,
            // vertical: context.k_22,
          ),
          child: Row(
            children: [
              if (widget.icon != null)
                Row(
                  children: [
                    SvgPicture.asset(
                      'lib/assets/images/svg/icons/flight/baggage.svg',
                      color: context.adColors.darkGreyTextColor,
                    ),
                    ADSizedBox(
                      width: context.k_12,
                    ),
                  ],
                )
              else
                const ADSizedBox(),
              Expanded(
                child: Text(
                  widget.title,
                  style: ADTextStyle600.size18,
                  overflow: TextOverflow.clip,
                ),
              ),
              //  const Spacer(),
              Icon(
                Icons.chevron_right,
                color: context.adColors.darkGreyTextColor,
                size: context.k_30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
