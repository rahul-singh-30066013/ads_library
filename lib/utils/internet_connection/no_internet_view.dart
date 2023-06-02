/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/catalog/views/filters_list_view.dart';
import 'package:adani_airport_mobile/utils/internet_connection/internet_view_alignment.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class NoInternetView extends StatefulWidget {
  const NoInternetView({
    Key? key,
    this.pageMainDesc,
    this.pageSubDesc,
    this.statusCode,
    this.internetViewAlignment = InternetViewAlignment.center,
  }) : super(key: key);

  //The main description of the page/screen
  final String? pageMainDesc;

  //The sub heading or description of the page/screen

  final String? pageSubDesc;

  final String? statusCode;

  final InternetViewAlignment? internetViewAlignment;

  @override
  _NoInternetViewState createState() => _NoInternetViewState();
}

class _NoInternetViewState extends State<NoInternetView> {
  static const sizeConstant = 200.0;
  static const heightConstant = 32.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          widget.internetViewAlignment == InternetViewAlignment.center
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
      children: [
        Container(
          width: context.scaled(sizeConstant),
          height: context.scaled(sizeConstant),
          child: widget.statusCode != null && widget.statusCode == '51'
              ? Image.asset(
                  'lib/assets/images/common/no_internet_found.gif',
                )
              : Image.asset(
                  'lib/assets/images/common/internal_server_error.gif',
                ),
        ),
        Center(
          child: Text(
            widget.pageMainDesc ?? '',
            textAlign: TextAlign.center,
            style: ADTextStyle700.size18.copyWith(
              color: context.adColors.blackTextColor,
            ),
          ).paddingBySide(left: context.k_30, right: context.k_30),
        ),
        const SizedBox(
          height: k_10,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: context.k_48),
          child: Text(
            widget.pageSubDesc ?? '',
            textAlign: TextAlign.center,
            style: ADTextStyle400.size16.copyWith(
              color: context.adColors.greyTextColor,
            ),
          ),
        ),
        const SizedBox(height: heightConstant),
      ],
    );
  }
}
