/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/mini_rule_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/cancellation_policy_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/cancellation_rate_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/route_name_container_view.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///This is cancellation tab which is showing flight details and charges for cancelling a booking.

class CancellationTabView extends StatelessWidget {
  final List<CancellationMiniRule> cancellationMiniRule;
  const CancellationTabView({Key? key, required this.cancellationMiniRule})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cancellationMiniRule.isNotEmpty
          ? ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: cancellationMiniRule.length,
              itemBuilder: (context, index) {
                final CancellationMiniRule cancellationMiniRuleItem =
                    cancellationMiniRule[index];
                final List<CancellationInfoItems> cancellationInfoListItem =
                    cancellationMiniRuleItem.cancellationInfoList ?? [];
                return Padding(
                  padding: EdgeInsets.only(bottom: context.k_20),
                  child: Column(
                    children: [
                      RouteNameContainerView(
                        isRoundTrip: false,
                        source: cancellationMiniRuleItem.fromLocationCity
                            .validateWithDefaultValue(),
                        destination: cancellationMiniRuleItem.toLocationCity
                            .validateWithDefaultValue(),
                      ),
                      ADSizedBox(
                        height: context.k_20,
                      ),
                      ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cancellationInfoListItem.length,
                        itemBuilder: (context, index) {
                          final CancellationInfoItems cancellationInfoItem =
                              cancellationInfoListItem[index];
                          return Visibility(
                            visible: cancellationInfoItem.chargesAmount!=0.0,
                            child: CancellationRateView(
                              time: cancellationInfoItem
                                  .cancellationItemDescription
                                  .validateWithDefaultValue(),
                              price: cancellationInfoItem.cancellationAmount
                                  .validateWithDefaultValue(),
                            ),
                          );
                        },
                      ),
                      CancellationPolicyView(
                        cancellationDescription: cancellationMiniRuleItem
                            .description
                            .validateWithDefaultValue(),
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(
              child: Text(
                'no_data_available'.localize(context),
                style: ADTextStyle400.size14
                    .setTextColor(context.adColors.greyTextColor),
              ),
            ),
    );
  }
}
