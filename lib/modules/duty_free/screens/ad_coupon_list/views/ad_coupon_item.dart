/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/ad_coupon_list/views/descriptive_text.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// This class is used to show coupon items.
class ADCouponItem extends StatelessWidget {
  /// define image on item
  final String images;

  /// name or title of the coupon
  final String couponTitle;

  /// name or description of the coupon
  final String couponDescription;

  /// name or code of the coupon
  final String couponCode;

  const ADCouponItem({
    Key? key,
    required this.images,
    required this.couponTitle,
    required this.couponDescription,
    required this.couponCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const data = 100;
    return Container(
      margin: EdgeInsets.fromLTRB(0, context.k_14, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            images,
            width: context.k_40,
            height: context.k_40,
            fit: BoxFit.cover,
          ),
          SizedBox(height: context.k_20),
          Text(
            couponTitle,
            style: ADTextStyle500.size16.setTextColor(ADColors.black),
          ),
          SizedBox(height: context.k_14),
          DescriptiveText(description: couponDescription),
          SizedBox(height: context.k_14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(
                  context.k_20,
                  context.k_10,
                  context.k_20,
                  context.k_10,
                ),
                decoration: BoxDecoration(
                  color: ADColors.blue.shade50,
                  borderRadius: BorderRadius.all(
                    Radius.circular(context.k_30),
                  ),
                ),
                child: Text(
                  couponCode,
                  style: ADTextStyle500.size16.setTextColor(ADColors.black),
                ),
              ),
              TextButton(
                onPressed: () => navigatorPopScreenWithData(context, data),
                child: Text(
                  'apply'.localize(context),
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
