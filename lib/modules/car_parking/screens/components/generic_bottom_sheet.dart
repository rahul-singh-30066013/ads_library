/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/car_parking/state_management/car_parking_dropdown_view_model.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class GenericBottomSheet extends StatefulWidget {
  final List<String> valuesDomain;
  final String selectedValue;
  final ADGenericCallback onBottomSheetItemSelect;

  const GenericBottomSheet({
    Key? key,
    required this.valuesDomain,
    required this.selectedValue,
    required this.onBottomSheetItemSelect,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GenericBottomSheetState();
  }
}

class _GenericBottomSheetState extends State<GenericBottomSheet> {
  CarParkingDropdownViewModel dropdownState = CarParkingDropdownViewModel();

  @override
  void initState() {
    dropdownState.populate(
      widget.valuesDomain,
      widget.selectedValue,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<CarParkingDropdownViewModel>(
      viewModel: dropdownState,
      child: Consumer<CarParkingDropdownViewModel>(
        builder: (context, value, child) {
          return ListView(
            shrinkWrap: true,
            children: dropdownState.options
                .map(
                  (element) => GestureDetector(
                    onTap: () => selectAndPop(element),
                    // dropdownState.updateSelectionWith(element),
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            element,
                            style: element == dropdownState.selectedValue
                                ? ADTextStyle600.size16.setTextColor(
                                    context.adColors.blackTextColor,
                                  )
                                : ADTextStyle500.size16,
                          ),
                          if (element == dropdownState.selectedValue)
                            Icon(
                              Icons.check,
                              color: context.adColors.neutralInfoMsg,
                            )
                          else
                            const SizedBox(),
                        ],
                      ).paddingBySide(
                        top: context.k_30,
                      ),
                    ),
                  ),
                )
                .toList(),
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          );
        },
      ),
    );
  }

  void selectAndPop(String element) {
    dropdownState.updateSelectionWith(element);
    widget.onBottomSheetItemSelect(element);
    Navigator.pop(context, element);
  }
}
