/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// library flutter_scale_tap;

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

const double _defaultScaleMinimumValue = 0.95;
const double _defaultOpacityMinimumValue = 0.9;
final Curve _defaultScaleCurve =
    CurveSpring(); // ignore: non_constant_identifier_names
const Curve _defaultOpacityCurve = Curves.ease;
const Duration _defaultDuration = Duration(milliseconds: 300);

class TouchableOpacity extends StatefulWidget {
  final Function()? onTap;
  final Function()? onLongPress;
  final Widget? child;
  final Duration? duration;
  final double? scaleMinValue;
  final Curve? scaleCurve;
  final Curve? opacityCurve;
  final double? opacityMinValue;
  final bool enableFeedback;

  const TouchableOpacity({
    Key? key,
    this.enableFeedback = true,
    this.onTap,
    this.onLongPress,
    required this.child,
    this.duration,
    this.scaleMinValue,
    this.opacityMinValue,
    this.scaleCurve,
    this.opacityCurve,
  }) : super(key: key);

  @override
  _TouchableOpacityState createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _scale;
  Animation<double>? _opacity;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this);
    _scale = Tween<double>(begin: 1, end: 1)
        .animate(_animationController ?? AnimationController(vsync: this));
    _opacity = Tween<double>(begin: 1, end: 1)
        .animate(_animationController ?? AnimationController(vsync: this));
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  Future<void> anim({double? scale, double? opacity, Duration? duration}) {
    _animationController?.stop();
    _animationController?.duration = duration ?? Duration.zero;

    _scale = Tween<double>(
      begin: _scale?.value,
      end: scale,
    ).animate(
      CurvedAnimation(
        curve: widget.scaleCurve ??
            ScaleTapConfig.scaleCurve ??
            _defaultScaleCurve,
        parent: _animationController ?? AnimationController(vsync: this),
      ),
    );
    _opacity = Tween<double>(
      begin: _opacity?.value,
      end: opacity,
    ).animate(
      CurvedAnimation(
        curve: widget.opacityCurve ??
            ScaleTapConfig.opacityCurve ??
            _defaultOpacityCurve,
        parent: _animationController ?? AnimationController(vsync: this),
      ),
    );
    _animationController?.reset();
    return (_animationController ?? AnimationController(vsync: this)).forward();
  }

  Future<void> _onTapDown(_) {
    return anim(
      scale: widget.scaleMinValue ??
          ScaleTapConfig.scaleMinValue ??
          _defaultScaleMinimumValue,
      opacity: widget.opacityMinValue ??
          ScaleTapConfig.opacityMinValue ??
          _defaultOpacityMinimumValue,
      duration: widget.duration ?? ScaleTapConfig.duration ?? _defaultDuration,
    );
  }

  Future<void> _onTapUp(_) {
    return anim(
      scale: 1,
      opacity: 1,
      duration: widget.duration ?? ScaleTapConfig.duration ?? _defaultDuration,
    );
  }

  Future<void> _onTapCancel(_) {
    return _onTapUp(_);
  }

  @override
  Widget build(BuildContext context) {
    final bool isTapEnabled =
        widget.onTap != null || widget.onLongPress != null;

    return AnimatedBuilder(
      animation: _animationController ?? AnimationController(vsync: this),
      builder: (_, Widget? child) {
        return Opacity(
          opacity: (_opacity ??
                  Tween<double>(begin: 1, end: 1).animate(
                    _animationController ?? AnimationController(vsync: this),
                  ))
              .value,
          child: Transform.scale(
            scale: _scale?.value,
            child: child,
          ),
        );
      },
      child: Listener(
        onPointerDown: isTapEnabled ? _onTapDown : null,
        onPointerCancel: _onTapCancel,
        onPointerUp: _onTapUp,
        child: GestureDetector(
          onTap: isTapEnabled
              ? () {
                  if (widget.enableFeedback) {
                    SystemSound.play(SystemSoundType.click);
                  }
                  final onPressedCall = widget.onTap?.call();
                  adLog(onPressedCall.toString());
                }
              : null,
          onLongPress: isTapEnabled ? widget.onLongPress : null,
          child: widget.child,
        ),
      ),
    );
  }
}

const double _stiffness = 70;
const double _ratio = 0.7;

class CurveSpring extends Curve {
  final SpringSimulation sim;

  CurveSpring() : sim = _sim(_stiffness);

  @override
  double transform(double t) => sim.x(t) + t * (1 - sim.x(1));
}

SpringSimulation _sim(double stiffness) => SpringSimulation(
      SpringDescription.withDampingRatio(
        mass: 1,
        stiffness: stiffness,
        ratio: _ratio,
      ),
      0,
      1,
      0,
    );

class ScaleTapConfig {
  static double? scaleMinValue;
  static Curve? scaleCurve;
  static double? opacityMinValue;
  static Curve? opacityCurve;
  static Duration? duration;
}
