/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/mini_rule_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/baggage_tab_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/cancellation_tab_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/date_change_tab_view.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///In this class, we are making baggage and cancellation policy screen.
///here, we have 3 tabs : baggage [BaggageTabView], cancellation [CancellationTabView], date change [DateChangeTabView]

class BaggageAndCancellationPoliciesScreen extends StatelessWidget {
  static const int tabBarLength = 3;

  final MiniRuleDisplayModel? miniRuleDisplayModel;

  const BaggageAndCancellationPoliciesScreen({
    Key? key,
    this.miniRuleDisplayModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabBarLength,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            labelColor: context.adColors.black,
            unselectedLabelColor: context.adColors.greyTextColor,
            labelStyle: ADTextStyle500.size14,
            indicatorColor: context.adColors.black,
            unselectedLabelStyle: ADTextStyle400.size14
                .setTextColor(context.adColors.greyTextColor),
            tabs: [
              Tab(
                text: 'baggage'.localize(context),
              ),
              Tab(
                text: 'cancellation'.localize(context),
              ),
              Tab(
                text: 'date_change'.localize(context),
              ),
            ],
          ),
          const Divider(
            height: 1,
          ),
          ADSizedBox(
            height: context.k_20,
          ),
          Expanded(
            child: TabBarView(
              children: [
                BaggageTabView(
                  baggageMiniRuleList:
                      miniRuleDisplayModel?.baggageMiniRuleList ?? [],
                ),
                CancellationTabView(
                  cancellationMiniRule:
                      miniRuleDisplayModel?.cancellationMiniRuleList ?? [],
                ),
                DateChangeTabView(
                  dataChangeMiniRuleList:
                      miniRuleDisplayModel?.dataChangeMiniRuleList ?? [],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
