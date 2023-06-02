/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';

const double _activeOpacity = 0.8;
const double _activeMargin = 2;
const Color _activeBackgroundColor = Colors.transparent;

class TouchableOpacityOld extends StatefulWidget {
  /// Creates a widget that uses Gesture Detector internally and works in the same way
  /// but fades the child when the user touches it.
  ///
  /// By default the opacity of the child is animated to 0.5 when the user touches it,
  /// this can be changed by providing a value for [activeOpacity]
  ///
  /// Pan and scale callbacks cannot be used simultaneously because scale is a
  /// superset of pan. Simply use the scale callbacks instead.
  ///
  /// Horizontal and vertical drag callbacks cannot be used simultaneously
  /// because a combination of a horizontal and vertical drag is a pan. Simply
  /// use the pan callbacks instead.
  ///
  /// By default, gesture detectors contribute semantic information to the tree
  /// that is used by assistive technology.
  const TouchableOpacityOld({
    Key? key,
    required this.child,
    this.activeOpacity = _activeOpacity,
    this.onTap,
    this.activeMargin = _activeMargin,
    this.activeBackgroundColor = _activeBackgroundColor,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TouchableOpacityState();
  }

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// Double value that will be used as the opacity of the child when a pointer
  /// down event is registered. Defaults to 0.2, value must be between 1.0 and
  /// 0.0 .
  final double activeOpacity;

  /// Double value that will be used as the margin of the child when a pointer
  /// down event is registered. Defaults to 5.
  final double activeMargin;

  /// Color value that will be used as the Background Color of the child when a pointer
  /// down event is registered. Defaults to transparent.
  final Color activeBackgroundColor;

  /// Give the on tap event.
  final GestureTapCallback? onTap;
}

class _TouchableOpacityState extends State<TouchableOpacityOld> {
  double animatedMargin = 0;
  double animatedOpacity = 1;
  Color animatedColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTap: widget.onTap,
      onTapCancel: _onTapCancel,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: animatedColor,
        ),
        margin: EdgeInsets.all(animatedMargin),
        duration: const Duration(milliseconds: 100),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: animatedOpacity,
          child: widget.child,
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails _) {
    updateView(isTapDown: true);
  }

  void _onTapUp(TapUpDetails _) {
    updateView(isTapDown: false);
  }

  void _onTapCancel() {
    updateView(isTapDown: false);
  }

  void updateView({required bool isTapDown}) {
    setState(() {
      animatedMargin = isTapDown ? widget.activeMargin : 0;
      animatedOpacity = isTapDown ? widget.activeOpacity : 1;
      animatedColor =
          isTapDown ? widget.activeBackgroundColor : Colors.transparent;
    });
  }
}
