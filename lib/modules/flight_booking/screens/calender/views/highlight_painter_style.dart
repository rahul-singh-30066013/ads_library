/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/screens/calender/views/month_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Determines which style to use to paint the highlight.
enum HighlightPainterStyle {
  /// Paints nothing.
  none,

  /// Paints a rectangle that occupies the leading half of the space.
  highlightLeading,

  /// Paints a rectangle that occupies the trailing half of the space.
  highlightTrailing,

  /// Paints a rectangle that occupies all available space.
  highlightAll,
}

///highlight selected range
class HighlightPainter extends CustomPainter {
  HighlightPainter({
    required this.color,
    this.style = HighlightPainterStyle.none,
    this.textDirection,
  });

  final Color color;
  final HighlightPainterStyle style;
  final TextDirection? textDirection;

  @override
  void paint(Canvas canvas, Size size) {
    if (style == HighlightPainterStyle.none) {
      return;
    }

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Rect rectLeft = Rect.fromLTWH(
      0,
      0,
      size.width / 2,
      selectionRangeHeight,
    );
    final Rect rectRight = Rect.fromLTWH(
      size.width / 2,
      0,
      size.width / 2,
      selectionRangeHeight,
    );

    switch (style) {
      case HighlightPainterStyle.highlightTrailing:
        canvas.drawRect(
          textDirection == TextDirection.ltr ? rectRight : rectLeft,
          paint,
        );
        break;
      case HighlightPainterStyle.highlightLeading:
        canvas.drawRect(
          textDirection == TextDirection.ltr ? rectLeft : rectRight,
          paint,
        );
        break;
      case HighlightPainterStyle.highlightAll:
        canvas.drawRect(
          Rect.fromLTWH(
            0,
            0,
            size.width,
            selectionRangeHeight,
          ),
          paint,
        );
        break;
      case HighlightPainterStyle.none:
        break;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
