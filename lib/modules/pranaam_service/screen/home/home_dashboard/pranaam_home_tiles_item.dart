/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_dashboard_builder.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart'
    as pranaam_dashboard;
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class PranaamHomeTilesItem extends StatelessWidget {
  ///*[onTapHandler] a function in which we will write the click functionality
  ///*[data] DutyFreeDashboardItem that needs to be shown content

  const PranaamHomeTilesItem({
    Key? key,
    required this.onTapHandler,
    required this.data,
  }) : super(key: key);

  ///a function in which we will write the click functionality
  final ADTapCallbackWithValue onTapHandler;
  final pranaam_dashboard.DashboardItem data;

  @override
  Widget build(BuildContext context) {
    return data.widgetItems.isNotEmpty
        ? TouchableOpacity(
            onTap: () => onTapHandler.call(data.widgetItems.first),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.sp, color: const Color(0xffE2E2E2)),
                //TODO
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    context.scaled(
                      data.subItemRadius,
                    ),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (Utils.startsWithHttp(data.widgetItems.first.imageSrc))
                    SvgPicture.network(
                      data.widgetItems.first.imageSrc,
                      width: context.k_26,
                      fit: BoxFit.fill,
                    ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.widgetItems.first.title,
                          style: ADTextStyle700.size18
                              .copyWith(color: context.adColors.blackTextColor),
                        ),
                        ADSizedBox(height: context.k_10),
                        Wrap(
                          children: [
                            Text(
                              data.widgetItems.first.description,
                              style: ADTextStyle400.size14.copyWith(
                                color: context.adColors.blackTextColor,
                                fontSize: fifteenFontSize,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ).paddingBySide(left: context.k_22, right: context.k_22),
                  ),
                  SvgPicture.asset(
                    'lib/assets/images/common/right-arrow.svg',
                    color: context.adColors.greyTextColor,
                    width: context.k_8,
                    fit: BoxFit.fill,
                  ),
                ],
              ).paddingBySide(
                top: data.subItemMargin.top.sp,
                bottom: data.subItemMargin.bottom.sp,
                left: data.subItemMargin.left.sp,
                right: data.subItemMargin.right.sp,
              ),
            ),
          ).paddingBySide(
            left: data.itemMargin.left.sp,
            right: data.itemMargin.right.sp,
            top: data.itemMargin.top.sp,
            bottom: data.itemMargin.bottom.sp,
          )
        : const ADSizedBox.shrink();
  }
}
