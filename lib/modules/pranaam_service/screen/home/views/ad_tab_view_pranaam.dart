/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart'
    as pranaam_dashboard;
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/home_dashboard/how_it_works_card.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class ADTabViewPranaam extends StatelessWidget {
  const ADTabViewPranaam({
    Key? key,
    required this.pranaamDashboardItem,
  }) : super(key: key);

  final pranaam_dashboard.DashboardItem pranaamDashboardItem;

  @override
  Widget build(BuildContext context) {
    final containerHeight =
        (context.widthOfScreen * pranaamDashboardItem.aspectRatio) +
            context.k_10;
    return DefaultTabController(
      length: pranaamDashboardItem.widgetItems.first.tabContent.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'How It Works',
                  style: ADTextStyle700.size22
                      .copyWith(color: context.adColors.blackTextColor),
                ).paddingBySide(
                  left: context.scaled(pranaamDashboardItem.itemMargin.left),
                ),
              ),
              TouchableOpacity(
                onTap: () => handlePressed(
                  title: 'how_it_works_pranaam'.localize(context),
                  context: context,
                  ctaLink: pranaamDashboardItem.widgetItems.first.appbtnUrl,
                ),
                child: Text(
                  pranaamDashboardItem.widgetItems.first.appbtnText
                      .validateWithDefaultValue(
                    defaultValue: 'know_more'.localize(context),
                  ),
                  style: ADTextStyle400.size16
                      .copyWith(color: context.adColors.blackTextColor)
                      .copyWith(
                        decoration: TextDecoration.underline,
                      ),
                ).paddingBySide(
                  right: context.k_16,
                ),
              ),
            ],
          ),
          TabBar(
            padding: EdgeInsets.only(
              top: context.scaled(pranaamDashboardItem.itemMargin.top),
            ),
            isScrollable: true,
            tabs: pranaamDashboardItem.widgetItems.first.tabContent
                .map(
                  (e) => Tab(
                    text: e.title,
                  ),
                )
                .toList(),
            unselectedLabelStyle: ADTextStyle400.size16.copyWith(
              color: context.adColors.greyTextColor,
            ),
            labelStyle: ADTextStyle500.size16.copyWith(
              color: context.adColors.neutralInfoMsg,
            ),
            indicatorColor: context.adColors.neutralInfoMsg,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xffE2E2E2),
          ).paddingBySide(bottom: context.k_12),
          Container(
            //color: Colors.blueGrey,
            height: containerHeight,
            child: TabBarView(
              children: pranaamDashboardItem.widgetItems.first.tabContent
                  .map(
                    (e) => TabView(
                      cards: e.cards,

                      /// subItemWidth is being used as subItemAspectRatio
                      subItemAspectRatio: pranaamDashboardItem.subItemWidth,
                      cardRightPadding:
                          pranaamDashboardItem.subItemMargin.right,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    ).paddingBySide(
      bottom: pranaamDashboardItem.itemMargin.bottom,
      right: pranaamDashboardItem.itemMargin.right,
    );
  }

  void handlePressed({
    required BuildContext context,
    required String title,
    required String ctaLink,
  }) {
    openWebViewWithPranaamBook(
      context: context,
      title: title,
      url: ctaLink,
    );
  }
}

class TabView extends StatefulWidget {
  final List<pranaam_dashboard.CardsItem> cards;
  final double subItemAspectRatio;
  final double cardRightPadding;

  const TabView({
    Key? key,
    required this.cards,
    required this.subItemAspectRatio,
    required this.cardRightPadding,
  }) : super(key: key);

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final noUseWidget = super.build(context);
    //added to avoid the warning
    adLog(noUseWidget.toString());
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(right: context.k_16),
      itemCount: widget.cards.length,
      itemBuilder: (context, index) {
        final pranaam_dashboard.CardsItem cardsItem = widget.cards[index];
        return HowItWorksCard(
          image: cardsItem.mobileImage,
          textThree: cardsItem.desc,
          textOne: cardsItem.value,
          textTwo: cardsItem.title,
          subItemAspectRatio: widget.subItemAspectRatio,
        ).paddingBySide(
          right:
              index == (widget.cards.length - 1) ? 0 : widget.cardRightPadding,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
