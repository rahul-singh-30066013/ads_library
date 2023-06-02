/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class ConfettiView extends StatelessWidget {
  final String couponCode;
  final String couponMessage;
  final double amount;

  const ConfettiView({
    Key? key,
    required this.couponCode,
    required this.amount,
    required this.couponMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double imageHeight = 92.sp;
    final double imageWidth = 80.sp;

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
                    SvgAssets.appliedCoupon,
                    width: imageWidth,
                    height: imageHeight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "'$couponCode' ",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: ADTextStyle400.size16,
                        ),
                      ),
                      Text(
                        'applied'.localize(context),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: ADTextStyle400.size14,
                      ),
                    ],
                  ).paddingBySide(top: context.k_16),
                  Align(
                    child: Text(
                      couponMessage.isEmpty
                          ? '${FlightUtils.getPriceFormatWithSymbol(
                              price: amount,
                            )} ${'saving_with_this_coupon'.localize(context)}'
                          : couponMessage,
                      style: ADTextStyle700.size22
                          .setTextColor(context.adColors.black),
                      textAlign: TextAlign.center,
                    ).paddingBySide(
                      top: context.k_16,
                      bottom: context.k_30,
                    ),
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
                              context.adColors.blackTextColor,
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
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'yay'.localize(context),
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
          IgnorePointer(
            child: Lottie.asset(
              SvgAssets.confetti,
              width: context.widthOfScreen,
              height: context.heightOfScreen,
              repeat: false,
              // controller: _animationController,
            ),
          ),
        ],
      ),
    );
  }
}
