/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart'
    as pranaam_dashboard;
import 'package:adani_airport_mobile/modules/pranaam_service/screen/package_service/package_list_image.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

///this class is used to handle two view at a time first view is pranaamPackage and second one is RushDeal type which named as recommended_1 type.
///[shouldBeKeptAlive], variable is used to maintain scrollindex while scrolling
class GuestPackage extends StatefulWidget {
  const GuestPackage({
    Key? key,
    required this.item,
    this.onTapHandler,
    this.shouldBeKeptAlive = true,
  }) : super(key: key);

  ///[item], variable is used to maintain dashboard reference
  ///[onTapHandler], variable is used to perform on TabHandler
  ///[shouldBeKeptAlive], variable is used to maintain index of list
  final pranaam_dashboard.DashboardItem item;
  final ADTapCallbackWithValue? onTapHandler;
  final bool shouldBeKeptAlive;

  @override
  _GuestPackageState createState() => _GuestPackageState();
  static double itemWidthBasedOnType(
    pranaam_dashboard.Element? item,
    BuildContext context,
  ) {
    final totalMarginWidth = (item?.fields.widget.itemMargin.left ?? 0) +
        (item?.fields.widget.itemMargin.right ?? 0);

    return context.widthOfScreen * (item?.fields.widget.subItemWidth ?? 0) -
        totalMarginWidth;
  }
}

class _GuestPackageState extends State<GuestPackage>
    with AutomaticKeepAliveClientMixin<GuestPackage> {
  bool isItemAvailable = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final result = super.build(context);
    //added to avoid the warning
    adLog(result.toString());
    return PackageListImage(
      dealsTypeItems: widget.item.widgetItems,
      item: widget.item,
      onTapHandler: widget.onTapHandler,
      isItemAvailable: isItemAvailable,
    );
  }

  ///this method is used to handle Click
  void handlePressed() {
    adLog('Click');
  }
}
