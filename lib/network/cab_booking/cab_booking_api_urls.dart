/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
class CabBookingApiUrls {
  static const urlApiDevEnvironment = 'CABBookingDev';

  // static const urlAPiQAEnvironment = 'CABBooking';
  static const urlAPiQAEnvironment = 'api/cabbookingservicev2';

  static const urlAPiEnvironment = urlAPiQAEnvironment;

  static const getCabBookingSearchCab =
      '$urlAPiEnvironment/api/CabBooking/SearchCab';
  static const createCabBookingCart = '$urlAPiEnvironment/api/CabBooking/Cart';
  static const getCabBookingCartDetails =
      '$urlAPiEnvironment/api/CabBooking/GetCartDetails';
  static const updateContactDetail =
      '$urlAPiEnvironment/api/CabBooking/UpdateContactDetail';

  static const couponList =
      '$urlAPiEnvironment/api/CabBooking/ElgibleOfferForCart';
  static const applyCoupon = '$urlAPiEnvironment/api/CabBooking/ApplyPromoCode';
  static const removeCoupon =
      '$urlAPiEnvironment/api/CabBooking/RemovePromoCode';

  // static const cabBookingPayNow = '/$urlAPiEnvironment/api/CabBooking/paynow';
  // static const cabBookingConfirmPayment =
  //     '/$urlAPiEnvironment/api/CabBooking/Confirmpayment';
  // static const getCabBookingOrderDetails =
  //     '/$urlAPiEnvironment/api/CabBooking/GetOrderDetails';
  static const getCabBookingPreCancellation =
      '/$urlAPiEnvironment/api/CabBookingV2/RefundInfo';

  //  static const postCabBookingSOS = '/$urlAPiEnvironment/api/CabBooking/sos';
  static const postCabBookingSOS = '/api/orderv2/cab-booking/sos';

// static const getCabBookingStatus =
//     '/$urlAPiEnvironment/api/CabBooking/BookingStatus';

  // static const postCabBookingCancellation =
  //     '/$urlAPiEnvironment/api/CabBooking/CancelBooking';
  static const postCabBookingCancellation =
      '/api/orderv2/cab-booking/full-cancel';
}
