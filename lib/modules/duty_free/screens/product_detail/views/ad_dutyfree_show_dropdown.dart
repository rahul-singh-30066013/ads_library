/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class will called to show size drop down for product
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/item_detail_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/screen_helper/automation_keys/duty_free_cart_automation_keys.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

//ignore: must_be_immutable
class ADDutyFreeShowDropdown extends StatelessWidget {
  ItemDetailResponse productList;
  ValueChanged<String> onChange;
  final GlobalKey dropdownKey = GlobalKey();

  ADDutyFreeShowDropdown({
    Key? key,
    required this.productList,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final dropDownWidth = 88.sp;
    final dropDownHeight = 36.sp;
    return GestureDetector(
      onTap: openDropdown,
      child: Row(
        children: [
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
                      'qtyLabel'.localize(context),
                      style: ADTextStyle600.size14
                          .setTextColor(context.adColors.blackTextColor),
                      key: const Key(
                        DutyFreeCartAutomationKeys.dutyFreeQtyText,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: context.adColors.greyChartTextColor,
                    ),
                    DropdownButton<String>(
                      key: dropdownKey,
                      underline: Container(color: Colors.transparent),
                      icon: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: context.adColors.greyChartTextColor,
                      ),
                      iconSize: context.k_18,
                      value: '${productList.quantity}',
                      items: productList.quantities.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value.validateWithDefaultValue(),
                            style: ADTextStyle600.size14,
                            key: const Key(
                              DutyFreeCartAutomationKeys.dutyFreeQtyValue,
                            ),
                          ).paddingBySide(
                            left: context.k_2,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) => onChange(value ?? ''),
                    ).paddingBySide(right: context.k_10),
                  ],
                );
              },
              shouldRebuild: (previous, next) => true,
            ),
          ),
        ],
      ),
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
