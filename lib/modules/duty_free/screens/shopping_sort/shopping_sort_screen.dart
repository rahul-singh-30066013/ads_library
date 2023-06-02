/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

// /// sortArray is a list of sort options in shopping.
// var _sortArray = [
//   'Price Low to High',
//   'Price High to Low',
//   'Popularity',
//   'Discount',
//   'Featured',
// ];

const checkCount = 2;

/// _bottomContainerHeight is use for bottom height in sort screen
const _bottomContainerHeight = 80.0;

/// _headerContainerHeight is use for header height in sort screen
const _headerContainerHeight = 72.0;
const _bottomPadding = 96.0;

/// This class is used to for create Shopping Sort screen

class ShoppingSortScreen extends StatelessWidget {
  final DutyFreeState dutyFreeState;
  final void Function(BuildContext context, String code, String name)
      adTapCallback;

  const ShoppingSortScreen({
    Key? key,
    required this.adTapCallback,
    required this.dutyFreeState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SortFilterHeader(),
        Selector<DutyFreeState, int?>(
          selector: (context, catalogListViewModel) =>
              dutyFreeState.dutyFreeSelectedIndex,
          builder: (BuildContext context, state, Widget? child) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: dutyFreeState
                  .dutyFreeFilterBaseResponse?.result.sort.filterData.length,
              itemBuilder: (context, index) {
                // if (sortImageArray.length >= index) {
                //   sortImageArray.addAll(sortImageArray);
                // }
                return GestureDetector(
                  onTap: () => updateIndex(context, index),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: index == dutyFreeState.dutyFreeSelectedIndex
                            ? context.adColors.greyTextColor
                            : context.adColors.lightGreyGridSeparatorColor,
                      ),
                      borderRadius:
                          BorderRadius.all(Radius.circular(context.k_8)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.network(
                          dutyFreeState.dutyFreeFilterBaseResponse?.result.sort
                                  .filterData[index].imageSrc ??
                              '',
                          color: context.adColors.neutralInfoMsg,
                        ),
                        Text(
                          dutyFreeState.dutyFreeFilterBaseResponse?.result.sort
                                  .filterData[index].title ??
                              '',
                          style: index == dutyFreeState.dutyFreeSelectedIndex
                              ? ADTextStyle400.size14
                                  .setTextColor(context.adColors.blackTextColor)
                              : ADTextStyle400.size14
                                  .setTextColor(context.adColors.greyTextColor),
                        ),
                      ],
                    ).paddingAllSide(context.k_8),
                  ).paddingAllSide(context.k_8),
                );
              },
            ).paddingAllSide(context.k_8);
          },
        ),
        // SortFooterView(
        //   dutyFreeState: dutyFreeState,
        //   adTapCallback: adTapCallback,
        // ),
      ],
    );
  }

  void updateIndex(BuildContext context, int index) {
    // dutyFreeState.dutyFreeSelectedIndex = index;
    // adLog('to avoid cascade consecutive warning');
    // dutyFreeState.notifyListeners();

    adTapCallback(
      context,
      dutyFreeState
              .dutyFreeFilterBaseResponse?.result.sort.filterData[index].code ??
          '',
      dutyFreeState.dutyFreeFilterBaseResponse?.result.sort.filterData[index]
              .title ??
          '',
    );
  }
}

/// This class is used for create Header View
/// [SortFilterHeader] is used for create header button
class SortFilterHeader extends StatelessWidget {
  const SortFilterHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _headerContainerHeight.sp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            key: const Key('sortFilterClose'),
            splashColor: context.adColors.transparentColor,
            onTap: () => {
              Navigator.pop(context),
            },

            ///Image that will be used to Left Top close button
            child: Container(
              width: context.k_34,
              height: context.k_34,
              child: Image.asset(
                'lib/assets/images/common/cross_black.png',
              ).paddingAllSide(context.k_10),
            ).paddingBySide(left: context.k_6),
          ),
          SizedBox(
            height: context.k_10,
          ),
          Text(
            'sort'.localize(context),
            style: ADTextStyle700.size22
                .setTextColor(context.adColors.neutralInfoMsg),
          ).paddingBySide(left: context.k_16),
        ],
      ),
    ).paddingBySide(top: context.k_16);
  }
}

/// This class is used for create Footer View
/// [SortFooterView] is used for create footer button
class SortFooterView extends StatelessWidget {
  final void Function(BuildContext context, String code, String name)
      adTapCallback;

  final DutyFreeState dutyFreeState;

  const SortFooterView({
    Key? key,
    required this.adTapCallback,
    required this.dutyFreeState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _bottomContainerHeight.sp,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          foregroundColor: MaterialStateProperty.all<Color>(
            context.adColors.whiteTextColor,
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(context.adColors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(context.k_28)),
              side: const BorderSide(),
            ),
          ),
        ),
        onPressed: () => dutyFreeState.dutyFreeSelectedIndex != -1
            ? adTapCallback(
                context,
                dutyFreeState.dutyFreeFilterBaseResponse?.result.sort
                        .filterData[dutyFreeState.dutyFreeSelectedIndex].code ??
                    '',
                dutyFreeState
                        .dutyFreeFilterBaseResponse
                        ?.result
                        .sort
                        .filterData[dutyFreeState.dutyFreeSelectedIndex]
                        .title ??
                    '',
              )
            : null,
        child: Text(
          'apply'.localize(context),
          style: ADTextStyle700.size16
              .setTextColor(context.adColors.whiteTextColor),
        ),
      ).paddingBySide(
        top: context.k_16,
        bottom: context.k_16,
        left: _bottomPadding.sp,
        right: _bottomPadding.sp,
      ),
    );
  }
}
