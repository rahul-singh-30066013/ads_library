/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/status_info_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_status.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class FlightDetailStatusItem extends StatelessWidget {
  final StatusInfoModel statusInfoModel;
  const FlightDetailStatusItem({Key? key, required this.statusInfoModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int divider = 2;
    final spaceAround = 88.sp;

    return ADSizedBox(
      width: (context.widthOfScreen - spaceAround) / divider,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            statusInfoModel.typeKey,
            style: ADTextStyle400.size12.setTextColor(
              context.adColors.greyTextColor,
            ),
          ),
          ADSizedBox(
            height: context.k_6,
          ),

          ///TODO:- will replace later with site core color value
          if ((statusInfoModel.typeValue.toString().toLowerCase() ==
                  FlightStatus.landed.name) ||
              (statusInfoModel.typeValue.toString().toLowerCase() ==
                  FlightStatus.departed.name))
            Text(
              statusInfoModel.typeValue,
              style: ADTextStyle500.size16.setTextColor(
                context.adColors.greenColor,
              ),
            )
          else if (statusInfoModel.typeValue.toString().toLowerCase() ==
              FlightStatus.cancelled.name)
            Text(
              statusInfoModel.typeValue,
              style: ADTextStyle500.size16.setTextColor(
                context.adColors.mediumPink,
              ),
            )
          else
            Text(
              statusInfoModel.typeValue,
              style: ADTextStyle500.size16.setTextColor(
                context.adColors.neutralInfoMsg,
              ),
            ),
        ],
      ),
    );
  }
}
