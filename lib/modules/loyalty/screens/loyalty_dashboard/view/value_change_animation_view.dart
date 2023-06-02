/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ValueChangeAnimationView extends StatefulWidget {
  const ValueChangeAnimationView({
    Key? key,
    required this.style,
    required this.point,
  }) : super(key: key);

  final TextStyle style;
  final int point;

  @override
  ValueChangeAnimationWidgetState createState() =>
      ValueChangeAnimationWidgetState();
}

class ValueChangeAnimationWidgetState extends State<ValueChangeAnimationView>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    final Animation curve = CurvedAnimation(
      parent: _controller ?? AnimationController(vsync: this),
      curve: Curves.easeOut,
    );
    _animation = IntTween(begin: 0, end: widget.point)
        .animate(curve as Animation<double>);
    final forward = _controller?.forward();
    adLog('$forward');
  }

  @override
  Widget build(BuildContext context) {
    //controller.forward();
    return AnimatedBuilder(
      animation: _controller ?? AnimationController(vsync: this),
      builder: (BuildContext context, _) => Text(
        _animation?.value.toString() ?? '0',
        style: widget.style,
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
