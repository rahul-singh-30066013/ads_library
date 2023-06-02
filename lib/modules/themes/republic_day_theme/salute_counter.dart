/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/views/circle_with_left_notification.dart';
import 'package:adani_airport_mobile/modules/themes/republic_day_theme/republic_day_theme.dart';
import 'package:adani_airport_mobile/modules/themes/state_management/theme_state_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

const int num5 = 5;
const double numPoint7 = 0.7;
const double num10k = 10000;

class SaluteCounter extends StatefulWidget {
  const SaluteCounter({Key? key}) : super(key: key);

  @override
  State<SaluteCounter> createState() => _SaluteCounterState();
}

class _SaluteCounterState extends State<SaluteCounter>
    with TickerProviderStateMixin {
  List numner = [];

  int salute = 0;

  @override
  void initState() {
    super.initState();
    context.read<ThemeStateManagement>().getSaluteCount();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<ThemeStateManagement, int>(
      selector: (context, viewModel) => viewModel.counter,
      builder: (context, value, Widget? child) {
        return value < num10k && value == 0
            ? const SizedBox.shrink()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: context.k_40,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        salute = value;
                        if (salute.toString().length < num5) {
                          numner = salute.toString().split('');
                          final int difference = 5 - salute.toString().length;
                          for (int itr = 0; itr < difference; itr++) {
                            numner.insert(0, '0');
                          }
                        } else {
                          numner = salute.toString().split('');
                        }
                        return Container(
                          width: context.k_36,
                          decoration: BoxDecoration(
                            color: orange,
                            borderRadius: index == 0
                                ? const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                  )
                                : index == numner.length - 1
                                    ? const BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      )
                                    : BorderRadius.zero,
                          ),
                          child: Center(
                            child: Text(
                              numner[index],
                              style: ADTextStyle400.size20.setTextColor(
                                white,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          width: numPoint7,
                          color: const Color(0xfffdcfa7),
                        );
                      },
                      itemCount: salute.toString().length < num5
                          ? num5
                          : salute.toString().length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: context.k_12,
                  ),
                  Text(
                    'Number of Proud Salutes',
                    style: ADTextStyle400.size20.setTextColor(
                      orange,
                    ),
                  ),
                ],
              );
      },
    );
  }
}
