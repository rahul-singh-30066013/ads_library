/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_fare/display_model/fare_calendar_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/trip_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_listing_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

// const double _unselectedColorOpacity = 0.5;

class DateSection extends StatefulWidget {
  final void Function(DateTime date) dateTapCallBack;
  final List<DateTime>? dateTime;
  final TripDetailModel? tripDetailModel;

  // final FlightCommonModel flightCommonModel;

  const DateSection({
    Key? key,
    required this.dateTapCallBack,
    required this.dateTime,
    required this.tripDetailModel,
    // required this.flightCommonModel,
  }) : super(key: key);

  @override
  State<DateSection> createState() => _DateSectionState();
}

class _DateSectionState extends State<DateSection> {
  /// initial selected date index
  int? selectedIndex;

  List<DateTime> get _dateTimeList => widget.dateTime ?? [];

  // width and height of
  final double widthOfContainer = 110.sp;
  final double dateContainerHeight = 50.sp;
  final double selectedBorderWidth = 1.5;
  final ScrollController _controller = ScrollController();
  final double maxRange = 100000;

  // height of date and price text
  static const double fontHeight = 1.3;

  // Returning color for selected and on selected index dates
  Color _returnColor({required int index, required int selectedIndex}) {
    return selectedIndex == index
        ? context.adColors.filterBlackText
        : context.adColors.darkGreyTextColor;
  }

  void setInitialIndex() {
    for (int index = 0; index < _dateTimeList.length; index++) {
      if (_dateTimeList[index] == widget.tripDetailModel?.date) {
        selectedIndex = index;
        break;
      }
    }
  }

  // Used to print name of flight
  String itemName(int index) {
    return DateFormat(Constant.dateFormat8).format(_dateTimeList[index]);
  }

  void _animateToIndex(int index) {
    _controller.animateTo(
      (index * (widthOfContainer.sp + context.k_8)) -
          (index != 0 ? widthOfContainer.sp : 0),
      duration: const Duration(
        milliseconds: 1200,
      ),
      curve: Curves.fastOutSlowIn,
    );
  }

  /// returns minimum price from corresponding date
  ColoredPrice? getDateColoredPrice(int index) {
    final coloredPrice = context
        .read<FlightListingState>()
        .fareCalendarDisplayModel
        ?.coloredPriceMap[FormattedDate.getFormattedStringFromDate(
      _dateTimeList[index],
      Constant.dateFormat5,
    )];

    return coloredPrice;
  }

  @override
  void initState() {
    setInitialIndex();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _animateToIndex(selectedIndex ?? 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: context.k_20),
      height: dateContainerHeight,
      child: ListView.builder(
        controller: _controller,
        padding: EdgeInsets.only(left: context.k_16, right: context.k_16),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _dateTimeList.length,
        itemBuilder: (BuildContext context, int index) {
          return Opacity(
            opacity: /*widget.dateTime?.indexOf(
                      widget.tripDetailModel?.date ?? DateTime.now(),
                    ) ==
                    index
                ? 1
                : _unselectedColorOpacity*/
                1,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: context.k_4),
              width: widthOfContainer,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: context.adColors.greyCircleColor,
                  backgroundColor: index == selectedIndex
                      ? context.adColors.lightGreyBackgroundColor
                      : context.adColors.whiteTextColor,
                  shape: const StadiumBorder(),
                  side: BorderSide(
                    width: index == selectedIndex ? selectedBorderWidth : 1,
                    color: _returnColor(
                      index: index,
                      selectedIndex: selectedIndex ??
                          widget.dateTime?.indexOf(
                            widget.tripDetailModel?.date ?? DateTime.now(),
                          ) ??
                          0,
                    ),
                  ),
                ),
                onPressed: onDatePressed(index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      itemName(index),
                      textAlign: TextAlign.center,
                      style: selectedIndex == index
                          ? ADTextStyle500.size12
                              .setTextColor(
                                context.adColors.blackTextColor,
                              )
                              .setFontHeight(fontHeight)
                          : ADTextStyle400.size12
                              .setTextColor(
                                context.adColors.darkGreyTextColor,
                              )
                              .setFontHeight(fontHeight),
                    ),
                    ADSizedBox(height: context.k_4),
                    if (context
                            .watch<FlightListingState>()
                            .flightFareCalendarState
                            .viewStatus ==
                        Status.complete)
                      (getDateColoredPrice(index)?.price ?? 0) < maxRange
                          ? Text(
                              getDateColoredPrice(index)?.price != null
                                  ? FlightUtils.getPriceFormatWithSymbol(
                                      price:
                                          getDateColoredPrice(index)?.price ??
                                              0,
                                    )
                                  : '-',
                              textAlign: TextAlign.center,
                              style: ADTextStyle400.size12
                                  .setFontHeight(fontHeight)
                                  .setTextColor(
                                    getDateColoredPrice(index)?.color ??
                                        context.adColors.blackTextColor,
                                  ),
                            )
                          : Text(
                              getDateColoredPrice(index)?.price != null
                                  ? FlightUtils.getPriceFormatWithKFormat(
                                      price:
                                          getDateColoredPrice(index)?.price ??
                                              0,
                                      maxRange: maxRange,
                                    )
                                  : '-',
                              textAlign: TextAlign.center,
                              style: ADTextStyle400.size12
                                  .setFontHeight(fontHeight)
                                  .setTextColor(
                                    getDateColoredPrice(index)?.color ??
                                        context.adColors.blackTextColor,
                                  ),
                            )
                    else if (context
                            .watch<FlightListingState>()
                            .flightFareCalendarState
                            .viewStatus ==
                        Status.error)
                      const Text('-')
                    else
                      const ADDotProgressView(
                        size: 4,
                        jumpingHeight: 2,
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  VoidCallback? onDatePressed(int index) {
    return () {
      widget.dateTapCallBack(
        _dateTimeList[index],
      );
      setState(
        () {
          selectedIndex = index;
        },
      );
    };
  }
}
