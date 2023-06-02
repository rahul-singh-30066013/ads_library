/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class TerminalView extends StatelessWidget {
  const TerminalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: context.adColors.lightGreyGridSeparatorColor,
        ),
        borderRadius: BorderRadius.circular(
          context.k_6,
        ),
      ),
      // margin: EdgeInsets.only(
      //   bottom: context.k_16,
      // ),
      padding: EdgeInsets.only(
        left: context.k_16,
        right: context.k_16,
        top: context.k_8,
        bottom: context.k_16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            SvgAssets.cartLocationIcon,
            width: context.k_18,
            height: context.k_18,
            color: context.adColors.greyTextColor,
          ).paddingBySide(top: context.k_10),
          ADSizedBox(
            width: context.k_12,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${'pickup'.localize(context)} : ',
                        style: ADTextStyle400.size14
                            .setTextColor(
                              context.adColors.blackTextColor,
                            )
                            .copyWith(height: context.k_2),
                      ),
                      TextSpan(
                        text: context.read<DutyFreeState>().storeName ?? '',
                        style: ADTextStyle500.size14.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                      ),
                      // WidgetSpan(
                      //   child: Container(
                      //     padding: EdgeInsets.symmetric(
                      //       vertical: context.k_4,
                      //     ),
                      //     child: Text(
                      //       ' - ',
                      //       style: ADTextStyle500.size14.setTextColor(
                      //         context.adColors.blackTextColor,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // WidgetSpan(
                      //   child: Container(
                      //     padding: EdgeInsets.fromLTRB(
                      //       context.k_8,
                      //       context.k_4,
                      //       context.k_8,
                      //       context.k_4,
                      //     ),
                      //     decoration: BoxDecoration(
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(context.k_4)),
                      //       color: const Color(0xffffd866),
                      //     ),
                      //     child: Text(
                      //       context.read<DutyFreeState>().collectionPointName ??
                      //           '',
                      //       style: ADTextStyle500.size14.setTextColor(
                      //         context.adColors.blackTextColor,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: context.k_4),
                  padding: EdgeInsets.fromLTRB(
                    context.k_8,
                    context.k_4,
                    context.k_8,
                    context.k_4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(context.k_4)),
                    color: const Color(0xffffd866),
                  ),
                  child: Text(
                    context.read<DutyFreeState>().collectionPointName ?? '',
                    style: ADTextStyle500.size14.setTextColor(
                      context.adColors.blackTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
