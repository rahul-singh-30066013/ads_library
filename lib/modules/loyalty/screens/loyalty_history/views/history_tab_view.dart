/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class HistoryTabView extends StatefulWidget {
  final String rewardPoints;
  final String rewardTitle;
  final String? rewardIconPath;
  final bool selected;
  const HistoryTabView({
    Key? key,
    required this.rewardPoints,
    required this.rewardTitle,
    this.rewardIconPath,
    required this.selected,
  }) : super(key: key);

  @override
  State<HistoryTabView> createState() => _HistoryTabViewState();
}

class _HistoryTabViewState extends State<HistoryTabView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.rewardPoints,
                    style: widget.selected
                        ? ADTextStyle600.size22.setTextColor(
                            context.adColors.blackColor,
                          )
                        : ADTextStyle400.size22.setTextColor(
                            context.adColors.blackColor,
                          ),
                  ),
                ],
              ),
              ADSizedBox(
                height: context.k_4,
              ),
              Text(
                widget.rewardTitle,
                style: ADTextStyle400.size14.setTextColor(
                  context.adColors.blackTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
