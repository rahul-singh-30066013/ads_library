/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///This can be use as a common widget to showcase the important tagged information
class FlightInformationView extends StatelessWidget {
  const FlightInformationView({
    Key? key,
    required this.tagName,
    required this.tagMessage,
  }) : super(key: key);

  final String tagName;
  final String tagMessage;

  static const colorOpacity = 0.12;
  static const maxLineTagPadding = 10.0;
  static const tagNameFontSize = 11.0;
  static const tagNameWidth = 75.0;

  bool needCenterAlign(String text) {
    if (text.contains('\n')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final isCenteredAlign = needCenterAlign(tagMessage);
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffeb9845)
            .withOpacity(FlightInformationView.colorOpacity),
        borderRadius: BorderRadius.all(
          Radius.circular(context.k_8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: isCenteredAlign
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Container(
            height: context.k_20,
            width: tagNameWidth.sp,
            decoration: BoxDecoration(
              color: const Color(0xffeb9845),
              borderRadius: BorderRadius.all(
                Radius.circular(context.k_6),
              ),
            ),
            child: Center(
              child: Text(
                tagName.toUpperCase(),
                style: ADTextStyle700.size10.copyWith(
                  fontSize: FlightInformationView.tagNameFontSize,
                  color: Colors.white,
                ),
              ),
            ),
          ).paddingAllSide(maxLineTagPadding),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(maxLineTagPadding),
              child: Text(
                tagMessage,
                style: ADTextStyle400.size12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
