/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/tooltip_shape_border.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/timeline/dashed_line.dart';

class DutyFreeADTimeLine extends StatelessWidget {
  /// Defines the work of the particular node is completed or not
  final bool status;

  final String orderStatus;

  final String orderLastStatus;

  /// Duty Free Flight No
  final String flightNo;

  /// Defines the main heading of node
  final String? mainText;

  /// Defines the subText of node
  final String? subText;

  /// Defines the information or the description related to that node.
  final String? description;

  /// Text inside the node
  final String? insideCircleText;

  /// Type of path line
  final bool isDashedLine;

  /// Current index of timeline
  final int index;

  /// Size of timeline
  final int timelineSize;

  /// textstyle of mainText
  final TextStyle? mainTextStyle;

  /// textstyle of subText
  final TextStyle? subTextStyle;

  /// textstyle description
  final TextStyle? descriptionTextStyle;

  /// color node
  final Color? nodeColor;

  /// color of path
  final Color? pathColor;

  // TextPainter? textPainter = TextPainter();

  static const double width = 0.7;

  /// This Constructor includes 9 parameters in which 5 of them are required and 4 are optional.
  ///
  /// Creates a timeline according to the parameters.
  ///
  /// [status] Defines the work of the particural node is completed or not.
  /// [mainText] Defines the main heading of node.
  /// [subText] Defines the subText of node.
  /// [description] Defines the information or the description related to that node.
  /// [insideCircleText] Text inside the node.
  /// [isDashedLine] Type of path line.
  /// [index] Current index of timeline.
  /// [timelineSize] Size of timeline.
  ///
  /// Usage ctor ADTimeline(
  ///   status: status,
  ///   mainText: mainText,
  ///   insideCircleText: insideCircleText,
  ///   isDashedLine: isDashedLine,
  ///   index: index,
  ///   timelineSize: timelineSize,
  ///   nextStatusNode: nextStatusNode,
  ///   contentWidget: contentWidget
  /// )
  const DutyFreeADTimeLine({
    Key? key,
    required this.status,
    required this.flightNo,
    this.mainText,
    this.subText,
    this.description,
    this.insideCircleText,
    required this.isDashedLine,
    required this.index,
    required this.timelineSize,
    this.mainTextStyle,
    this.subTextStyle,
    this.nodeColor,
    this.pathColor,
    this.descriptionTextStyle,
    required this.orderStatus,
    required this.orderLastStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adLog('description--> $description');
    final double textContainerWidth = 311.sp;
    const verticalOffset = 12.0;
    const lineHeight = 1.5;
    const blurRadius = 8.0;
    const opacity = 0.18;
    return Flex(
      crossAxisAlignment: CrossAxisAlignment.start,
      direction: Axis.horizontal,
      children: [
        Column(
          children: [
            Container(
              width: context.k_8,
              height: context.k_8,
              margin: EdgeInsets.only(top: context.k_6),
              decoration: BoxDecoration(
                color: ((isOrderCancelled(
                          context,
                        ) /*||
                            isOrderRescheduled(context)*/
                        ) &&
                        (orderStatus.toLowerCase() == 'picked_up'))
                    ? context.adColors.greyTextColor
                    : (nodeColor ?? context.adColors.greyTextColor),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  insideCircleText == null ? '' : insideCircleText.toString(),
                  style: ADTextStyle400.size12
                      .setTextColor(context.adColors.whiteTextColor),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: context.k_6),
              width: 1,
              height: _calculateContentHeight(
                mainText.validateWithDefaultValue(),
                subText.validateWithDefaultValue(),
                description.validateWithDefaultValue(),
                context,
              ),
              child: index == timelineSize - 1
                  ? const SizedBox()
                  : isDashedLine
                      ? CustomPaint(
                          /// This method is used to draw dashed line.
                          painter: ADLineDashedPainter(
                            color: pathColor ??
                                context.adColors.circleGreyTextColor,
                            height: _calculateContentHeight(
                              mainText.validateWithDefaultValue(),
                              subText.validateWithDefaultValue(),
                              description.validateWithDefaultValue(),
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

        /// This method is used to draw the content related to that node and shows the information of the node.
        Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.vertical,
          children: [
            if (orderStatus.toLowerCase() != 'picked_up') ...[
              Row(
                children: [
                  Text(
                    mainText.validateWithDefaultValue(),
                    textAlign: TextAlign.justify,
                    style: mainTextStyle ??
                        ADTextStyle400.size12.setTextColor(
                          context.theme.colorScheme.greyTextColor,
                        ),
                  ),
                  if (orderStatus.toLowerCase() == 'failed')
                    Tooltip(
                      verticalOffset: verticalOffset,
                      triggerMode: TooltipTriggerMode.tap,
                      preferBelow: true,
                      richMessage: TextSpan(
                        text: 'order_failed_message'.localize(context),
                        style: ADTextStyle400.size14
                            .setTextColor(
                              context.adColors.whiteTextColor,
                            )
                            .copyWith(
                              height: lineHeight,
                            ),
                      ),
                      decoration: ShapeDecoration(
                        shape: const TooltipShapeBorder(
                          arrowArc: 0.2,
                          arrowHeight: 14,
                          radius: 4,
                          showBottomArrow: false,
                        ),
                        color: context.adColors.blackTextColor,
                        shadows: [
                          BoxShadow(
                            color: context.adColors.blackColor.withOpacity(
                              opacity,
                            ),
                            blurRadius: blurRadius,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(
                        left: context.k_20,
                        right: context.k_20,
                        top: context.k_10,
                        bottom: context.k_10,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: context.k_10,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.k_8,
                          vertical: context.k_2,
                        ),
                        child: Icon(
                          Icons.info_outline,
                          size: context.k_14,
                          color: context.adColors.darkGreyTextColor,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: context.k_4,
              ),
              Container(
                width: textContainerWidth,
                child: RichText(
                  text: TextSpan(
                    text: subText.validateWithDefaultValue(),
                    style: subTextStyle ??
                        ADTextStyle400.size12.setTextColor(
                          context.theme.colorScheme.blackTextColor,
                        ),
                    children: [
                      TextSpan(
                        text: description != null
                            ? '. ${description.validateWithDefaultValue()}'
                            : '',
                        style: descriptionTextStyle ??
                            ADTextStyle400.size12.setTextColor(
                              context.theme.colorScheme.blackTextColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ] else if (orderStatus.toLowerCase() == 'picked_up') ...[
              Text(
                mainText.validateWithDefaultValue(),
                textAlign: TextAlign.justify,
                style: (!isOrderCancelled(context) && !isOrderFailed(context))
                    ? /*isOrderRescheduled(context)
                        ? mainTextStyle?.copyWith(
                            color: context.adColors.circleGreyTextColor,
                          )
                        :*/
                    mainTextStyle
                    : mainTextStyle?.copyWith(
                          color: context.adColors.circleGreyTextColor,
                          decoration: TextDecoration.lineThrough,
                        ) ??
                        ADTextStyle400.size12.setTextColor(
                          context.theme.colorScheme.greyTextColor,
                        ),
              ),
              SizedBox(
                height: context.k_4,
              ),
              Row(
                children: [
                  Text(
                    subText.validateWithDefaultValue(),
                    textAlign: TextAlign.justify,
                    style: !isOrderCancelled(context)
                        ? /*isOrderRescheduled(context)
                            ? subTextStyle?.copyWith(
                                color: context.adColors.circleGreyTextColor,
                              )
                            :*/
                        subTextStyle
                        : subTextStyle?.copyWith(
                              color: context.adColors.greyTextColor,
                              decoration: TextDecoration.lineThrough,
                            ) ??
                            ADTextStyle500.size14
                                .setTextColor(
                                  context.theme.colorScheme.blackTextColor,
                                )
                                .copyWith(
                                  color: context.adColors.greyTextColor,
                                  decoration: TextDecoration.lineThrough,
                                ),
                  ),
                  SizedBox(
                    width: context.k_6,
                  ),
                  Container(
                    height: context.k_6,
                    width: context.k_6,
                    decoration: BoxDecoration(
                      color: isOrderCancelled(
                        context,
                      ) /*||
                              isOrderRescheduled(context)*/
                          ? context.adColors.circleGreyTextColor
                          : context.adColors.circleGreyTextColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: context.k_6,
                  ),
                  Text(
                    flightNo.validateWithDefaultValue(),
                    textAlign: TextAlign.justify,
                    style: !isOrderCancelled(context)
                        ? /*isOrderRescheduled(context)
                            ? subTextStyle?.copyWith(
                                color: context.adColors.circleGreyTextColor,
                              )
                            :*/
                        subTextStyle
                        : subTextStyle?.copyWith(
                              color: context.adColors.greyTextColor,
                              decoration: TextDecoration.lineThrough,
                            ) ??
                            ADTextStyle500.size14
                                .setTextColor(
                                  context.theme.colorScheme.red900,
                                )
                                .copyWith(
                                  color: context.adColors.greyTextColor,
                                  decoration: TextDecoration.lineThrough,
                                ),
                  ),
                ],
              ),
            ],

            // else if ((orderStatus.toUpperCase() ==
            //             'Completed'.toUpperCase() ||
            //         orderStatus.toUpperCase() == 'Picked Up'.toUpperCase()) &&
            //     !context.read<DutyFreeOrderState>().orderCancelled)
            // Row(
            //   children: [
            //     Text(
            //       subText.validateWithDefaultValue(),
            //       textAlign: TextAlign.justify,
            //       style: subTextStyle ??
            //           ADTextStyle500.size14
            //               .setTextColor(
            //                 context.theme.colorScheme.blackTextColor,
            //               )
            //               .copyWith(
            //                 color: context.adColors.greyTextColor,
            //                 decoration: TextDecoration.lineThrough,
            //               ),
            //     ),
            //     SizedBox(
            //       width: context.k_6,
            //     ),
            //     Container(
            //       height: context.k_6,
            //       width: context.k_6,
            //       decoration: BoxDecoration(
            //         color: context.adColors.greyTextColor,
            //         shape: BoxShape.circle,
            //       ),
            //     ),
            //     // SizedBox(
            //     //   width: context.k_6,
            //     // ),
            //     Text(
            //       flightNo.validateWithDefaultValue(),
            //       textAlign: TextAlign.justify,
            //       style: subTextStyle ??
            //           ADTextStyle500.size14
            //               .setTextColor(
            //                 context.theme.colorScheme.red900,
            //               )
            //               .copyWith(
            //                 color: context.adColors.greyTextColor,
            //                 decoration: TextDecoration.lineThrough,
            //               ),
            //     ),
            //   ],
            // ),
            // Text(
            //   description.validateWithDefaultValue(),
            //   textAlign: TextAlign.justify,
            //   style: descriptionTextStyle ??
            //       ADTextStyle400.size12.setTextColor(
            //         context.theme.colorScheme.neutralInfoMsg,
            //       ),
            // ),
          ],
        ),
      ],
    );
  }

  ///
  bool isOrderRescheduled(BuildContext context) {
    return context.read<DutyFreeOrderState>().orderRescheduled;
  }

  bool isOrderCancelled(BuildContext context) {
    return context.read<DutyFreeOrderState>().orderCancelled;
  }

  bool isOrderFailed(BuildContext context) {
    return context.read<DutyFreeOrderState>().orderFailed;
  }

  /// This method is used to get the size of the content
  double _calculateContentHeight(
    String mainText,
    String subText,
    String description,
    BuildContext context,
  ) {
    final double k_24 = 24.sp;
    return mainText.textHeight(
          mainTextStyle ??
              ADTextStyle400.size12
                  .setTextColor(context.theme.colorScheme.greyTextColor),
          ADSizeConfig.defaultSize.width * width,
          mainText,
        ) +
        subText.textHeight(
          subTextStyle ??
              ADTextStyle500.size14
                  .setTextColor(context.theme.colorScheme.blackTextColor),
          ADSizeConfig.defaultSize.width * width,
          subText,
        ) +
        description.textHeight(
          descriptionTextStyle ??
              ADTextStyle400.size12
                  .setTextColor(context.theme.colorScheme.neutralInfoMsg),
          ADSizeConfig.defaultSize.width * width,
          description,
        ) +
        k_24;
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
