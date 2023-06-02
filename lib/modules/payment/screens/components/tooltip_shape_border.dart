/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';

const defaultArrowWidth = 20.0;
const defaultArrowHeight = 20.0;
const defaultSpacing = 10.0;

///Custom Tooltip shape border for tooltip.
class TooltipShapeBorder extends ShapeBorder {
  final double arrowHeight;
  final double arrowArc;
  final double radius;
  final bool showBottomArrow;
  final double offsetDx;
  final bool showTopArrow;
  const TooltipShapeBorder({
    this.radius = 0,
    this.arrowHeight = defaultArrowHeight,
    this.arrowArc = 0.0,
    this.offsetDx = 0.0,
    this.showBottomArrow = true,
    this.showTopArrow = false,
  }) : assert(arrowArc <= 1.0 && arrowArc >= 0.0);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: arrowHeight);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(
      rect.topLeft,
      rect.bottomRight - Offset(0, arrowHeight),
    );
    final Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          rect,
          Radius.circular(radius),
        ),
      );
    if (showBottomArrow) {
      path
        ..moveTo(
          offsetDx > 0 ? offsetDx : rect.bottomCenter.dx - defaultSpacing,
          rect.bottomCenter.dy,
        )
        ..relativeLineTo(defaultSpacing, arrowHeight)
        ..relativeLineTo(
          defaultSpacing,
          -arrowHeight,
        );
    }
    if (!showBottomArrow && showTopArrow) {
      const double xxx = defaultArrowWidth;
      final double yyy = arrowHeight;
      final double zzz = 1 - arrowArc;
      const double num = 2;
      path
        ..moveTo(rect.bottomCenter.dx + defaultSpacing, defaultSpacing)
        ..relativeLineTo(-xxx / num * zzz, -yyy * zzz)
        ..relativeQuadraticBezierTo(
          -xxx / num * (1 - zzz),
          -yyy * (1 - zzz),
          -xxx * (1 - zzz),
          0,
        )
        ..relativeLineTo(-xxx / num * zzz, yyy * zzz);
    }

    path.close();
    return path;
  }

  @override
  ShapeBorder scale(double t) => this;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // TODO: implement paint
  }
}
