/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/animated_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/how_does_it_work_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to provide reward view and howitdoeswork view on loyalty dashboard
class AdaniRewardsView extends StatefulWidget {
  final DashboardItem dashboardItem;

  const AdaniRewardsView({Key? key, required this.dashboardItem})
      : super(key: key);

  @override
  State<AdaniRewardsView> createState() => _AdaniRewardsViewState();
}

class _AdaniRewardsViewState extends State<AdaniRewardsView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    /// local variables for size,count etc
    final double circleHeight = 192.sp;
    final double circlePositionFromTop = 140.sp;
    final double circlePositionFromLeft = -80.sp;
    final double adaniRewardsProgramHeight = 218.sp;
    final double stackTopPositioned = 156.sp;
    final double _k_100 = 100.sp;
    final double _bottomPositioned = 300.sp;

    ///TODO add in style
    const _cardColor = Color(0xff4b2885);

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
            child: Stack(
              children: [
                Column(
                  children: [
                    Text(
                      widget.dashboardItem.widgetItems.first.title,
                      style: ADTextStyle700.size20.setTextColor(
                        context.adColors.whiteTextColor,
                      ),
                    ),
                    ADSizedBox(
                      height: context.k_8,
                    ),
                    Column(
                      children: [
                        Text(
                          widget.dashboardItem.widgetItems.first.subTitle,
                          style: ADTextStyle400.size14.setTextColor(
                            context.adColors.whiteTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        AnimatedView(
          left: context.k_24,
          animationType: Constants.animationTypeTop,
          path: SvgAssets.icParasute,
          rotationAngle: Constants.rotationAngle,
          height: context.k_60,
          width: context.k_40,
          bottom: _bottomPositioned,
        ),
        AnimatedView(
          top: _k_100,
          animationType: Constants.animationTypeRight,
          path: SvgAssets.icClouds,
          height: context.k_22,
          width: context.k_24,
        ),
        Positioned(
          top: circlePositionFromTop,
          left: circlePositionFromLeft,
          child: Image.asset(
            'lib/assets/images/loyalty/dot_cirlce.png',
            height: circleHeight,
          ),
        ),
        Positioned(
          top: stackTopPositioned,
          left: 0,
          right: 0,
          bottom: 0,
          child: ListView.builder(
            // key: Key(
            //   'builder ${_isExpanded.value.toString()}',
            // ),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            itemCount: widget.dashboardItem.widgetItems.first.rewardList.length,
            padding: EdgeInsets.fromLTRB(context.k_16, 0, 0, 0),
            itemBuilder: (BuildContext context, int index) {
              return HowDoesItWorkView(
                textColor: context.adColors.darkGreyTextColor,
                index: index,
                title: widget
                    .dashboardItem.widgetItems.first.rewardList[index].title,
                img: widget.dashboardItem.widgetItems.first.rewardList[index]
                    .standerdImageUrl,
                indexBackgroundColor: Colors.green,
                indexColor: Colors.yellow,
                description: widget.dashboardItem.widgetItems.first
                    .rewardList[index].description,
                backgroundColor: Colors.white,
              );
            },
          ),
        ),
      ],
    );
  }
}
