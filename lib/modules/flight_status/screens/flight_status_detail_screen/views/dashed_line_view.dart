/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class returns Dashed Line View for Flight status Detail Screen
class DashedLineView extends StatelessWidget {
  final double dashHeight;
  final double dashWidth;
  final int dashCount;
  final Color color;
  static const count = 3;
  const DashedLineView({
    Key? key,
    this.dashHeight = 1,
    this.dashWidth = 1,
    this.dashCount = count,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            dashCount,
            (index) => ADSizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            ),
          ),
        );
      },
    );
  }
}
