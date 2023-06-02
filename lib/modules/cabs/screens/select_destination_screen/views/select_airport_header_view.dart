/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/airport_terminal_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class SelectAirportHeaderView extends StatelessWidget {
  final AirportTerminalDetailModel airportItemModel;
  final ADTapCallback onTap;
  final bool isRecentSelectedAirport;

  const SelectAirportHeaderView({
    Key? key,
    required this.airportItemModel,
    required this.onTap,
    this.isRecentSelectedAirport = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.k_16,
          vertical: context.k_14,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: context.adColors.containerGreyBg,
              radius: context.k_14,
              child: Center(
                child: SvgPicture.asset(
                  isRecentSelectedAirport
                      ? SvgAssets.recentAddress
                      : SvgAssets.destinationAddress,
                  height: context.k_13,
                  width: context.k_13,
                  color: context.adColors.neutralInfoMsg,
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          airportItemModel.airportNameDescription ?? '',
                          style: ADTextStyle500.size16.setTextColor(
                            context.adColors.blackTextColor,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        ADSizedBox(
                          height: context.k_4,
                        ),
                        Text(
                          airportItemModel.airportAddressDescription ?? '',
                          style: ADTextStyle400.size14.setTextColor(
                            context.adColors.greyTextColor,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ).paddingBySide(left: context.k_16),
                  ),
                  Text(
                    airportItemModel.airportCode ?? '',
                    style: ADTextStyle500.size16
                        .setTextColor(context.adColors.blackTextColor),
                    textAlign: TextAlign.left,
                  ).paddingBySide(left: context.k_16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
