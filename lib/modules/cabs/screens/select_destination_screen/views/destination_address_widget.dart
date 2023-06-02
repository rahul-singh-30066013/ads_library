/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/cabs/models/google_places_models/destination_search_address_model.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/enums/search_results_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class DestinationAddressWidget extends StatelessWidget {
  final SearchAddressModel location;
  final SearchResultsEnum headerWidget;
  final ADTapCallback onTap;

  const DestinationAddressWidget({
    Key? key,
    required this.location,
    required this.headerWidget,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap.call(),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: context.adColors.containerGreyBg,
            radius: context.k_14,
            child: Center(
              child: SvgPicture.asset(
                headerWidget == SearchResultsEnum.recentSearches
                    ? SvgAssets.recentAddress
                    : SvgAssets.destinationAddress,
                height: context.k_13,
                width: context.k_13,
                color: context.adColors.neutralInfoMsg,
              ),
            ),
          ).paddingBySide(right: context.k_8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location.structuredFormatting?.mainText ?? '',
                  style: ADTextStyle500.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ),
                Text(
                  location.structuredFormatting?.secondaryText ?? '',
                  style: ADTextStyle400.size14.setTextColor(
                    context.adColors.greyTextColor,
                  ),
                ).paddingBySide(top: context.k_4),
              ],
            ),
          ),
        ],
      ).paddingBySide(
        left: context.k_16,
        right: context.k_16,
        top: context.k_14,
        bottom: context.k_14,
      ),
    );
  }
}
