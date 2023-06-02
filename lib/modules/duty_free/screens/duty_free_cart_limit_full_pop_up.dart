/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/duty_free_remove_item.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

const Color _closeIconColor = Color(0xff333333);

/// This is used to display popup for exceeded cart limit above 25000
class DutyFreeCartLimitFullPopUp extends StatefulWidget {
  ///This is to get the callback on click of reset
  // final ADTapCallback yesCallBack;

  /// Title Text String
  final String titleString;

  /// Detail Text String

  final String detailString;
  static const _heightCircle = 90.0;
  static const Color circleColor = Color(0xfff1f7f9);
  static const _imageCircle = 150.0;

  const DutyFreeCartLimitFullPopUp({
    Key? key,
    // required this.yesCallBack,
    required this.titleString,
    required this.detailString,
  }) : super(key: key);

  @override
  _DutyFreeCartLimitFullPopUpState createState() =>
      _DutyFreeCartLimitFullPopUpState();
}

class _DutyFreeCartLimitFullPopUpState
    extends State<DutyFreeCartLimitFullPopUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ADBottomSheetDragBar(
          //   height: context.k_4,
          //   width: context.k_40,
          // ).paddingBySide(top: context.k_16),
          const DutyFreeAgeItemHeader(),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: DutyFreeCartLimitFullPopUp._heightCircle,
                  height: DutyFreeCartLimitFullPopUp._heightCircle,
                  decoration: const BoxDecoration(
                    color: DutyFreeCartLimitFullPopUp.circleColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Image.asset(
                  'lib/assets/images/duty_free/shopping-cart-full.png',
                  height: DutyFreeCartLimitFullPopUp._imageCircle,
                  width: DutyFreeCartLimitFullPopUp._imageCircle,
                  //color: context.adColors.black,
                ),
              ],
            ).paddingBySide(top: context.k_10),
          ),
          Text(
            'cart_full'.localize(context),
            style: ADTextStyle700.size20.setTextColor(context.adColors.black),
            textAlign: TextAlign.center,
          ).paddingBySide(
            left: context.k_24,
            right: context.k_20,
            top: context.k_20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      ///Set value in Left List Sheet
                      'stay_Within_limit'.localize(context),
                      textAlign: TextAlign.center,
                      style: ADTextStyle400.size16
                          .setTextColor(context.adColors.black),
                    ).paddingAllSide(context.k_10),
                  ),
                ],
              ),
            ],
          ).paddingBySide(
            bottom: context.k_10,
            left: context.k_48,
            right: context.k_60,
            top: context.k_12,
          ),
          SizedBox(
            height: context.scaled(context.k_16),
          ),
          DutyFreeAgeFooter(
            yesCallBack: () => navigatorPopScreen(context),
          ),
        ],
      ),
    );
  }
}

///_height is used for header & Tab bar container height

///_height is used for bottom container height

/// This class is used to for create Duty Free Remove Item Header & Footer View
///[DutyFreeRemoveItemHeader] is use for create Header View
///
const _height = 50.0;

class DutyFreeAgeItemHeader extends StatelessWidget {
  const DutyFreeAgeItemHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.scaled(_height),
      child: Row(
        children: <Widget>[
          InkWell(
            key: const Key('dutyFreeRemoveClose'),
            onTap: () => {
              Navigator.pop(context),
            },

            ///Image that will be used to Left Top close button
            child: Padding(
              padding: EdgeInsets.all(context.k_12),
              child: SvgPicture.asset(
                SvgAssets.closeIcon,
                height: context.k_14,
                width: context.k_14,
                color: _closeIconColor,
              ),
            ),
          ),
          SizedBox(
            width: context.scaled(context.k_4),
          ),
        ],
      ),
    ).paddingBySide(left: context.k_6, right: context.k_6);
  }
}

class DutyFreeAgeFooter extends StatelessWidget {
  const DutyFreeAgeFooter({
    Key? key,
    required this.yesCallBack,
  }) : super(key: key);

  ///This is to get the callback on click of reset
  final ADTapCallback yesCallBack;

  @override
  Widget build(BuildContext context) {
    final double _bottomContainerHeight = 50.sp;

    return Container(
      height: _bottomContainerHeight,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          foregroundColor: MaterialStateProperty.all<Color>(
            context.adColors.whiteTextColor,
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            context.adColors.blackTextColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(context.k_28)),
            ),
          ),
        ),
        onPressed: yesCallBack,
        child: Text(
          'ok_got_it'.localize(context),
          style: ADTextStyle700.size16
              .setTextColor(context.adColors.whiteTextColor),
          textAlign: TextAlign.center,
        ),
      ).paddingBySide(left: context.k_22, right: context.k_22),
    );
  }
}
