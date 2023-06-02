/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/cart_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_service_booking_state_management.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_state_management.dart';
import 'package:collection/collection.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pranaam_service/model/booking/booking_details/api_response_model/booking_details_response_model.dart';

class StandAloneGaAnalytics {
  final String dateFormat = "'~t'yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
  final String timeFormat = 'hh:mm a';
  void bookNowEvent(BuildContext context, ClickEvents event) {
    final Map<String, Object?> eventMap = {
      ..._getBookingMap(context),
    };
    event.logEvent(parameters: eventMap);
  }

  void addToCartEvent(
    BuildContext context,
    ClickEvents event, [
    int? itemCount,
  ]) {
    final Map<String, Object?> eventMap = {
      ..._getCartMap(context),
      ..._getEcommerceMap(context),
    };
    event.logAnalyticsEventItem(
      parameters: eventMap,
      items: _getAnalyticsItems(context, itemCount),
    );
  }

  void removeCartEvent(
    BuildContext context,
    ClickEvents event,
  ) {
    final Map<String, Object?> eventMap = {
      ..._getCartMap(context),
    };
    event.logEvent(
      parameters: eventMap,
    );
  }

  void paymentEcommerceEvent(
    BuildContext context,
    ClickEvents event,
  ) {
    final eventMap = {
      ..._getCartMap(context),
      ..._getEcommerceMap(context),
      ..._getPaymentMap(context),
    };
    event.logAnalyticsEventItem(
      parameters: eventMap,
      items: _getAnalyticsItems(
        context,
      ),
    );
  }

  void paymentEvent(BuildContext context, ClickEvents event) {
    final eventMap = {
      ..._getCartMap(context),
      ..._getPaymentMap(context),
    };
    event.logEvent(
      parameters: eventMap,
    );
  }

  void bannerClickEvent(BuildContext context, ClickEvents event) {
    final Map<String, Object?> eventMap = {
      ..._getBannerClickMap(context),
    };
    event.logEvent(
      parameters: eventMap,
    );
  }

  Map<String, Object?> _getEcommerceMap(BuildContext context) {
    final PranaamAppDataStateManagement pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    final CartResponse? cartResponse =
        pranaamAppDataStateManagement.cartDataResponse;
    return {
      Parameters.purchase_revenue.name:
          cartResponse?.standaloneProductDetails.pricingInfo.totalFare.amount,
      Parameters.currency.name: cartResponse
          ?.standaloneProductDetails.pricingInfo.totalFare.currencyCode,
      Parameters.value.name:
          cartResponse?.standaloneProductDetails.pricingInfo.totalFare.amount,
      Parameters.price.name:
          cartResponse?.standaloneProductDetails.pricingInfo.totalFare.amount,
      Parameters.discount.name: cartResponse?.standaloneProductDetails
          .pricingInfo.discountCouponDetail.couponDiscountAmount,
      //   Parameters.items.name: '',
    };
  }

  Map<String, Object?> _getPaymentMap(BuildContext context) {
    String bank = '';
    String mode = '';
    try {
      final paymentMethodState = context.read<PaymentMethodState>();
      mode = paymentMethodState.selectedOption?.mode?.name ?? '';
      bank = paymentMethodState.selectedOption?.name ?? '';
    } catch (e) {
      // mode = context
      //         .read<BookingAndCancellationState>()
      //         .bookingDetailsResponse
      //         ?.createBooking
      //         .paymentDetails
      //         .firstOrNull
      //         ?.transactionMode ??
      //     '';
    }
    return {
      Parameters.payment_type.name: mode,
      Parameters.payment_bank.name: bank,
      Parameters.payment_gateway.name: 'RazorPaY',
      Parameters.payment_aggregator.name: 'PineLabs',

      ///change when migrate to justpay
    };
  }

  List<AnalyticsEventItem> _getAnalyticsItems(
    BuildContext context, [
    int? itemCount,
  ]) {
    final PranaamAppDataStateManagement pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    final StandAloneStateManagement standAloneStateManagement =
        context.read<StandAloneStateManagement>();
    final CartResponse? cartResponse =
        pranaamAppDataStateManagement.cartDataResponse;
    final List<AnalyticsEventItem> items = List.generate(
      itemCount ?? (cartResponse?.standaloneProductDetails.itemCount ?? 0),
      (index) => AnalyticsEventItem(
        itemId:
            '${standAloneStateManagement.currentServiceType.name} ${cartResponse?.standaloneProductDetails.id}',
        currency: cartResponse
            ?.standaloneProductDetails.pricingInfo.totalFare.currencyCode,
        itemName:
            '${standAloneStateManagement.currentServiceType.name} ${cartResponse?.standaloneProductDetails.name} ${getCityName(cartResponse?.tripDetail.serviceAirport ?? '', context.read<SiteCoreStateManagement>())}',
        discount: cartResponse?.standaloneProductDetails.pricingInfo
            .discountCouponDetail.couponDiscountAmount,
        itemCategory:
            standAloneStateManagement.currentServiceType.name.toLowerCase(),
        itemVariant: cartResponse?.tripDetail.serviceType,
        price:
            cartResponse?.standaloneProductDetails.pricingInfo.totalFare.amount,
        quantity: cartResponse?.standaloneProductDetails.itemCount,
      ),
    );
    return items;
  }

  Map<String, Object?> _getBookingMap(BuildContext context) {
    final StandAloneServiceBookingStateManagement
        standAloneServiceBookingStateManagement =
        context.read<StandAloneServiceBookingStateManagement>();
    final StandAloneStateManagement standAloneStateManagement =
        context.read<StandAloneStateManagement>();
    return {
      Parameters.category.name:
          standAloneStateManagement.currentServiceType.name.toLowerCase(),
      Parameters.sub_category.name: 'purchase',
      Parameters.trip_type.name: standAloneServiceBookingStateManagement
          .selectedService.serviceTitle
          .toLowerCase(),
      Parameters.sector_type.name: standAloneServiceBookingStateManagement
          .selectedTravelSector?.travelSectorTitle
          .toLowerCase(),
      Parameters.departure_date.name: universalDateFormatter(
        requiredFormat: dateFormat,
        dateTimeObject: standAloneServiceBookingStateManagement
            .selectedArrivalDepartureDate,
      ),
      Parameters.departure_time.name: universalDateFormatter(
        requiredFormat: timeFormat,
        dateTimeObject: standAloneServiceBookingStateManagement
            .selectedArrivalDepartureDate,
      ),
      Parameters.outbound_flight_number.name:
          standAloneServiceBookingStateManagement
              .selectedArrivalDepartureFlight?.flightFinalNumber,
      Parameters.outbound_airline.name: standAloneServiceBookingStateManagement
          .selectedArrivalDepartureFlight?.airlineCode,
      Parameters.departure_station.name:
          standAloneServiceBookingStateManagement.selectedOrigin?.cityCode,
      Parameters.arrival_station.name:
          standAloneServiceBookingStateManagement.selectedDestination?.cityCode,
      Parameters.return_date.name: universalDateFormatter(
        requiredFormat: dateFormat,
        dateTimeObject:
            standAloneServiceBookingStateManagement.selectedRoundTripDate,
      ),
      Parameters.return_time.name: universalDateFormatter(
        requiredFormat: timeFormat,
        dateTimeObject:
            standAloneServiceBookingStateManagement.selectedRoundTripDate,
      ),
      Parameters.inbound_flight_number.name:
          standAloneServiceBookingStateManagement
              .selectedRoundTripFlight?.flightFinalNumber,
      Parameters.inbound_airline.name: standAloneServiceBookingStateManagement
          .selectedRoundTripFlight?.airlineCode,
      Parameters.inbound_departure_station.name:
          standAloneServiceBookingStateManagement
              .selectedRoundTripOrigin?.cityCode,
      Parameters.inbound_arrival_station.name:
          standAloneServiceBookingStateManagement.selectedDestination?.cityCode,
      Parameters.quantity.name:
          standAloneServiceBookingStateManagement.porterCount,
      Parameters.booking_type.name:
          standAloneStateManagement.currentServiceType.name.toLowerCase(),
    };
  }

  Map<String, Object?> _getCartMap(BuildContext context) {
    final StandAloneStateManagement standAloneStateManagement =
    context.read<StandAloneStateManagement>();


    final CartResponse? cartResponse =
        context.read<PranaamAppDataStateManagement>().cartDataResponse;


    final double? amount = cartResponse?.totalFare.amount ??
        context.read<BookingAndCancellationState>().bookingDetailsResponse?.totalAmount?.toDouble();

    final Map<String, Object?> eventMap = {
      Parameters.category.name:
          standAloneStateManagement.currentServiceType.name.toLowerCase(),
      Parameters.af_revenue.name: amount,
      Parameters.af_currency.name: 'INR',
      Parameters.sub_category.name: 'purchase',
      Parameters.trip_type.name: cartResponse?.tripDetail.serviceType,
      Parameters.sector_type.name: cartResponse?.tripDetail.travelSector,
      Parameters.departure_date.name: universalDateFormatter(
        requiredFormat: dateFormat,
        dateString: cartResponse?.tripDetail.flightDate,
        inCommingFormat: 'yyyy-MM-dd',
      ),
      Parameters.departure_time.name: universalDateFormatter(
        requiredFormat: timeFormat,
        dateString: cartResponse?.tripDetail.flightTime,
        inCommingFormat: 'hh:mm',
      ),
      Parameters.outbound_flight_number.name:
          cartResponse?.tripDetail.flightNumber,
      Parameters.outbound_airline.name:
          cartResponse?.tripDetail.flightNumber.split('-').firstOrNull,
      Parameters.departure_station.name: cartResponse?.tripDetail.originAirport,
      Parameters.arrival_station.name:
          cartResponse?.tripDetail.destinationAirport,
      Parameters.return_date.name: universalDateFormatter(
        requiredFormat: dateFormat,
        dateString: cartResponse?.tripDetail.transitRoundTripSecFlightDate,
        inCommingFormat: 'yyyy-MM-dd',
      ),
      Parameters.return_time.name: universalDateFormatter(
        requiredFormat: timeFormat,
        dateString: cartResponse?.tripDetail.transitRoundTripSecFlightDate,
        inCommingFormat: 'HH:mm',
      ),

      ///TODO: add checks
      Parameters.inbound_flight_number.name:
          cartResponse?.tripDetail.transitRoundTripSecFlightName,
      Parameters.inbound_airline.name: cartResponse
          ?.tripDetail.transitRoundTripSecFlightName
          .split('-')
          .firstOrNull,
      Parameters.inbound_departure_station.name: null,
      Parameters.inbound_arrival_station.name: null,
      Parameters.quantity.name:
          cartResponse?.standaloneProductDetails.itemCount,
      Parameters.booking_type.name: 'normal_purchase',
      Parameters.cart_amount.name: cartResponse?.totalFare.amount,
      Parameters.total_price.name: cartResponse?.totalFare.amount,
      Parameters.total_discount.name: cartResponse?.standaloneProductDetails
          .pricingInfo.discountCouponDetail.couponDiscountAmount,
      Parameters.coupon.name: cartResponse?.standaloneProductDetails.pricingInfo
          .discountCouponDetail.couponCode,
      Parameters.coupon_value.name: cartResponse?.standaloneProductDetails
          .pricingInfo.discountCouponDetail.couponDiscountAmount,
      Parameters.reward_earned.name: cartResponse?.potentialLoyaltyEarning,
    };
    return eventMap;
  }

  Map<String, Object?> _getBannerClickMap(BuildContext context) {
    final StandAloneStateManagement standAloneStateManagement =
        context.read<StandAloneStateManagement>();
    final Map<String, Object?> eventMap = {
      Parameters.category.name:
          standAloneStateManagement.currentServiceType.name.toLowerCase(),
      Parameters.sub_category.name: 'banner',
      Parameters.source.name: 'home page',
      Parameters.label.name: 'book_now',
      Parameters.banner_category.name:
          'book a ${standAloneStateManagement.currentServiceType.name.toLowerCase()} service',
    };
    return eventMap;
  }
}
