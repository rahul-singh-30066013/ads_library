/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class PranaamApiUrls {
  static const _baseName = 'api/pranaamservicev2/api/PranaamService';
  static const _checkOutBaseName = 'api/orderv2';

  static const getPackages = '$_baseName/V1/GetPranaamPackages';
  static const getFlights = '$_baseName/GetFlights';
  static const getPranaamCoupons = '$_baseName/V2/GetPranaamCoupons';
  static const addCartItem = '$_baseName/V2/AddCartItem';
  static const createBooking = '$_baseName/createBooking';
  static const getCartDetail = '$_baseName/GetCartDetail';
  static const addCartAddOn = '$_baseName/V1/CartAddOn';
  static const removeCartItems = '$_baseName/V2/RemoveCartItems';
  static const validateCoupon = '$_baseName/V2/ValidateCoupon';
  static const removeCoupon = '$_baseName/V2/removeCoupon';
  static const getBookingDetails = 'api/orderv2/order';
  static const cancelBooking = 'api/orderv2/pranaam/cancel';
  static const payNow = '$_baseName/payNow';
  static const confirmPayment = '$_baseName/confirmPayment';
  static const createPranaamPayments = '$_baseName/createPranaamPayments';
  static const downloadInvoice =
      '/api/authenticatorv2/api/MyBooking/GetOrderPdf';
  static const getApplePassBook =
      'api/pranaamservicev2/api/Passbook/getApplePassbook';
  static const countryCodesUrl = 'api/v0.1/countries/flag/images';
  static const countryCodeBaseUrl = 'https://countriesnow.space/';
  static const rescheduleBooking = '$_baseName/V2/AddRescheduleCart';
  static const rescheduleCheckout =
      '$_checkOutBaseName/pranaam/reschedule/checkout';
  static const reschedulePlacement =
      '$_checkOutBaseName/pranaam/reschedule/placement';
  static const upgradeCheckout = '$_checkOutBaseName/pranaam/upgrade/checkout';
  static const upgradePlacement =
      '$_checkOutBaseName/pranaam/upgrade/placement';
}
