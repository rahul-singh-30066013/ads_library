/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/filter/duty_free_filter_constants.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/view_models/duty_free_filter_view_model.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

/// This class is used to for create Left View Container
///[DutyFreeFilterLeftViewContainer] is use for create Header View
const k_16 = 16;
const dotRadius = 2.5;

class DutyFreeFilterLeftViewContainer extends StatelessWidget {
  const DutyFreeFilterLeftViewContainer({
    Key? key,
    required this.isSelected,
    required this.index,
  }) : super(key: key);
  final bool isSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
    final dutyFreeState = context.read<DutyFreeState>();
    return Container(
      // height: context.k_56,
      alignment: Alignment.centerLeft,
      color: isSelected
          ? context.adColors.transparentColor
          : context.adColors.containerGreyBg,
      child: Row(
        children: [
          Expanded(
            child: Text(
              ///Set value in Left List Sheet
              getName(dutyFreeState, index),
              textAlign: TextAlign.left,
              style: isSelected
                  ? ADTextStyle500.size14
                      .setTextColor(context.adColors.blackTextColor)
                  : ADTextStyle400.size14
                      .setTextColor(context.adColors.greyTextColor),
            ).paddingBySide(
              left: context.k_16,
              right: context.k_12,
              top: context.k_20,
              bottom: context.k_20,
            ),
          ),
          if (isFilterApplied(
            dutyFreeState.dutyFreeFilterList[index],
            dutyFreeState.tempFilterMap,
          ))
            CircleAvatar(
              backgroundColor: context.adColors.blueColor,
              minRadius: dotRadius.sp,
              maxRadius: dotRadius.sp,
            ).paddingBySide(right: context.k_8),
        ],
      ),
    );
  }

  String getName(DutyFreeState dutyFreeState, int index) {
    // final String name = index ==
    //         (dutyFreeState
    //                 .dutyFreeFilterBaseResponse?.result.categories.length ??
    //             0)
    //     ? dutyFreeState.dutyFreeFilterBaseResponse?.result.brands.filterTitle ??
    //         ''
    //     : (index <
    //             (dutyFreeState
    //                     .dutyFreeFilterBaseResponse?.result.categories.length ??
    //                 0)
    //         ? dutyFreeState.dutyFreeFilterBaseResponse?.result.categories[index]
    //                 .filterTitle ??
    //             ''
    //         : dutyFreeState
    //                 .dutyFreeFilterBaseResponse?.result.price.filterTitle ??
    //             '');
    adLog('filterTitle ${dutyFreeState.dutyFreeFilterList[index].title}');
    return dutyFreeState.dutyFreeFilterList[index].title ?? '';
  }

  String getCode(DutyFreeState dutyFreeState, int index) {
    // final String code = index ==
    //         (dutyFreeState.dutyFreeFilterBaseResponse?.result.categories.length ??
    //             0)
    //     ? dutyFreeState.dutyFreeFilterBaseResponse?.result.brands.filterCode ??
    //         ''
    //     : (index <
    //             (dutyFreeState
    //                     .dutyFreeFilterBaseResponse?.result.categories.length ??
    //                 0)
    //         ? dutyFreeState.dutyFreeFilterBaseResponse?.result.categories[index]
    //                 .filterCode ??
    //             ''
    //         : dutyFreeState
    //                 .dutyFreeFilterBaseResponse?.result.price.filterCode ??
    //             '');
    return dutyFreeState.dutyFreeFilterList[index].code ?? '';
  }

  bool isFilterApplied(
    DutyFreeFilterViewModel dutyFreeFilterViewModel,
    Map appliedFilterMap,
  ) {
    Map? map;
    if (dutyFreeFilterViewModel.isCategory) {
      map = appliedFilterMap[DutyFreeFilterConstants.category];
    } else if (dutyFreeFilterViewModel.isBrand) {
      map = appliedFilterMap[DutyFreeFilterConstants.brands];
    } else if (dutyFreeFilterViewModel.isOffer) {
      map = appliedFilterMap[DutyFreeFilterConstants.offers];
    } else if (dutyFreeFilterViewModel.isExclusive) {
      map = appliedFilterMap[DutyFreeFilterConstants.exclusive];
    } else if (dutyFreeFilterViewModel.isIncludeOOS) {
      map = appliedFilterMap[DutyFreeFilterConstants.includeOOS];
    }
    return map?.containsKey(dutyFreeFilterViewModel.code ?? '') ?? false;
  }
}
