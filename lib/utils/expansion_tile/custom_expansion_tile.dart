/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_dashboard_builder.dart'
    show greyBorder;
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

const Duration _kExpand = Duration(milliseconds: 200);

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.initiallyExpanded = false,
    this.maintainState = false,
    this.tilePadding,
    this.expandedCrossAxisAlignment,
    this.expandedAlignment,
    this.childrenPadding,
    this.backgroundColor,
    this.collapsedBackgroundColor,
    this.textStyle,
    this.collapsedTextStyle,
    this.iconColor,
    this.collapsedIconColor,
    this.borderRadius,
    this.backGroundImage,
    this.isLocked = false,
    this.rowAlignment = MainAxisAlignment.start,
    this.showSpacing = true,
    this.tileHeight,
    this.onEmptyTileTap,
    this.onLockedTileTap,
    this.disabled,
  })  : assert(
          expandedCrossAxisAlignment != CrossAxisAlignment.baseline,
        ),
        super(key: key);

  final String title;
  final Widget? subtitle;
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget> children;
  final Color? backgroundColor;
  final Color? collapsedBackgroundColor;
  final bool initiallyExpanded;
  final bool maintainState;
  final EdgeInsetsGeometry? tilePadding;
  final Alignment? expandedAlignment;
  final CrossAxisAlignment? expandedCrossAxisAlignment;
  final EdgeInsetsGeometry? childrenPadding;
  final Color? iconColor;
  final Color? collapsedIconColor;
  final BorderRadius? borderRadius;
  final String? backGroundImage;
  final TextStyle? textStyle;
  final TextStyle? collapsedTextStyle;
  final MainAxisAlignment rowAlignment;
  final bool isLocked;
  final bool showSpacing;
  final double? tileHeight;
  final void Function()? onEmptyTileTap;
  final void Function()? onLockedTileTap;
  final bool? disabled;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween =
      CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0, end: 0.5);

  final ColorTween _borderColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();
  final TextStyleTween _textStyleTween = TextStyleTween();

  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;

  late Animation<Color?> _iconColor;
  late Animation<Color?> _backgroundColor;
  late Animation<TextStyle> _titleFontStyle;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));
    _backgroundColor =
        _controller.drive(_backgroundColorTween.chain(_easeOutTween));
    _titleFontStyle = _controller.drive(_textStyleTween.chain(_easeInTween));

    _isExpanded = PageStorage.of(context)?.readState(context) as bool? ??
        widget.initiallyExpanded;
    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (widget.isLocked) {
      widget.onLockedTileTap?.call();
    } else if (widget.children.isEmpty) {
      widget.onEmptyTileTap?.call();
    } else {
      setState(() {
        _isExpanded = !_isExpanded;
        if (_isExpanded) {
          _controller.forward();
        } else {
          setState(() {
            _controller.reverse().then<void>((void value) {
              if (!mounted) {
                return;
              }
            });
          });
        }
        PageStorage.of(context)?.writeState(context, _isExpanded);
      });
      widget.onExpansionChanged?.call(_isExpanded);
    }
  }

  Widget _buildChildren(BuildContext context, Widget? child, bool? disable) {
    return Container(
      decoration: BoxDecoration(
        color: (disable ?? false)
            ? Colors.transparent
            : _backgroundColor.value ?? Colors.transparent,
        borderRadius: widget.borderRadius,
      ),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (disable ?? false) ? null : _handleTap,
            child: Opacity(opacity: (disable ?? false)?0.3:1,child: Container(
              height: widget.tileHeight,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: widget.tilePadding,
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius,
                image: (widget.backGroundImage != null &&
                    widget.backGroundImage != '')
                    ? DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    (disable ?? false)
                        ? const Color(greyBorder).withOpacity(1)
                        : Colors.transparent,
                    // 0 = Colored, 1 = Black & White
                    BlendMode.saturation,
                  ),
                  image: NetworkImage(widget.backGroundImage ?? ''),
                )
                    : null,
              ),
              child: Row(
                mainAxisAlignment: (widget.isLocked)
                    ? MainAxisAlignment.start
                    : widget.rowAlignment,
                children: (widget.isLocked)
                    ? [
                  Text(
                    widget.title,
                    style: _titleFontStyle.value,
                  ),
                  if (widget.children.isNotEmpty)
                    RotationTransition(
                      turns: _iconTurns,
                      child: Icon(
                        Icons.expand_more_rounded,
                        color: _iconColor.value,
                        size: context.k_20,
                      ),
                    ),
                  Container(
                    height: context.k_30,
                    width: context.k_30,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.black,
                      size: context.k_16,
                    ),
                  ),
                ]
                    : [
                  Text(
                    widget.title,
                    style: _titleFontStyle.value,
                  ),
                  if (widget.showSpacing)
                    const Spacer()
                  else
                    const SizedBox(),
                  if (widget.children.isNotEmpty)
                    RotationTransition(
                      turns: _iconTurns,
                      child: Icon(
                        Icons.expand_more_rounded,
                        color: _iconColor.value,
                        size: context.k_20,
                      ),
                    ),
                ],
              ),
            ),),
          ),
          ClipRect(
            child: Align(
              alignment: widget.expandedAlignment ?? Alignment.center,
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    _borderColorTween.end = theme.dividerColor;
    _textStyleTween
      ..begin = widget.collapsedTextStyle ?? const TextStyle()
      ..end = widget.textStyle ?? const TextStyle();
    _iconColorTween
      ..begin = widget.collapsedIconColor ?? theme.unselectedWidgetColor
      ..end = widget.iconColor ?? colorScheme.primary;
    _backgroundColorTween
      ..begin = widget.collapsedBackgroundColor
      ..end = widget.backgroundColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    final bool shouldRemoveChildren = closed && !widget.maintainState;

    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Padding(
          padding: widget.childrenPadding ?? EdgeInsets.zero,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: widget.expandedCrossAxisAlignment ??
                  CrossAxisAlignment.center,
              children: widget.children,
            ),
          ),
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, child) =>
          _buildChildren(context, child, widget.disabled),
      child: shouldRemoveChildren ? null : result,
    );
  }
}
