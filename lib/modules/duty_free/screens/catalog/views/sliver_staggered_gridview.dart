/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math';

import 'package:adani_airport_mobile/modules/duty_free/models/deal_product_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_data_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/catalog/views/ad_duty_free_product.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/views/staggered/widgets/sliver.dart';
import 'package:adani_airport_mobile/modules/duty_free/views/staggered/widgets/staggered_tile.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

const k_10 = 10;

/// _SliverStaggeredGridView class is used for creating Staggered GridView on screen
class SliverStaggeredGridView extends StatefulWidget {
  final DutyFreeState dutyFreeState;
  final String catalogType;

  const SliverStaggeredGridView({
    Key? key,
    required this.dutyFreeState,
    required this.catalogType,
  }) : super(key: key);

  @override
  State<SliverStaggeredGridView> createState() =>
      _SliverStaggeredGridViewState();
}

class _SliverStaggeredGridViewState extends State<SliverStaggeredGridView> {
  void calculation(BuildContext context) {
    adLog('$context');
  }

  @override
  Widget build(BuildContext context) {
    calculation(context);
    final double heightWithLoyaltyPoints = 360.sp;
    final double heightWithOutLoyaltyPoints = 330.sp;
    const int crossAxisCount = 2;
    double containerHeight = 370.sp;
    const int isEven = 2;
    final List<DutyFreeProductDataModel> data =
        widget.dutyFreeState.dutyFreeProductDataList;

    return SliverStaggeredGrid.countBuilder(
      crossAxisCount: crossAxisCount,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        containerHeight = checkLoyaltyAvailable(
          data: data,
          index: index,
          isEven: index % isEven == 0,
        )
            ? heightWithLoyaltyPoints
            : heightWithOutLoyaltyPoints;

        if (widget
            .dutyFreeState.dutyFreeProductDataList[index].timeStamp.isEmpty) {
          widget.dutyFreeState.dutyFreeProductDataList[index] =
              widget.dutyFreeState.dutyFreeProductDataList[index].copyWith(
            timeStamp: DateTime.now().millisecondsSinceEpoch.toString(),
          );
          adLog(
            'Models Time Stamps ${widget.dutyFreeState.dutyFreeProductDataList[index].timeStamp}',
          );
        }

        return Container(
          color: context.adColors.lightGreyGridSeparatorColor,
          height: containerHeight,
          padding: EdgeInsets.only(
            bottom: data.length == 1 ? 0 : 1,
            right: index % isEven == 0 ? 1 : 0,
          ),
          child: Container(
            padding: EdgeInsets.only(
              left: index % isEven != 0 ? context.k_8 : 0,
              right: index % isEven == 0 ? context.k_8 : 0,
            ),
            color: context.adColors.whiteTextColor,
            child: ADDutyFreeProduct(
              dutyFreeProductDataModel: data[index],
              isEven: index % isEven == 0,
              heroTag: data[index].timeStamp,
              enableFavourite: false,
              productCartQty: data[index].quantity,
              // productCartQty: data[index].quantity,
              onDecrementTapHandler: (int value) =>
                  updateData(context, data[index], increment: false),
              onIncrementTapHandler: (int value) =>
                  updateData(context, data[index], increment: true),
              isFavorite: false,
              unit: '',
              onTapHandler: () => productTap(
                item: data[index],
                index: index,
                context: context,
              ),
              productSize: '',
              favoriteTapHandler: () => favoriteTap(
                index: index,
                context: context,
              ),
              onAddTap: () => updateData(context, data[index], increment: true),
              addButtonText: 'add'.localize(context),
              catalogType: widget.catalogType,
              maxQuantity: min(data[index].availableQuantity.toInt(), k_10),
              isProgress: widget.dutyFreeState.isProgressMap
                  .containsKey(data[index].skuCode),
              loyaltyType: data[index].earn2XString,
              loyaltyAvailable: checkLoyaltyAvailable(
                data: data,
                index: index,
                isEven: index % isEven == 0,
              ),
            ),
          ),
        );
      },
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
    );
  }

  bool checkLoyaltyAvailable({
    required List<DutyFreeProductDataModel> data,
    required int index,
    required bool isEven,
  }) {
    const defaultBoolValue = true;
    try {
      if (index < data.length - 1) {
        return isEven
            ? (data[index].earn2XString.isNotEmpty &&
                    (num.tryParse(
                              data[index]
                                  .earn2XString
                                  .replaceAll(RegExp('[^0-9]'), ''),
                            ) ??
                            0) >
                        1)
                ? defaultBoolValue
                : (data[index + 1].earn2XString.isNotEmpty &&
                    (num.tryParse(
                              data[index + 1]
                                  .earn2XString
                                  .replaceAll(RegExp('[^0-9]'), ''),
                            ) ??
                            0) >
                        1)
            : (data[index].earn2XString.isNotEmpty &&
                    (num.tryParse(
                              data[index]
                                  .earn2XString
                                  .replaceAll(RegExp('[^0-9]'), ''),
                            ) ??
                            0) >
                        1)
                ? defaultBoolValue
                : (data[index - 1].earn2XString.isNotEmpty &&
                    (num.tryParse(
                              data[index - 1]
                                  .earn2XString
                                  .replaceAll(RegExp('[^0-9]'), ''),
                            ) ??
                            0) >
                        1);
      }
    } catch (e) {
      adLog('Error ${e.toString()}');
    }
    return false;
  }

  void productTap({
    required int index,
    required BuildContext context,
    required DutyFreeProductDataModel item,
  }) {
    context
        .read<DutyFreeState>()
        .dutyFreeEventState
        .selectItemEvent(item, 'catalog_list_screen');
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      productDetailDutyFreeScreen,
      rootNavigator: false,
      argumentObject: DealProductModel(
        catalogType: widget.catalogType,
        item: widget.dutyFreeState.dutyFreeProductDataList[index],
        index: index,
        timeStamp:
            widget.dutyFreeState.dutyFreeProductDataList[index].timeStamp,
        isExclusive:
            widget.dutyFreeState.dutyFreeProductDataList[index].isExclusive,
      ),
    );
  }

  void favoriteTap({required int index, required BuildContext context}) {
    context.read<DutyFreeState>().updateFavoriteState(index: index);
  }

  void updateData(
    BuildContext context,
    DutyFreeProductDataModel dutyFreeProductDataModel, {
    required bool increment,
  }) {
    widget.dutyFreeState.updateCart(
      context: context,
      increment: increment,
      fromCartPage: false,
      dutyFreeProductDataModel: dutyFreeProductDataModel,
    );
  }
}
