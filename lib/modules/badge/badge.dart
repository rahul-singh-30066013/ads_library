/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/badge/badge_position.dart';
import 'package:adani_airport_mobile/modules/badge/badge_positioned.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

/// This widget allows you to add badges to any of your [Widget].
const double badgePadding = 5;
const double badgeElevation = 2;

class Badge extends StatefulWidget {
  /// Creates a [Badge].
  ///
  /// If [child] is null, it doesn't make sense to set [ignorePointer],
  /// [position] and [alignment]
  ///
  /// See also:
  ///
  /// * [BorderRadius]
  /// * [BorderSide]
  const Badge({
    Key? key,
    required this.badgeContent,
    required this.child,
    this.badgeColor = Colors.blue,
    this.elevation = badgeElevation,
    this.position,
    this.padding = const EdgeInsets.all(badgePadding),
    this.borderRadius = BorderRadius.zero,
    this.alignment = Alignment.center,
    this.showBadge = true,
    this.ignorePointer = false,
    this.borderSide = BorderSide.none,
    this.stackFit = StackFit.loose,
    this.gradient,
  }) : super(key: key);

  /// It defines the widget that will be wrapped by this [badgeContent].
  final Widget child;

  /// This defines alignment for your [child].
  ///
  /// The default value is [Alignment.center].
  final AlignmentGeometry alignment;

  /// Allows to set custom position of [badgeContent].
  /// according to [child].
  ///
  /// If [child] is null, it doesn't make sense to use it.
  final BadgePosition? position;

  /// Content of this badge widget
  final int badgeContent;

  /// Can make your [badgeContent] interactive.
  ///
  /// The default value is false.
  final bool ignorePointer;

  /// Allows you to set the color for this [badgeContent].
  final Color badgeColor;

  /// Allows you to set the gradient color for this [badgeContent]
  final Gradient? gradient;

  /// This controls the size of the shadow below the material and the opacity.
  /// of the elevation overlay color if it is applied.
  final double elevation;

  /// Allows to set border side to this [badgeContent].
  ///
  /// The default value is [BorderSide.none].
  final BorderSide borderSide;

  /// Allows to edit fit parameter to [Stack] widget.
  ///
  /// The default value is [StackFit.loose].
  final StackFit stackFit;

  /// Allows to set border radius to this [badgeContent].
  ///
  /// The default value is [BorderRadius.zero].
  ///
  /// See also:
  ///
  /// * [borderSide]
  final BorderRadiusGeometry borderRadius;

  /// Specify padding for [badgeContent].
  ///
  /// The default value is EdgeInsets.all(5.0).
  final EdgeInsetsGeometry padding;

  /// Allows you to hide or show [badgeContent].
  ///
  /// The default value is true.
  /// If true, the badge will be displayed, if false, it doesn't.
  final bool showBadge;

  @override
  BadgeState createState() {
    return BadgeState();
  }
}

class BadgeState extends State<Badge> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  int previousCount = 0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
      lowerBound: context.k_20,
      upperBound: context.k_24,
      value: context.k_20,
    )..addListener(() => setState(() => ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const int dividerValue = 2;

    if (context.read<AppSessionState>().previousCartCount !=
        widget.badgeContent) {
      HapticFeedback.lightImpact();

      _controller?.forward().whenComplete(() => _controller?.reverse());
      context.read<AppSessionState>().previousCartCount = widget.badgeContent;
    }
    return Stack(
      fit: widget.stackFit,
      alignment: widget.alignment,
      clipBehavior: Clip.none,
      children: [
        widget.child,
        BadgePositioned(
          position: widget.position,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.badgeColor,
            ),
            width: _controller?.value ?? context.k_20,
            height: _controller?.value ?? context.k_20,
            child: Text(
              '${widget.badgeContent}',
              style: TextStyle(
                color: context.adColors.whiteTextColor,
                fontSize: (_controller?.value ?? context.k_20) / dividerValue,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void didUpdateWidget(Badge oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
