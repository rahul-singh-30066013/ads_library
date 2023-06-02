/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/state_management/cab_traveller_detail_state.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class BottomBarView extends StatelessWidget {
  ///price to display on bottom bar
  final String price;

  ///default set to View Details
  final String? subtitleText;

  /// primary, viewDetail button
  final void Function()? onSubtitleTap;

  ///default set to book
  final String? buttonText;

  /// primary, blue button
  final void Function()? onButtonTap;

  final bool isTravellerScreen;

  const BottomBarView({
    Key? key,
    required this.price,
    this.subtitleText,
    this.buttonText,
    this.onButtonTap,
    this.onSubtitleTap,
    this.isTravellerScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double continueButtonWidth = 172.sp;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(height: 1, thickness: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onSubtitleTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        price,
                        style: ADTextStyle700.size24
                            .setTextColor(context.adColors.blackTextColor),
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
                      style: ADTextStyle400.size12.copyWith(
                        decoration: TextDecoration.underline,
                        color: context.adColors.blackTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ADSizedBox(
              width: continueButtonWidth,
              child: isTravellerScreen
                  ? Selector<CabTravellerDetailState, bool>(
                      selector: (context, state) =>
                          state.isUserInformationUpdated,
                      builder: (context, isUserinfoUpdate, child) {
                        return SizedBox(
                          height: context.k_40 + context.k_6,
                          child: ElevatedButton(
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
                                  horizontal: context.k_32,
                                  vertical: context.k_14,
                                ),
                              ),
                            ),
                            onPressed: onButtonTap,
                            child: isTravellerScreen && isUserinfoUpdate
                                ? ADDotProgressView(
                                    color: context.adColors.whiteTextColor,
                                  )
                                : Text(
                                    buttonText ?? 'continue'.localize(context),
                                    style: ADTextStyle700.size16.setTextColor(
                                      context.adColors.whiteTextColor,
                                    ),
                                  ),
                          ),
                        );
                      },
                    )
                  : ElevatedButton(
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
                            horizontal: context.k_32,
                            vertical: context.k_14,
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
        ).paddingBySide(
          left: context.k_16,
          top: context.k_12,
          right: context.k_16,
          bottom: context.k_12,
        ),
      ],
    );
  }

/* Size _textSize(String text, BuildContext context) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style:
            ADTextStyle500.size18.setTextColor(context.adColors.blackTextColor),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size;
  }*/
}
