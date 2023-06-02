/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_fare/data_model/flight_fare_calender_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/trip_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

const Color redColor = Color(0xffe3463b);
const Color greenColor = Color(0xff32a851);
const Color blackColor = Color(0xff222222);

// this class is used to return fromToCity and toFromCity key with map of colored price and farecalendar prices
class FareCalendarDisplayModel {
  final DateTime lastHitTime;
  final Map<String, ColoredPrice> coloredPriceMap;

  FareCalendarDisplayModel({
    required this.lastHitTime,
    required this.coloredPriceMap,
  });

  factory FareCalendarDisplayModel.fromFareCalenderResponse(
    FlightFareCalenderResponseModel? fareCalenderResponseModel,
  ) {
    final _fareCalendars = fareCalenderResponseModel?.fareCalendars ?? [];
    final listCount = _fareCalendars.length;

    final Map<String, ColoredPrice> _coloredPrice = {};
    for (int index = 0; index < listCount; index++) {
      final String dateStr = _fareCalendars[index].date ?? '';
      final splitArray = _fareCalendars[index].date.toString().split('-');
      num? minPrice = 0;
      num? maxPrice = 0;
      if (splitArray.isNotEmpty) {
        final String month = splitArray[1];
        List<FareCalendars> mtempList = [];
        mtempList = fareCalenderResponseModel?.monthPriceMap[month] ?? [];
        minPrice = mtempList.first.prices?.amount ?? 0;
        maxPrice = mtempList.last.prices?.amount ?? 0;
      }
      final price = _fareCalendars[index].prices?.amount as num;
      Color color = blackColor;
      if (price == maxPrice && price > minPrice) {
        color = redColor;
      } else if (price == minPrice && price < maxPrice) {
        color = greenColor;
      }
      final coloredPrice = ColoredPrice(price: price.toDouble(), color: color);
      _coloredPrice[dateStr] = coloredPrice;
    }

    return FareCalendarDisplayModel(
      lastHitTime: DateTime.now(),
      coloredPriceMap: _coloredPrice,
    );
  }

  Color setMinMaxPriceColor(
    String? calendarPrice,
    String? maxPrice,
    String? minPrice,
    BuildContext buildContext,
  ) {
    if (calendarPrice == maxPrice) {
      return buildContext.adColors.red900;
    } else if (calendarPrice == minPrice) {
      return buildContext.adColors.greenTextColor;
    }
    return buildContext.adColors.blackTextColor;
  }
}

class ColoredPrice {
  double price;
  Color color;

  ColoredPrice({required this.price, required this.color});
}

// this class is used to get colored price object to set price on calendar
class FareCalendarPrice {
  ColoredPrice? getFareCalendarPrice(
    String calendarDate, {
    required bool isArrivalSelected,
    required TripDetailModel? tripDetailModel,
    required Map<String, FareCalendarDisplayModel> fareCalendarAllObjects,
  }) {
    final String fromToCityKey;
    if (fareCalendarAllObjects.isNotEmpty &&
        fareCalendarAllObjects.length.toInt() > 0) {
      final selectedFromCity = tripDetailModel?.fromCity?.cityCode ?? '';
      final selectedToCity = tripDetailModel?.toCity?.cityCode ?? '';

      fromToCityKey = isArrivalSelected
          ? '$selectedToCity$selectedFromCity'
          : '$selectedFromCity$selectedToCity';

      final fromToCityString =
          fareCalendarAllObjects.containsKey(fromToCityKey);

      if (fromToCityString) {
        final fareCalendarData = fareCalendarAllObjects[fromToCityKey];

        final dateObjects = fareCalendarData?.coloredPriceMap;
        final priceObj = dateObjects?[calendarDate];
        return priceObj;
      }
      return null;
    }
    return null;
  }
}
