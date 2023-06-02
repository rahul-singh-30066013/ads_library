/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/response_models/filtered_vendor_data_response_model.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class ImportantInformationView extends StatelessWidget {
  final ImportantInformation impInfo;

  const ImportantInformationView({Key? key, required this.impInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          impInfo.title ?? '',
          style: ADTextStyle700.size22.setTextColor(
            context.adColors.blackTextColor,
          ),
        ),
        ListView.builder(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.only(top: context.k_10),
          shrinkWrap: true,
          itemCount: impInfo.info?.length ?? 0,
          itemBuilder: (context, index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: context.k_6),
                  width: context.k_6,
                  height: context.k_6,
                  decoration: BoxDecoration(
                    color: context.adColors.darkGreyTextColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(context.k_4),
                    ),
                  ),
                ),
                SizedBox(
                  width: context.k_12,
                ),
                Expanded(
                  child: Text(
                    impInfo.info?[index] ?? '',
                    style: ADTextStyle400.size16.setTextColor(
                      context.adColors.neutralInfoMsg,
                    ),
                  ),
                ),
              ],
            ).paddingBySide(
              top: context.k_10,
              bottom:
                  (index == (impInfo.info?.length ?? 0) - 1) ? 0 : context.k_10,
            );
          },
        ),
      ],
    );
  }
}
