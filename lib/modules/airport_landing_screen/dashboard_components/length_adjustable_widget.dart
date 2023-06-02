/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/components/weather/ad_weather_widget.dart';
import 'package:adani_airport_mobile/modules/components/weather/weather_utils.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_ad_slider_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/home_screen_dashboard_builder.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/widget_type.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class LengthAdjustableWidget extends StatefulWidget {
  const LengthAdjustableWidget({
    Key? key,
    required this.dutyFreeDashboardItem,
    this.onTapHandler,
  }) : super(key: key);

  final DutyFreeDashboardItem dutyFreeDashboardItem;
  final Function(DutyFreeItem?, BuildContext)? onTapHandler;

  @override
  State<LengthAdjustableWidget> createState() => _LengthAdjustableWidgetState();
}

class _LengthAdjustableWidgetState extends State<LengthAdjustableWidget> {
  static const _two = 2;

  int length = 0;

  List<DutyFreeItem> widgetItems = [];

  @override
  void initState() {
    super.initState();
    widgetItems = widget.dutyFreeDashboardItem.widgetItems ?? [];
    length = widgetItems.length;
  }

  double _getItemWidth(DutyFreeDashboardItem? dashboardItem) {
    return DutyFreeADSliderView.itemWidthBasedOnType(
      WidgetType.weather,
      dashboardItem,
      context,
    );
  }

  void _onWeatherWidgetError() {
    setState(() {
      widgetItems.removeWhere(
        (item) => item.uniqueId == WeatherUtils.siteCoreUniqueId,
      );
      length = widgetItems.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dashBoardItem = widget.dutyFreeDashboardItem;
    final margin = dashBoardItem.itemMargin;
    final subItemMargin = dashBoardItem.subItemMargin;
    final itemWidth = _getItemWidth(dashBoardItem);
    switch (length) {
      case 0:
        return const SizedBox.shrink();
      case 1:
        final screenWidth = context.widthOfScreen;
        final singleBannerHeight = (screenWidth *
                (widget.dutyFreeDashboardItem.aspectRatio ?? 0) /
                _two) +
            (subItemMargin?.left ?? 0) +
            (subItemMargin?.left ?? 0);
        final myWidget = widgetItems.first;
        final returnWidget = myWidget.uniqueId == WeatherUtils.siteCoreUniqueId
            ? ADWeatherWidget(
                compact: false,
                itemWidth: screenWidth,
                onErrorCallback: _onWeatherWidgetError,
                //Using description as url for this widget
                url: myWidget.description,
                itemHeight: singleBannerHeight,
                borderRadius: widget.dutyFreeDashboardItem.subItemRadius ?? 0,
              )
            : _DefaultRenderWidget(
                dashBoardItem: widget.dutyFreeDashboardItem,
                itemWidth: screenWidth,
                itemHeight: singleBannerHeight,
                item: myWidget,
                onTapHandler: widget.onTapHandler,
                index: 0,
              );
        return SizedBox(
          height: singleBannerHeight,
          child: returnWidget.paddingBySide(
            top: margin?.top ?? 0,
            bottom: margin?.bottom ?? 0,
            left: margin?.left ?? 0,
            right: margin?.right ?? 0,
          ),
        );
      case _two:
        final halfScreenWidth = (context.widthOfScreen) / _two;
        final twoBannerHeight = (halfScreenWidth *
                (widget.dutyFreeDashboardItem.aspectRatio ?? 0)) +
            (subItemMargin?.left ?? 0) +
            (subItemMargin?.left ?? 0);
        return SizedBox(
          height: twoBannerHeight,
          child: Row(
            children: widgetItems
                .asMap()
                .entries
                .map(
                  (myWidget) => Flexible(
                    child: myWidget.value.uniqueId ==
                            WeatherUtils.siteCoreUniqueId
                        ? ADWeatherWidget(
                            compact: true,
                            itemWidth: halfScreenWidth,
                            onErrorCallback: _onWeatherWidgetError,
                            //Using description as url for this widget
                            url: myWidget.value.description,
                            itemHeight: twoBannerHeight,
                            borderRadius:
                                widget.dutyFreeDashboardItem.subItemRadius ?? 0,
                          ).paddingBySide(
                            left: myWidget.key != 0
                                ? ((dashBoardItem.subItemMargin?.left.sp ?? 0) /
                                    two)
                                : 0,
                            right: myWidget.key !=
                                    ((dashBoardItem.widgetItems?.length ?? 0) -
                                        1)
                                ? ((dashBoardItem.subItemMargin?.left.sp ?? 0) /
                                    two)
                                : 0,
                          )
                        : _DefaultRenderWidget(
                            dashBoardItem: widget.dutyFreeDashboardItem,
                            itemWidth: halfScreenWidth,
                            itemHeight: twoBannerHeight,
                            item: myWidget.value,
                            onTapHandler: widget.onTapHandler,
                            index: myWidget.key,
                          ).paddingBySide(
                            left: myWidget.key != 0
                                ? ((dashBoardItem.subItemMargin?.left.sp ?? 0) /
                                    two)
                                : 0,
                            right: myWidget.key !=
                                    ((dashBoardItem.widgetItems?.length ?? 0) -
                                        1)
                                ? ((dashBoardItem.subItemMargin?.left.sp ?? 0) /
                                    two)
                                : 0,
                          ),
                  ),
                )
                .toList(),
          ).paddingBySide(
            top: margin?.top ?? 0,
            bottom: margin?.bottom ?? 0,
            left: margin?.left ?? 0,
            right: margin?.right ?? 0,
          ),
        );
      default:
        return DutyFreeADSliderView(
          contentData: widget.dutyFreeDashboardItem,
          sliderType: WidgetType.weather,
          itemBuilder: (BuildContext context, int index) {
            final myWidget = widgetItems[index];
            return myWidget.uniqueId == WeatherUtils.siteCoreUniqueId
                ? ADWeatherWidget(
                    compact: true,
                    itemWidth: itemWidth,
                    onErrorCallback: _onWeatherWidgetError,
                    //Using description as url for this widget
                    url: myWidget.description,
                    itemHeight: itemWidth *
                        (widget.dutyFreeDashboardItem.aspectRatio ?? 0),
                    borderRadius:
                        widget.dutyFreeDashboardItem.subItemRadius ?? 0,
                  )
                : _DefaultRenderWidget(
                    dashBoardItem: widget.dutyFreeDashboardItem,
                    itemWidth: itemWidth,
                    itemHeight: itemWidth *
                        (widget.dutyFreeDashboardItem.aspectRatio ?? 0),
                    item: myWidget,
                    onTapHandler: widget.onTapHandler,
                    index: index,
                  );
          },
        );
    }
  }
}

class _DefaultRenderWidget extends StatelessWidget {
  const _DefaultRenderWidget({
    Key? key,
    required this.dashBoardItem,
    required this.itemWidth,
    required this.item,
    this.onTapHandler,
    required this.index,
    required this.itemHeight,
  }) : super(key: key);

  final DutyFreeDashboardItem dashBoardItem;
  final DutyFreeItem item;
  final double itemWidth;
  final double itemHeight;
  final Function(DutyFreeItem?, BuildContext)? onTapHandler;
  final int index;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () => onTapHandler?.call(
        item,
        context,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              dashBoardItem.subItemRadius ?? context.k_12,
            ),
          ),
          border: Border.all(
            color: context.adColors.lightGreyGridSeparatorColor,
          ),
        ),
        child: SizedBox(
          width: itemWidth,
          height: itemHeight,
          child: DefaultRenderTemplate(
            displayModel: _DisplayModel(
              title: item.title,
              subtitle: item.subTitle,
              imageSrc: item.imageSrc,
            ),
          ),
        ),
      ),
    );
  }
}

class _DisplayModel {
  final String title;
  final String subtitle;
  final String imageSrc;

  _DisplayModel({
    required this.title,
    required this.subtitle,
    required this.imageSrc,
  });
}

class DefaultRenderTemplate extends StatelessWidget {
  static const _subTitleFontSize = 13.0;

  const DefaultRenderTemplate({
    Key? key,
    required this.displayModel,
  }) : super(key: key);

  final _DisplayModel displayModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                displayModel.title,
                style: ADTextStyle500.size16.setTextColor(
                  context.adColors.black,
                ),
              ),
              SizedBox(
                height: context.k_2,
              ),
              Text(
                displayModel.subtitle,
                style: ADTextStyle400.size12
                    .setTextColor(
                      context.adColors.greyTextColor,
                    )
                    .copyWith(
                      fontSize: _subTitleFontSize,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ).paddingBySide(
            left: context.k_12,
          ),
        ),
        SizedBox(
          width: context.k_4,
        ),
        Image.network(
          displayModel.imageSrc,
          height: context.k_32,
          fit: BoxFit.fill,
        ).paddingBySide(
          right: context.k_8,
        ),
      ],
    );
  }
}
