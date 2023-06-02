/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_order_cancel_pop_up.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_bottom_sheet_drag_bar.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class HelpAndSupportBottomSheet extends StatelessWidget {
  final ContactDetail? contactDetail;

  const HelpAndSupportBottomSheet({Key? key, required this.contactDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _leftMargin = 52.sp;
    final List<String> phoneNumbers =
        contactDetail?.phone?.richText?.split('|') ?? [];
    final List<String> emails =
        contactDetail?.email?.richText?.split('|') ?? [];
    const radius = 0.5;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ADBottomSheetDragBar(
          height: context.k_4,
          width: context.k_40,
        ).paddingBySide(top: context.k_10),
        DutyFreeRemoveOrderCancelHeader(),
        ADSizedBox(
          height: context.k_16,
        ),
        if (contactDetail?.phone?.richText?.isNotEmpty ?? false)
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
                            contactDetail?.phone?.title ?? '',
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
                          RichText(
                            text: TextSpan(
                              text: 'call'.localize(context),
                              style: ADTextStyle400.size14.setTextColor(
                                context.adColors.greyTextColor,
                              ),
                              children: List.generate(
                                phoneNumbers.length,
                                (index) => TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: phoneNumbers[index],
                                      style: ADTextStyle500.size14
                                          .setTextColor(
                                            context.adColors.greyTextColor,
                                          )
                                          .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Utils.redirectToPhoneEmail(
                                            phoneNumbers[index],
                                          );
                                        },
                                    ),
                                    if (phoneNumbers.length > 1 &&
                                        index != phoneNumbers.length - 1)
                                      const TextSpan(
                                        text: ' , ',
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Spacer(),
                    InkWell(
                      onTap: () => Utils.redirectToPhoneEmail(
                        phoneNumbers.first,
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
        if ((contactDetail?.phone?.richText?.isNotEmpty ?? false) &&
            (contactDetail?.email?.richText?.isNotEmpty ?? false))
          Container(
            margin: EdgeInsets.only(
              left: _leftMargin,
              right: context.k_16,
              top: context.k_22,
              bottom: context.k_22,
            ),
            height: 1,
            color: context.adColors.dividerColor,
          ),
        if (contactDetail?.email?.richText?.isNotEmpty ?? false)
          Row(
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
                            contactDetail?.email?.title ?? '',
                            style: ADTextStyle500.size16.setTextColor(
                              context.adColors.neutralInfoMsg,
                            ),
                          ),
                          ADSizedBox(
                            height: context.k_6,
                          ),
                          RichText(
                            text: TextSpan(
                              text: '',
                              style: ADTextStyle400.size14.setTextColor(
                                context.adColors.greyTextColor,
                              ),
                              children: List.generate(
                                emails.length,
                                (index) => TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: emails[index],
                                      style: ADTextStyle500.size14
                                          .setTextColor(
                                            context.adColors.greyTextColor,
                                          )
                                          .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Utils.redirectToPhoneEmail(
                                            emails[index],
                                          );
                                        },
                                    ),
                                    if (emails.length > 1 &&
                                        index != emails.length - 1)
                                      const TextSpan(
                                        text: ' , ',
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Spacer(),
                    InkWell(
                      onTap: () => Utils.redirectToPhoneEmail(
                        emails.first,
                      ),
                      child: const Icon(Icons.keyboard_arrow_right),
                    ),
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
        ADSizedBox(
          height: context.k_22,
        ),
      ],
    );
  }
}
