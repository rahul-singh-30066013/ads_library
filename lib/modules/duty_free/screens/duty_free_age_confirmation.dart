/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/duty_free_remove_item.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_bottom_sheet_drag_bar.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const Color _closeIconColor = Color(0xff333333);

class DutyFreeAgeConfirmation extends StatefulWidget {
  ///This is to get the callback on click of reset
  final ADTapCallback yesCallBack;

  ///This is to get the callback on click of apply
  final ADTapCallback noCallBack;

  /// Title Text String
  final String titleString;

  /// Detail Text String

  final String detailString;
  static const _heightCircle = 90.0;
  static const Color circleColor = Color(0xfff1f7f9);
  static const _imageCircle = 150.0;

  const DutyFreeAgeConfirmation({
    Key? key,
    required this.yesCallBack,
    required this.noCallBack,
    required this.titleString,
    required this.detailString,
  }) : super(key: key);

  @override
  _DutyFreeAgeConfirmationState createState() =>
      _DutyFreeAgeConfirmationState();
}

class _DutyFreeAgeConfirmationState extends State<DutyFreeAgeConfirmation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ADBottomSheetDragBar(
            height: context.k_4,
            width: context.k_40,
          ).paddingBySide(top: context.k_16),
          const DutyFreeAgeItemHeader(),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: DutyFreeAgeConfirmation._heightCircle,
                  height: DutyFreeAgeConfirmation._heightCircle,
                  decoration: const BoxDecoration(
                    color: DutyFreeAgeConfirmation.circleColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Image.asset(
                  'lib/assets/gif/AgeConfirmation.gif',
                  height: DutyFreeAgeConfirmation._imageCircle,
                  width: DutyFreeAgeConfirmation._imageCircle,
                  //color: context.adColors.black,
                ),
              ],
            ).paddingBySide(top: context.k_10),
          ),
          Text(
            ///Set value in Left List Sheet
            'you_need_to_be_25_above_years_of_age_to_purchase_alcohol'
                .localize(context)
                .replaceAll(
                  '#1',
                  (selectedAirportsData?.dutyFreeAgeLimit ?? 0).toString(),
                ),
            textAlign: TextAlign.center,
            style: ADTextStyle700.size18.setTextColor(context.adColors.black),
          ).paddingBySide(
            left: context.k_36,
            right: context.k_36,
            top: context.k_20,
            bottom: context.k_20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   width: context.k_20,
                  //   height: context.k_20,
                  //   decoration: const BoxDecoration(
                  //     color: DutyFreeAgeConfirmation.circleColor,
                  //     shape: BoxShape.circle,
                  //   ),
                  // ),
                  ADSizedBox(
                    width: context.k_14,
                  ),
                  Expanded(
                    child: Text(
                      ///Set value in Left List Sheet
                      'duty_free_age_content'.localize(context),
                      textAlign: TextAlign.center,
                      style: ADTextStyle400.size16
                          .setTextColor(context.adColors.black),
                    ),
                  ),
                ],
              ),
              // ADSizedBox(
              //   height: context.k_20,
              // ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Container(
              //       width: context.k_20,
              //       height: context.k_20,
              //       decoration: const BoxDecoration(
              //         color: DutyFreeAgeConfirmation.circleColor,
              //         shape: BoxShape.circle,
              //       ),
              //     ),
              //     ADSizedBox(
              //       width: context.k_14,
              //     ),
              //     Expanded(
              //       child: Text(
              //
              //         ///Set value in Left List Sheet
              //         'Buy Alcohol to the limit but drink within the limit.',
              //         textAlign: TextAlign.left,
              //         style: ADTextStyle400.size16
              //             .setTextColor(context.adColors.black),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ).paddingBySide(
            bottom: context.k_20,
            left: context.k_36,
            right: context.k_36,
          ),
          Container(
            height: 1,
            decoration: BoxDecoration(
              border: Border.all(
                color: DutyFreeAgeConfirmation.circleColor,
              ),
            ),
          ).paddingBySide(left: context.k_36, right: context.k_36),
          // Text(
          //   ///Set value in Left List Sheet
          //   'age_limit_disclaimer'.localize(context),
          //   textAlign: TextAlign.center,
          //   style: ADTextStyle400.size12
          //       .setTextColor(context.adColors.greyCircleColor),
          // ).paddingBySide(
          //   left: context.k_36,
          //   right: context.k_36,
          //   top: context.k_20,
          // ),
          // SizedBox(
          //   height: context.scaled(context.k_6),
          // ),
          SizedBox(
            height: context.scaled(context.k_24),
          ),
          DutyFreeAgeFooter(
            yesCallBack: widget.yesCallBack,
            noCallBack: widget.noCallBack,
          ),
          Text(
            ///Set value in Left List Sheet
            'age_limit_disclaimer'.localize(context),
            textAlign: TextAlign.center,
            style: ADTextStyle400.size12
                .setTextColor(context.adColors.greyCircleColor),
          ).paddingBySide(
            left: context.k_36,
            right: context.k_36,
            bottom: context.k_20,
          ),
        ],
      ),
    );
  }
}

///_height is used for header & Tab bar container height

///_height is used for bottom container height
double _bottomContainerHeight = 84.sp;

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
    required this.noCallBack,
  }) : super(key: key);

  ///This is to get the callback on click of reset
  final ADTapCallback yesCallBack;

  ///This is to get the callback on click of apply
  final ADTapCallback noCallBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _bottomContainerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              foregroundColor:
                  MaterialStateProperty.all<Color>(context.adColors.black),
              backgroundColor: MaterialStateProperty.all<Color>(
                context.adColors.whiteTextColor,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(context.k_28)),
                  side: const BorderSide(),
                ),
              ),
            ),
            onPressed: noCallBack,
            child: Text(
              'no_i_am_not'.localize(context),
              style: ADTextStyle400.size16
                  .setTextColor(context.adColors.blackTextColor),
            ).paddingBySide(left: context.k_10, right: context.k_10),
          ).paddingBySide(left: context.k_16, right: context.k_4),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0),
                foregroundColor: MaterialStateProperty.all<Color>(
                  context.adColors.whiteTextColor,
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  context.adColors.blueColor,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(context.k_28)),
                  ),
                ),
              ),
              onPressed: yesCallBack,
              child: Text(
                'yes_i_am_above_25'.localize(context),
                style: ADTextStyle700.size16
                    .setTextColor(context.adColors.whiteTextColor),
                textAlign: TextAlign.center,
              ),
            ).paddingBySide(left: context.k_4, right: context.k_16),
          ),
        ],
      ).paddingBySide(bottom: context.k_36),
    );
  }
}
