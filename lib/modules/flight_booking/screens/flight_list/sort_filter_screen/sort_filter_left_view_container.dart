/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_selected_model.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

/// This class is used to for create Left View Container
///[SortFilterLeftViewContainer] is use for create Header View

class SortFilterLeftViewContainer extends StatelessWidget {
  final double dotRadius = 2.5.sp;

  SortFilterLeftViewContainer({
    Key? key,
    required this.isSelected,
    required this.filterSelectedModel,
  }) : super(key: key);
  final bool isSelected;
  final FilterSelectedModel filterSelectedModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: context.k_56,
      alignment: Alignment.centerLeft,
      color: isSelected ? context.adColors.whiteTextColor : null,
      child: Row(
        children: [
          Expanded(
            child: Text(
              ///Set value in Left List Sheet
              filterSelectedModel.name,
              textAlign: TextAlign.left,
              style: isSelected
                  ? ADTextStyle500.size14.setTextColor(context.adColors.black)
                  : ADTextStyle400.size14
                      .setTextColor(context.adColors.greyTextColor),
            ).paddingBySide(
              left: context.k_16,
              right: context.k_12,
              top: context.k_20,
              bottom: context.k_20,
            ),
          ),
          if (filterSelectedModel.selected.isNotEmpty) ...[
            CircleAvatar(
              backgroundColor: context.adColors.greyTextColor,
              minRadius: dotRadius.sp,
              maxRadius: dotRadius.sp,
            ).paddingBySide(right: context.k_8),
          ],
        ],
      ),
    );
  }
}
