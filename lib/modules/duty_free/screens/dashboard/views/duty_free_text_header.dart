/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class DutyFreeTextHeader extends StatelessWidget {
  ///A Simple Text header with left title and right blue action title
  /// as header for any inside widget of a scrollable screen.
  /// below is the example that how to use:
  /// ADTextHeader(
  ///           leftTitle: "Search Widget",
  ///         ),
  ///
  /// *[leftTitle] left title for component header with defined style guide.
  /// *[leftSubTitle] left sub title for component header with defined style guide.
  /// *[rightActionTitle] right action type text eg. "See All"
  /// *[onTapHandler] tap handler of right action item
  const DutyFreeTextHeader({
    Key? key,
    required this.leftTitle,
    this.leftSubTitle,
    this.rightActionTitle = '',
    this.onTapHandler,
  }) : super(key: key);

  ///left title for component header with defined style guide.
  final String leftTitle;

  ///left sub title for component header with defined style guide.
  final String? leftSubTitle;

  ///right action type text eg. "See All"
  final String? rightActionTitle;

  ///tap handler of right action item
  final ADTapCallback? onTapHandler;

  @override
  Widget build(BuildContext context) {
    const flex7 = 7;
    const flex3 = 3;
    const maxLines = 2;

    return Container(
      child: leftTitle.trim().isNotEmpty
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: flex7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        leftTitle,
                        maxLines: maxLines,
                        overflow: TextOverflow.ellipsis,
                        style: ADTextStyle700.size22.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      if (leftSubTitle != null &&
                          (leftSubTitle?.trim().isNotEmpty ?? true))
                        Text(
                          leftSubTitle ?? '',
                          maxLines: maxLines,
                          overflow: TextOverflow.ellipsis,
                          style: ADTextStyle400.size14,
                          textAlign: TextAlign.left,
                        ),
                    ],
                  ),
                ),
                if (rightActionTitle?.isNotEmpty == true)
                  Expanded(
                    flex: flex3,
                    child: GestureDetector(
                      onTap: onTapHandler,
                      child: SizedBox(
                        child: Text(
                          rightActionTitle ?? '',
                          maxLines: maxLines,
                          style: ADTextStyle400.size18
                              .copyWith(decoration: TextDecoration.underline),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ),
              ],
            )
          : const SizedBox(
              height: 0,
            ),
    );
  }
}
