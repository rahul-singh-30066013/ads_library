/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:ui';

import 'package:flutter/material.dart';

const int two = 2;

class AnimatedBorder extends CustomPainter {
  final double currentState;
  final double strokeWidth;
  final double radius;

  AnimatedBorder({
    required this.currentState,
    required this.strokeWidth,
    required this.radius,
  });

  final List<Color> animationColors = [
    const Color.fromRGBO(240, 86, 54, 0.8),
    const Color.fromRGBO(146, 57, 147, 0.8),
    const Color.fromRGBO(107, 92, 166, 0.8),
    const Color.fromRGBO(32, 115, 184, 0.8),
    const Color.fromRGBO(15, 179, 113, 0.8),
    const Color.fromRGBO(146, 57, 147, 0.8),
    const Color.fromRGBO(240, 86, 54, 0.8),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final Paint paint1 = Paint()
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..shader = SweepGradient(
        colors: animationColors,
      ).createShader(rect);

    final Paint paint2 = Paint()
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..shader = SweepGradient(
        colors: animationColors,
      ).createShader(rect);

    final Path path1 = getPath1(size);
    final Path extracted1 = getPathMetric(path: path1);
    canvas.drawPath(extracted1, paint1);

    final Path path2 = getPath2(size);
    final Path extracted2 = getPathMetric(path: path2);
    canvas.drawPath(extracted2, paint2);
  }

  Path getPathMetric({required Path path}) {
    final PathMetrics pathMetrics = path.computeMetrics();
    final PathMetric pathMetric = pathMetrics.first;
    final Path extracted =
        pathMetric.extractPath(0, pathMetric.length * currentState);
    return extracted;
  }

  Path getPath1(Size size) {
    final radius = Radius.circular(this.radius);
    final offset = Rect.fromCircle(center: Offset.zero, radius: this.radius);
    return Path()
      ..moveTo(size.width / two, size.height)
      ..lineTo(size.width / two, size.height)
      ..lineTo(this.radius, size.height)
      ..relativeArcToPoint(offset.topLeft, radius: radius)
      ..lineTo(0, size.height - this.radius)
      ..lineTo(0, this.radius)
      ..relativeArcToPoint(offset.topRight, radius: radius)
      ..lineTo(this.radius, 0)
      ..lineTo(size.width / two, 0);
  }

  Path getPath2(Size size) {
    final radius = Radius.circular(this.radius);
    final offset = Rect.fromCircle(center: Offset.zero, radius: this.radius);
    return Path()
      ..moveTo(size.width / two, size.height)
      ..lineTo(size.width / two, size.height)
      ..lineTo(size.width - this.radius, size.height)
      ..relativeArcToPoint(offset.topRight, clockwise: false, radius: radius)
      ..lineTo(size.width, size.height - this.radius)
      ..lineTo(size.width, this.radius)
      ..relativeArcToPoint(offset.topLeft, clockwise: false, radius: radius)
      ..lineTo(size.width - this.radius, 0)
      ..lineTo(size.width / two, 0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
