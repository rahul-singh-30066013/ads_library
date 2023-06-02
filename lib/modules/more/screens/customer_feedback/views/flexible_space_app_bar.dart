/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const double expandedHeight = 120;
const double paddingLeftSide = 16;

/// This class will used to represent _FlexibleSpaceBar.
class FlexibleSpaceAppBar extends StatelessWidget {
  final double flexibleSpaceBar;
  final BuildContext context;
  final String title;
  final double paddingLeft;
  const FlexibleSpaceAppBar(this.context,
      {Key? key,
      required this.title,
      this.flexibleSpaceBar = expandedHeight,
      this.paddingLeft = paddingLeftSide,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ADSizedBox(
                  height: flexibleSpaceBar,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title,
                      style: ADTextStyle600.size32
                          .setTextColor(context.adColors.storyViewBarFillColor),
                      textAlign: TextAlign.left,
                    ).paddingBySide(
                      left: paddingLeft,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
