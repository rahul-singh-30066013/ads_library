/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/modules/flight_booking/models/confirmation_gif_align_value.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/city_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_constants.dart';
import 'package:adani_airport_mobile/modules/site_core/model/airline/airline_info.dart';
import 'package:adani_airport_mobile/modules/site_core/model/airline/site_core_airline_response.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:intl/intl.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

/// this class is used for all utilities related to flight.
class FlightUtils {
  static const padLeft = 2;
  static const clearTripBookingHelpUrl = 'https://www.cleartrip.com/support';
  static Map<String, AirLineInfo?>? airlineInfo;
  static Map<String, int> departureFlightCountMap = {};
  static Map<String, int> arrivalFlightCountMap = {};
  static Map<String, CityDetailModel> internationalAirportMap = {};
  static SiteCoreAirlineParam? loyaltyParams;

  /// this method return the true value for round trip
  static bool isRoundTrip(TripType? tripType) {
    return tripType == TripType.roundTrip;
  }

  /// this method return the true value for round trip
  static bool isTripIsRound(String? tripType) {
    return tripType == 'R';
  }

  /// this method return the true value for oneway trip
  static bool isOnewayTrip(TripType? tripType) {
    return tripType == TripType.oneWay;
  }

// calculation utils method
  static String numberOFStops(int stops) {
    return stops != 0 ? '$stops ${stops > 1 ? 'Stops' : 'Stop'}' : 'Non-stop';
  }

  // calculation utils method
  static String numberOFStopsForFilter(int stops) {
    if (stops == 0) {
      return 'Non-stop';
    } else if (stops == 1) {
      return '$stops Stop';
    } else {
      return '1+ Stops';
    }
  }

// this will return duration in h ,m by giving input as duration in minute
  static String durationToString(int minutes) {
    final duration = Duration(minutes: minutes);
    final List<String> parts = duration.toString().split(':');
    return '${parts.first.padLeft(padLeft, '0')}h ${parts[1].padLeft(padLeft, '0')}m';
  }

  // to convert dat format in dd-MM-yyyy
  static String getConvertedDateStringInDdMMYYYY(String inputDate) {
    if (inputDate == 'N/A' || inputDate.isEmpty) {
      return 'N/A';
    } else {
      final DateFormat inputFormat = DateFormat(Constant.dateFormat5);
      final DateTime inputDateTime = inputFormat.parse(inputDate);
      return DateFormat(Constant.dateFormat2)
          .format(
            inputDateTime,
          )
          .toString();
    }
  }

  // to convert date in required format
  static String eventDateYYYYMMDDFormat(
    String? inputDate,
    String fromDateFormat,
    String toDateFormat,
  ) {
    adLog('eventDateYYYYMMDDFormat $inputDate');
    if (inputDate == null ||
        inputDate == 'N/A' ||
        inputDate.isEmpty ||
        inputDate == 'null') {
      return 'N/A';
    } else {
      final DateFormat inputFormat = DateFormat(fromDateFormat);
      final DateTime inputDateTime = inputFormat.parse(inputDate);
      return DateFormat(toDateFormat, 'en-US')
          .format(
            inputDateTime,
          )
          .toString();
    }
  }

  // to convert dat format in dd-MM-yyyy
  static String getConvertedDateStringForSaved(String inputDate) {
    if (inputDate == 'N/A' || inputDate.isEmpty) {
      return 'N/A';
    } else {
      final DateFormat inputFormat = DateFormat(Constant.dateFormat5);
      final DateTime inputDateTime = inputFormat.parse(inputDate);
      return DateFormat(Constant.dateFormat)
          .format(
            inputDateTime,
          )
          .toString();
    }
  }

  static String getConvertedDateStringSaved(String inputDate) {
    if (inputDate == 'N/A' || inputDate.isEmpty) {
      return 'N/A';
    } else {
      final DateFormat inputFormat = DateFormat(Constant.dateFormat);
      final DateTime inputDateTime = inputFormat.parse(inputDate);
      return DateFormat(Constant.dateFormat2)
          .format(
            inputDateTime,
          )
          .toString();
    }
  }

// to convert dat format in dd-MM

  static String getConvertedDateShortString(String inputDate) {
    if (inputDate == 'N/A' || inputDate.isEmpty) {
      return 'N/A';
    } else {
      final DateFormat inputFormat = DateFormat(Constant.dateFormat5);
      final DateTime inputDateTime = inputFormat.parse(inputDate);
      return DateFormat(Constant.dateFormat14)
          .format(
            inputDateTime,
          )
          .toString();
    }
  }

  // to convert dat format in dd-MM , use this while ddmm only required
  static String getConvertedDdMmString(String inputDate) {
    if (inputDate == 'N/A' || inputDate.isEmpty) {
      return 'N/A';
    } else {
      final DateFormat inputFormat = DateFormat(Constant.dateFormat5);
      final DateTime inputDateTime = inputFormat.parse(inputDate);
      return DateFormat(Constant.dateFormat10)
          .format(
            inputDateTime,
          )
          .toString();
    }
  }

//to get contact no length based on country selected
  static int lengthOfNumber(String countryCode) {
    const int numberLengthForIndia = 10;
    const int numberLengthForOtherCountry = 13;
    return countryCode == '+91' || countryCode.isEmpty
        ? numberLengthForIndia
        : numberLengthForOtherCountry;
  }

//this method is used to get first journey date as per date selected
  static DateTime getFirstDateOfJourney(String inputDate) {
    if (inputDate == 'N/A' || inputDate.isEmpty) {
      return DateTime.now();
    } else {
      final DateFormat inputFormat = DateFormat(Constant.dateFormat5);
      return inputFormat.parse(inputDate);
    }
  }

  /// this method takes price and formats with "," and rupee symbol
  /// decimal value is the count of decimal digits to be displayed
  static String getPriceFormatWithSymbol({
    required double price,
    String locale = 'HI',
    int? decimalValue,
  }) {
    const int maxDecimalCount = 2;
    final String decimals = price.toString().split('.')[1];
    int actualDecimalLength;
    if (decimals == '00' || decimals == '0') {
      actualDecimalLength = 0;
    } else if (decimals.length <= maxDecimalCount) {
      actualDecimalLength = maxDecimalCount;
    } else {
      actualDecimalLength = maxDecimalCount;
    }
    return NumberFormat.simpleCurrency(
      locale: locale,
      decimalDigits: decimalValue ?? actualDecimalLength,
    ).format(price);
  }

  ///to get price in "K" format in case of >10000
  static String getPriceFormatWithKFormat({
    required double price,
    required double maxRange,
  }) {
    const int maxDecimalCount = 0;
    final dividedAmount = price / 1000;
    return price >= maxRange
        ? '${dividedAmount.toStringAsFixed(maxDecimalCount)}k'
        : getPriceFormatWithSymbol(price: price);
  }

  static String getAmountWithTwoDecimalPoint(double rightContent) {
    final String formattedAmount = NumberFormat.simpleCurrency(
      locale: 'HI',
      decimalDigits: 2,
    ).format(rightContent);
    return formattedAmount;
  }

  //amount formatter in thousand format
  static String getAmountInThousandFormat({
    required double price,
  }) {
    final formatter = NumberFormat('#,##,000');
    return formatter.format(price);
  }

  //amount formatter in thousand format used to provide floor value
  static String getFloorAmountInThousandFormat({
    required double price,
  }) {
    final formatter = NumberFormat('#,##,000');
    return formatter.format(price.floor());
  }

  //amount formatter in thousand format used to provide ceil value
  static String getCeilAmountInThousandFormat({
    required double price,
  }) {
    final formatter = NumberFormat('#,##,000');
    return formatter.format(price.ceil());
  }

//it wil return traveller type based on ADT,CHL,INF
  static String getTravellerType(String type) {
    String travellerType = '';
    if (type.isEmpty) {
      travellerType = '';
    } else {
      if (type == kAdultCode) {
        travellerType = kAdult;
      } else if (type == kChildCode) {
        travellerType = kChild;
      } else if (type == kInfantCode) {
        travellerType = kInfant;
      }
    }
    return travellerType;
  }

  //it wil return traveller type based on ADT,CHL,INF
  static PaxType getPaxType(String type) {
    if (type == kAdultCode) {
      return PaxType.adult;
    } else if (type == kChildCode) {
      return PaxType.child;
    } else {
      return PaxType.infant;
    }
  }

  //it wil return booking status on the basis of status code from api like Z,PF,P,Q
  static String getBookingStatusType(String type) {
    String bookingType = '';
    if (type.isEmpty) {
      bookingType = '';
    } else {
      if (type == 'Z') {
        bookingType = 'confirmed';
      } else if (type == 'PF') {
        bookingType =
            'confirmed'; //as discussed with pramod - we are not showing payment paid on UI
      } else if (type == 'F') {
        bookingType = 'booking_failed';
      } else if (type == 'P') {
        bookingType = 'confirmed';
      } else if (type == 'H') {
        // bookingType = 'Booking Offline'; //as discussed with QA and prod team, comment on Azure - it should be complete
        //Pending Booking Status Order 2.0
        bookingType = 'pending';
      } else if (type == 'Q') {
        bookingType = 'cancelled';
      } else if (type == 'K') {
        bookingType = 'refunded';
      } else if (type == 'PQ') {
        bookingType = 'partially_cancelled';
      }
    }
    return bookingType;
  }

  //it wil return booking status on the basis of status code from api like Z,PF,P,Q
  static Color getBookingStatusTypeColor(String type, BuildContext context) {
    final String statusType = type.toUpperCase();
    Color bookingTypeColor = context.adColors.greenColor;
    if (statusType.isEmpty) {
      bookingTypeColor = context.adColors.greenColor;
    } else {
      if (statusType == 'Z' ||
          statusType == 'PF' ||
          statusType == 'P' ||
          statusType == 'BOOKED' ||
          statusType == 'CONFIRMED') {
        bookingTypeColor = context.adColors.greenColor;
      } else if (statusType == 'PARTIALLY CANCELLED') {
        bookingTypeColor = const Color(0xffeb9845);
      } else if (statusType == 'F' ||
          statusType == 'Q' ||
          statusType == 'CANCELLED' ||
          statusType == 'FAILED') {
        bookingTypeColor = const Color(0xffdc464b);
      } else if (statusType == 'K' || statusType == 'REFUNDED') {
        bookingTypeColor = context.adColors.blueColor;
      } else if (statusType == 'PENDING' || statusType == 'H') {
        bookingTypeColor = const Color(0xffeb9845);
      }
    }
    return bookingTypeColor;
  }

  //it wil return booking status on the basis of status code from api like Z,PF,P,Q
  static String getBookingStatusTypeLottie(String type) {
    String bookingTypeLottie =
        'lib/assets/gif/lottie/booking_confirmation_flight.json';
    if (type.isEmpty) {
      bookingTypeLottie =
          // 'lib/assets/gif/lottie/booking_confirmation_flight.json';
          // 'lib/assets/gif/lottie/booking_confirmation_pranaam.json';
          'lib/assets/gif/lottie/booking_confirnation_duty_free.json';
    } else {
      if (type == 'Z' ||
          type == 'PF' ||
          type == 'P' ||
          type == 'H' ||
          type == 'Booked' ||
          type == 'Confirmed') {
        bookingTypeLottie =
            'lib/assets/gif/lottie/booking_confirmation_flight.json';
      } else if (type == 'Partially Cancelled') {
        bookingTypeLottie =
            'lib/assets/gif/lottie/booking_partially_cancelled.json';
      } else if (type == 'F' ||
          type == 'Q' ||
          type == 'Cancelled' ||
          type == 'FAILED') {
        bookingTypeLottie = 'lib/assets/gif/lottie/booking_cancelled.json';
      } else if (type == 'K' || type == 'Refunded') {
        bookingTypeLottie = 'lib/assets/gif/lottie/booking_successful.json';
      } else if (type == 'PENDING') {
        bookingTypeLottie =
            'lib/assets/gif/lottie/booking_partially_cancelled.json';
      }
    }
    return bookingTypeLottie;
  }

  //it wil return values of padding that either the lottie should be placed in center or on bottom
  static ConfirmationGifAlignValue getConfirmationGifAlignValueLottie(
    String type,
  ) {
    ConfirmationGifAlignValue confirmationGifAlignValue =
        ConfirmationGifAlignValue();
    final double topPadding = 16.sp;
    final double rightPadding = 10.sp;
    if (type.isEmpty) {
      confirmationGifAlignValue = ConfirmationGifAlignValue(
        top: topPadding,
        right: 0,
      );
    } else {
      if (type == 'Z' ||
          type == 'PF' ||
          type == 'P' ||
          type == 'H' ||
          type == 'Booked' ||
          type == 'Confirmed') {
        confirmationGifAlignValue = ConfirmationGifAlignValue(
          right: rightPadding,
          bottom: 0,
        );
      } else if (type == 'Partially Cancelled') {
        confirmationGifAlignValue = ConfirmationGifAlignValue(
          top: topPadding,
          right: 0,
        );
      } else if (type == 'F' || type == 'Q' || type == 'Cancelled') {
        confirmationGifAlignValue = ConfirmationGifAlignValue(
          top: topPadding,
          right: 0,
        );
      } else if (type == 'K' || type == 'Refunded') {
        confirmationGifAlignValue = ConfirmationGifAlignValue(
          top: topPadding,
          right: 0,
        );
      }
    }
    return confirmationGifAlignValue;
  }

  static String getBookingStatusTypeMessage(String type) {
    String bookingTypeMessage = 'Booking updated successfully!';
    if (type.isEmpty) {
      bookingTypeMessage = 'Booking updated successfully!';
    } else {
      if (type.toLowerCase() == 'confirmed') {
        bookingTypeMessage = 'Booking Confirmed,\nThank you!';
      } else if (type == 'Z' || type == 'Booked') {
        bookingTypeMessage = 'Booked successfully!';
      } else if (type == 'PF' || type == 'Booked') {
        bookingTypeMessage = 'Booked successfully!';
      } else if (type == 'F' || type == 'Cancelled') {
        bookingTypeMessage = 'Booking Cancelled!';
      } else if (type == 'P' || type == 'Booked') {
        bookingTypeMessage = 'Booked successfully!';
      } else if (type == 'H' || type == 'Booked') {
        bookingTypeMessage = 'Booked successfully!';
      } else if (type == 'Q' || type == 'Cancelled') {
        bookingTypeMessage = 'Booking Cancelled!';
      } else if (type == 'K' || type == 'Refunded') {
        bookingTypeMessage = 'Booking Refunded!';
      } else if (type == 'Partially Cancelled') {
        bookingTypeMessage = 'Partially Cancellation Completed!';
      } else if (type == 'PENDING') {
        bookingTypeMessage = 'Booking Pending!';
      } else if (type == 'FAILED') {
        bookingTypeMessage = 'Booking Failed!';
      }
    }
    return bookingTypeMessage;
  }

  static String getBookingStatusTypeDescription(String type) {
    String bookingTypeMessage = 'Booked Successfully';
    if (type.isEmpty) {
      bookingTypeMessage = 'Booked Successfully';
    } else {
      if (type == 'Z' || type == 'Booked') {
        bookingTypeMessage = 'Ticket emailed to\n';
      } else if (type == 'PF' || type == 'Booked') {
        bookingTypeMessage = 'Ticket emailed to\n';
      } else if (type == 'F' || type == 'Cancelled') {
        bookingTypeMessage = 'Details emailed to\n';
      } else if (type == 'P' || type == 'Booked') {
        bookingTypeMessage = 'Ticket emailed to\n';
      } else if (type == 'H' || type == 'Booked') {
        bookingTypeMessage = 'Ticket emailed to\n';
      } else if (type == 'Q' || type == 'Cancelled') {
        bookingTypeMessage = 'Details emailed to\n';
      } else if (type == 'K' || type == 'Refunded') {
        bookingTypeMessage = 'Details emailed to\n';
      } else if (type == 'Partially Cancelled') {
        bookingTypeMessage = 'Ticket emailed to\n';
      }
    }
    return bookingTypeMessage;
  }

  static const int dateBuildCount = 7;
  static const int hoursInADay = 24;
  static const int multiplier = 2;

  /// to create fare calender data list to display on UI
  static List<DateTime> createFareCalendarDateList({
    DateTime? journeyDate,
    int daysRequired = dateBuildCount,
  }) {
    final List<DateTime> _dateTimeArray = [];
    final DateTime dateTime = journeyDate ?? DateTime.now();

    /// Add before dates from selected date
    for (var index = -daysRequired; index <= 0; index++) {
      final date = dateTime.add(Duration(days: index));
      if (!date.isBefore(DateTime.now()) ||
          date.difference(DateTime.now()).inHours > -hoursInADay) {
        _dateTimeArray.add(date);
      }
    }

    /// Add selected and after dates
    for (var index = 1; index <= daysRequired; index++) {
      final date = dateTime.add(Duration(days: index));
      final validLastDate = DateTime.now().add(const Duration(days: 365));
      if (!date.isAfter(validLastDate)) {
        _dateTimeArray.add(date);
      }
    }
    //commented for now as per story-https://dev.azure.com/AdaniDigitallabs/Adani-Airports/_workitems/edit/4073/
    /*   /// Add after dates if previous dates are less
    for (var index = 1; index <= daysRequired; index++) {
      final date = dateTime.add(Duration(days: index + daysRequired));
      final validLastDate = DateTime.now().add(const Duration(days: 365));
      if (!date.isAfter(validLastDate) &&
          _dateTimeArray.length <= (daysRequired * multiplier)) {
        _dateTimeArray.add(date);
      }
    }*/
    return _dateTimeArray;
  }

  //it wil return travel type based on E,P,B
  static String getTravelType(String type) {
    String travelType = '';
    if (type.isEmpty) {
      travelType = '';
    } else {
      if (type == 'E') {
        travelType = 'economy';
      } else if (type == 'P') {
        travelType = 'premiumEconomy';
      } else if (type == 'B') {
        travelType = 'business';
      } else if (type == 'F') {
        travelType = 'first';
      }
    }
    return travelType;
  }

  ///In case of flight booking valid duration range is 1 year
  static DateTime nextValidDate({required DateTime sameDate}) {
    final validLastDate = DateTime.now().add(const Duration(days: 365));
    final nextDate = sameDate.add(const Duration(days: 1));
    if (nextDate.isAfter(validLastDate)) {
      return sameDate;
    }
    return nextDate;
  }

  // to convert date format Tue, 15 Mar 22 to 15/03/2022
  static String changeDateFormat(String inputDate) {
    if (inputDate == 'N/A' || inputDate.isEmpty) {
      return 'N/A';
    } else {
      final DateFormat inputFormat = DateFormat(Constant.dateFormat2);
      final DateTime inputDateTime = inputFormat.parse(inputDate);
      return DateFormat(Constant.dateFormat12)
          .format(
            inputDateTime,
          )
          .toString();
    }
  }

  static int journeyDays(String arrivalEpoch, String departureEpoch) {
    final departureFlight = DateTime.fromMillisecondsSinceEpoch(
      int.parse(
        departureEpoch,
      ),
    );
    final arrivalFlight = DateTime.fromMillisecondsSinceEpoch(
      int.parse(
        arrivalEpoch,
      ),
      isUtc: true,
    );

    final DateTime departureDate = DateTime(
      departureFlight.year,
      departureFlight.month,
      departureFlight.day,
    );
    final DateTime arrivalDate = DateTime(
      arrivalFlight.year,
      arrivalFlight.month,
      arrivalFlight.day,
    );

    final timeDifferenceInTwoFlights = arrivalDate.difference(departureDate);
    return timeDifferenceInTwoFlights.inDays;
  }

  static int journeyDaysByDate(String aDate, String dDate) {
    final DateTime departureDate =
        Utils.getFormattedDateFromString(dateStr: dDate);
    final DateTime arrivalDate =
        Utils.getFormattedDateFromString(dateStr: aDate);

    final timeDifferenceInTwoFlights = arrivalDate.difference(departureDate);
    return timeDifferenceInTwoFlights.inDays;
  }

  static int timeSeparate(String departureTime) {
    final time = departureTime.toString().split(':');
    if (time.isNotEmpty && time.length > 1) {
      final String hour = time.first.toString();
      final String min = time[1].toString();
      return int.parse(hour + min);
    } else {
      return 0;
    }
  }

  static Future<bool> openPdf(String pdfLink) async {
    if (Platform.isAndroid && pdfLink.contains('.pdf')) {
      final file = await DefaultCacheManager().getSingleFile(pdfLink);
      final result = await OpenFile.open(file.path);
      return result.type == ResultType.done;
    }
    return false;
  }

  ///Yesterday : calculateDifference(date) == -1.
  /// Today : calculateDifference(date) == 0.
  /// Tomorrow : calculateDifference(date) == 1.
  static int calculateDifference(DateTime date) {
    final DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  /// Flight departure and arrival date difference check
  static int dateDiffCheck(DateTime departure, DateTime arrival) {
    return DateTime(departure.year, departure.month, departure.day)
        .difference(DateTime(arrival.year, arrival.month, arrival.day))
        .inDays;
  }
}

//string extension to make 1st char capital
extension StringExtension on String {
  String capitalizeFirstChar() {
    return isNotEmpty
        ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
        : '';
  }
}
