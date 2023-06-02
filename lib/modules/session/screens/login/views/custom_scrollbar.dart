/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

const Duration _kScrollbarTimeToFade = Duration(milliseconds: 1200);
const Duration _kScrollbarFadeDuration = Duration(milliseconds: 250);

/// Custom ScrollBar
/// Wrap over a Scrollable widget to show ScrollBar

class CustomScrollBar extends RawScrollbar {
  const CustomScrollBar({
    Key? key,
    required Widget child,
    ScrollController? controller,
    bool isAlwaysShown = false,
    double thickness = defaultThickness,
    this.thicknessWhileDragging = defaultThicknessWhileDragging,
    Radius radius = defaultRadius,
    this.radiusWhileDragging = defaultRadiusWhileDragging,
    ScrollNotificationPredicate? notificationPredicate,
    ScrollbarOrientation? scrollbarOrientation,
    required this.showScrollBar,
  })  : assert(thickness < double.infinity),
        assert(thicknessWhileDragging < double.infinity),
        super(
          key: key,
          child: child,
          controller: controller,
          thumbVisibility: isAlwaysShown,
          thickness: thickness,
          radius: radius,
          fadeDuration: _kScrollbarFadeDuration,
          timeToFade: _kScrollbarTimeToFade,
          pressDuration: const Duration(milliseconds: 100),
          notificationPredicate:
              notificationPredicate ?? defaultScrollNotificationPredicate,
          scrollbarOrientation: scrollbarOrientation,
        );

  static const double defaultThickness = 3;
  static const double defaultThicknessWhileDragging = 8;
  static const Radius defaultRadius = Radius.circular(1.5);
  static const Radius defaultRadiusWhileDragging = Radius.circular(4);
  final double thicknessWhileDragging;
  final Radius radiusWhileDragging;
  final bool showScrollBar;

  @override
  RawScrollbarState<CustomScrollBar> createState() => _CustomScrollBarState();
}

class _CustomScrollBarState extends RawScrollbarState<CustomScrollBar> {
  AnimationController? _thicknessAnimationController;

  final double _kScrollbarMinLength = 20;
  final double _kScrollbarMinOverscrollLength = 8;
  final Duration _kScrollbarResizeDuration = const Duration(milliseconds: 100);
  final double _kPaddingBelowScrollBar = -34;
  final double _kPaddingAboveScrollBar = 25;
  final double _kVelocityCheck = 10;

  final Color _kScrollbarColor = const CupertinoDynamicColor.withBrightness(
    color: Color(0x59000000),
    darkColor: Color(0x80FFFFFF),
  );

  final double _kScrollbarMainAxisMargin = 3;
  final double _kScrollbarCrossAxisMargin = 3;

  double _pressStartAxisPosition = 0;

  double get _thickness {
    return widget.thickness ??
        0.0 +
            (_thicknessAnimationController?.value ?? 0.0) *
                (widget.thicknessWhileDragging - (widget.thickness ?? 0.0));
  }

  Radius? get _radius {
    return Radius.lerp(
      widget.radius,
      widget.radiusWhileDragging,
      _thicknessAnimationController?.value ?? 0.0,
    );
  }

  @override
  void initState() {
    super.initState();
    _thicknessAnimationController = AnimationController(
      vsync: this,
      duration: _kScrollbarResizeDuration,
    );
    _thicknessAnimationController?.addListener(() {
      updateScrollbarPainter();
    });
  }

  @override
  void updateScrollbarPainter() {
    scrollbarPainter
      ..color = CupertinoDynamicColor.resolve(_kScrollbarColor, context)
      ..textDirection = Directionality.of(context)
      ..thickness = (widget.showScrollBar) ? _thickness : 0
      ..mainAxisMargin = _kScrollbarMainAxisMargin
      ..crossAxisMargin = _kScrollbarCrossAxisMargin
      ..radius = _radius
      ..padding = EdgeInsets.only(
        bottom: _kPaddingBelowScrollBar,
        top: _kPaddingAboveScrollBar,
      )
      ..minLength = _kScrollbarMinLength
      ..minOverscrollLength = _kScrollbarMinOverscrollLength
      ..scrollbarOrientation = widget.scrollbarOrientation;
  }

  @override
  void handleThumbPressStart(Offset localPosition) {
    super.handleThumbPressStart(localPosition);
    final Axis? direction = getScrollbarDirection();
    if (direction != null) {
      switch (direction) {
        case Axis.vertical:
          _pressStartAxisPosition = localPosition.dy;
          break;
        case Axis.horizontal:
          _pressStartAxisPosition = localPosition.dx;
          break;
      }
    }
  }

  @override
  void handleThumbPress() {
    if (getScrollbarDirection() == null) {
      return;
    }
    super.handleThumbPress();
    _thicknessAnimationController?.forward().then<void>(
          (_) => HapticFeedback.mediumImpact(),
        );
  }

  @override
  void handleThumbPressEnd(Offset localPosition, Velocity velocity) {
    final Axis? direction = getScrollbarDirection();
    if (direction == null) {
      return;
    }
    // final value = _thicknessAnimationController?.reverse();
    super.handleThumbPressEnd(localPosition, velocity);
    switch (direction) {
      case Axis.vertical:
        if (velocity.pixelsPerSecond.dy.abs() < _kVelocityCheck &&
            (localPosition.dy - _pressStartAxisPosition).abs() > 0) {
          HapticFeedback.mediumImpact();
        }
        break;
      case Axis.horizontal:
        if (velocity.pixelsPerSecond.dx.abs() < _kVelocityCheck &&
            (localPosition.dx - _pressStartAxisPosition).abs() > 0) {
          HapticFeedback.mediumImpact();
        }
        break;
    }
  }

  @override
  void dispose() {
    _thicknessAnimationController?.dispose();
    super.dispose();
  }
}
