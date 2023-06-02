/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart'
    as pranaam_dashboard;
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/home_dashboard/ad_departure_card.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

///this class is used to show image of component in recommended section in which background image
class DepartureArrivalService extends StatelessWidget {
  ///[item], variable is used to maintain dashboard reference
  ///[onTapHandler], variable is used to perform on TabHandler
  ///[departureItems], variable is used to used for dealType item in list
  ///[isItemAvailable], variable is used to check availability of item in dashBoardItem
  final pranaam_dashboard.DashboardItem item;
  final List<pranaam_dashboard.Item> departureItems;
  final ADTapCallbackWithValue? onTapHandler;
  final bool isItemAvailable;

  const DepartureArrivalService({
    Key? key,
    required this.departureItems,
    required this.item,
    this.onTapHandler,
    required this.isItemAvailable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);

    ///this ratio for container
    final itemWidth = DepartureArrivalService.itemWidthBasedOnType(
      item,
      context,
    );
    final aspectRatio = item.aspectRatio;

    /// this is used for container ratio calculation
    final heightContainer = context.widthOfScreen * aspectRatio;
    adLog('heightContainer bblkn;kjn $heightContainer');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          item.widgetItems.first.title.validateWithDefaultValue(),
          style: ADTextStyle700.size22
              .copyWith(color: context.adColors.filterBlackText),
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
          top: item.itemMargin.top,
          bottom: item.itemMargin.bottom,
        ),
        if (departureItems.isNotEmpty)
          SizedBox(
            height: heightContainer,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: departureItems.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: item.subItemMargin.left,
                    right: index + 1 == departureItems.length
                        ? item.subItemMargin.right
                        : 0,
                  ),
                  child: AdDepartureCard(
                    title:
                        departureItems[index].title.validateWithDefaultValue(),
                    subTitle: departureItems[index]
                        .description
                        .validateWithDefaultValue(),
                    width: itemWidth,
                    image: departureItems[index]
                        .mobileImage
                        .validateWithDefaultValue(),
                    placeHolder: '',
                    actualPrice: int.parse(departureItems[index].finalPrice),
                    guestType: departureItems[index].btnText.isNotEmpty
                        ? departureItems[index].btnText
                        : 'know_more'.localize(context),
                    addText: 'add'.localize(context),
                    onTap: () => handlePressed(context, departureItems[index]),
                    ctaLink: departureItems[index].ctaLink,
                  ),
                );
              },
            ),
          )
        else
          const SizedBox.shrink(),
      ],
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

  void handlePressed(BuildContext context, pranaam_dashboard.Item item) {
    openWebViewWithPranaamBook(
      context: context,
      title: item.title,
      url: '${item.appCtaLink}?isApp=true',
    );
  }
}
