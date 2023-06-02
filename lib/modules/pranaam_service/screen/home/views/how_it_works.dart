/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this class used to create gird view
const int columnCount = 2;
const double childAspectRatio = 0.7;

class HowItWorks extends StatelessWidget {
  const HowItWorks({
    Key? key,
    this.children,
    required this.contentData,
    this.crossAxisCount,
    this.onTapHandler,
  }) : super(key: key);

  ///Need to pass in case other then default items required
  final List<Widget>? children;

  ///Object of Dashboard item driving from the configuration json file.
  final DashboardItem contentData;

  ///Four type of Widget in case of grid [crossAxisCount]  where
  final int? crossAxisCount;

  ///onTapHandler to get the callback of item clicked.
  final ADTapCallbackWithValue? onTapHandler;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    const int _crossAxisCount = 2;
    return Container(
      padding: EdgeInsets.only(
        top: contentData.itemMargin.top.sp,
        bottom: contentData.itemMargin.bottom.sp,
        left: contentData.itemMargin.left.sp,
        right: contentData.itemMargin.right.sp,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (contentData.title.trim().isNotEmpty ||
              contentData.title.trim().isNotEmpty)
            Text(
              contentData.title,
              style: ADTextStyle700.size22,
              textAlign: TextAlign.left,
            )
          else
            const SizedBox(height: 0),
          ADSizedBox(
            height: context.k_20,
          ),
          GridView.count(
            padding: EdgeInsets.symmetric(vertical: context.k_20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing:
                context.scaled(contentData.subItemMargin.right.toDouble()),
            crossAxisCount: crossAxisCount ?? _crossAxisCount,
            childAspectRatio: childAspectRatio,
            children: children ??
                (contentData.widgetItems).map((item) {
                  return GestureDetector(
                    onTap: () => _onTapHandler(),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          contentData.borderRadius,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: context.adColors.lightGreyGridSeparatorColor,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }

  /// this method is used to handle tab listener
  void _onTapHandler() {
    ///TODO
  }
}
