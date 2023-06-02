/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart'
    as pranaam_dashboard;
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/home_dashboard/ad_porter_card.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

///this class is used to show image of component in recommended section in which background image
class PorterListService extends StatelessWidget {
  ///[item], variable is used to maintain dashboard reference
  ///[onTapHandler], variable is used to perform on TabHandler
  ///[dealsTypeItems], variable is used to used for dealType item in list
  ///[isItemAvailable], variable is used to check availability of item in dashBoardItem
  final pranaam_dashboard.DashboardItem item;
  final List<pranaam_dashboard.WidgetItem> dealsTypeItems;
  final ADTapCallbackWithValue? onTapHandler;
  final bool isItemAvailable;
  const PorterListService({
    Key? key,
    required this.dealsTypeItems,
    required this.item,
    this.onTapHandler,
    required this.isItemAvailable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final itemWidth = PorterListService.itemWidthBasedOnType(item, context);
    final containerHeight = itemWidth * (item.aspectRatio);
    final double adCardHeight_347 = 347.sp;
    final double adCardWidth_270 = 343.sp;
    return Container(
      margin: EdgeInsets.only(
        top: item.itemMargin.top,
        left: context.k_8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (dealsTypeItems.isNotEmpty)
            Container(
              height: containerHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dealsTypeItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      left: item.subItemMargin.left,
                      right: item.subItemMargin.right,
                    ),
                    child: ADPorterCard(
                      title: dealsTypeItems[index]
                          .title
                          .validateWithDefaultValue(),
                      subTitle: dealsTypeItems[index]
                          .subTitle
                          .validateWithDefaultValue(),
                      height: adCardHeight_347,
                      width: adCardWidth_270,
                      image:
                          dealsTypeItems[index].src.validateWithDefaultValue(),
                      placeHolder: '',
                      //actualPrice: dealsTypeItems[index].price ?? 0,
                      actualPrice: int.parse(dealsTypeItems[index].price),
                      guestType:
                          dealsTypeItems[index].text.validateWithDefaultValue(),
                      addText: 'buy_now'.localize(context),
                      onTap: () => handlePressed(),
                    ),
                  );
                },
              ),
            )
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }

  ///this method is used to calculate itemWidthBasedOnType
  static double itemWidthBasedOnType(
    pranaam_dashboard.DashboardItem? item,
    BuildContext context,
  ) {
    final totalMarginWidth =
        (item?.itemMargin.left ?? 0) + (item?.itemMargin.right ?? 0);

    return context.widthOfScreen * (item?.subItemWidth ?? 0) - totalMarginWidth;
  }

  ///this method is used to handle Click
  void handlePressed() {
    adLog('Click');
  }
}
