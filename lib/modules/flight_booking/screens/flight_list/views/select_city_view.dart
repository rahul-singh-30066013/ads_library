/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/city_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

//TODO: need to implement in style guide.
const double _k_48 = 48;
const double _k_50 = 50;

/// this class return the view for from and to city, this is also responsible for city swapping.

class SelectCityView extends StatelessWidget {
  ///*[cityDetail] is used to contain the detail of from and to airport.
  final CityDetailModel? cityDetail;

  ///*[crossAxisAlignment] is used to content on view by given alignment.
  final CrossAxisAlignment? crossAxisAlignment;

  const SelectCityView({
    Key? key,
    required this.cityDetail,
    this.crossAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        Text(
          cityDetail?.cityName ??
              cityDetail?.cityPlaceholder?.localize(context) ??
              '',
          style: ADTextStyle400.size16
              .setTextColor(context.adColors.greyTextColor),
          key: const Key(FlightAutomationKeys.cityNameKey),
          overflow: TextOverflow.ellipsis,
        ).paddingBySide(left: context.k_2, right: context.k_2),

        Visibility(
          visible: cityDetail?.cityCode == null,
          child: const Icon(
            Icons.more_horiz,
            size: _k_50,
            key: Key(FlightAutomationKeys.cityCodeIconKey),
          ).paddingBySide(top: context.k_4),
        ),

        ///TODO: need to insert this size and color in style guide.
        Visibility(
          visible: cityDetail?.cityCode != null,
          child: Text(
            cityDetail?.cityCode ?? '',
            style: ADTextStyle400.size32
                .copyWith(fontSize: _k_48, color: context.adColors.black),
            key: const Key(FlightAutomationKeys.cityCodeKey),
          ).paddingBySide(top: context.k_4),
        ),
      ],
    );
  }
}
