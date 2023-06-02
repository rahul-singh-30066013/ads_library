/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabShowBookingIdView extends StatelessWidget {
  final String title;
  final String id;

  const CabShowBookingIdView({Key? key, required this.title, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return id.isNotEmpty
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: ADTextStyle400.size14
                        .setTextColor(context.adColors.greyTextColor),
                  ),
                  Text(
                    id,
                    style: ADTextStyle500.size14
                        .setTextColor(context.adColors.blackTextColor),
                  ),
                ],
              ).paddingBySide(top: context.k_15, bottom: context.k_15),
              Divider(
                color: context.adColors.tileBorderColor,
                height: 1.sp,
                thickness: 1.sp,
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
