/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_payment/views/price_details_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/tooltip_shape_border.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// this class is used to draw a row with your custom left and right textstyle.
class ADRow extends StatelessWidget {
  const ADRow({
    Key? key,
    required this.leftText,
    required this.rightText,
    this.leftTextStyle,
    this.rightTextStyle,
    this.showInfoIcon,
    this.tapInfoIcon,
    this.toolTipEnable,
  }) : super(key: key);

  /// this defines the left text of row
  final String leftText;

  /// this defines the left text of row
  final String rightText;

  /// this defines the leftTextStyle of row
  final TextStyle? leftTextStyle;

  /// this defines the rightTextStyle of row
  final TextStyle? rightTextStyle;

  final ADTapCallback? tapInfoIcon;
  final bool? showInfoIcon;
  final bool? toolTipEnable;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '',
      container: true,
      child: Row(
        key: const Key(FlightAutomationKeys.adRowKey),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    leftText,
                    style: leftTextStyle ??
                        ADTextStyle400.size14
                            .setTextColor(context.adColors.blackTextColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (showInfoIcon != null && showInfoIcon == true)
                  Container(
                    padding: EdgeInsets.all(context.k_6),
                    child: GestureDetector(
                      onTap: tapInfoIcon,
                      behavior: HitTestBehavior.translucent,
                      child: Icon(
                        Icons.info_outline,
                        size: context.k_20,
                        color: context.adColors.blackTextColor,
                      ),
                    ),
                  ),
                if (toolTipEnable != null && toolTipEnable == true)
                  Tooltip(
                    verticalOffset: verticalOffset,
                    triggerMode: TooltipTriggerMode.tap,
                    richMessage: TextSpan(
                      children: [
                        WidgetSpan(
                          child: SvgPicture.asset(
                            SvgAssets.zeroCancellationIcon,
                            height: context.k_22,
                            width: context.k_20,
                          ),
                        ),
                        WidgetSpan(
                          child: Text(
                            'you_can_claim'.localize(context),
                            textAlign: TextAlign.center,
                            style: ADTextStyle400.size14.setTextColor(
                              context.adColors.whiteTextColor,
                            ),
                          ).paddingBySide(
                            bottom: context.k_4,
                          ),
                        ),
                      ],
                    ),
                    decoration: ShapeDecoration(
                      shape: const TooltipShapeBorder(
                        arrowArc: 0.2,
                        arrowHeight: 14,
                        radius: 4,
                        showTopArrow: true,
                        showBottomArrow: false,
                      ),
                      color: context.adColors.black,
                      shadows: [
                        BoxShadow(
                          color:
                              context.adColors.blackColor.withOpacity(opacity),
                          blurRadius: blurRadius,
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(top: context.k_10),
                    padding: EdgeInsets.only(
                      left: context.k_20,
                      right: context.k_20,
                      top: context.k_8,
                      bottom: context.k_10,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.k_2,
                      ),
                      child: SvgPicture.asset(
                        'lib/assets/images/svg/icons/shopping/i_common.svg',
                        height: context.k_15,
                        width: context.k_15,
                      ),
                    ),
                  ).paddingBySide(
                    left: context.k_4,
                  ),
              ],
            ),
          ),
          SizedBox(width: context.k_8),
          Text(
            rightText,
            style: rightTextStyle ??
                ADTextStyle400.size14.setTextColor(
                  context.adColors.blackTextColor,
                ),
          ),
        ],
      ),
    );
  }
}
