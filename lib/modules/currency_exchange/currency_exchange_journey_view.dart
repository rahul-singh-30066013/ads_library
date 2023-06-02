import 'package:adani_airport_mobile/modules/currency_exchange/how_currency_exchange_work_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dashboard_site_core_response.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CurrencyExchangeJourneyView extends StatefulWidget {
  final DashboardItem dashboardItem;
  const CurrencyExchangeJourneyView({Key? key, required this.dashboardItem})
      : super(key: key);

  @override
  State<CurrencyExchangeJourneyView> createState() =>
      _CurrencyExchangeJourneyViewState();
}

class _CurrencyExchangeJourneyViewState
    extends State<CurrencyExchangeJourneyView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final double adaniRewardsProgramHeight = 239.sp;
    final double stackTopPositioned = 156.sp;
    const _cardColor = Color(0xfff3f8ff);

    return Stack(
      children: [
        Container(
          color: context.adColors.whiteTextColor,
          padding: EdgeInsets.symmetric(
            vertical: context.k_60,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: context.k_28,
            ),
            alignment: Alignment.topCenter,
            height: adaniRewardsProgramHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: _cardColor,
            ),
            child: Column(
              children: [
                Text(
                  widget.dashboardItem.widgetItems.first.title,
                  style: ADTextStyle700.size18.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ),
                ADSizedBox(
                  height: context.k_8,
                ),
                Text(
                  widget.dashboardItem.widgetItems.first.subTitle,
                  style: ADTextStyle400.size16.setTextColor(
                    context.adColors.neutralInfoMsg,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: stackTopPositioned,
          left: 0,
          right: 0,
          bottom: 0,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            itemCount: widget.dashboardItem.widgetItems.first.rewardList.length,
            padding: EdgeInsets.fromLTRB(context.k_16, 0, 0, 0),
            itemBuilder: (BuildContext context, int index) {
              return HowCurrencyExchangeWorkView(
                index: index,
                title: widget
                    .dashboardItem.widgetItems.first.rewardList[index].title,
                img: widget.dashboardItem.widgetItems.first.rewardList[index]
                    .standerdImageUrl,
                description: widget.dashboardItem.widgetItems.first
                    .rewardList[index].description,
              );
            },
          ),
        ),
      ],
    );
  }
}
