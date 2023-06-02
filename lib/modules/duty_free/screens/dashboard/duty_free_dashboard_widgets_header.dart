/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/views/duty_free_text_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

/// this  class is used to handle dashboard header
class DutyFreeDashBoardWidgetsHeader extends StatelessWidget {
  const DutyFreeDashBoardWidgetsHeader({
    Key? key,
    required this.contentData,
    this.onTapHandler,
  }) : super(key: key);

  ///Object of Dashboard item driving from the configuration json file.
  final DutyFreeDashboardItem contentData;

  ///onTapHandler to get the callback of item clicked.
  final ADTapCallbackWithValue? onTapHandler;

  @override
  Widget build(BuildContext context) {
    return _TextHeader(
      contentData: contentData,
    );
  }
}

/// this  class is used to handle _TextHeader
class _TextHeader extends StatelessWidget {
  final DutyFreeDashboardItem contentData;

  const _TextHeader({
    Key? key,
    required this.contentData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final String actionTitle = contentData.actionTitle?.name ?? '';
    final String title = contentData.title ?? '';
    final String subTitle = contentData.subTitle ?? '';
    return title.trim().isNotEmpty || subTitle.trim().isNotEmpty
        ? DutyFreeTextHeader(
            leftTitle: contentData.title?.replaceAll(r'\n', '\n') ?? '',
            leftSubTitle: contentData.subTitle ?? '',
            // rightActionTitle: contentData.actionTitle?.name ?? '',
            // onTapHandler: actionTitle.isNotEmpty
            //     ? () {
            //         TapDetail(
            //           objectID: contentData.actionTitle?.actionId ?? 0,
            //           name: contentData.actionTitle?.name ?? '',
            //           item: contentData,
            //         );
            //       }
            //     : null,
          ).paddingBySide(
            left: contentData.itemMargin?.left.sp ?? 0,
          )
        : const SizedBox(height: 0);
  }
}
