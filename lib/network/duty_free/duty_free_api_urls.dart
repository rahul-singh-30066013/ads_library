/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class DutyFreeApiUrls {
  //CMS endpoint
  static const getDutyFreeProducts = 'api/GetDutyFreeProducts';
  static const getDutyFreeCategory = 'api/GetDutyFreeCategory';
  static const getProductFilters = 'api/GetProductFilters';

  //API endpoint
  static const baseName = 'api/dutyfreeservicev2';
  static const baseNameOrder = 'api/orderv2';

  static const addToCart = '$baseName/api/DutyFree/AddCart';
  static const getCartDetails = '$baseName/api/DutyFree/GetCartDetails';
  static const createOrder = '$baseName/api/DutyFree/ProcessCreatedOrder';
  static const updatePassengerDetails =
      '$baseName/api/DutyFree/UpdatePassengerDetails';
  static const removeCartByUser = '$baseName/api/DutyFree/RemoveCartByUser';
  static const rescheduleOrder = '$baseNameOrder/duty-free/reschedule';

  /// Order Cancellation Flow
  static const orderCancellation = '$baseNameOrder/duty-free/cancel';
  static const payNow = '$baseName/api/Payment/payNow';
  static const confirmPayment = '$baseName/api/Payment/confirmPayment';
  static const getDutyFreeCancelOrderDetails =
      '$baseNameOrder/order/';
  static const dutyFreeBankOffer = 'sitecore/api/layout/placeholder/jss';
  static const dutyFreeOtherServices =
      'sitecore/api/layout/placeholder/jss?placeholderName=main&item=/sitecore/content/AirportHome/DutyFreeAirports/';
  static const categories = 'sitecore/api/layout/placeholder/jss';
  static const getCoupon = '$baseName/api/DutyFree/GetCoupons';
  static const applyCoupon = '$baseName/api/DutyFree/ApplyCoupon';
  static const validateCart = '$baseName/api/DutyFree/ValidateCart';
  static const removeMultipleItems =
      '$baseName/api/DutyFree/RemoveMultipleItems';
  static const validatePreOrderDiscount =
      '$baseName/api/DutyFree/ValidatePreOrderDiscount';
}
