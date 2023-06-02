/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class BenefitsView extends StatelessWidget {
  const BenefitsView({
    Key? key,
    required this.dashBoardItem,
  }) : super(key: key);
  final DutyFreeDashboardItem dashBoardItem;

  @override
  Widget build(BuildContext context) {
    const maxLines = 2;
    return SizedBox(
      height: context.k_60,
      child: Center(
        child: ListView.separated(
          padding: EdgeInsets.only(
            left: dashBoardItem.itemMargin?.left.sp ?? 0,
            right: dashBoardItem.itemMargin?.right.sp ?? 0,
          ),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: dashBoardItem.widgetItems?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            final data = (dashBoardItem.widgetItems ?? [])[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(context.k_12),
                border: Border.all(
                  color: context.adColors.lightGreyGridSeparatorColor,
                ),
                color: context.adColors.transparentColor,
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.network(
                    dashBoardItem.widgetItems?[index].mobileImage ?? '',
                    color: context.adColors.darkGreyTextColor,
                    width: context.k_18,
                    height: context.k_18,
                  ).paddingBySide(right: context.k_12),
                  Text(
                    data.title.replaceAll(r'\n', '\n'),
                    textAlign: TextAlign.left,
                    style: ADTextStyle500.size14
                        .setTextColor(context.adColors.darkGreyTextColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: maxLines,
                  ),
                ],
              ).paddingBySide(left: context.k_16, right: context.k_16),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: dashBoardItem.subItemMargin?.left.sp ?? 0,
            );
          },
        ),
      ),
    ).paddingBySide(
      top: dashBoardItem.itemMargin?.top.sp ?? 0,
      bottom: dashBoardItem.itemMargin?.bottom.sp ?? 0,
    );
  }
}
