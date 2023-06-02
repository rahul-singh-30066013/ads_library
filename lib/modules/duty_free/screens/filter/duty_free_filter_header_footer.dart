/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:core';

import 'package:adani_airport_mobile/modules/duty_free/models/request/duty_free_product_list_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/filter/duty_free_filter_constants.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

///TODO: constant

const int ratio1 = 30;
const int ration2 = 37;

///_height is used for header & Tab bar container height
///_height is used for bottom container height
const _bottomContainerHeight = 80.0;

/// This class is used to for create Sort & Filter Header & Footer View
///[DutyFreeFilterHeaderFooter] is use for create Header View
///[DutyFreeFooterView] is use for create Footer View
class DutyFreeFilterHeaderFooter extends StatelessWidget {
  const DutyFreeFilterHeaderFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          key: const Key('sortFilterClose'),
          splashColor: context.adColors.transparentColor,
          onTap: () => {
            // context.read<DutyFreeState>().resetFilter(context),
            Navigator.pop(context),
          },

          ///Image that will be used to Left Top close button
          child: Container(
            child: Image.asset(
              'lib/assets/images/common/cross_black.png',
              width: context.k_18,
              height: context.k_18,
            ).paddingAllSide(context.k_4),
          ),
        ),
        SizedBox(
          height: context.scaled(context.k_16),
        ),
        Text(
          'all_filter'.localize(context),
          style: ADTextStyle700.size22
              .setTextColor(context.adColors.neutralInfoMsg),
        ),
      ],
    ).paddingBySide(left: context.k_14, top: context.k_10);
  }
}

/// This class is used for create Footer View
/// [DutyFreeFooterView] is used for create footer button
class DutyFreeFooterView extends StatefulWidget {
  const DutyFreeFooterView({Key? key}) : super(key: key);

  @override
  State<DutyFreeFooterView> createState() => _DutyFreeFooterViewState();
}

class _DutyFreeFooterViewState extends State<DutyFreeFooterView> {
  DutyFreeState? dutyFreeState;

  // bool isFilterApplied = false;

  @override
  void initState() {
    super.initState();
    dutyFreeState = context.read<DutyFreeState>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.scaled(_bottomContainerHeight),
      color: context.adColors.whiteTextColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: ratio1,
            child: ElevatedButton(
              key: const Key(FlightAutomationKeys.sortFilterReset),
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(context.adColors.black),
                backgroundColor: MaterialStateProperty.all<Color>(
                  context.adColors.whiteTextColor,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(context.k_28)),
                    side: const BorderSide(),
                  ),
                ),
              ),
              onPressed: () => {
                context.read<DutyFreeState>().resetFilter(context),
              },
              child: Text(
                'reset'.localize(context),
                style: ADTextStyle400.size16
                    .setTextColor(context.adColors.blackTextColor),
              ),
            ).paddingBySide(left: context.k_16, right: context.k_4),
          ),
          Expanded(
            flex: ration2,
            child: ElevatedButton(
              key: const Key(FlightAutomationKeys.sortFilterApply),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                  context.adColors.whiteTextColor,
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  context.adColors.blackTextColor,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(context.k_28)),
                    side: const BorderSide(),
                  ),
                ),
              ),
              onPressed: () => applyFilter(context),
              child: Text(
                'apply'.localize(context),
                style: ADTextStyle700.size16
                    .setTextColor(context.adColors.whiteTextColor),
              ),
            ).paddingBySide(left: context.k_4, right: context.k_16),
          ),
        ],
      ).paddingBySide(top: context.k_16, bottom: context.k_16),
    );
  }

  void applyFilter(BuildContext context) {
    if (!const DeepCollectionEquality().equals(
      dutyFreeState?.appliedFilterMap,
      dutyFreeState?.tempFilterMap,
    )) {
      dutyFreeState?.dutyFreeProductDataList.clear();
      dutyFreeState?.appliedFilterMap.clear();
      dutyFreeState?.appliedFilterMap
          .addEntries(context.read<DutyFreeState>().tempFilterMap.entries);
      dutyFreeState?.currentPage = 1;
      // dutyFreeState?.addedCategoryMap.forEach(
      //   (key, value) => dutyFreeState?.appliedFilterMap[key] = List.of(value),
      // );

      /*    dutyFreeState.filterMaxPrice;
    dutyFreeState.priceSelectedValueBackup;
     * */
      dutyFreeState?.priceSelectedValueBackup =
          dutyFreeState?.priceSelectedValue ?? 0;
      // String exclusiveSKUs = 'false';

      dutyFreeState?.exclusive =
          dutyFreeState?.getExclusive().isNotEmpty ?? false;
      dutyFreeState?.includeOOS =
          dutyFreeState?.getIncludeOutOfStock().isNotEmpty ?? false;
      dutyFreeState?.isFilterApplied = true;
      dutyFreeState?.updateProductListStatus(Status.loading);
      dutyFreeState?.dutyFreeProductListRequest =
          dutyFreeState?.dutyFreeProductListRequest?.copyWith(
        category: dutyFreeState?.getCategory(),
        brand: dutyFreeState?.getBrand(),
        subCategory: dutyFreeState?.getSubCategory(),
        restricted: !(dutyFreeState?.ageAbove25 ?? false),
        page: dutyFreeState?.currentPage,
        offers: dutyFreeState?.getOffers(),
        exclusive: dutyFreeState?.exclusive ?? false,
        includeOOS: dutyFreeState?.includeOOS ?? false,
      );
      dutyFreeState?.getDutyFreeProductList(
        dutyFreeState?.dutyFreeProductListRequest ??
            DutyFreeProductListRequest(
              airportCode: selectedAirportsData?.airportCode ?? '',
            ),
      );
      dutyFreeState?.dutyFreeEventState.filterSelectEvent();
    }
    navigatorPopScreen(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final Map<String, List<String>>? categoryMap =
          dutyFreeState?.appliedFilterMap[DutyFreeFilterConstants.category];
      for (int count = 0;
          count < (dutyFreeState?.dataList.length ?? 0);
          count++) {
        dutyFreeState?.dataList[count].isSelected.value =
            categoryMap?.containsKey(dutyFreeState?.dataList[count].code) ??
                false;
      }
    });
    adLog(dutyFreeState?.dutyFreeFilterBaseResponse.toString());
    super.dispose();
  }
}
