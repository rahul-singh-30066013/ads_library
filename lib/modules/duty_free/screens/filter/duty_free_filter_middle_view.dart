/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screen_helper/automation_keys/product_detail_automation_keys.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/filter/duty_free_filter_left_view_container.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/filter/duty_free_filter_right_view_optimised.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

/// This class is used to for create Bottom Sheet Container and Select Right View Container
///[DutyFreeFilterMiddleView] is use for create Bottom Sheet Container
///[SelectRightViewOptimised] is use for Select Right View Container
/// Case is used for manage for select right side Widget

const case0 = 0;
const case5 = 5;
const count = 1;

/// leftViewIndex is used for default Selected Index

const int ratio1 = 8;
const int ratio2 = 17;

///DutyFreeFilterMiddleView This class is used for create middle view of sor & filter
///[DutyFreeFilterMiddleView] This class is used for create middle view of sor & filter
class DutyFreeFilterMiddleView extends StatelessWidget {
  const DutyFreeFilterMiddleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dutyFreeState = context.read<DutyFreeState>();

    return Consumer<DutyFreeState>(
      builder: (context, value, child) => Row(
        children: [
          Expanded(
            flex: ratio1,
            child: Container(
              color: context.adColors.transparentColor,
              child: ListView.builder(
                itemCount: dutyFreeState.dutyFreeFilterList.length,
                itemBuilder: (BuildContext context, int index) {
                  ///InkWell that will be used to handle the click event in Right List

                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => {
                        dutyFreeState.updateSwitchStatus(
                          index,
                        ),
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Selector<DutyFreeState, int>(
                            selector: (context, viewModel) =>
                                viewModel.selectedIndex,
                            builder: (context, value, Widget? child) {
                              return DutyFreeFilterLeftViewContainer(
                                isSelected:
                                    index == dutyFreeState.selectedIndex,
                                index: index,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: ratio2,
            child: Selector<DutyFreeState, int>(
              selector: (context, viewModel) => viewModel.selectedIndex,
              builder: (context, value, Widget? child) {
                return SelectRightViewOptimised(
                  key: const Key(
                    ProductDetailAutomationKeys.allFilterContentKey,
                  ),
                  dutyFreeState: dutyFreeState,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
