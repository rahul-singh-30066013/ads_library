import 'dart:async';

import 'package:adani_airport_mobile/modules/payment/screens/components/tooltip_shape_border.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class TooltipScreen extends StatefulWidget {
  const TooltipScreen({
    Key? key,
    this.richTextHeader,
    this.textStyleHeader,
    this.textStyleMessage,
    this.padding,
    this.tooltipColor,
    required this.richTextMessage,
    this.divider = false,
    this.dividerTextMessage,
    this.dividerTextHeader,
  }) : super(key: key);

  final String? richTextHeader;
  final String richTextMessage;
  final String? dividerTextMessage;

  final TextStyle? textStyleHeader;
  final TextStyle? textStyleMessage;
  final TextStyle? dividerTextHeader;

  final Color? tooltipColor;
  final double? padding;
  final bool divider;

  @override
  State<TooltipScreen> createState() => _TooltipScreenState();
}

class _TooltipScreenState extends State<TooltipScreen> {
  final verticalOffset = 12.0;
  final divideValue = 3;
  final lineHeight = 1.5;
  final blurRadius = 8.0;
  final opacity = 0.12;
  final arrowArc = 0.2;
  double tooltipPoint = 0;
  final GlobalKey tooltipKey = GlobalKey();
  RenderBox? renderBox;
  @override
  void initState() {
    super.initState();
    // defines a timer
    Timer(
      const Duration(milliseconds: 500),
      () => {
        setState(() {
          renderBox =
              tooltipKey.currentContext?.findRenderObject() as RenderBox?;
          tooltipPoint = renderBox?.localToGlobal(Offset.zero).dx ?? 0;
        }),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      verticalOffset: verticalOffset,
      triggerMode: TooltipTriggerMode.tap,
      padding: EdgeInsets.all(context.k_14),
      margin: EdgeInsets.only(
        left: tooltipPoint / divideValue,
        right: context.k_12,
      ),
      preferBelow: false,
      richMessage: TextSpan(
        style: TextStyle(
          color: context.adColors.whiteTextColor,
        ),
        children: [
          if (!widget.richTextHeader.isNullOrEmpty)
            TextSpan(
              text: widget.richTextHeader,
              style: widget.textStyleHeader ??
                  ADTextStyle400.size14.setTextColor(
                    context.adColors.whiteTextColor,
                  ),
            ),
          if (widget.divider)
            WidgetSpan(
              child: SizedBox(
                height: context.k_28,
              ),
            ),
          if (widget.divider)
            TextSpan(
              text: widget.dividerTextMessage,
              style: widget.dividerTextHeader ??
                  ADTextStyle400.size14.setTextColor(
                    context.adColors.whiteTextColor,
                  ),
            ),
          if (widget.divider)
            WidgetSpan(
              child: SizedBox(
                height: context.k_16,
              ),
            ),
          if (widget.divider)
            WidgetSpan(
              child: Divider(
                color: context.adColors.tileBorderColor,
              ),
            ),
          TextSpan(
            text: widget.richTextMessage,
            style: widget.textStyleMessage ??
                ADTextStyle400.size12.setTextColor(
                  context.adColors.whiteTextColor,
                ),
          ),
        ],
      ),
      decoration: ShapeDecoration(
        shape: TooltipShapeBorder(
          arrowArc: arrowArc,
          arrowHeight: context.k_14,
          radius: context.k_4,
          offsetDx: widget.padding == null
              ? tooltipPoint
              : (tooltipPoint + (widget.padding ?? 0)),
        ),
        color: widget.tooltipColor ?? context.adColors.blackTextColor,
        shadows: [
          BoxShadow(
            color: context.adColors.blackColor.withOpacity(opacity),
            blurRadius: blurRadius,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.k_8,
          vertical: context.k_8,
        ),
        child: Image.asset(
          'lib/assets/images/pranaam/information.png',
          width: context.k_16,
          height: context.k_16,
          key: tooltipKey,
        ),
      ),
    );
  }
}
