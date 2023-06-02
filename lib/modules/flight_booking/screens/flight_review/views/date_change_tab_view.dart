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

///This is date change tab which is showing the flight details and the charges for changing the date of flight.

class DateChangeTabView extends StatelessWidget {
  final List<DataChangeMiniRule> dataChangeMiniRuleList;
  const DateChangeTabView({
    Key? key,
    required this.dataChangeMiniRuleList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return dataChangeMiniRuleList.isNotEmpty
        ? ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: dataChangeMiniRuleList.length,
            itemBuilder: (context, index) {
              final DataChangeMiniRule dataChangeMiniRule =
                  dataChangeMiniRuleList[index];
              final List<DataChangeInfoItems> dataChangeInfoList =
                  dataChangeMiniRule.dataChangeInfoList ?? [];
              return Column(
                children: [
                  RouteNameContainerView(
                    isRoundTrip: false,
                    source: dataChangeMiniRule.fromLocationCity
                        .validateWithDefaultValue(),
                    destination: dataChangeMiniRule.toLocationCity
                        .validateWithDefaultValue(),
                  ),
                  ADSizedBox(
                    height: context.k_20,
                  ),
                  ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dataChangeInfoList.length,
                    itemBuilder: (context, index) {
                      final DataChangeInfoItems dataChangeInfoItem =
                          dataChangeInfoList[index];
                      return Visibility(
                        visible: dataChangeInfoItem.chargesAmount!=0.0,
                        child: CancellationRateView(
                          time: dataChangeInfoItem.dataChangeItemDescription
                              .validateWithDefaultValue(),
                          price: dataChangeInfoItem.dataChangeAmount
                              .validateWithDefaultValue(),
                        ),
                      );
                    },
                  ),
                  CancellationPolicyView(
                    cancellationDescription: dataChangeMiniRule.description
                        .validateWithDefaultValue(),
                  ),
                ],
              );
            },
          )
        : Center(
            child: Text(
              'no_data_available'.localize(context),
              style: ADTextStyle400.size14
                  .setTextColor(context.adColors.greyTextColor),
            ),
          );
  }
}
