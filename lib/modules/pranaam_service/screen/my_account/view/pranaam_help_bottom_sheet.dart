/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_order_cancel_pop_up.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/terms_and_conditions/terms_and_conditions.dart'
    as terms;
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_bottom_sheet_drag_bar.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class PranaamHelpBottomSheet extends StatefulWidget {
  final terms.Element termsAndCondition;
  const PranaamHelpBottomSheet({Key? key, required this.termsAndCondition})
      : super(key: key);

  @override
  State<PranaamHelpBottomSheet> createState() => _PranaamHelpBottomSheetState();
}

class _PranaamHelpBottomSheetState extends State<PranaamHelpBottomSheet> {
  SiteCoreStateManagement pranaamSitecoreStateManagement =
      SiteCoreStateManagement();
  @override
  void initState() {
    pranaamSitecoreStateManagement = context.read<SiteCoreStateManagement>();
    adLog(
      'pranaamSitecoreStateManagement termsAndCondition ${widget.termsAndCondition}',
    );
    super.initState();
  }

  final double containerHeight = 285.sp;

  final double leftMargin = 52.sp;

  @override
  Widget build(BuildContext context) {
    final int phoneNumberLength = widget
        .termsAndCondition.fields.contentItems[1].richText
        .split('|')
        .length;
    final helpPhoneNumber1 = helpPhoneNumber(
      widget.termsAndCondition.fields.contentItems[1].richText,
      0,
    );
    final helpPhoneNumber2 = phoneNumberLength > 1
        ? helpPhoneNumber(
            widget.termsAndCondition.fields.contentItems[1].richText,
            1,
          )
        : '';
    const radius = 0.5;
    return Container(
      height: containerHeight,
      child: Column(
        children: [
          ADBottomSheetDragBar(
            height: context.k_4,
            width: context.k_40,
          ).paddingBySide(top: context.k_10),
          DutyFreeRemoveOrderCancelHeader(),
          ADSizedBox(
            height: context.k_22,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                SvgAssets.dutyFreeCall,
                width: context.k_18,
                height: context.k_18,
                color: context.adColors.greyTextColor,
              ),
              ADSizedBox(
                width: context.k_18,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget
                                .termsAndCondition.fields.contentItems[1].title,
                            style: ADTextStyle500.size16.setTextColor(
                              context.adColors.neutralInfoMsg,
                            ),
                          ),
                          ADSizedBox(
                            height: context.k_4,
                          ),
                          Text(
                            'having_problem_with_something'.localize(context),
                            style: ADTextStyle400.size14.setTextColor(
                              context.adColors.greyTextColor,
                            ),
                          ),
                          ADSizedBox(
                            height: context.k_2,
                          ),
                          Row(
                            children: [
                              Text(
                                'call'.localize(context),
                                style: ADTextStyle400.size14.setTextColor(
                                  context.adColors.greyTextColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    Utils.phoneCall(helpPhoneNumber1, context)
                                        .then(
                                  (value) => adLog('makeCall '),
                                ),
                                child: Text(
                                  helpPhoneNumber1,
                                  style: ADTextStyle500.size14
                                      .setTextColor(
                                        context.adColors.greyTextColor,
                                      )
                                      .copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                              if (phoneNumberLength > 1)
                                const Text(' , ')
                              else
                                const SizedBox.shrink(),
                              GestureDetector(
                                onTap: () =>
                                    Utils.phoneCall(helpPhoneNumber2, context)
                                        .then(
                                  (value) => adLog('makeCall '),
                                ),
                                child: Text(
                                  helpPhoneNumber2,
                                  style: ADTextStyle500.size14
                                      .setTextColor(
                                        context.adColors.greyTextColor,
                                      )
                                      .copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Spacer(),
                    InkWell(
                      onTap: () =>
                          Utils.phoneCall(helpPhoneNumber1, context).then(
                        (value) => adLog('makeCall '),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(context.k_10),
                        decoration: BoxDecoration(
                          color: context.adColors.whiteTextColor,
                          borderRadius: BorderRadius.circular(context.k_22),
                          boxShadow: [
                            BoxShadow(
                              color: context.adColors.lightGreyColor,
                              spreadRadius: radius,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.call,
                          color: context.adColors.blueColor,
                          size: context.k_24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
          Container(
            margin: EdgeInsets.only(
              left: leftMargin,
              right: context.k_16,
              top: context.k_22,
              bottom: context.k_22,
            ),
            height: 1,
            color: context.adColors.dividerColor,
          ),
          InkWell(
            onTap: () => Utils.email(
              widget.termsAndCondition.fields.contentItems.first.richText,
              context,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  SvgAssets.dutyFreeMail,
                  width: context.k_14,
                  height: context.k_14,
                  color: context.adColors.greyTextColor,
                ),
                ADSizedBox(
                  width: context.k_18,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.termsAndCondition.fields.contentItems.first
                                  .title,
                              style: ADTextStyle500.size16.setTextColor(
                                context.adColors.neutralInfoMsg,
                              ),
                            ),
                            ADSizedBox(
                              height: context.k_6,
                            ),
                            Text(
                              widget.termsAndCondition.fields.contentItems.first
                                  .richText,
                              style: ADTextStyle400.size14
                                  .setTextColor(
                                    context.adColors.greyTextColor,
                                  )
                                  .copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      // Spacer(),
                      const Icon(Icons.keyboard_arrow_right),
                      ADSizedBox(
                        width: context.k_10,
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingBySide(
              left: context.k_16,
              right: context.k_16,
            ),
          ),
        ],
      ),
    );
  }

  String helpPhoneNumber(String phoneNumber, int index) {
    final String callNumber1 = phoneNumber.split('|')[index];
    adLog('callNumber1 $callNumber1');
    return callNumber1;
  }
}
