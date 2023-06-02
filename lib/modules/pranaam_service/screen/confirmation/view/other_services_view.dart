/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/view/other_services_cardview.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/constants/pranaam_service_contants.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

int otherServicesSize = otherServicesList.length;

class OtherServicesView extends StatelessWidget {
  /// this is used to draw the other services available in horizontal list.
  /// this includes [OtherServicesCardView] to draw the list item.
  const OtherServicesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.k_16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'other_services'.localize(context),
            style: ADTextStyle700.size22,
          ),
          ADSizedBox(
            height: context.k_20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int index = 0; index < otherServicesSize; index++)
                  Row(
                    children: [
                      OtherServicesCardView(
                        title: otherServicesList[index].title,
                        subTitle: otherServicesList[index].subTitle,
                        image: otherServicesList[index].image,
                      ),
                      if (index != otherServicesSize - 1)
                        ADSizedBox(
                          width: context.k_22,
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OtherServices {
  final String title;
  final String subTitle;
  OtherServices(this.title, this.subTitle, this.image);
  final String image;
}
