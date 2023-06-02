/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart'
    as pranaam_dashboard;
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/home_dashboard/ad_product_card.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

final heightOfComponent = 421.sp;

///this class is used to show image of component in recommended section in which background image
class PackageListImage extends StatelessWidget {
  ///[item], variable is used to maintain dashboard reference
  ///[onTapHandler], variable is used to perform on TabHandler
  ///[dealsTypeItems], variable is used to used for dealType item in list
  ///[isItemAvailable], variable is used to check availability of item in dashBoardItem
  final pranaam_dashboard.DashboardItem item;
  final List<pranaam_dashboard.WidgetItem> dealsTypeItems;
  final ADTapCallbackWithValue? onTapHandler;
  final bool isItemAvailable;
  const PackageListImage({
    Key? key,
    required this.dealsTypeItems,
    required this.item,
    this.onTapHandler,
    required this.isItemAvailable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);

    ///this ratio for container
    const double innerCerdratio = 0.8;
    final itemWidth = PackageListImage.itemWidthBasedOnType(item, context);
    const Color purpleColor = Color(0xff4d365b);

    /// this is used for container ratio calculation
    final double outerContainerHeight = context.widthOfScreen * (1.33);
    adLog('outerContainerHeight $outerContainerHeight');
    final containerHeight = itemWidth * (item.aspectRatio);
    adLog('itemWidth $itemWidth');
    adLog('containerHeight $containerHeight');
    final double adCardHeight_347 = containerHeight;
    final double adCardWidth_270 = context.widthOfScreen * innerCerdratio;
    return Container(
      //height: outerContainerHeight,
      margin: EdgeInsets.only(top: item.itemMargin.top),
      color: purpleColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            item.title.validateWithDefaultValue(),
            style: ADTextStyle700.size24
                .copyWith(color: context.adColors.whiteTextColor),
            textAlign: TextAlign.start,
          ).paddingBySide(
            top: context.k_30,
            bottom: item.itemMargin.bottom,
            left: context.k_16,
            right: context.k_16,
          ),
          if (dealsTypeItems.first.pranaamPackage.cards.items.isNotEmpty)
            SizedBox(
              height: heightOfComponent,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    dealsTypeItems.first.pranaamPackage.cards.items.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      left: item.subItemMargin.left,
                      bottom: item.subItemMargin.bottom,
                      right: index ==
                              (dealsTypeItems
                                      .first.pranaamPackage.cards.items.length -
                                  1)
                          ? item.subItemMargin.right
                          : 0,
                    ),
                    child: ADProductCard(
                      title: dealsTypeItems
                          .first.pranaamPackage.cards.items[index].title
                          .validateWithDefaultValue(),
                      subTitle: dealsTypeItems
                          .first.pranaamPackage.cards.items[index].cardDesc
                          .validateWithDefaultValue(),
                      height: adCardHeight_347,
                      width: adCardWidth_270,
                      image: dealsTypeItems
                          .first.pranaamPackage.cards.items[index].mobileImage
                          .validateWithDefaultValue(),
                      placeHolder: '',
                      actualPrice: dealsTypeItems
                          .first.pranaamPackage.cards.items[index].finalPrice,
                      guestType: 'Per Guest',
                      addText: 'book_now'.localize(context),
                      onTap: () => handlePressed(
                        context,
                      ),
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
  void handlePressed(
    BuildContext context,
  ) =>
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        serviceBookingScreen,
        argumentObject: [true, true],
      );
}
