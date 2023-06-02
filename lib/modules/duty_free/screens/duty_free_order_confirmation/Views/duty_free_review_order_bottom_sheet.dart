/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
/*

 void openOrderReviewSheet(
    BuildContext context,
  ) =>
      BottomSheetUtils.showDraggableBottomSheetDialog(
        context,
        const DutyFreeReviewOrderBottomSheet().paddingAllSide(context.k_16),
        'order_review'.localize(context),
      );

       */

/// Cart list from DutyFreeConfirmationOrder Page
class DutyFreeReviewOrderBottomSheet extends StatefulWidget {
  // final bool showMoreButtonVisibility;
  const DutyFreeReviewOrderBottomSheet({Key? key}) : super(key: key);

  @override
  _DutyFreeReviewOrderBottomSheetState createState() =>
      _DutyFreeReviewOrderBottomSheetState();
}

class _DutyFreeReviewOrderBottomSheetState
    extends State<DutyFreeReviewOrderBottomSheet> {
  static const int maxTextLines = 2;
  static double heightOfIcon = 38.sp;

  @override
  Widget build(BuildContext context) {
    return Consumer<DutyFreeState>(
      builder: (BuildContext context, dutyFreeState, Widget? child) => SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ADSizedBox(
                height: context.k_10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'cart_details'.localize(context),
                    style: ADTextStyle700.size18
                        .setTextColor(context.adColors.blackTextColor),
                  ),
                  ADSizedBox(
                    width: context.k_6,
                  ),
                  if ((dutyFreeState.dutyFreeCartResponse?.itemDetails.length ??
                          0) >
                      1)
                    Text(
                      '(${dutyFreeState.dutyFreeCartResponse?.itemDetails.length ?? 0} ${'items'.localize(context)})',
                      style: ADTextStyle400.size18
                          .setTextColor(context.adColors.greyTextColor),
                    ),
                  if ((dutyFreeState.dutyFreeCartResponse?.itemDetails.length ??
                          0) <=
                      1)
                    Text(
                      '(${dutyFreeState.dutyFreeCartResponse?.itemDetails.length ?? 0} ${'item'.localize(context)})',
                      style: ADTextStyle400.size18
                          .setTextColor(context.adColors.greyTextColor),
                    ),
                ],
              ).paddingBySide(
                left: context.k_16,
              ),
              ADSizedBox(
                height: context.k_22,
              ),
              ListView.builder(
                shrinkWrap: true,
                // primary: true,
                physics: const NeverScrollableScrollPhysics(),
                // scrollDirection: Axis.horizontal,
                itemCount:
                    dutyFreeState.dutyFreeCartResponse?.itemDetails.length ?? 0,
                itemBuilder: (context, index) {
                  final String productUrl = dutyFreeState.dutyFreeCartResponse
                          ?.itemDetails[index].productImage ??
                      '';
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: context.k_38,
                            // height: heightOfIcon,
                            child: FadeInImage.memoryNetwork(
                              width: context.k_38,
                              height: heightOfIcon,
                              image: Utils.validateAndAppendBaseUrl(productUrl),
                              fit: BoxFit.contain,
                              placeholder: kTransparentImage,
                              imageErrorBuilder: (
                                BuildContext context,
                                Object error,
                                StackTrace? stackTrace,
                              ) =>
                                  Container(
                                // width: context.k_38,
                                // height: heightOfIcon,
                                color: context.adColors.cardBgColor,
                                child: Icon(
                                  Icons.image_rounded,
                                  color: context.adColors.dividerColor,
                                  // Color(0xfff7f7f7),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    dutyFreeState.dutyFreeCartResponse
                                            ?.itemDetails[index].skuName ??
                                        '',
                                    // dutyFreeState.dutyFreeCartResponse
                                    //         ?.itemDetails[index].skuName ??
                                    //     '',
                                    style: ADTextStyle400.size16.setTextColor(
                                      context.adColors.neutralInfoMsg,
                                    ),
                                    maxLines: maxTextLines,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                ADSizedBox(
                                  height: context.k_8,
                                ),
                                Text(
                                  '${'qty'.localize(context)}: ${dutyFreeState.dutyFreeCartResponse?.itemDetails[index].quantity}',
                                  style: ADTextStyle400.size14.setTextColor(
                                    context.adColors.neutralInfoMsg,
                                  ),
                                  maxLines: maxTextLines,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // ADSizedBox(
                                //   height: context.k_28,
                                // ),
                              ],
                            ).paddingBySide(
                              left: context.k_20,
                              right: context.k_10,
                            ),
                          ),
                        ],
                      ).paddingBySide(
                        top: context.k_22,
                        bottom: context.k_28,
                      ),
                      Container(
                        color: context.adColors.lightGreyGridSeparatorColor,
                        height: (index ==
                                (dutyFreeState.dutyFreeCartResponse?.itemDetails
                                            .length ??
                                        0) -
                                    1)
                            ? 0
                            : 1,
                        width: double.infinity,
                      ),
                    ],
                  ).paddingBySide(left: context.k_16, right: context.k_16);
                },
              ),
              Container(
                color: context.adColors.containerGreyBg,
                height: context.k_8,
                width: double.infinity,
              ),
              const PickupView().paddingBySide(
                left: context.k_16,
                right: context.k_16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PickupView extends StatelessWidget {
  const PickupView({Key? key}) : super(key: key);
  static const int flex2 = 2;
  static const int flex3 = 3;

  @override
  Widget build(BuildContext context) {
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'pickup_details'.localize(context),
            style: ADTextStyle700.size18
                .setTextColor(context.adColors.blackTextColor),
          ),
        ).paddingBySide(
          top: context.k_24,
          bottom: context.k_10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomView(
              text1: 'store'.localize(context),
              text2: '${dutyFreeState.dutyFreeCartResponse?.store ?? ''} ${dutyFreeState.dutyFreeCartResponse?.collectionPoint ?? ''}',
              flex: flex3,
            ),
            ADSizedBox(
              width: context.k_6,
            ),
            BottomView(
              text1: 'pickup_date'.localize(context),
              text2: dutyFreeState.pickupDateController.text,
              flex: flex2,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomView(
              text1: 'pickup_time'.localize(context),
              // text2: dutyFreeState.pickupTimeController.text,
              text2: dutyFreeState.pickupTimeController.text
                  .replaceAll('am', 'AM')
                  .replaceAll('pm', 'PM'),
              flex: flex3,
            ),
            ADSizedBox(
              width: context.k_6,
            ),
            BottomView(
              text1: 'flight'.localize(context),
              text2: dutyFreeState.flightNumberController.text,
              flex: flex2,
            ),
          ],
        ),
      ],
    );
  }
}

class BottomView extends StatelessWidget {
  final String text1;
  final String text2;
  final TextStyle? style1;
  final TextStyle? style2;

  final int flex;

  const BottomView({
    Key? key,
    required this.text1,
    required this.text2,
    this.flex = 1,
    this.style1,
    this.style2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text1,
              style: style1 ??
                  ADTextStyle400.size14.setTextColor(
                    context.adColors.greyTextColor,
                  ),
            ),
          ),
          ADSizedBox(
            height: context.k_4,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text2,
              style: style2 ??
                  ADTextStyle500.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
            ),
          ),
        ],
      ).paddingBySide(
        top: context.k_10,
        bottom: context.k_10,
      ),
    );
  }
}
