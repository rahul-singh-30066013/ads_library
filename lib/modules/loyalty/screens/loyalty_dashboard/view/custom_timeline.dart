/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/loyalty/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/timeline/dashed_line.dart';

///this class is used to add custome timeline with icon and text in list
class CustomTimeline extends StatelessWidget {
  /// Defines the work of the particural node is completed or not
  final bool status;

  /// Defines the main heading of node
  final String? mainText;

  /// Defines the subText of node
  final Widget? subWidget;

  /// Type of path line
  final bool isDashedLine;

  /// Current index of timeline
  final int index;

  /// Size of timeline
  final int timelineSize;

  /// textstyle of mainText
  final TextStyle? mainTextStyle;

  /// color node
  final Color? nodeColor;

  /// color of path
  final Color? pathColor;

  /// This Constructor includes 9 parameters in which 5 of them are required and 4 are optional.
  ///
  /// Creates a timeline according to the parameters.
  ///
  /// [status] Defines the work of the particural node is completed or not.
  /// [mainText] Defines the main heading of node.
  /// [subWidget] Defines the subText of node.
  /// [isDashedLine] Type of path line.
  /// [index] Current index of timeline.
  /// [timelineSize] Size of timeline.

  const CustomTimeline({
    Key? key,
    required this.status,
    this.mainText,
    this.subWidget,
    required this.isDashedLine,
    required this.index,
    required this.timelineSize,
    this.mainTextStyle,
    this.nodeColor,
    this.pathColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      crossAxisAlignment: CrossAxisAlignment.start,
      direction: Axis.horizontal,
      children: [
        Column(
          children: [
            Container(
              width: 1,
              height: context.k_4,
              child: index == 0
                  ? const ADSizedBox.shrink()
                  : isDashedLine
                      ? CustomPaint(
                          painter: ADLineDashedPainter(
                            color: pathColor ??
                                context.adColors.circleGreyTextColor,
                            height: context.k_4,
                          ),
                        )
                      : Container(
                          color: pathColor ?? context.adColors.greyTextColor,
                        ),
            ),
            Container(
              width: context.k_8,
              height: context.k_8,
              decoration: BoxDecoration(
                color: nodeColor ?? context.adColors.greyTextColor,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 1,
              height: _calculateContentHeight(
                mainText.validateWithDefaultValue(),
                context,
              ),
              child: index == timelineSize - 1
                  ? const SizedBox()
                  : isDashedLine
                      ? CustomPaint(
                          painter: ADLineDashedPainter(
                            color: pathColor ??
                                context.adColors.circleGreyTextColor,
                            height: _calculateContentHeight(
                              mainText.validateWithDefaultValue(),
                              context,
                            ),
                          ),
                        )
                      : Container(
                          color: pathColor ?? context.adColors.greyTextColor,
                        ),
            ),
          ],
        ),
        SizedBox(
          width: context.k_20,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                mainText.validateWithDefaultValue(),
                textAlign: TextAlign.justify,
                style: mainTextStyle ??
                    ADTextStyle400.size12
                        .setTextColor(context.theme.colorScheme.greyTextColor),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// This method is used to draw the content related to that node and shows the information of the node.

  /// This method is used to get the size of the content
  double _calculateContentHeight(
    String mainText,
    BuildContext context,
  ) {
    return mainText.textHeight(
          mainTextStyle ??
              ADTextStyle400.size12
                  .setTextColor(context.theme.colorScheme.greyTextColor),
          ADSizeConfig.defaultSize.width * Constants.widthRatio,
          mainText,
        ) +
        context.k_32;
  }

  double textHeight(
    TextStyle style,
    double textWidth,
    BuildContext context,
    String text,
  ) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();

    final countLines = (textPainter.size.width / textWidth).ceil();

    final height = countLines * textPainter.size.height;
    return height;
  }
}

extension StringExtension on String {
  double textHeight(
    TextStyle style,
    double textWidth,
    String text,
  ) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text.replaceAll(' ', '0'), style: style),
      //   textScaleFactor: MediaQuery.of(context).textScaleFactor,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();
    final countLines = (textPainter.size.width / textWidth).ceil();

    final height = countLines * textPainter.size.height;
    return height;
  }
}
