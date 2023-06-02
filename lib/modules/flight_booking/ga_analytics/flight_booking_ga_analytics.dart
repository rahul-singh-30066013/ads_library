/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/analytics.dart';
import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_create_itinerary_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/flight_view_trip_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_view_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/passenger_type_quantity.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/priced_itinerary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/flight_booking_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_booking_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

// this class is used to track all the flight booking GA events
class FlightBookingGaAnalytics {
  final List<AnalyticsEventItem> itemList = <AnalyticsEventItem>[];

  void signInFromPopup() {
    final signInObject = <String, Object?>{
      Parameters.category.name: 'home_screen_popup',
      Parameters.sub_category.name: 'sign_in',
    };
    ClickEvents.login_start.logEvent(parameters: signInObject);
  }

  // login and otp verification GA methods
  void signInAnalyticsData({bool? signInFromPopup, String? categoryName}) {
    final isSignInFromPopup = signInFromPopup ?? false;
    final signInObject = <String, Object?>{
      Parameters.category.name: isSignInFromPopup
          ? 'home_screen_popup'
          : categoryName ?? 'flight_book',
      Parameters.sub_category.name: 'sign_in',
    };
    ClickEvents.login_submit.logEvent(parameters: signInObject);
  }

  void resendOtpAnalyticsData({bool? signInFromPopup, String? categoryName}) {
    final isSignInFromPopup = signInFromPopup ?? false;
    final signInObject = <String, Object?>{
      Parameters.category.name: isSignInFromPopup
          ? 'home_screen_popup'
          : categoryName ?? 'flight_book',
      Parameters.sub_category.name: 'sign_in',
    };
    ClickEvents.otp_resend.logEvent(parameters: signInObject);
  }

  void moreOptionsAnalyticsData(String label, {bool? signInFromPopup}) {
    final isSignInFromPopup = signInFromPopup ?? false;
    final signInObject = <String, Object?>{
      Parameters.category.name:
          isSignInFromPopup ? 'home_screen_popup' : 'flight_book',
      Parameters.sub_category.name: 'sign_in',
      Parameters.label.name: label,
    };
    ClickEvents.otp_more_options.logEvent(parameters: signInObject);
  }

  void signUpSuccessfulAnalyticsData(
    String userId, {
    bool isRegistered = false,
    required String type,
    required String label,
  }) {
    final signInObject = <String, Object?>{
      Parameters.category.name: 'flight_book',
      Parameters.sub_category.name: 'sign_in',
      Parameters.user_id.name: userId,
      Parameters.is_registered.name: isRegistered,
      Parameters.type.name: type,
      Parameters.label.name: label,
    };
    ClickEvents.sign_up.logEvent(parameters: signInObject);
  }

  void loginAndLogoutSuccessfulAnalyticsData(
    String userId, {
    bool isRegistered = true,
    required String type,
    required String label,
    bool? signInFromPopup,
    String? categoryName,
  }) {
    final isSignInFromPopup = signInFromPopup ?? false;
    final signInObject = <String, Object?>{
      Parameters.category.name: isSignInFromPopup
          ? 'home_screen_popup'
          : categoryName ?? 'flight_book',
      Parameters.sub_category.name: 'sign_in',
      Parameters.user_id.name: userId,
      Parameters.is_registered.name: isRegistered,
      Parameters.type.name: type,
      Parameters.label.name: label,
      Parameters.login_status.name:
          ProfileSingleton.profileSingleton.isLoggedIn ? 'login' : 'guest',
    };
    ClickEvents.login.logEvent(parameters: signInObject);
  }

  void signInFailAnalyticsData({
    bool isRegistered = false,
    required String type,
    required String label,
    bool? signInFromPopup,
  }) {
    final isSignInFromPopup = signInFromPopup ?? false;
    final signInObject = <String, Object?>{
      Parameters.category.name:
          isSignInFromPopup ? 'home_screen_popup' : 'flight_book',
      Parameters.sub_category.name: 'sign_in',
      Parameters.is_registered.name: isRegistered,
      Parameters.type.name: type,
      Parameters.label.name: label,
    };
    ClickEvents.login_fail.logEvent(parameters: signInObject);
  }

  void signInVerificationFailAnalyticsData(
    String? message,
    String? errorCode, {
    bool isRegistered = false,
    required String type,
    required String label,
    bool? signInFromPopup,
  }) {
    final isSignInFromPopup = signInFromPopup ?? false;
    final signInObject = <String, Object?>{
      Parameters.category.name:
          isSignInFromPopup ? 'home_screen_popup' : 'flight_book',
      Parameters.sub_category.name: 'sign_in',
      Parameters.error_code.name: errorCode,
      Parameters.error_text.name: message,
      Parameters.is_registered.name: isRegistered,
      Parameters.type.name: type,
      Parameters.label.name: label,
    };
    ClickEvents.otp_verification_fail.logEvent(parameters: signInObject);
  }

  void registerUserIdAnalyticsData({
    required String? userId,
  }) {
    if (userId != null) {
      ClickEvents.identify_user.logUserId(
        userId: userId,
      ); // sending userid to GA events
    }
  }

  void saveProfileDataAnalyticsEvent({
    required ProfileModel profileData,
  }) {
    ClickEvents.identify_user.logUserProfileData(
      profileData: profileData,
    );
  }

  void otpVerifiedSuccessAnalyticsData(
    String type,
    String label, {
    bool isRegistered = false,
    bool? signInFromPopup,
    String? categoryName,
  }) {
    final isSignInFromPopup = signInFromPopup ?? false;
    final signInObject = <String, Object?>{
      Parameters.category.name: isSignInFromPopup
          ? 'home_screen_popup'
          : categoryName ?? 'flight_book',
      Parameters.sub_category.name: 'sign_in',
      Parameters.is_registered.name: isRegistered,
      Parameters.label.name: label,
      Parameters.type.name: type,
    };
    ClickEvents.otp_verification_success.logEvent(parameters: signInObject);
  }

  void otpSuccessAnalyticsData({
    required String type,
    required String label,
    bool? signInFromPopup,
    String? categoryName,
  }) {
    final isSignInFromPopup = signInFromPopup ?? false;
    final signInObject = <String, Object?>{
      Parameters.category.name: isSignInFromPopup
          ? 'home_screen_popup'
          : categoryName ?? 'flight_book',
      Parameters.sub_category.name: 'sign_in',
      Parameters.type.name: type,
      Parameters.label.name: label,
    };
    ClickEvents.otp_verification.logEvent(parameters: signInObject);
  }

  //to prepare obj to pass on GA-Flight section implemented on flight_booking_search screen
  void prepareFlightGACommonObj(
    FlightBookingModel flightBookingModel,
    FlightBookingState flightViewModel,
  ) {
    final fromCity = flightBookingModel.roundTrip?.fromCity?.cityCode;
    final toCity = flightBookingModel.roundTrip?.toCity?.cityCode;
    final marketValue = getSortedString(fromCity ?? '', toCity ?? '');

    final sectorId = (!flightBookingModel.isDomesticDepartureCity ||
            !flightBookingModel.isDomesticArrivalCity)
        ? 'I'
        : 'D';

    final isDomestic = sectorId.toLowerCase() == 'd';

    Analytics.flightBookingGAObject = {
      Parameters.category.name: 'book_flight',
      Parameters.sub_category.name: 'purchase',
      Parameters.trip_type.name: flightBookingModel.tripType.name,
      Parameters.booking_class.name:
          flightBookingModel.travellers?.travelClass?.name,
      Parameters.departure_station.name:
          flightBookingModel.oneWayTrip?.fromCity?.cityCode,
      Parameters.arrival_station.name:
          flightBookingModel.oneWayTrip?.toCity?.cityCode,
      Parameters.market.name: marketValue,
      Parameters.departure_date.name: FlightUtils.eventDateYYYYMMDDFormat(
        flightBookingModel.oneWayTrip?.date.toString() ?? 'N/A',
        Constant.dateFormat12,
        Constant.dateFormat21,
      ),
      Parameters.return_date.name: FlightUtils.isRoundTrip(
        flightViewModel.flightBookingModel.tripType,
      )
          ? FlightUtils.eventDateYYYYMMDDFormat(
              flightBookingModel.roundTrip?.date.toString() ?? 'N/A',
              Constant.dateFormat12,
              Constant.dateFormat21,
            )
          : 'N/A',
      Parameters.pax_count.name:
          (flightBookingModel.travellers?.totalTravellers ?? 0) -
              (flightBookingModel.travellers?.infants ?? 0),
      Parameters.child_count.name: flightBookingModel.travellers?.children,
      Parameters.infant_count.name: flightBookingModel.travellers?.infants,
      Parameters.travel_type.name: isDomestic ? 'domestic' : 'international',
    };
  }

  // modify search analytics data for GA on flight listing screen
  void modifySearchAnalyticsData(FlightBookingModel? flightBookingModel) {
    final modifyBookingObject = <String, Object?>{
      Parameters.category.name: 'book_flight',
      Parameters.sub_category.name: 'purchase',
      Parameters.trip_type.name: flightBookingModel?.tripType.name,
      Parameters.booking_class.name:
          flightBookingModel?.travellers?.travelClass?.name,
      Parameters.departure_station.name: FlightUtils.isRoundTrip(
        flightBookingModel?.tripType,
      )
          ? flightBookingModel?.roundTrip?.fromCity?.cityCode
          : flightBookingModel?.oneWayTrip?.fromCity?.cityCode,
      Parameters.arrival_station.name: FlightUtils.isRoundTrip(
        flightBookingModel?.tripType,
      )
          ? flightBookingModel?.roundTrip?.toCity?.cityCode
          : flightBookingModel?.oneWayTrip?.toCity?.cityCode,
      Parameters.market.name:
          Analytics.flightBookingGAObject?[Parameters.market.name] ?? '',
      Parameters.departure_date.name:
          Analytics.flightBookingGAObject?[Parameters.departure_date.name] ??
              'N/A',
      Parameters.return_date.name:
          Analytics.flightBookingGAObject?[Parameters.return_date.name] ??
              'N/A',
      Parameters.pax_count.name:
          (flightBookingModel?.travellers?.totalTravellers ?? 0) -
              (flightBookingModel?.travellers?.infants ?? 0),
      Parameters.child_count.name: flightBookingModel?.travellers?.children,
      Parameters.infant_count.name: flightBookingModel?.travellers?.infants,
      Parameters.travel_type.name:
          Analytics.flightBookingGAObject?[Parameters.travel_type.name],
    };
    ClickEvents.book_flight_search_modify
        .logEvent(parameters: modifyBookingObject);
  }

  String getSortedString(String fromCity, String toCity) {
    if (fromCity.isNotEmpty && toCity.isNotEmpty) {
      final List<String> cityStringList = [
        ...{fromCity, toCity},
      ]..sort();
      final marketValue = '${cityStringList.first} - ${cityStringList.last}';
      return marketValue;
    }
    return '';
  }

  // GA analytics method for flight review screen
  Map<String, Object> reviewFlightAnalyticsData(
    List<FlightReviewDetailInfo> flightReviewDetailInfo,
    FlightViewItineraryResponseModel? flightViewItineraryResponseModel,
  ) {
    double inboundPrice = 0;
    double outboundPrice = 0;
    if (Analytics.flightBookingGAObject?[Parameters.outbound_price.name] !=
        null) {
      outboundPrice = double.parse(
        Analytics.flightBookingGAObject?[Parameters.outbound_price.name]
                .toString() ??
            '0',
      );
    } else {
      Analytics.flightBookingGAObject?[Parameters.outbound_price.name] =
          '$outboundPrice';
    }
    if (Analytics.flightBookingGAObject?[Parameters.inbound_price.name] !=
        null) {
      inboundPrice = double.parse(
        Analytics.flightBookingGAObject?[Parameters.inbound_price.name]
                .toString() ??
            '0',
      );
    } else {
      Analytics.flightBookingGAObject?[Parameters.inbound_price.name] =
          '$inboundPrice';
    }
    final flightObjToGA = <String, Object>{
      Parameters.category.name: 'book_flight',
      Parameters.sub_category.name: 'purchase',
      Parameters.trip_type.name:
          Analytics.flightBookingGAObject?[Parameters.trip_type.name] ?? '',
      Parameters.booking_class.name:
          Analytics.flightBookingGAObject?[Parameters.booking_class.name] ?? '',
      Parameters.departure_station.name:
          Analytics.flightBookingGAObject?[Parameters.departure_station.name] ??
              '',
      Parameters.arrival_station.name:
          Analytics.flightBookingGAObject?[Parameters.arrival_station.name] ??
              '',
      Parameters.market.name:
          Analytics.flightBookingGAObject?[Parameters.market.name] ?? '',
      Parameters.departure_datetime.name: FlightUtils.eventDateYYYYMMDDFormat(
        Analytics.flightBookingGAObject?[Parameters.departure_datetime.name]
                .toString() ??
            'N/A',
        Constant.dateFormat23,
        Constant.dateFormat22,
      ),
      Parameters.departure_datetime.name: FlightUtils.eventDateYYYYMMDDFormat(
        Analytics.flightBookingGAObject?[Parameters.departure_datetime.name]
                .toString() ??
            'N/A',
        Constant.dateFormat23,
        Constant.dateFormat22,
      ),
      Parameters.return_datetime.name: FlightUtils.isTripIsRound(
        flightViewItineraryResponseModel?.tripType,
      )
          ? FlightUtils.eventDateYYYYMMDDFormat(
              Analytics.flightBookingGAObject?[
                          Parameters.round_trip_departure_time.name]
                      .toString() ??
                  'N/A',
              Constant.dateFormat23,
              Constant.dateFormat22,
            )
          : 'N/A',
      Parameters.arrival_datetime.name: Analytics.flightBookingGAObject?[
              Parameters.arrival_datetime_with_iso.name] ??
          'N/A',
      Parameters.return_arrival_datetime.name: Analytics.flightBookingGAObject?[
              Parameters.return_arrival_datetime_with_iso.name] ??
          'N/A',
      Parameters.pax_count.name:
          Analytics.flightBookingGAObject?[Parameters.pax_count.name] ?? '',
      Parameters.child_count.name:
          Analytics.flightBookingGAObject?[Parameters.child_count.name] ?? '',
      Parameters.infant_count.name:
          Analytics.flightBookingGAObject?[Parameters.infant_count.name] ?? '',
      Parameters.outbound_airline.name:
          Analytics.flightBookingGAObject?[Parameters.outbound_airline.name] ??
              '',
      Parameters.inbound_airline.name:
          Analytics.flightBookingGAObject?[Parameters.inbound_airline.name] ??
              '',
      Parameters.outbound_price.name: outboundPrice,
      Parameters.inbound_price.name: inboundPrice,
      Parameters.outbound_layover_time.name:
          '${flightReviewDetailInfo.first.journeyFlightDetails?.first.flightLayoverDuration}',
      Parameters.inbound_layover_time.name: flightViewItineraryResponseModel
                  ?.tripType ==
              'O'
          ? ''
          : '${flightReviewDetailInfo.last.journeyFlightDetails?.first.flightLayoverDuration}',
      Parameters.outbound_total_travel_time.name:
          flightReviewDetailInfo.first.passengerJourneyInfo?.journeyDuration ??
              '',
      Parameters.inbound_total_travel_time.name:
          flightViewItineraryResponseModel?.tripType == 'O'
              ? ''
              : flightReviewDetailInfo
                      .last.passengerJourneyInfo?.journeyDuration ??
                  '',
      Parameters.outbound_stops.name:
          '${flightReviewDetailInfo.first.journeyFlightDetails?.length}',
      Parameters.inbound_stops.name:
          flightViewItineraryResponseModel?.tripType == 'O'
              ? ''
              : '${flightReviewDetailInfo.last.journeyFlightDetails?.length}',
      Parameters.travel_type.name:
          Analytics.flightBookingGAObject?[Parameters.travel_type.name] ?? '',
      Parameters.insurance_opt.name:
          flightViewItineraryResponseModel?.insurance?.insured == null
              ? 'No'
              : flightViewItineraryResponseModel?.insurance?.insured ?? true
                  ? 'Yes'
                  : 'No',
      Parameters.insurance_price.name:
          (flightViewItineraryResponseModel?.insurance?.netAmt ?? 0).toDouble(),
    };
    Analytics.flightBookingGAObject?[Parameters.inbound_layover_time.name] =
        flightObjToGA[Parameters.inbound_layover_time.name];
    Analytics.flightBookingGAObject?[Parameters.outbound_layover_time.name] =
        flightObjToGA[Parameters.outbound_layover_time.name];
    Analytics.flightBookingGAObject?[Parameters.outbound_airline.name] =
        flightObjToGA[Parameters.outbound_airline.name];
    Analytics.flightBookingGAObject?[Parameters.inbound_airline.name] =
        flightObjToGA[Parameters.inbound_airline.name];
    Analytics.flightBookingGAObject?[Parameters.outbound_total_travel_time
        .name] = flightObjToGA[Parameters.outbound_total_travel_time.name];
    Analytics
            .flightBookingGAObject?[Parameters.inbound_total_travel_time.name] =
        flightObjToGA[Parameters.inbound_total_travel_time.name];
    Analytics.flightBookingGAObject?[Parameters.flight_number.name] =
        '${flightReviewDetailInfo.first.journeyFlightDetails?.first.airLineNumber}';
    return flightObjToGA;
  }

  //GA analytics method for traveller screen
  void travelerDetailsAnalyticsData(
    FlightViewItineraryResponseModel flightViewItineraryResponseModel,
    ClickEvents events,
  ) {
    final flightBookingPaymentStartGAObject = <String, Object?>{
      Parameters.category.name: 'book_flight',
      Parameters.sub_category.name: 'purchase',
      Parameters.trip_type.name:
          Analytics.flightBookingGAObject?[Parameters.trip_type.name] ?? '',
      Parameters.booking_class.name:
          Analytics.flightBookingGAObject?[Parameters.booking_class.name] ?? '',
      Parameters.departure_station.name:
          Analytics.flightBookingGAObject?[Parameters.departure_station.name] ??
              '',
      Parameters.arrival_station.name:
          Analytics.flightBookingGAObject?[Parameters.arrival_station.name] ??
              '',
      Parameters.market.name:
          Analytics.flightBookingGAObject?[Parameters.market.name] ?? '',
      Parameters.departure_date.name: Analytics.flightBookingGAObject?[
              Parameters.departure_date_with_iso.name] ??
          '',
      Parameters.return_date.name: Analytics
              .flightBookingGAObject?[Parameters.return_date_with_iso.name] ??
          '',
      Parameters.pax_count.name:
          Analytics.flightBookingGAObject?[Parameters.pax_count.name] ?? '',
      Parameters.departure_datetime.name: FlightUtils.eventDateYYYYMMDDFormat(
        Analytics.flightBookingGAObject?[Parameters.departure_datetime.name]
                .toString() ??
            'N/A',
        Constant.dateFormat23,
        Constant.dateFormat22,
      ),
      Parameters.return_datetime.name: FlightUtils.isTripIsRound(
        flightViewItineraryResponseModel.tripType,
      )
          ? FlightUtils.eventDateYYYYMMDDFormat(
              Analytics.flightBookingGAObject?[
                          Parameters.round_trip_departure_time.name]
                      .toString() ??
                  'N/A',
              Constant.dateFormat23,
              Constant.dateFormat22,
            )
          : 'N/A',
      Parameters.arrival_datetime.name: Analytics.flightBookingGAObject?[
              Parameters.arrival_datetime_with_iso.name] ??
          'N/A',
      Parameters.return_arrival_datetime.name: Analytics.flightBookingGAObject?[
              Parameters.return_arrival_datetime_with_iso.name] ??
          'N/A',
      Parameters.child_count.name:
          Analytics.flightBookingGAObject?[Parameters.child_count.name] ?? '',
      Parameters.infant_count.name:
          Analytics.flightBookingGAObject?[Parameters.infant_count.name] ?? '',
      Parameters.outbound_price.name: _getAmountPayable(
        flightViewItineraryResponseModel.pricedItineraries ?? [],
      ).toString(),
      Parameters.inbound_price.name: _getAmountPayable(
        flightViewItineraryResponseModel.pricedItineraries ?? [],
      ).toString(),
      Parameters.total_price.name:
          Analytics.flightBookingGAObject?[Parameters.total_price.name] ?? 0.0,
      Parameters.cart_amount.name:
          Analytics.flightBookingGAObject?[Parameters.cart_amount.name] ?? 0.0,
      Parameters.coupon.name:
          Analytics.flightBookingGAObject?[Parameters.coupon.name] ?? '',
      Parameters.coupon_value.name:
          Analytics.flightBookingGAObject?[Parameters.coupon_value.name] ?? '',
      Parameters.insurance_opt.name:
          flightViewItineraryResponseModel.insurance?.insured ?? true
              ? 'Yes'
              : 'No',
      Parameters.insurance_price.name:
          (flightViewItineraryResponseModel.insurance?.netAmt ?? 0).toDouble(),
      Parameters.purchase_revenue.name:
          Analytics.flightBookingGAObject?[Parameters.total_price.name] ?? 0.0,
      Parameters.value.name:
          Analytics.flightBookingGAObject?[Parameters.total_price.name] ?? 0.0,
      Parameters.travel_type.name:
          Analytics.flightBookingGAObject?[Parameters.travel_type.name] ?? '',
      Parameters.zero_cancellation_opt.name:
          flightViewItineraryResponseModel.zeroCancellationSummary?.isActive ??
                  false
              ? 'yes'
              : 'no',
      Parameters.zero_cancellation_amount.name:
          (flightViewItineraryResponseModel.zeroCancellationSummary?.isActive ??
                  false)
              ? (flightViewItineraryResponseModel
                          .zeroCancellationSummary?.netAmt ??
                      0)
                  .toDouble()
              : 0,
    };

    events.logEvent(
      parameters: flightBookingPaymentStartGAObject,
    );
  }

  /// this is use for get total fare of flight inclusive of taxes
  double _getAmountPayable(List<PricedItinerary> _pricedList) {
    double total = 0;
    for (final element in _pricedList) {
      total = total + (element.priceInfo.totalBaseFare?.amount ?? 0).toDouble();
    }
    return total;
  }

  /// GA analytics method for payment screen on pay now button
  void payNowAnalyticsData(
    FlightViewItineraryResponseModel? flightViewItineraryResponseModel,
    List<FlightReviewDetailInfo> flightReviewDetailInfo,
    String paymentType,
    String paymentProvider,
    ClickEvents events,
    Map<String, String>? map,
  ) {
    final payNowBookingObject = <String, Object?>{
      Parameters.category.name: 'book_flight',
      Parameters.sub_category.name: 'purchase',
      Parameters.trip_type.name:
          flightViewItineraryResponseModel?.tripType == 'O'
              ? TripType.oneWay.name
              : TripType.roundTrip.name,
      Parameters.booking_class.name:
          flightReviewDetailInfo.first.passengerJourneyInfo?.travelClass,
      Parameters.departure_station.name:
          Analytics.flightBookingGAObject?[Parameters.departure_station.name] ??
              '',
      Parameters.arrival_station.name:
          Analytics.flightBookingGAObject?[Parameters.arrival_station.name] ??
              '',
      Parameters.market.name:
          Analytics.flightBookingGAObject?[Parameters.market.name] ?? '',
      Parameters.departure_date.name: Analytics.flightBookingGAObject?[
              Parameters.departure_date_with_iso.name] ??
          'N/A',
      Parameters.return_date.name: Analytics
              .flightBookingGAObject?[Parameters.return_date_with_iso.name] ??
          'N/A',
      Parameters.departure_datetime.name: FlightUtils.eventDateYYYYMMDDFormat(
        Analytics.flightBookingGAObject?[Parameters.departure_datetime.name]
                .toString() ??
            'N/A',
        Constant.dateFormat23,
        Constant.dateFormat22,
      ),
      Parameters.return_datetime.name: FlightUtils.isTripIsRound(
        flightViewItineraryResponseModel?.tripType,
      )
          ? FlightUtils.eventDateYYYYMMDDFormat(
              Analytics.flightBookingGAObject?[
                          Parameters.round_trip_departure_time.name]
                      .toString() ??
                  'N/A',
              Constant.dateFormat23,
              Constant.dateFormat22,
            )
          : 'N/A',
      Parameters.arrival_datetime.name: Analytics.flightBookingGAObject?[
              Parameters.arrival_datetime_with_iso.name] ??
          'N/A',
      Parameters.return_arrival_datetime.name: Analytics.flightBookingGAObject?[
              Parameters.return_arrival_datetime_with_iso.name] ??
          'N/A',
      Parameters.pax_count.name:
          Analytics.flightBookingGAObject?[Parameters.pax_count.name],
      Parameters.child_count.name:
          Analytics.flightBookingGAObject?[Parameters.child_count.name],
      Parameters.infant_count.name:
          Analytics.flightBookingGAObject?[Parameters.infant_count.name],
      Parameters.inbound_airline.name:
          Analytics.flightBookingGAObject?[Parameters.inbound_airline.name],
      Parameters.outbound_airline.name:
          Analytics.flightBookingGAObject?[Parameters.outbound_airline.name],
      Parameters.inbound_price.name:
          Analytics.flightBookingGAObject?[Parameters.inbound_price.name],
      Parameters.outbound_price.name:
          Analytics.flightBookingGAObject?[Parameters.outbound_price.name],
      Parameters.total_price.name:
          Analytics.flightBookingGAObject?[Parameters.total_price.name] ?? 0.0,
      Parameters.cart_amount.name:
          Analytics.flightBookingGAObject?[Parameters.cart_amount.name] ?? 0.0,
      Parameters.inbound_layover_time.name:
          Analytics.flightBookingGAObject?[Parameters.inbound_layover_time] ??
              '',
      Parameters.outbound_layover_time.name:
          Analytics.flightBookingGAObject?[Parameters.outbound_layover_time] ??
              '',
      Parameters.gst_flag.name: '',
      Parameters.pax_title.name: '',
      Parameters.payment_type.name: paymentType,
      Parameters.payment_bank.name: paymentProvider,
      Parameters.payment_aggregator.name: 'PineLabs',
      Parameters.payment_gateway.name: '',
      Parameters.user_id.name:
          Analytics.flightBookingGAObject?[Parameters.user_id.name] ?? '',
      Parameters.error_text.name: map?['msg'] ?? '',
      Parameters.transaction_id.name: map?['transactionId'] ?? '',
      Parameters.order_id.name: map?['order_id'] ?? '',
      Parameters.coupon.name:
          Analytics.flightBookingGAObject?[Parameters.coupon.name] ?? '',
      Parameters.total_discount.name:
          Analytics.flightBookingGAObject?[Parameters.coupon_value.name] ?? '',
      Parameters.rewards_burned.name:
          Analytics.flightBookingGAObject?[Parameters.rewards_burned.name] ??
              0.0,
      Parameters.coupon_value.name:
          Analytics.flightBookingGAObject?[Parameters.coupon_value.name] ?? '',
      Parameters.insurance_opt.name:
          flightViewItineraryResponseModel?.insurance?.insured ?? true
              ? 'Yes'
              : 'No',
      Parameters.insurance_price.name:
          (flightViewItineraryResponseModel?.insurance?.netAmt ?? 0).toDouble(),
      Parameters.purchase_revenue.name:
          Analytics.flightBookingGAObject?[Parameters.total_price.name] ?? 0.0,
      Parameters.af_currency.name: 'INR',
      Parameters.af_revenue.name:
          Analytics.flightBookingGAObject?[Parameters.total_price.name] ?? 0.0,
      Parameters.travel_type.name:
          Analytics.flightBookingGAObject?[Parameters.travel_type.name] ?? '',
      Parameters.convenience_fee.name:
          Analytics.flightBookingGAObject?[Parameters.convenience_fee.name] ??
              0.0,
      Parameters.zero_cancellation_opt.name:
          flightViewItineraryResponseModel?.zeroCancellationSummary?.isActive ??
                  false
              ? 'yes'
              : 'no',
      Parameters.zero_cancellation_amount.name:
          (flightViewItineraryResponseModel
                      ?.zeroCancellationSummary?.isActive ??
                  false)
              ? (flightViewItineraryResponseModel
                          ?.zeroCancellationSummary?.netAmt ??
                      0)
                  .toDouble()
              : 0,
    };

    final selectedAFlight = SelectedFlightModel(
      pricedItineraryList: flightViewItineraryResponseModel?.pricedItineraries,
      isRoundTrip: FlightUtils.isTripIsRound(
        flightViewItineraryResponseModel?.tripType,
      ),
      pricedItinerary:
          flightViewItineraryResponseModel?.pricedItineraries?.first,
    );
    if (events == ClickEvents.book_flight_payment_submit) {
      ecommerceGAEvents(events, selectedAFlight, payNowBookingObject);
    } else {
      events.logEvent(
        parameters: payNowBookingObject,
      );
    }
  }

  void backToPaymentOptionsAnalyticsData(
    String couponCode,
    String labelName,
    String category,
    double? discount,
    double finalAmount,
  ) {
    final backToPaymentButtonObject = <String, Object?>{
      Parameters.category.name: category,
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: labelName,
      Parameters.coupon.name: couponCode,
      Parameters.coupon_value.name: discount ?? 0,
      Parameters.cart_amount.name: finalAmount,
      Parameters.total_price.name: finalAmount,
      Parameters.rewards_earned.name:
          Analytics.flightBookingGAObject?[Parameters.rewards_earned.name] ?? 0,
      Parameters.rewards_burned.name:
          Analytics.flightBookingGAObject?[Parameters.rewards_burned.name] ?? 0,
      Parameters.total_discount.name: discount ?? 0,
      Parameters.error_text.name: '$couponCode Coupon Code Not Applicable',
    };

    ClickEvents.popup_display.logEvent(
      parameters: backToPaymentButtonObject,
    );
  }

  void purchaseAnalyticsData(
    FlightViewItineraryResponseModel? flightViewItineraryResponseModel,
    List<FlightReviewDetailInfo> flightReviewDetailInfo,
    String paymentType,
    String paymentProvider,
    ClickEvents events,
    Map<String, String>? map,
  ) {
    final payNowBookingObject = <String, Object?>{
      Parameters.category.name: 'book_flight',
      Parameters.sub_category.name: 'purchase',
      Parameters.trip_type.name:
          flightViewItineraryResponseModel?.tripType == 'O'
              ? TripType.oneWay.name
              : TripType.roundTrip.name,
      Parameters.booking_class.name:
          flightReviewDetailInfo.first.passengerJourneyInfo?.travelClass,
      Parameters.departure_station.name:
          Analytics.flightBookingGAObject?[Parameters.departure_station.name] ??
              '',
      Parameters.arrival_station.name:
          Analytics.flightBookingGAObject?[Parameters.arrival_station.name] ??
              '',
      Parameters.market.name:
          Analytics.flightBookingGAObject?[Parameters.market.name] ?? '',
      Parameters.departure_date.name: Analytics.flightBookingGAObject?[
              Parameters.departure_date_with_iso.name] ??
          'N/A',
      Parameters.return_date.name: Analytics
              .flightBookingGAObject?[Parameters.return_date_with_iso.name] ??
          'N/A',
      Parameters.departure_datetime.name: FlightUtils.eventDateYYYYMMDDFormat(
        Analytics.flightBookingGAObject?[Parameters.departure_datetime.name]
                .toString() ??
            'N/A',
        Constant.dateFormat23,
        Constant.dateFormat22,
      ),
      Parameters.return_datetime.name: FlightUtils.isTripIsRound(
        flightViewItineraryResponseModel?.tripType,
      )
          ? FlightUtils.eventDateYYYYMMDDFormat(
              Analytics.flightBookingGAObject?[
                          Parameters.round_trip_departure_time.name]
                      .toString() ??
                  'N/A',
              Constant.dateFormat23,
              Constant.dateFormat22,
            )
          : 'N/A',
      Parameters.arrival_datetime.name: Analytics.flightBookingGAObject?[
              Parameters.arrival_datetime_with_iso.name] ??
          'N/A',
      Parameters.return_arrival_datetime.name: Analytics.flightBookingGAObject?[
              Parameters.return_arrival_datetime_with_iso.name] ??
          'N/A',
      Parameters.pax_count.name:
          Analytics.flightBookingGAObject?[Parameters.pax_count.name],
      Parameters.child_count.name:
          Analytics.flightBookingGAObject?[Parameters.child_count.name],
      Parameters.infant_count.name:
          Analytics.flightBookingGAObject?[Parameters.infant_count.name],
      Parameters.inbound_airline.name:
          Analytics.flightBookingGAObject?[Parameters.inbound_airline.name],
      Parameters.outbound_airline.name:
          Analytics.flightBookingGAObject?[Parameters.outbound_airline.name],
      Parameters.inbound_price.name:
          Analytics.flightBookingGAObject?[Parameters.inbound_price.name],
      Parameters.outbound_price.name:
          Analytics.flightBookingGAObject?[Parameters.outbound_price.name],
      Parameters.total_price.name:
          Analytics.flightBookingGAObject?[Parameters.total_price.name] ?? 0.0,
      Parameters.cart_amount.name:
          Analytics.flightBookingGAObject?[Parameters.cart_amount.name] ?? 0.0,
      Parameters.inbound_layover_time.name:
          Analytics.flightBookingGAObject?[Parameters.inbound_layover_time] ??
              '',
      Parameters.outbound_layover_time.name:
          Analytics.flightBookingGAObject?[Parameters.outbound_layover_time] ??
              '',
      Parameters.gst_flag.name: '',
      Parameters.pax_title.name: '',
      Parameters.payment_type.name: paymentType,
      Parameters.payment_bank.name: paymentProvider,
      Parameters.payment_aggregator.name: 'PineLabs',
      Parameters.payment_gateway.name: '',
      Parameters.currency.name: 'INR',
      Parameters.value.name:
          Analytics.flightBookingGAObject?[Parameters.total_price.name] ?? 0.0,
      Parameters.user_id.name:
          Analytics.flightBookingGAObject?[Parameters.user_id.name] ?? '',
      Parameters.error_text.name: map?['msg'] ?? '',
      Parameters.transaction_id.name: map?['transactionId'] ?? '',
      Parameters.order_id.name: map?['order_id'] ?? '',
      Parameters.label.name: map?['label'] ?? '',
      Parameters.coupon.name:
          Analytics.flightBookingGAObject?[Parameters.coupon.name] ?? '',
      Parameters.coupon_value.name:
          Analytics.flightBookingGAObject?[Parameters.coupon_value.name] ?? '',
      Parameters.total_discount.name:
          Analytics.flightBookingGAObject?[Parameters.coupon_value.name] ?? '',
      Parameters.rewards_burned.name:
          Analytics.flightBookingGAObject?[Parameters.rewards_burned.name] ??
              0.0,
      Parameters.insurance_opt.name:
          flightViewItineraryResponseModel?.insurance?.insured ?? true
              ? 'Yes'
              : 'No',
      Parameters.insurance_price.name:
          (flightViewItineraryResponseModel?.insurance?.netAmt ?? 0).toDouble(),
      Parameters.purchase_revenue.name:
          Analytics.flightBookingGAObject?[Parameters.total_price.name] ?? 0.0,
      Parameters.travel_type.name:
          Analytics.flightBookingGAObject?[Parameters.travel_type.name] ?? '',
      Parameters.convenience_fee.name:
          Analytics.flightBookingGAObject?[Parameters.convenience_fee.name] ??
              0.0,
      Parameters.zero_cancellation_opt.name:
          flightViewItineraryResponseModel?.zeroCancellationSummary?.isActive ??
                  false
              ? 'yes'
              : 'no',
      Parameters.zero_cancellation_amount.name:
          (flightViewItineraryResponseModel
                      ?.zeroCancellationSummary?.isActive ??
                  false)
              ? (flightViewItineraryResponseModel
                          ?.zeroCancellationSummary?.netAmt ??
                      0)
                  .toDouble()
              : 0,
    };
    final selectedAFlight = SelectedFlightModel(
      pricedItineraryList: flightViewItineraryResponseModel?.pricedItineraries,
      isRoundTrip: FlightUtils.isTripIsRound(
        flightViewItineraryResponseModel?.tripType,
      ),
      pricedItinerary:
          flightViewItineraryResponseModel?.pricedItineraries?.first,
    );

    if (events == ClickEvents.add_payment_info ||
        events == ClickEvents.purchase) {
      ecommerceGAEvents(events, selectedAFlight, payNowBookingObject);
    } else {
      events.logEvent(
        parameters: payNowBookingObject,
      );
    }
  }

  ///GA analytics method for booking cancel start
  void bookingCancelStartAnalyticsData(
    FlightViewTripResponseModel? flightBookingResponseModel,
  ) {
    final flightBookingCancelStartGAObject = <String, Object?>{
      Parameters.category.name: 'book_flight',
      Parameters.sub_category.name: 'cancellation',
      Parameters.booking_id.name: flightBookingResponseModel?.tripID ?? 'N/A',
      Parameters.trip_type.name:
          (flightBookingResponseModel?.tripType?.name ?? 'O') == 'O'
              ? 'Oneway'
              : 'RoundTripe',
    };
    Analytics.flightBookingGAObject?[Parameters.booking_id.name] =
        flightBookingResponseModel?.tripID ?? 'N/A';
    Analytics.flightBookingGAObject?[Parameters.travel_type.name] =
        (flightBookingResponseModel?.tripType?.name ?? 'O') == 'O'
            ? 'Oneway'
            : 'RoundTripe';

    ClickEvents.cancel_flight_start.logEvent(
      parameters: flightBookingCancelStartGAObject,
    );
  }

  //GA analytics method for invoice download
  void downloadInvoiceAnalyticsData() {
    final downloadInvoiceGAObject = <String, Object?>{
      Parameters.category.name: 'book_flight',
      Parameters.sub_category.name: 'orders_and_bookings',
      Parameters.label.name: 'invoice',
    };
    ClickEvents.file_download.logEvent(
      parameters: downloadInvoiceGAObject,
    );
  }

  //GA analytics method for Train invoice download
  // void downloadTrainInvoiceAnalyticsData() {
  //   final downloadInvoiceGAObject = <String, Object?>{
  //     Parameters.category.name: 'train_booking',
  //     Parameters.sub_category.name: 'orders_and_bookings',
  //     Parameters.label.name: 'invoice',
  //   };
  //   ClickEvents.file_download.logEvent(
  //     parameters: downloadInvoiceGAObject,
  //   );
  // }

  //GA analytics method for email itinerary start-end
  void emailItineraryStartEndAnalyticsData(
    int type,
  ) {
    final flightBookingEmailItineraryStartEndGAObject = <String, Object?>{
      Parameters.category.name: 'book_flight',
      Parameters.sub_category.name: 'orders_and_bookings',
      Parameters.label.name: 'email _itinerary',
    };
    if (type == 0) {
      ClickEvents.email_itinerary_start.logEvent(
        parameters: flightBookingEmailItineraryStartEndGAObject,
      );
    } else {
      ClickEvents.email_itinerary_complete.logEvent(
        parameters: flightBookingEmailItineraryStartEndGAObject,
      );
    }
  }

  //GA analytics method for select pax on booking cancel
  void selectPaxOnBookingCancelAnalyticsData(
    int selectedPaxCount,
    int totalPax,
  ) {
    // setting value in global object to fetch values for further events
    Analytics.flightBookingGAObject = {
      Parameters.pax_count.name: selectedPaxCount,
      Parameters.type.name: selectedPaxCount == totalPax ? 'Full' : 'Partial',
      Parameters.booking_id.name:
          Analytics.flightBookingGAObject?[Parameters.booking_id.name] ?? '',
      Parameters.travel_type.name:
          Analytics.flightBookingGAObject?[Parameters.travel_type.name] ?? '',
    };
    final selectPaxOnBookingCancelGAObject = <String, Object?>{
      Parameters.category.name: 'book_flight',
      Parameters.sub_category.name: 'cancellation',
      Parameters.pax_count.name: selectedPaxCount,
      Parameters.type.name: selectedPaxCount == totalPax ? 'Full' : 'Partial',
      Parameters.booking_id.name:
          Analytics.flightBookingGAObject?[Parameters.booking_id.name] ?? '',
      Parameters.trip_type.name:
          Analytics.flightBookingGAObject?[Parameters.travel_type.name] ?? '',
    };
    ClickEvents.book_flight_cancellation_passenger_selection.logEvent(
      parameters: selectPaxOnBookingCancelGAObject,
    );
  }

  //GA analytics method for booking cancel
  void bookingCancelAnalyticsData(ClickEvents events, String? reason) {
    final selectPaxOnBookingCancelGAObject = <String, Object?>{
      Parameters.category.name: 'book_flight',
      Parameters.sub_category.name: 'cancellation',
      Parameters.pax_count.name:
          Analytics.flightBookingGAObject?[Parameters.pax_count.name],
      Parameters.type.name: Analytics.flightBookingGAObject?[Parameters.type],
      Parameters.cancel_reason.name: reason,
      Parameters.booking_id.name:
          Analytics.flightBookingGAObject?[Parameters.booking_id.name] ?? '',
      Parameters.trip_type.name:
          Analytics.flightBookingGAObject?[Parameters.travel_type.name] ?? '',
    };
    events.logEvent(
      parameters: selectPaxOnBookingCancelGAObject,
    );
  }

  //GA analytics method for cv tool tips click
  void cvToolTipAnalyticsData() {
    final cvToolTipGAObject = <String, Object?>{
      Parameters.category.name: 'book_flight',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cvv_tool_tip',
    };
    ClickEvents.cvv_tool_tip.logEvent(
      parameters: cvToolTipGAObject,
    );
  }

  // purchase event for flight listing
  Future<void> ecommerceGAEvents(
    ClickEvents events,
    SelectedFlightModel? selectedFlightModel,
    Map<String, Object?> flightBookingObject,
  ) async {
    List<PassengerTypeQuantity>? inBoundPriceArrray = [];
    List<PassengerTypeQuantity>? outBoundPriceArrray = [];
    double? totalDiscount = 0;

    final priceItenaryObject = selectedFlightModel?.isRoundTrip == false
        ? [selectedFlightModel?.pricedItinerary]
        : selectedFlightModel?.pricedItineraryList;

    if (priceItenaryObject != null) {
      for (int index = 0; index < priceItenaryObject.length; index++) {
        final discount =
            priceItenaryObject[index]?.airItineraryPricingInfo?.discounts;
        if (discount != null) {
          totalDiscount = discount.amount ?? 0;
        }
        if (priceItenaryObject[index]?.directionInd == 'O') {
          outBoundPriceArrray = priceItenaryObject[index]
              ?.airItineraryPricingInfo
              ?.passengerTypeQuantity;
          createEventObject(outBoundPriceArrray, totalDiscount, index);
        } else if (priceItenaryObject[index]?.directionInd == 'I') {
          inBoundPriceArrray = priceItenaryObject[index]
              ?.airItineraryPricingInfo
              ?.passengerTypeQuantity;
          createEventObject(inBoundPriceArrray, totalDiscount, index);
        }
      }
    }

    events.logAnalyticsEventItem(
      parameters: flightBookingObject,
      items: itemList,
    );
  }

  void createEventObject(
    List<PassengerTypeQuantity>? selectedItenaryArray,
    double? discount,
    int indexValue,
  ) {
    int noOfAdults = 0;
    num adultPrice = 0;
    int noOfChild = 0;
    num childPrice = 0;

    if (selectedItenaryArray != null && selectedItenaryArray.isNotEmpty) {
      for (int index = 0; index < selectedItenaryArray.length; index++) {
        if (selectedItenaryArray[index].code == 'ADT') {
          noOfAdults += selectedItenaryArray[index].quantity ?? 0;
          adultPrice = selectedItenaryArray[index].totalFare?.perPaxAmount ?? 0;
        } else if (selectedItenaryArray[index].code == 'CHD') {
          noOfChild += selectedItenaryArray[index].quantity ?? 0;
          childPrice = selectedItenaryArray[index].totalFare?.perPaxAmount ?? 0;
        }
      }
      if (noOfChild > 0) {
        itemList
          ..add(
            eventObject(
              noOfAdults + noOfChild,
              adultPrice * noOfAdults + childPrice * noOfChild,
              discount,
              indexValue,
            ),
          )
          ..add(
            eventObject(
              noOfAdults,
              adultPrice * noOfAdults,
              discount,
              indexValue,
            ),
          );
      } else {
        itemList.add(
          eventObject(
            noOfAdults,
            adultPrice * noOfAdults,
            discount,
            indexValue,
          ),
        );
      }
    }
  }

  AnalyticsEventItem eventObject(
    int paxCount,
    num paxPrice,
    double? dis,
    int index,
  ) {
    final itemId =
        'Flight ${Analytics.flightBookingGAObject?[Parameters.departure_station.name]}'
        ' - ${Analytics.flightBookingGAObject?[Parameters.arrival_station.name]} - ${Analytics.flightBookingGAObject?[Parameters.departure_date.name]} - ${Analytics.flightBookingGAObject?[Parameters.outbound_airline.name]} - ${Analytics.flightBookingGAObject?[Parameters.flight_number.name]}';
    final itemName =
        'Flight ${Analytics.flightBookingGAObject?[Parameters.departure_station.name]}'
        ' - ${Analytics.flightBookingGAObject?[Parameters.arrival_station.name]}';

    return AnalyticsEventItem(
      affiliation: 'N/A',
      currency: 'INR',
      coupon:
          Analytics.flightBookingGAObject?[Parameters.coupon.name].toString() ??
              'N/A',
      creativeName: 'N/A',
      creativeSlot: 'N/A',
      discount: dis,
      index: index,
      itemBrand: Analytics
          .flightBookingGAObject?[Parameters.inbound_airline.name]
          .toString(),
      itemCategory: 'Flight',
      itemCategory2: 'N/A',
      itemCategory4: 'N/A',
      itemCategory5: 'N/A',
      itemId: itemId,
      itemListId: 'N/A',
      itemListName: 'N/A',
      itemName: itemName,
      itemVariant: Analytics.flightBookingGAObject?[Parameters.trip_type.name]
          .toString(),
      locationId: 'N/A',
      price: paxPrice,
      promotionId: 'N/A',
      promotionName: 'N/A',
      itemCategory3: 'N/A',
      quantity: paxCount,
    );
  }

  //GA analytics method for view more flights
  void viewMoreFlights(ClickEvents events, int seatsLeft, double totalPrice) {
    final selectPaxOnBookingCancelGAObject = <String, Object?>{
      Parameters.category.name:
          Analytics.flightBookingGAObject?[Parameters.category.name],
      Parameters.sub_category.name:
          Analytics.flightBookingGAObject?[Parameters.sub_category.name],
      Parameters.arrival_station.name:
          Analytics.flightBookingGAObject?[Parameters.arrival_station.name],
      Parameters.departure_date.name:
          Analytics.flightBookingGAObject?[Parameters.departure_date.name],
      Parameters.return_date.name:
          Analytics.flightBookingGAObject?[Parameters.return_date.name],
      Parameters.departure_station.name:
          Analytics.flightBookingGAObject?[Parameters.departure_station.name],
      Parameters.travel_type.name:
          Analytics.flightBookingGAObject?[Parameters.travel_type.name],
      Parameters.seats_left.name: seatsLeft,
      Parameters.total_price.name: totalPrice,
    };
    events.logEvent(
      parameters: selectPaxOnBookingCancelGAObject,
    );
  }

  //GA analytics method for apply coupon click
  void applyCouponClick(
    ClickEvents events,
    String category,
    String subCategory,
    String travellerType,
    String loginStatus,
  ) {
    final selectMealBaggage = <String, Object?>{
      Parameters.category.name: category,
      Parameters.sub_category.name: subCategory,
      Parameters.travel_type.name: travellerType,
      Parameters.login_status.name: loginStatus,
    };
    events.logEvent(
      parameters: selectMealBaggage,
    );
  }

  //GA analytics method for offer dialog
  void homeScreenOfferDialogAnalyticsData(
    ClickEvents events,
    String type,
    String? imageSrc,
  ) {
    final offerBannerObject = <String, Object?>{
      Parameters.category.name: 'home_screen',
      Parameters.sub_category.name: 'adanione',
      Parameters.type.name: type,
      Parameters.label.name: imageSrc,
    };
    events.logEvent(
      parameters: offerBannerObject,
    );
  }
}
