/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class will used to show list item  in bottom sheet from  other than flight module(if not localised and prefix without dot
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class SalutationView extends StatelessWidget {
  const SalutationView({
    Key? key,
    required this.onBottomSheetItemSelect,
    required this.text,
    this.selectedItem,
  }) : super(key: key);

  final ADGenericCallback onBottomSheetItemSelect;
  final String text;
  final String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onBottomSheetItemSelect(text),
      child: Container(
        color: text == selectedItem
            ? context.adColors.lightBlue
            : context.adColors.transparentColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: text == selectedItem
                  ? ADTextStyle700.size16
                  : ADTextStyle400.size16,
            ),
            Visibility(
              visible: text == selectedItem,
              child: SvgPicture.asset(SvgAssets.refundableCheck),
            ),
          ],
        ).paddingBySide(
          left: context.k_20,
          right: context.k_20,
          top: context.k_14,
          bottom: context.k_14,
        ),
      ),
    );
  }
}
