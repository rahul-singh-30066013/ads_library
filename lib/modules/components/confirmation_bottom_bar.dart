/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class ConfirmationBottomBar extends StatelessWidget {
  final List<ConfirmationBottomButtonModel> buttons;

  ///ConfirmationBottomBar(
  ///  buttons: [
  ///    ConfirmationBottomButtonModel(
  ///      icon: SvgAssets.bottomBarHome,
  ///      title: 'Home',
  ///      onTap: () => null,
  ///    ),
  ///    ConfirmationBottomButtonModel(
  ///      icon: SvgAssets
  ///          .confirmationBarModify,
  ///      title: 'Modify',
  ///      onTap: () => null,
  ///    ),
  ///    ConfirmationBottomButtonModel(
  ///      icon: SvgAssets
  ///          .confirmationBarModify,
  ///      title: 'Cancel',
  ///      onTap: () => null,
  ///    ),
  ///  ],
  ///)
  const ConfirmationBottomBar({
    Key? key,
    required this.buttons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.k_22),
      decoration: BoxDecoration(
        color: context.adColors.blackTextColor,
        borderRadius: BorderRadius.circular(context.k_30),
      ),
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(context.k_30),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            buttons.length,
            (index) => ConfirmationBottomWidget(
              confirmationBottomButtonModel: buttons[index],
            ),
          ),
        ),
      ),
    );
  }
}

class ConfirmationBottomButtonModel {
  final String icon;
  final String title;
  final Function() onTap;
  final bool isDisabled;

  ConfirmationBottomButtonModel({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isDisabled = false,
  });
}

const double _fontSize = 11;
const double _disabledOpacity = 0.3;

class ConfirmationBottomWidget extends StatelessWidget {
  final ConfirmationBottomButtonModel confirmationBottomButtonModel;

  const ConfirmationBottomWidget({
    Key? key,
    required this.confirmationBottomButtonModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: confirmationBottomButtonModel.isDisabled ? _disabledOpacity : 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(context.k_6),
        child: Material(
          clipBehavior: Clip.antiAlias,
          color: context.adColors.blackTextColor,
          child: InkWell(
            onTap: confirmationBottomButtonModel.onTap,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  confirmationBottomButtonModel.icon,
                  color: context.adColors.whiteTextColor,
                ),
                ADSizedBox(
                  height: context.k_4,
                ),
                Text(
                  confirmationBottomButtonModel.title,
                  style:
                      ADTextStyle500.size12.setFontSize(_fontSize).setTextColor(
                            context.adColors.whiteTextColor,
                          ),
                ),
              ],
            ).paddingBySide(
              bottom: context.k_12,
              top: context.k_12,
              left: context.k_16,
              right: context.k_16,
            ),
          ),
        ),
      ),
    );
  }
}
