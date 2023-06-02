/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class BookedToCapacityErrorScreen extends StatelessWidget {
  const BookedToCapacityErrorScreen({
    Key? key,
    required this.textOne,
    required this.textTwo,
    required this.textThree,
    required this.textFour,
  }) : super(key: key);

  final String textOne;
  final String textTwo;
  final String textThree;
  final String textFour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.k_16,
        right: context.k_16,
        bottom: context.k_38,
      ),
      child: Text.rich(
        TextSpan(
          children: <InlineSpan>[
            TextSpan(
              text: textOne,
              style: ADTextStyle400.size16,
            ),
            TextSpan(
              text: textTwo,
              style: ADTextStyle500.size16,
            ),
            TextSpan(
              text: textThree,
              style: ADTextStyle400.size16,
            ),
            TextSpan(
              text: textFour,
              style: ADTextStyle500.size16,
            ),
          ],
        ),
      ),
    );
  }
}
