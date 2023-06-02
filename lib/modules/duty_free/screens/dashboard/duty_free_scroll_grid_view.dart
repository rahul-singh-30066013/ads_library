/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */


import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/tap_detail.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/deep_link_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_dashboard_screen.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// This class will used to move grid horizontally.
class DutyFreeScrollGridView extends StatefulWidget {
  const DutyFreeScrollGridView({
    Key? key,
    this.children,
    required this.content,
    required this.containerHeight,
    this.shouldBeKeptAlive = true,
  }) : super(key: key);

  final double containerHeight;

  ///this is used to represent dashboard item
  final DutyFreeDashboardItem content;

  ///this is used to represent list of widget
  final IndexedWidgetBuilder? children;

  ///this is used to main
  final bool shouldBeKeptAlive;


  @override
  State<DutyFreeScrollGridView> createState() => _DutyFreeScrollGridViewState();
}

class _DutyFreeScrollGridViewState extends State<DutyFreeScrollGridView>
    with AutomaticKeepAliveClientMixin {
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
    adLog('Aspect Ratiossssss ${widget.content.aspectRatio}');
    const int greyBorder = 0xd8d8d8;


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ADSizedBox(
          height: widget.content.itemMargin?.top.sp ?? 0,
        ),
        if (widget.content.title?.isNotEmpty ?? false)
          Text(
            widget.content.title ?? '',
            style: ADTextStyle700.size22.setTextColor(
              context.adColors.blackTextColor,
            ),
          ).paddingBySide(
            left: widget.content.itemMargin?.left.sp ?? 0,
            right: widget.content.itemMargin?.right.sp ?? 0,
          ),
        if (widget.content.title?.isNotEmpty ?? false)
          ADSizedBox(
            height: context.k_24,
          ),
        Container(
          height: widget.containerHeight,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(
              left: widget.content.itemMargin?.left.sp ?? 0,
              right: widget.content.itemMargin?.right.sp ?? 0,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.content.gridColumn ?? crossAxisCount,
              childAspectRatio: widget.content.aspectRatio ?? 1,
              mainAxisSpacing: widget.content.subItemMargin?.left.sp ?? 0,
              crossAxisSpacing: widget.content.subItemMargin?.top.sp ?? 0,
            ),
            itemCount: widget.content.widgetItems?.length,
            itemBuilder: widget.children ??
                (context, index) => ColorFiltered(colorFilter: ColorFilter.mode(
                  widget.content.widgetItems?[index].disableForAirport  ?? false?const Color(greyBorder).withOpacity(1) : Colors.transparent , // 0 = Colored, 1 = Black & White
    BlendMode.saturation,
    ), child:Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(
                          widget.content.subItemRadius ?? 0,
                        ),
                      ),
                      child: ADDeepLinkTile(
                        deepLinkData: DeepLinkModel(
                          image: widget.content.widgetItems?[index].imageSrc,
                          deepLink:
                              widget.content.widgetItems?[index].deepLink ?? '',
                        ),
                        onTapHandler: _onTapHandler,
                      ),
                    ),
                ),
          ),
        ),
        ADSizedBox(
          height: widget.content.itemMargin?.bottom.h ?? 0,
        ),
      ],
    );
  }
}
