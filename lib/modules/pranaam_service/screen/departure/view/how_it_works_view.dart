/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/departure/view/how_it_works_model.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to represent HowToWorks View
const double innerRadius = 15;
const double outerRadius = 71;

class HowItWorksView extends StatelessWidget {
  const HowItWorksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final List<HowItWorksModel> howItWorksItems = [
      HowItWorksModel('Select a Pranaam Package', 1),
      HowItWorksModel('Confirm your booking', 2),
      HowItWorksModel('Arrive at Airport', 3),
      HowItWorksModel(
        'Enjoy your Pranaam experience and travel hassle free',
        4,
      ),
    ];
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: howItWorksItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.78,
        mainAxisSpacing: 30,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: outerRadius,
                  backgroundColor: context.adColors.lightGreyColor,
                ),
                PositionedDirectional(
                  top: context.k_16,
                  child: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    radius: innerRadius,
                    child: Text(
                      howItWorksItems[index].serialNumber.toString(),
                      style: ADTextStyle500.size16.setTextColor(
                        context.adColors.whiteTextColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ADSizedBox(
              height: context.k_14,
            ),
            Text(
              howItWorksItems[index].name,
              style: ADTextStyle600.size14,
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
