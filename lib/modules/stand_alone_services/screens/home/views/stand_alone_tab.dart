import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/custom_timeline.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/constants.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class StandAloneTab extends StatefulWidget {
  final DashboardItem pranaamDashboardItem;

  const StandAloneTab({
    Key? key,
    required this.pranaamDashboardItem,
  }) : super(key: key);
  static const int tabLength = 3;
  static const double contHeight = 450;

  @override
  State<StandAloneTab> createState() => _StandAloneTabState();
}

class _StandAloneTabState extends State<StandAloneTab>
    with TickerProviderStateMixin {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final widgetItem = widget.pranaamDashboardItem.widgetItems.isNotEmpty
        ? widget.pranaamDashboardItem.widgetItems.first
        : const WidgetItem();
    // double height = textHeight(, 20, context, '2sdfghjkl');
    return DefaultTabController(
      length: widgetItem.tabContent.length,
      child: Column(
        children: [
          TabBar(
            padding: EdgeInsets.only(
              top: context.scaled(widget.pranaamDashboardItem.itemMargin.top),
            ),
            // isScrollable: true,
            onTap: (index) => indexCallback(index),
            tabs: widgetItem.tabContent
                .map(
                  (e) => Tab(
                    text: e.title,
                  ),
                )
                .toList(),
            unselectedLabelStyle: ADTextStyle400.size16.copyWith(
              color: context.adColors.greyTextColor,
            ),
            labelStyle: ADTextStyle700.size16.copyWith(
              color: context.adColors.neutralInfoMsg,
            ),
            indicatorColor: context.adColors.neutralInfoMsg,
          ).paddingBySide(left: context.k_20),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xffE2E2E2),
          ).paddingBySide(bottom: context.k_12, left: context.k_20),
          ADSizedBox(
            height: context.k_24,
          ),
          SizedBox(
            height: _getTabHeight(
              widgetItem.tabContent.isNotEmpty
                  ? widgetItem.tabContent[tabIndex]
                  : const TabContentItem(),
            ),
            child: AbsorbPointer(
              child: TabBarView(
                children: widgetItem.tabContent
                    .map(
                      (e) => ListView.builder(
                        //shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: e.cards.length,
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (e.cards[index].value.isNotEmpty)
                              Text(
                                e.cards[index].value,
                                style: ADTextStyle700.size16.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                              ).paddingBySide(bottom: context.k_10),
                            if (e.cards[index].desc.isNotEmpty)
                              Text(
                                e.cards[index].desc,
                                style: ADTextStyle400.size16.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                              ),
                          ],
                        ).paddingBySide(
                          left: context.k_20,
                          right: context.k_20,
                          bottom: context.k_20,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    ).paddingBySide(
      bottom: (widget.pranaamDashboardItem.itemMargin.bottom).sp,
      top: (widget.pranaamDashboardItem.itemMargin.top).sp,
      right: (widget.pranaamDashboardItem.itemMargin.right).sp,
      left: (widget.pranaamDashboardItem.itemMargin.left).sp,
    );
  }

  void indexCallback(index) {
    setState(() {
      tabIndex = index;
    });
  }

  double _getTabHeight(TabContentItem tabContentItem) {
    final style =
        ADTextStyle400.size16.setTextColor(context.adColors.blackTextColor);
    final width = ADSizeConfig.defaultSize.width * Constants.widthRatio - 40;
    double _height = 0;

    for (final item in tabContentItem.cards) {
      _height += item.value.textHeight(style, width, item.value) +
          item.desc.textHeight(style, width, item.desc) +
          context.k_28;
    }
    return _height;
  }
}
