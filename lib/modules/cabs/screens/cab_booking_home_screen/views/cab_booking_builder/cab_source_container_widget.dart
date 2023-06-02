/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/google_places_models/destination_search_address_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/airport_terminal_detail_model.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/cab_util.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabSourceContainerWidget extends StatelessWidget {
  final bool isFromSource;
  final void Function(bool) onTap;
  final SearchAddressModel? selectedAddressDetail;
  final AirportTerminalDetailModel? selectedAirportDetail;
  final bool isFromAirport;

  const CabSourceContainerWidget({
    Key? key,
    required this.selectedAddressDetail,
    required this.isFromSource,
    required this.onTap,
    required this.selectedAirportDetail,
    required this.isFromAirport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double heightOfContainer = 92.sp;
    const int containerBorderColors = 0xffd9d9d9;

    final String finalText = CabUtil.buildStringWithThreeDot(
      context,
      context.widthOfScreen - context.k_64,
      isFromSource
          ? selectedAirportDetail?.airportAddressDescription ?? ''
          : selectedAddressDetail?.description ?? '',
      ADTextStyle500.size18.setTextColor(
        context.adColors.neutralInfoMsg,
      ),
    );

    return InkWell(
      borderRadius: BorderRadius.all(
        Radius.circular(context.k_8),
      ),
      onTap: () => {
        onTap(isFromSource),
      },
      child: Container(
        height: heightOfContainer,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: (isFromSource
                        ? selectedAirportDetail?.airportAddressDescription ?? ''
                        : selectedAddressDetail?.description ?? '')
                    .trim()
                    .isNotEmpty
                ? const Color(containerBorderColors)
                : context.adColors.blackTextColor,
          ),
          borderRadius: BorderRadius.circular(context.k_8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFromSource
                  ? 'airport_name'.localize(context)
                  : isFromAirport
                      ? 'drop_location'.localize(context)
                      : 'pick_up_location'.localize(context),
              style: selectedAddressDetail != null
                  ? ADTextStyle400.size16.setTextColor(
                      context.adColors.greyTextColor,
                    )
                  : ADTextStyle400.size18.setTextColor(
                      context.adColors.greyTextColor,
                    ),
            ),
            Visibility(
              visible: isFromSource
                  ? selectedAirportDetail?.airportAddressDescription != null
                  : selectedAddressDetail?.description != null,
              child: Text(
                finalText,
                maxLines: 1,
                style: ADTextStyle500.size18.setTextColor(
                  context.adColors.blackTextColor,
                ),
              ).paddingBySide(
                top: context.k_12,
              ),
            ),
          ],
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
        ),
      ),
    );
  }
}
