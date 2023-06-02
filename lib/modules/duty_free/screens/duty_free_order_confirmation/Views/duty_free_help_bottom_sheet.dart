/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_order_cancel_pop_up.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
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
import 'package:url_launcher/url_launcher.dart';

/// Help on order detail / confirmation page
class DutyFreeHelpBottomSheet extends StatelessWidget {
  DutyFreeHelpBottomSheet({Key? key}) : super(key: key);

  final double containerHeight = 285.sp;
  final double leftMargin = 52.sp;
  static const int maxLine = 2;

  @override
  Widget build(BuildContext context) {
    final SiteCoreStateManagement data =
        context.read<SiteCoreStateManagement>();
    return Container(
      height: containerHeight,
      child: Column(
        children: [
          ADBottomSheetDragBar(
            height: context.k_4,
            width: context.k_40,
          ).paddingBySide(top: context.k_10),
          DutyFreeRemoveOrderCancelHeader(),
          // ADSizedBox(
          //   height: context.k_22,
          // ),
          InkWell(
            onTap: () => launchUrl(
              Uri.parse('tel:${data.contactNumber}'),
            ).then(
              (value) => adLog(
                value.toString(),
              ),
            ),
            child: Row(
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
                              data.contactNumberTitle ?? '',
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
                                children: [
                                  TextSpan(
                                    text: 'call ',
                                    style: ADTextStyle400.size14.setTextColor(
                                      context.adColors.greyTextColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: data.contactNumber,
                                    style: ADTextStyle500.size14
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
                          ],
                        ),
                      ),
                      // Spacer(),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: SvgPicture.asset(
                          SvgAssets.callBlueIcon,
                          width: context.k_19,
                          height: context.k_19,
                        ),
                      ),
                      ADSizedBox(
                        width: context.k_20,
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingBySide(
              left: context.k_20,
              //right: context.k_16,
              bottom: context.k_22,
              top: context.k_22,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: leftMargin,
              right: context.k_16,
              // bottom: context.k_22,
            ),
            // padding: EdgeInsets.only(top: context.k_22,),
            height: 1,
            color: context.adColors.dividerColor,
          ),
          InkWell(
            onTap: () => Utils.email(
              data.contactEmailId ?? '',
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
                              data.contactEmailIdTitle ?? '',
                              style: ADTextStyle500.size16.setTextColor(
                                context.adColors.neutralInfoMsg,
                              ),
                            ),
                            ADSizedBox(
                              height: context.k_6,
                            ),
                            Text(
                              data.contactEmailId ?? '',
                              style: ADTextStyle400.size14
                                  .setTextColor(
                                    context.adColors.greyTextColor,
                                  )
                                  .copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                              maxLines: maxLine,
                            ),
                          ],
                        ),
                      ),
                      // Spacer(),
                      SvgPicture.asset(
                        SvgAssets.arrowRight,
                        width: context.k_14,
                        height: context.k_14,
                        color: context.adColors.greyTextColor,
                      ),
                      ADSizedBox(
                        width: context.k_20,
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingBySide(
              left: context.k_16,
              right: context.k_16,
              top: context.k_22,
              bottom: context.k_22,
            ),
          ),
        ],
      ),
    );
  }
}
