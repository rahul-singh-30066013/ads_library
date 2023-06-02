/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class SomethingWrong extends StatelessWidget {
  final ADTapCallbackWithValue tapCallbackWithValue;

  const SomethingWrong({
    Key? key,
    required this.tapCallbackWithValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double imageHeight = 76.sp;
    final double imageWidth = 71.sp;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(context.k_20),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(
                left: context.k_20,
                top: context.k_20,
                right: context.k_20,
                bottom: context.k_20,
              ),
              margin: EdgeInsets.only(top: context.k_48),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(context.k_20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SizedBox(
                        width: context.k_22,
                        height: context.k_22,
                        child: const Icon(Icons.close),
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    SvgAssets.noDataFound,
                    width: imageWidth,
                    height: imageHeight,
                  ),
                  ADSizedBox(
                    height: context.k_30,
                  ),
                  Align(
                    child: Text(
                      'oops_something_went_wrong'.localize(context),
                      style: ADTextStyle700.size22
                          .setTextColor(context.adColors.black),
                      textAlign: TextAlign.center,
                    ).paddingBySide(
                      top: context.k_16,
                      bottom: context.k_10,
                    ),
                  ),
                  // Align(
                  //   child: Text(
                  //     'the_server_encountered_a_temporary_error'
                  //         .localize(context),
                  //     style: ADTextStyle400.size16,
                  //     textAlign: TextAlign.center,
                  //   ).paddingBySide(
                  //     top: context.k_16,
                  //     bottom: context.k_30,
                  //   ),
                  // ),
                  SizedBox(
                    height: context.k_12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                              context.adColors.whiteTextColor,
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              context.adColors.blueColor,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(context.k_28),
                                ),
                                side: const BorderSide(),
                              ),
                            ),
                          ),
                          onPressed: () => {
                            tapCallbackWithValue(false),
                            Navigator.pop(context),
                          },
                          child: Text(
                            'try_again'.localize(context),
                            style: ADTextStyle700.size16.setTextColor(
                              context.adColors.whiteTextColor,
                            ),
                          ).paddingBySide(
                            top: context.k_16,
                            bottom: context.k_16,
                          ),
                        ),
                      ),
                    ],
                  ).paddingBySide(bottom: context.k_14),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
