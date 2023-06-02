/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/loyalty_dashboard_screen.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

///this class is used to provide animation view on loyalty dashboard
class AnimatedView extends StatefulWidget {
  final double? left, right, top, bottom;
  final String path;
  final double? rotationAngle;
  final double? height;
  final double? width;
  final int animationType;
  final Color? color;

  const AnimatedView({
    Key? key,
    this.left,
    this.right,
    this.top,
    this.bottom,
    this.rotationAngle,
    required this.path,
    required this.animationType,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);

  @override
  State<AnimatedView> createState() => _AnimatedViewState();
}

class _AnimatedViewState extends State<AnimatedView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          builder: (context, child) {
            return Positioned(
              left: widget.animationType == Constants.animationTypeLeft
                  ? wAnimation?.value
                  : widget.left,
              right: widget.animationType == Constants.animationTypeRight
                  ? wAnimation?.value
                  : widget.right,
              top: widget.animationType == Constants.animationTypeTop
                  ? wAnimation?.value
                  : widget.top,
              bottom: widget.animationType == Constants.animationTypeBottom
                  ? wAnimation?.value
                  : widget.bottom,
              child: Transform.rotate(
                angle: widget.rotationAngle ?? 0,
                child: SvgPicture.asset(
                  widget.path,
                  height: widget.height,
                  width: widget.width,
                  color: widget.color,
                ),
              ),
            );
          },
          animation:
              wAnimationController?.view ?? AnimationController(vsync: this),
        ),
      ],
    );
  }
}
