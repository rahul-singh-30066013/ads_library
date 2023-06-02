/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabsNotFoundView extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  final String buttonTittle;
  final ADTapCallback? buttonAction;
  final bool isCabNotAvailable;
  final ADTapCallback? subTitleAction;

  const CabsNotFoundView({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.buttonTittle,
    this.buttonAction,
    this.isCabNotAvailable = false,
    this.subTitleAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = isCabNotAvailable || subTitle.isEmpty ? 162.sp : 250.sp;
    const double percentageWeightageContainer = 0.07;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (imagePath.isNotEmpty)
          Image.asset(
            imagePath,
            width: width,
          ),
        SizedBox(
          height: context.k_20,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: ADTextStyle700.size22.copyWith(
            color: context.adColors.blackTextColor,
          ),
        ).paddingBySide(
          left: context.k_30,
          right: context.k_30,
        ),
        Visibility(
          visible: subTitle.isNotEmpty,
          child: Column(
            children: [
              SizedBox(
                height: context.k_20,
              ),
              InkWell(
                onTap: subTitleAction,
                child: Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: isCabNotAvailable
                      ? ADTextStyle500.size16.copyWith(
                          color: context.adColors.blackTextColor,
                          decoration: TextDecoration.underline,
                        )
                      : ADTextStyle400.size16.copyWith(
                          color: context.adColors.blackTextColor,
                        ),
                ).paddingBySide(
                  left: context.k_30,
                  right: context.k_30,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: context.k_30,
        ),
        Visibility(
          visible: !isCabNotAvailable,
          child: SizedBox(
            height: context.heightOfScreen * percentageWeightageContainer,
            child: ElevatedButton(
              onPressed: () => {
                navigatorPopScreen(context),
                buttonAction?.call(),
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: context.k_34),
                backgroundColor: context.adColors.blackTextColor,
                shape: const StadiumBorder(),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  buttonTittle,
                  style: ADTextStyle700.size16.setTextColor(
                    context.adColors.whiteTextColor,
                  ),
                ),
              ),
            ).paddingBySide(
              left: context.scaled(context.k_6),
              right: context.scaled(context.k_6),
            ),
          ),
        ),
      ],
    );
  }
}
