/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

/// This class will used to show DescriptionTextWidgetState,
class DescriptiveText extends StatefulWidget {
  final String description;

  const DescriptiveText({Key? key, required this.description})
      : super(key: key);

  @override
  _DescriptiveTextState createState() => _DescriptiveTextState();
}

class _DescriptiveTextState extends State<DescriptiveText> {
  String firstHalf = '';
  String secondHalf = '';

  bool flag = true;

  @override
  void initState() {
    super.initState();
    const descriptionLength = 90;
    if (widget.description.length > descriptionLength) {
      firstHalf = widget.description.substring(0, descriptionLength);
      secondHalf = widget.description
          .substring(descriptionLength, widget.description.length);
    } else {
      firstHalf = widget.description;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(firstHalf.trim())
          : RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: getDescriptionText(),
                    style: ADTextStyle400.size14.setTextColor(ADColors.black),
                  ),
                  TextSpan(
                    text: flag
                        ? 'viewDetails'.localize(context)
                        : 'lessDetails'.localize(context),
                    style: ADTextStyle500.size16.setTextColor(ADColors.black),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          flag = !flag;
                        });
                      },
                  ),
                ],
              ),
            ),
    );
  }

  String getDescriptionText() {
    return flag ? '$firstHalf...' : '$firstHalf$secondHalf ';
  }
}
