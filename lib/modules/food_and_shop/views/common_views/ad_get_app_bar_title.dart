/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';

/// this class will use to set appbar title
class ADGetAppbarTitle extends StatelessWidget {
  final int headerMaxLines;
  final ValueNotifier<String> dynamicTitle;
  const ADGetAppbarTitle({
    Key? key,
    required this.dynamicTitle,
    required this.headerMaxLines,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([dynamicTitle]),
      builder: (BuildContext context, _) => Text(
        dynamicTitle.value,
        style: ADTextStyle700.size22,
        maxLines: headerMaxLines,
      ),
    );
  }
}
