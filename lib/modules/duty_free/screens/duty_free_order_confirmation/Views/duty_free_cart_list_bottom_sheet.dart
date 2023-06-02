/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// Cart list from DutyFreeConfirmationOrder Page
class DutyFreeCartListBottomSheet extends StatefulWidget {
  // final bool showMoreButtonVisibility;
  const DutyFreeCartListBottomSheet({this.isBottomSheet = false, Key? key})
      : super(key: key);
  final bool isBottomSheet;

  @override
  _DutyFreeCartListBottomSheetState createState() =>
      _DutyFreeCartListBottomSheetState();
}

class _DutyFreeCartListBottomSheetState
    extends State<DutyFreeCartListBottomSheet> {
  static const int itemCount = 10;

  // static double heightOfitem = 80.sp;
  // static double height102 = 102.sp;
  static const int maxTextLines = 3;
  static const int initialItemToDisplay = 4;
  static double heightOfIcon = 50.sp;
  static double heightOfShowButton = 42.sp;
  static double widthOfShowButton = 212.sp;
  bool isShowEnabled = itemCount > initialItemToDisplay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isShowEnabled = !widget.isBottomSheet;
    // if (widget.isBottomSheet) {
    //   heightOfitem = height102;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: context.adColors.whiteTextColor,
        child: Column(
          children: [
            if (isShowEnabled)
              Row(
                children: [
                  Text(
                    'Cart Details ',
                    style: ADTextStyle700.size22
                        .setTextColor(context.adColors.blackTextColor),
                  ),
                  Text(
                    '($itemCount items)',
                    style: ADTextStyle400.size22
                        .setTextColor(context.adColors.greyTextColor),
                  ),
                ],
              ).paddingBySide(bottom: context.k_6),
            Expanded(
              child: Consumer<DutyFreeOrderState>(
                builder:
                    (BuildContext context, dutyFreeOrderState, Widget? child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    // scrollDirection: Axis.horizontal,
                    itemCount: isShowEnabled
                        ? initialItemToDisplay
                        : dutyFreeOrderState
                                .dutyFreeCancelOrderDetailsResponseModel
                                ?.orderDetail
                                ?.dutyfreeDetail
                                ?.itemDetails
                                .length ??
                            0,
                    itemBuilder: (context, index) {
                      final imagePath = dutyFreeOrderState
                              .dutyFreeCancelOrderDetailsResponseModel
                              ?.orderDetail
                              ?.dutyfreeDetail
                              ?.itemDetails[index]
                              .productImage ??
                          '';
                      adLog(
                        'productImage--> ${dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel?.orderDetail?.dutyfreeDetail?.itemDetails[index].productImage}',
                      );
                      return Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: heightOfIcon,
                                  height: heightOfIcon,
                                  child: FadeInImage.memoryNetwork(
                                    fit: BoxFit.contain,
                                    width: heightOfIcon,
                                    height: heightOfIcon,
                                    image: imagePath.startsWith('https')
                                        ? imagePath
                                        : '${Environment.instance.configuration.cmsImageBaseUrl}$imagePath',
                                    placeholder: kTransparentImage,
                                    imageErrorBuilder: (
                                      BuildContext context,
                                      Object error,
                                      StackTrace? stackTrace,
                                    ) =>
                                        Container(
                                      color: context.adColors.cardBgColor,
                                      child: Icon(
                                        Icons.image_rounded,
                                        color: context.adColors.dividerColor,
                                        // Color(0xfff7f7f7),
                                        size: context.k_56,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        dutyFreeOrderState
                                                .dutyFreeCancelOrderDetailsResponseModel
                                                ?.orderDetail
                                                ?.dutyfreeDetail
                                                ?.itemDetails[index]
                                                .skuName ??
                                            '',
                                        style:
                                            ADTextStyle400.size16.setTextColor(
                                          context.adColors.blackTextColor,
                                        ),
                                        maxLines: maxTextLines,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${'qty'.localize(context)} ${dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel?.orderDetail?.dutyfreeDetail?.itemDetails[index].quantity}',
                                            style: ADTextStyle400.size14
                                                .setTextColor(
                                              context.adColors.neutralInfoMsg,
                                            ),
                                            maxLines: maxTextLines,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          ADSizedBox(
                                            width: context.k_6,
                                          ),
                                          Container(
                                            height: context.k_4,
                                            width: context.k_4,
                                            decoration: BoxDecoration(
                                              color: context
                                                  .adColors.circleGreyTextColor,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          ADSizedBox(
                                            width: context.k_6,
                                          ),
                                          Text(
                                            '₹${dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel?.orderDetail?.dutyfreeDetail?.itemDetails[index].totalDiscountedPrice.toString() ?? ''}',
                                            style: ADTextStyle400.size14
                                                .setTextColor(
                                              context.adColors.neutralInfoMsg,
                                            ),
                                            maxLines: maxTextLines,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                      .paddingBySide(
                                        left: context.k_10,
                                        right: context.k_10,
                                      )
                                      .paddingBySide(
                                        left: context.k_16,
                                      ),
                                ),
                              ],
                            ).paddingBySide(
                              top: widget.isBottomSheet
                                  ? context.k_20
                                  : context.k_14,
                              bottom: widget.isBottomSheet
                                  ? context.k_20
                                  : context.k_14,
                            ),
                            Container(
                              color: context.adColors.dividerColor,
                              height: 1,
                              width: double.infinity,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            if (isShowEnabled)
              Container(
                margin: EdgeInsets.symmetric(vertical: context.k_20),
                width: widthOfShowButton,
                height: heightOfShowButton,
                child: OutlinedButton(
                  onPressed: () => showMoreButtonAction(),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: context.adColors.neutralInfoMsg,
                    ),
                  ),
                  child: Text(
                    'Show more',
                    style: ADTextStyle600.size14
                        .setTextColor(context.adColors.neutralInfoMsg),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void showMoreButtonAction() {
    setState(() {
      isShowEnabled = false;
    });
  }
}
