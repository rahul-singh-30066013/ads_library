/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/mini_rule_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/baggage_item_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/route_name_container_view.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///This is baggage tab

class BaggageTabView extends StatelessWidget {
  const BaggageTabView({
    Key? key,
    required this.baggageMiniRuleList,
  }) : super(key: key);
  final List<BaggageMiniRule> baggageMiniRuleList;

  @override
  Widget build(BuildContext context) {
    return baggageMiniRuleList.isNotEmpty
        ? ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: baggageMiniRuleList.length,
            itemBuilder: (context, index) {
              final BaggageMiniRule baggageMiniRule =
                  baggageMiniRuleList[index];
              final List<BaggageInfo> baggageInfoList =
                  baggageMiniRule.baggageInfoList ?? [];
              /*  final baggageInfoNote = getBaggageNote(
                baggageInfoList: baggageMiniRule.baggageInfoList ?? [],
              );*/
              return Column(
                children: [
                  RouteNameContainerView(
                    isRoundTrip: false,
                    source: baggageMiniRule.fromLocationCity
                        .validateWithDefaultValue(),
                    destination: baggageMiniRule.toLocationCity
                        .validateWithDefaultValue(),
                  ),
                  ADSizedBox(
                    height: context.k_20,
                  ),
                  ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: baggageInfoList.length,
                    itemBuilder: (context, index) {
                      final BaggageInfo baggageInfoItem =
                          baggageInfoList[index];
                      return BaggageItemView(
                        baggageInfoItem: baggageInfoItem,
                      );
                    },
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
/*
  String getBaggageNote({required List<BaggageInfo> baggageInfoList}) {
    final StringBuffer baggageNote = StringBuffer();
    for (final object in baggageInfoList) {
      if (baggageNote.isEmpty) {
        baggageNote.write(object.baggageInfoNote);
      }
    }
    return baggageNote.toString();
  }*/
}
