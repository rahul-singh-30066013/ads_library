/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math';

import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/item_detail_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/screen_helper/automation_keys/duty_free_cart_automation_keys.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/addons/select_add_on_quantity_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const opacity = 0.699999988079071;

//ignore: must_be_immutable
class DutyFreeProductQuantityView extends StatelessWidget {
  ItemDetailResponse productList;
  ADGenericCallback onChange;
  final GlobalKey dropdownKey = GlobalKey();

  DutyFreeProductQuantityView({
    Key? key,
    required this.productList,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final dropDownWidth = 88.sp;
    final dropDownHeight = 36.sp;
    // ValueNotifier<int>(productList.quantity);
    return GestureDetector(
      onTap: productList.availableStock > 0
          ? () => selectAddOnsQuantity(context)
          : null,
      child: Opacity(
        opacity: productList.inStock ? 1 : opacity,
        child: Row(
          children: [
            //if (productList.inStock)
            Container(
              padding: EdgeInsets.only(
                left: context.k_16,
                top: context.k_10,
                bottom: context.k_10,
              ),
              height: dropDownHeight,
              // width: dropDownWidth,
              decoration: BoxDecoration(
                color: context.adColors.whiteTextColor,
                borderRadius: BorderRadius.circular(context.k_30),
                boxShadow: [
                  BoxShadow(
                    color: context.adColors.circleGreyTextColor,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Selector<DutyFreeState, int>(
                selector: (context, viewModel) => productList.quantity,
                builder: (context, qty, Widget? child) {
                  return Row(
                    children: [
                      Text(
                        '${'qtyLabel'.localize(context)} ${productList.quantity}',
                        style: ADTextStyle600.size14
                            .setTextColor(context.adColors.blackTextColor)
                            .copyWith(
                              decoration: productList.inStock
                                  ? TextDecoration.none
                                  : TextDecoration.lineThrough,
                            ),
                        key: const Key(
                          DutyFreeCartAutomationKeys.dutyFreeQtyText,
                        ),
                      ),
                      if (productList.inStock)
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: context.k_18,
                          key: dropdownKey,
                          color: context.adColors.greyChartTextColor,
                        ).paddingBySide(right: context.k_10),
                      if (!productList.inStock)
                        ADSizedBox(
                          width: context.k_16,
                        ),
                      // DropdownButton<String>(
                      //   key: dropdownKey,
                      //   underline: Container(color: Colors.transparent),
                      //   icon: Icon(
                      //     Icons.keyboard_arrow_down_sharp,
                      //     color: context.adColors.greyChartTextColor,
                      //   ),
                      //   iconSize: context.k_18,
                      //   value: '${productList.quantity}',
                      //   items: productList.quantities.map((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(
                      //         value.validateWithDefaultValue(),
                      //         style: ADTextStyle600.size14,
                      //         key: const Key(
                      //           DutyFreeCartAutomationKeys.dutyFreeQtyValue,
                      //         ),
                      //       ).paddingBySide(
                      //         left: context.k_2,
                      //       ),
                      //     );
                      //   }).toList(),
                      //   onChanged: (value) => onChange(value ?? ''),
                      // ).paddingBySide(right: context.k_10),
                    ],
                  );
                },
                shouldRebuild: (previous, next) => true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectAddOnsQuantity(
    BuildContext context,
  ) {
    const itemCount = 10;
    adShowBottomSheet(
      context: context,
      childWidget: SelectAddOnQuantityScreen(
        itemCounts: min(productList.availableStock.toInt(), itemCount),
        selectedIndexNotifier: ValueNotifier<int>(productList.quantity),
        adGenericCallback: (value) => {
          if (productList.quantity != value) onChange(value ?? ''),
          navigatorPopScreen(context),
        },
      ),
      headerTitle: 'Select_Quantity'.localize(context),
    );
  }

  void openDropdown() {
    GestureDetector? detector;
    void searchForGestureDetector(BuildContext? element) {
      element?.visitChildElements((element) {
        if (element.widget is GestureDetector) {
          detector = element.widget as GestureDetector?;
          return;
        } else {
          searchForGestureDetector(element);
        }

        return;
      });
    }

    searchForGestureDetector(dropdownKey.currentContext);

    detector?.onTap?.call();
  }
/* void onItemClickHandler(
    ItemDetailResponse productList,
    BuildContext context,
    String value,
  ) {
    final ItemDetailResponse response = context
        .read<DutyFreeState>()
        .onDropDownAndRemoveItemClick(productList, value, context);
    productList = response;
  }*/
}
