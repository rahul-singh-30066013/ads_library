/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as sit_core_masters;
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class TravelSectorSelector extends StatelessWidget {
  const TravelSectorSelector({
    Key? key,
    required this.travelSectorList,
    required this.travelSectorListIndex,
    this.selectedItemData,
  }) : super(key: key);
  final List<sit_core_masters.TravelSector>? travelSectorList;
  final int travelSectorListIndex;
  final String? selectedItemData;
  @override
  Widget build(BuildContext context) {
    const _lightBlack = Color(0xff333333);
    final data = travelSectorList?[travelSectorListIndex];
    Color getContainerColor() {
      if (data?.label == selectedItemData) {
        return context.adColors.lightBlue;
      }
      return context.adColors.transparentColor;
    }

    return Container(
      color: getContainerColor(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            data?.label ?? '',
            style: data?.label == selectedItemData
                ? ADTextStyle500.size16
                    .setTextColor(context.adColors.filterBlackText)
                    .copyWith(fontWeight: FontWeight.w600)
                : ADTextStyle400.size16
                    .setTextColor(context.adColors.blackTextColor)
                    .copyWith(fontWeight: FontWeight.w400),
          ),
          Icon(
            data?.label == selectedItemData ? Icons.check : null,
            size: context.k_22,
            color: _lightBlack,
          ),
        ],
      ).paddingBySide(
        top: context.k_14,
        bottom: context.k_14,
        right: context.k_16,
        left: context.k_16,
      ),
    );
  }
}
