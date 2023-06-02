/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class FLightsApiUrls {
  //Flight booking endpoints
  // static const _baseName = 'flightbooking';
  static const _baseName = 'api/flightbookingv2';
  static const _checkOutBaseName = 'api/orderv2';

  //static const _baseName = 'FlightBookingDev';

  static const searchFlight = '$_baseName/api/Flights/search';
  static const fareCalendar = '$_baseName/api/Flights/fareCalendar';
  static const createItinerary = '$_baseName/api/Itinerary/Create';
  static const viewItinerary = '$_baseName/api/Itinerary/View';
  static const updatePassenger = '$_baseName/api/Itinerary/update';
  static const checkPrice = '$_baseName/api/Itinerary/checkPrice';
  static const itineraryBook = '$_baseName/api/Itinerary/bookV2';
  static const viewTrip = '$_baseName/api/Trip/view';
  static const payNow = '$_baseName/api/Payment/paynow';
  static const confirmPayment = '$_baseName/api/payment/confirmPayment';
  static const cancelTrip = '$_checkOutBaseName/flight-booking/cancel';
  static const cancellationReasons =
      '$_checkOutBaseName/flight-booking/cancel-reason';
  static const refundInfo = '$_checkOutBaseName/flight-booking/refund-info';
  static const couponList = '$_baseName/api/promo/getelgibleoffer';
  static const applyCouponForFlight = '$_baseName/api/promo/applypromo';
  static const removeCouponForFlight = '$_baseName/api/promo/removepromo';
  static const downloadInvoiceForTrip =
      'api/authenticatorv2/api/mybooking/GetOrderPdf?orderId=';
  static const emailItinerary =
      '$_checkOutBaseName/flight-booking/email-itinerary';

  //Finance api endpoints
  static const checkout = 'checkout';

  // Flight service endpoints
  static const searchFlightStatus = 'api/fidsv2/api/FlightFid/GetFlightFid';
  static const addFlight = 'api/fidsv2/api/FlightFid/AddFlightFid';
  static const getApplePassBook = '$_baseName/api/Passbook/getApplePassbook';

  static const checkOut = '$_checkOutBaseName/checkout';
  static const placement = '$_checkOutBaseName/placement';
  static const getOrder = '$_checkOutBaseName/order';
  static const potentialEarning = '$_checkOutBaseName/order/';
  //static const paymentmethods = '$_checkOutBaseName/payment-methods';
  static const paymentmethods = '/api/paymentv2/payment-method';

  static const signInOffer = 'api/loyaltyv2/promo/top-lob-promos';
}
