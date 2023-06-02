/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/tap_detail.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/deep_link_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_dashboard_screen.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

// import 'deep_link_model.dart';

/// This class will used to move grid horizontally.
class ScrollGridView extends StatefulWidget {
  const ScrollGridView({
    Key? key,
    this.children,
    required this.content,
    this.shouldBeKeptAlive = true,
  }) : super(key: key);

  ///this is used to represent dashboard item
  final DutyFreeDashboardItem content;

  ///this is used to represent list of widget
  final List<Widget>? children;

  ///this is used to main
  final bool shouldBeKeptAlive;

  @override
  State<ScrollGridView> createState() => _ScrollGridViewState();
}

class _ScrollGridViewState extends State<ScrollGridView>
    with AutomaticKeepAliveClientMixin {
  final double containerHeight = 97;

  final int crossAxisCount = 2;

  void _onTapHandler(
    dynamic tapDetail,
  ) {
    if (tapDetail is TapDetail) {
      if (tapDetail.name == kGridCircleTile) {
        handleVerticalTap(tapDetail.objectID, context);
      }
    }
  }

  /// this method is used to perform click listener on circle grid view
  void handleVerticalTap(int? objectID, BuildContext context) {
    const int switchValue = 3;
    const int shopId = 2;
    switch (objectID) {
      case 0:
        navigateToScreenUsingNamedRoute(context, flightBooking);
        break;
      case 1:
        navigateToScreenUsingNamedRoute(context, dutyFreeScreen);
        break;
      case shopId:
        navigateToScreenUsingNamedRoute(context, airportShopList);
        break;
      case switchValue:
        navigateToScreenUsingNamedRoute(context, reviewFlightDetails);
        break;
      default:
        adLog('Item Not Found');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => widget.shouldBeKeptAlive;

  @override
  Widget build(BuildContext context) {
    final Widget superBuild = super.build(context);
    adLog('$superBuild');

    return Column(
      children: [
        ADSizedBox(
          height: widget.content.itemMargin?.top.sp ?? 0,
        ),
        Container(
          height: ((widget.content.gridColumn ?? 1) *
                  ((widget.content.aspectRatio ?? 1) * containerHeight))
              .sp,
          child: GridView.count(
            padding: EdgeInsets.only(
              left: widget.content.itemMargin?.left.sp ?? 0,
              right: widget.content.itemMargin?.right.sp ?? 0,
            ),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            crossAxisSpacing: widget.content.subItemMargin?.bottom.sp ?? 0,
            mainAxisSpacing: widget.content.subItemMargin?.left.sp ?? 0,
            crossAxisCount: widget.content.gridColumn ?? crossAxisCount,
            childAspectRatio: widget.content.aspectRatio ?? 1,
            children: widget.children ??
                (widget.content.widgetItems ?? [] as List<DutyFreeItem>)
                    .map((item) {
                  return Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(
                        widget.content.subItemMargin?.left ?? 0,
                      ),
                    ),
                    child: ADDeepLinkTile(
                      deepLinkData: DeepLinkModel(
                        image: item.imageSrc,
                        deepLink: item.deepLink,
                      ),
                      onTapHandler: _onTapHandler,
                    ),
                  );
                }).toList(),
          ),
        ),
        ADSizedBox(
          height: widget.content.itemMargin?.bottom.sp ?? 0,
        ),
      ],
    );
  }
}
