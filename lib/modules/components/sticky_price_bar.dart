/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class StickyPriceBar extends StatelessWidget {
  ///price to display on bottom bar
  final String price;

  ///default set to View Details
  final String? subtitleText;

  /// text style for subtitle
  /// mainly used for showing underlined text
  final TextStyle? subtitleTextStyle;

  final void Function()? onSubtitleTap;

  ///default set to book
  final String? buttonText;

  /// only work for default defined button
  /// primary, blue button
  final void Function()? onButtonTap;

  /// only required when a custom button is required instead of default button
  final Widget? customButton;

  ///only required in case of any discount on total price
  final String? specialFare;

  const StickyPriceBar({
    Key? key,
    required this.price,
    this.subtitleText,
    this.buttonText,
    this.customButton,
    this.specialFare,
    this.onButtonTap,
    this.subtitleTextStyle,
    this.onSubtitleTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int staticLengthOfPrice = 7;
    return Container(
      color: context.adColors.whiteTextColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 1, thickness: 1),
          ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: context.k_16,
              vertical: context.k_8,
            ),
            title: Semantics(
              label: 'final price ',
              child: GestureDetector(
                onTap: onSubtitleTap,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        if (price.length > staticLengthOfPrice)
                          FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            specialFare ?? price,
                            style: ADTextStyle700.size24,
                          ),
                        )
                        else
                          Text(
                            specialFare ?? price,
                            style: ADTextStyle700.size24,
                          ),
                        ADSizedBox(width: context.k_2),
                        Visibility(
                          visible: specialFare != null,
                          child: Text(
                            price,
                            style: ADTextStyle700.size12.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: context.adColors.greyTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ADSizedBox(height: context.k_2),
                    InkWell(
                      onTap: onSubtitleTap,
                      child: Text(
                        subtitleText ??
                            'viewDetails'.localize(
                              context,
                            ),
                        style: subtitleTextStyle ??
                            ADTextStyle400.size12
                                .copyWith(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            trailing: customButton ??
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          context.k_28,
                        ),
                      ),
                    ),
                    side: MaterialStateProperty.all(
                      BorderSide.none,
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      context.adColors.blueColor,
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                        horizontal: context.k_56,
                        vertical: context.k_16,
                      ),
                    ),
                  ),
                  onPressed: onButtonTap,
                  child: Text(
                    buttonText ?? 'continue'.localize(context),
                    style: ADTextStyle700.size16.setTextColor(
                      context.adColors.whiteTextColor,
                    ),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
