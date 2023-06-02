/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math';

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/shopping_cart/terminal_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CartDetailsList extends StatefulWidget {
  final bool isBottomSheet;

  // final bool showMoreButtonVisibility;
  const CartDetailsList({Key? key, required this.isBottomSheet})
      : super(key: key);

  @override
  _CartDetailsListState createState() => _CartDetailsListState();
}

class _CartDetailsListState extends State<CartDetailsList> {
  // static const int itemCount = 10;
  // static double heightOfitem = 80.sp;
  static double heightOfIcon = 50.sp;
  static const int maxTextLines = 2;
  static double heightOfShowButton = 42.sp;
  static double widthOfShowButton = 212.sp;
  bool isShowEnabled = false;
  final maxItems = 3;

  void checkCartForLiquor(DutyFreeState dutyFreeState) {
    // String? materialName = dutyFreeState
    //         .dutyFreeCartResponse?.itemDetails.first.materialName
    //         .toLowerCase() ??
    //     '';
    final AppSessionState appSessionState = context.read<AppSessionState>();
    final item = dutyFreeState.dutyFreeCartResponse?.itemDetails ?? [];
    dutyFreeState.isCartContainLiquor = false;
    for (final i in item) {
      if (i.materialName.toLowerCase().contains('liquor')) {
        dutyFreeState.isCartContainLiquor = true;
      }
    }
    try {
      dutyFreeState.dateOfBirth = DateFormat(Constant.dateFormat5)
          .parse(appSessionState.profileModel.personInfo?.dob ?? '');
    } catch (e) {
      adLog(e.toString());
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final DateTime dob = dutyFreeState.dateOfBirth ?? DateTime.now();
      dutyFreeState.dateOfBirthController.text =
          dutyFreeState.dateOfBirth != null
              ? DateFormat('dd/MM/yyyy').format(dob)
              : '';

      if (Utils.isCartContainLiquorAndDobTessThan25(
        dob,
        context.read<DutyFreeState>(),
        context.read<SiteCoreStateManagement>().adaniAirportsList,
      )) {
        context.read<DutyFreeState>().dateOfBirthController.text = '';
        context.read<DutyFreeState>().dateOfBirth = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    final int numberOfItem = context
            .read<DutyFreeState>()
            .dutyFreeCartResponse
            ?.itemDetails
            .length ??
        0;
    checkCartForLiquor(dutyFreeState);
    return Column(
      children: [
        Row(
          children: [
            Text(
              '${'cart_details'.localize(context)} ',
              style: ADTextStyle700.size22
                  .setTextColor(context.adColors.blackTextColor),
            ),
            Text(
              numberOfItem > 1
                  ? '($numberOfItem ${'items'.localize(context)})'
                  : '($numberOfItem ${'item'.localize(context)})',
              style: ADTextStyle400.size22
                  .setTextColor(context.adColors.greyTextColor),
            ),
          ],
        ),
        const TerminalView().paddingBySide(
          top: context.k_20,
          bottom: context.k_6,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          // scrollDirection: Axis.horizontal,
          itemCount: isShowEnabled
              ? dutyFreeState.dutyFreeCartResponse?.itemDetails.length ?? 0
              : min(
                  dutyFreeState.dutyFreeCartResponse?.itemDetails.length ?? 0,
                  maxItems,
                ),
          itemBuilder: (context, index) {
            final String productUrl = dutyFreeState
                    .dutyFreeCartResponse?.itemDetails[index].productImage ??
                '';
            return Container(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      ADCachedImage(
                        maxHeightDiskCache: heightOfIcon.toInt(),
                        maxWidthDiskCache: context.k_38.toInt(),
                        boxFit: BoxFit.contain,
                        imageUrl: Utils.validateAndAppendBaseUrl(productUrl),
                        placeHolderSize: context.k_38,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dutyFreeState.dutyFreeCartResponse
                                      ?.itemDetails[index].skuName ??
                                  '',
                              style: ADTextStyle400.size14.setTextColor(
                                context.adColors.neutralInfoMsg,
                              ),
                              maxLines: maxTextLines,
                              overflow: TextOverflow.ellipsis,
                            ),
                            ADSizedBox(
                              height: context.k_4,
                            ),
                            Text(
                              '${'qty'.localize(context)} ${dutyFreeState.dutyFreeCartResponse?.itemDetails[index].quantity ?? 0}',
                              style: ADTextStyle400.size14.setTextColor(
                                context.adColors.neutralInfoMsg,
                              ),
                            ),
                          ],
                        ).paddingBySide(
                          left: context.k_10,
                          right: context.k_10,
                        ),
                      ),
                      //.paddingBySide(left: context.k_10, right: context.k_10),
                    ],
                  ).paddingBySide(top: context.k_14, bottom: context.k_14),
                  Container(
                    /// TODO: add color in styleguide
                    color: context.adColors.lightGreyGridSeparatorColor,
                    height: 1,
                    width: double.infinity,
                  ),
                ],
              ),
            );
          },
        ),
        if ((dutyFreeState.dutyFreeCartResponse?.itemDetails.length ?? 0) >
            maxItems)
          Container(
            margin: EdgeInsets.symmetric(vertical: context.k_20),
            width: widthOfShowButton,
            height: heightOfShowButton,
            child: OutlinedButton(
              onPressed: () => showMoreButtonAction(),
              style: OutlinedButton.styleFrom(
                primary: context.adColors.blackTextColor,
                side: BorderSide(
                  color: context.adColors.neutralInfoMsg,
                ),
              ),
              child: Text(
                isShowEnabled
                    ? 'showLess'.localize(context)
                    : 'showMore'.localize(context),
                style: ADTextStyle600.size14
                    .setTextColor(context.adColors.neutralInfoMsg),
              ),
            ),
          ),
      ],
    );
  }

  void showMoreButtonAction() {
    setState(() {
      isShowEnabled = !isShowEnabled;
    });
  }
}
