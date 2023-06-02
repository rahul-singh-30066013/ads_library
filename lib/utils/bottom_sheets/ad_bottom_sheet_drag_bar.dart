/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';

const double widthDefault = 40;
const double heightDefault = 4;
const double borderRadiusDefault = 10;

class ADBottomSheetDragBar extends StatelessWidget {
  const ADBottomSheetDragBar({
    Key? key,
    this.width = widthDefault,
    this.height = heightDefault,
    this.barColor = Colors.grey,
    this.borderRadius = borderRadiusDefault,
  }) : super(key: key);

  final double height;
  final double width;
  final Color? barColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: height,
        width: width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: barColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
