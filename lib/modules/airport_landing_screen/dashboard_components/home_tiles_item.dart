/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_dashboard_builder.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_constant_remote.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class HomeTilesItem extends StatelessWidget {
  ///*[onTapHandler] a function in which we will write the click functionality
  ///*[data] DutyFreeDashboardItem that needs to be shown content

  const HomeTilesItem({
    Key? key,
    required this.onTapHandler,
    required this.data,
  }) : super(key: key);

  ///a function in which we will write the click functionality
  final ADTapCallbackWithValue onTapHandler;
  final DutyFreeDashboardItem data;

  @override
  Widget build(BuildContext context) {
    return (data.widgetItems?.first.uniqueId == '1004')
        ? (AppConstantRemote().appConstantRemoteModel?.isChatBotEnabled ??
                false)
            ? TouchableOpacity(
                onTap: () => onTapHandler.call(data.widgetItems?.first),
                child: Container(
                  margin: EdgeInsets.only(
                    left: data.itemMargin?.left.sp ?? 0,
                    right: data.itemMargin?.right.sp ?? 0,
                    top: data.itemMargin?.top.sp ?? 0,
                    bottom: data.itemMargin?.bottom.sp ?? 0,
                  ),
                  padding: EdgeInsets.only(
                    top: data.subItemMargin?.top.sp ?? 0,
                    bottom: data.subItemMargin?.bottom.sp ?? 0,
                  ),
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 1.sp, color: const Color(0xffE2E2E2)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        data.subItemRadius?.sp ?? 0,
                      ),
                    ),
                    color: Color(
                      int.tryParse(data.backgroundColor) ??
                          Colors.transparent.value,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (Utils.startsWithHttp(
                        data.widgetItems?.first.imageSrc,
                      ))
                        SvgPicture.network(
                          data.widgetItems?.first.imageSrc ?? '',
                          width: context.k_26,
                          fit: BoxFit.fill,
                        ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.widgetItems?.first.title ?? '',
                              style: ADTextStyle700.size18.copyWith(
                                color: context.adColors.blackTextColor,
                              ),
                            ),
                            ADSizedBox(height: context.k_10),
                            Wrap(
                              children: [
                                Text(
                                  data.widgetItems?.first.description ?? '',
                                  style: ADTextStyle400.size14.copyWith(
                                    color: context.adColors.blackTextColor,
                                    fontSize: fifteenFontSize,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ).paddingBySide(
                          left: context.k_22,
                          right: context.k_22,
                        ),
                      ),
                      SvgPicture.asset(
                        'lib/assets/images/common/right-arrow.svg',
                        color: context.adColors.greyTextColor,
                        width: context.k_8,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ).paddingBySide(
                    // top: data.subItemMargin?.top.sp ?? 0,
                    // bottom: data.subItemMargin?.bottom.sp ?? 0,
                    left: data.subItemMargin?.left.sp ?? 0,
                    right: data.subItemMargin?.right.sp ?? 0,
                  ),
                ),
              )
            : SizedBox(
                height: context.k_56,
              )
        : TouchableOpacity(
            onTap: () => onTapHandler.call(data.widgetItems?.first),
            child: Container(
              margin: EdgeInsets.only(
                left: data.itemMargin?.left.sp ?? 0,
                right: data.itemMargin?.right.sp ?? 0,
                top: data.itemMargin?.top.sp ?? 0,
                bottom: data.itemMargin?.bottom.sp ?? 0,
              ),
              padding: EdgeInsets.only(
                top: data.subItemMargin?.top.sp ?? 0,
                bottom: data.subItemMargin?.bottom.sp ?? 0,
              ),
              decoration: BoxDecoration(
                border: Border.all(width: 1.sp, color: const Color(0xffE2E2E2)),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    data.subItemRadius?.sp ?? 0,
                  ),
                ),
                color: Color(
                  int.tryParse(data.backgroundColor) ??
                      Colors.transparent.value,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (Utils.startsWithHttp(data.widgetItems?.first.imageSrc))
                    SvgPicture.network(
                      data.widgetItems?.first.imageSrc ?? '',
                      width: context.k_26,
                      fit: BoxFit.fill,
                    ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.widgetItems?.first.title ?? '',
                          style: ADTextStyle700.size18
                              .copyWith(color: context.adColors.blackTextColor),
                        ),
                        ADSizedBox(height: context.k_10),
                        Wrap(
                          children: [
                            Text(
                              data.widgetItems?.first.description ?? '',
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
                // top: data.subItemMargin?.top.sp ?? 0,
                // bottom: data.subItemMargin?.bottom.sp ?? 0,
                left: data.subItemMargin?.left.sp ?? 0,
                right: data.subItemMargin?.right.sp ?? 0,
              ),
            ),
          );
  }
}
