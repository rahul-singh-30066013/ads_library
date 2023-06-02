/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/cabs/models/coupon/cab_booking_apply_coupon_response.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/airport_terminal_detail_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/cab_live_tracking_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/cab_srp_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/select_destination_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_cart_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_order_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_confirmation_state.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_detail_state.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_state.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cabs_srp_state.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/select_destination_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/coupon_response/coupon_list_response.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/my_bookings/models/response/my_booking_list_item.dart';
import 'package:adani_airport_mobile/utils/jwt_token_decoder.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:intl/intl.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

class CabGoogleAnalytics {
  String? userId;
  String? logInStatus;
  int totalTime = 90;

  CabGoogleAnalytics() {
    final String jwtToken = ProfileSingleton.profileSingleton.secureToken;
    logInStatus = ProfileSingleton.profileSingleton.isLoggedIn
        ? 'Logged In'
        : 'Not Logged In';

    if (!jwtToken.isNullOrEmpty) {
      final Map<String, dynamic>? decodedTokenData =
          JwtTokenDecoder.decode(jwtToken);
      userId = decodedTokenData?['sub'];
    } else {
      userId = '';
    }
  }

  /// 1) use  for sending parameters in cabs Landing Page ////
  void sendGoogleAnalyticParameters(
    ClickEvents eventName,
    AirportTerminalDetailModel airportTerminalDetailModel,
  ) {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'booking',
      Parameters.terminal.name: airportTerminalDetailModel.terminalCode,
      Parameters.airport_name.name: airportTerminalDetailModel.airportCode,
      Parameters.user_id.name: userId,
      Parameters.login_status.name: logInStatus,
    };
    if (eventName == ClickEvents.cab_booking_destination_search) {
      ClickEvents.cab_booking_destination_search.logEvent(parameters: obj);
    } else if (eventName == ClickEvents.cab_booking_video_played) {
      ClickEvents.cab_booking_video_played.logEvent(parameters: obj);
    } else if (eventName == ClickEvents.cab_booking_lp_cancellation_policy) {
      ClickEvents.cab_booking_lp_cancellation_policy.logEvent(parameters: obj);
    } else if (eventName == ClickEvents.cab_booking_terms_and_condtitions) {
      ClickEvents.cab_booking_terms_and_condtitions.logEvent(parameters: obj);
    }
  }

  /// 2) use  for sending parameters in  Cab book Destination suggest ////
  void sendGACabBookingDestinationSelect(SelectDestinationState viewModel) {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'booking',
      Parameters.terminal.name:
          viewModel.selectedAirportTerminalDetailModel?.terminalCode,
      Parameters.selected_location.name:
          viewModel.selectedAddressDetailModel?.formattedAddress,
      Parameters.airport_name.name:
          viewModel.selectedAirportTerminalDetailModel?.airportCode,
      Parameters.place_id.name: viewModel.selectedAddressDetailModel?.placeId,
      Parameters.user_id.name: userId,
      Parameters.trip_type.name:
          viewModel.selectDestinationNavigateModel?.selectedDate != null
              ? 'Schedule'
              : 'NowRide',
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name:
          viewModel.selectDestinationNavigateModel?.isFromAirport ?? true
              ? 'from_airport'
              : 'to_airport',
    };
    /**/
    ClickEvents.cab_booking_destination_select.logEvent(parameters: obj);
  }

  /// 3)  use  for sending parameters in  Location not found ////
  void sendGAParametersLocationNotFound(
    SelectDestinationState selectDestinationState,
  ) {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.label.name: 'cab_booking_location_not_found',
      Parameters.sub_category.name: 'purchase',
      Parameters.selected_location.name:
          selectDestinationState.selectedAddressDetailModel?.formattedAddress,
      Parameters.error_text.name: 'destination_error',
      Parameters.user_id.name: userId,
      Parameters.place_id.name:
          selectDestinationState.selectedAddressDetailModel?.placeId,
      Parameters.terminal.name: selectDestinationState
          .selectedAirportTerminalDetailModel?.terminalCode,
      Parameters.search_text.name:
          selectDestinationState.destinationController.text,
      Parameters.airport_name.name: selectDestinationState
          .selectedAirportTerminalDetailModel?.airportCode,
      Parameters.trip_type.name:
          selectDestinationState.selectDestinationNavigateModel?.selectedDate !=
                  null
              ? 'Schedule'
              : 'NowRide',
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name: selectDestinationState
                  .selectDestinationNavigateModel?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
    };
    ClickEvents.cab_booking_location_not_found.logEvent(parameters: obj);
  }

  /// 4)   use  for sending parameters in  Change locations ////
  void sendGAParametersChangeLocation(
    CabBookingState cabBookingState,
    String title,
    String subTitle,
  ) {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.error_text.name: subTitle.isNullOrEmpty ? title : subTitle,
      Parameters.sub_category.name: 'purchase',
      Parameters.selected_location.name:
          cabBookingState.selectedAddressDetailModel?.description,
      Parameters.place_id.name:
          cabBookingState.selectedAddressDetailModel?.placeId,
      Parameters.terminal.name:
          cabBookingState.selectedAirportTerminalDetailModel?.terminalCode,
      Parameters.label.name: title,
      Parameters.user_id.name: userId,
      Parameters.search_text.name:
          cabBookingState.selectedAddressDetailModel?.description,
      Parameters.airport_name.name:
          cabBookingState.selectedAirportTerminalDetailModel?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.trip_type.name:
          cabBookingState.selectedDate != null ? 'Schedule' : 'NowRide',
      Parameters.travel_type.name:
          cabBookingState.isFromAirport ? 'from_airport' : 'to_airport',
    };

    ClickEvents.cab_booking_change_drop_location.logEvent(parameters: obj);
  }

  /// 5) use  for sending parameters in  Cab Selection ////
  void sendGAParametersCabSelection(CabsSrpState cabsSrpState) {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name:
          cabsSrpState.selectedCabItinerary?.vehicleCategory?.vehicleType,
      Parameters.vendor.name: cabsSrpState.selectedProviderInfo?.providerName,
      Parameters.currency.name: cabsSrpState.currencyCode,
      Parameters.selected_location.name: cabsSrpState
          .cabSrpNavigateModel?.locationAddressDetailModel?.formattedAddress,
      Parameters.cab_name.name:
          cabsSrpState.selectedCabItinerary?.vehicleCategory?.vehicleType,
      Parameters.cart_amount.name:
          cabsSrpState.selectedCabItinerary?.priceInfo?.totalAmount,
      Parameters.place_id.name:
          cabsSrpState.cabSrpNavigateModel?.locationAddressDetailModel?.placeId,
      Parameters.terminal.name: cabsSrpState
          .cabSrpNavigateModel?.airportTerminalDetailModel?.terminalCode,
      Parameters.date_time.name: DateFormat(Constant.dateFormat24)
          .format(cabsSrpState.selectedDate ?? DateTime.now()),
      Parameters.user_id.name: userId,
      Parameters.trip_type.name:
          cabsSrpState.cabSrpNavigateModel?.selectedDate != null
              ? 'Schedule'
              : 'NowRide',
      Parameters.airport_name.name:
          '${cabsSrpState.cabSrpNavigateModel?.airportTerminalDetailModel?.airportCode}_${cabsSrpState.cabSrpNavigateModel?.airportTerminalDetailModel?.terminalCode}',
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name:
          cabsSrpState.cabSrpNavigateModel?.isFromAirport ?? true
              ? 'from_airport'
              : 'to_airport',
    };

    ClickEvents.cab_booking_select_package.logEvent(parameters: obj);
  }

  /// 6)use  for sending parameters in  Cab Selection - Book ////
  void sendGAParametersCabSelectionBook(CabsSrpState cabsSrpState) {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name:
          cabsSrpState.selectedCabItinerary?.vehicleCategory?.vehicleType,
      Parameters.selected_location.name: cabsSrpState
          .cabSrpNavigateModel?.locationAddressDetailModel?.formattedAddress,
      Parameters.vendor.name: cabsSrpState.selectedProviderInfo?.providerName,
      Parameters.currency.name: cabsSrpState.currencyCode,
      Parameters.cab_name.name:
          cabsSrpState.selectedCabItinerary?.vehicleCategory?.vehicleType,
      Parameters.place_id.name:
          cabsSrpState.cabSrpNavigateModel?.locationAddressDetailModel?.placeId,
      Parameters.date_time.name: DateFormat(Constant.dateFormat24)
          .format(cabsSrpState.selectedDate ?? DateTime.now()),
      Parameters.terminal.name: cabsSrpState
          .cabSrpNavigateModel?.airportTerminalDetailModel?.terminalCode,
      Parameters.trip_type.name:
          cabsSrpState.cabSrpNavigateModel?.selectedDate != null
              ? 'Schedule'
              : 'NowRide',
      Parameters.user_id.name: userId,
      Parameters.airport_name.name:
          '${cabsSrpState.cabSrpNavigateModel?.airportTerminalDetailModel?.airportCode}_${cabsSrpState.cabSrpNavigateModel?.airportTerminalDetailModel?.terminalCode}',
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name:
          cabsSrpState.cabSrpNavigateModel?.isFromAirport ?? true
              ? 'from_airport'
              : 'to_airport',
    };
    cabsSrpState.selectedDate == null
        ? ClickEvents.cab_booking_now.logEvent(parameters: obj)
        : ClickEvents.cab_booking_scheduled.logEvent(parameters: obj);
  }

  /// 7)use  for sending parameters in  Schedule ride ////
  void sendGAParametersResetSchedule(CabsSrpState cabsSrpState) {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name:
          cabsSrpState.selectedCabItinerary?.vehicleCategory?.vehicleType,
      Parameters.terminal.name: cabsSrpState
          .cabSrpNavigateModel?.airportTerminalDetailModel?.terminalCode,
      Parameters.cab_name.name:
          cabsSrpState.selectedCabItinerary?.vehicleCategory?.vehicleType,
      Parameters.currency.name: cabsSrpState.currencyCode,
      Parameters.vendor.name: cabsSrpState.selectedProviderInfo?.providerName,
      Parameters.place_id.name:
          cabsSrpState.cabSrpNavigateModel?.locationAddressDetailModel?.placeId,
      Parameters.date_time.name: DateFormat(Constant.dateFormat24)
          .format(cabsSrpState.selectedDate ?? DateTime.now()),
      Parameters.user_id.name: userId,
      Parameters.trip_type.name:
          cabsSrpState.cabSrpNavigateModel?.selectedDate != null
              ? 'Schedule'
              : 'NowRide',
      Parameters.airport_name.name:
          '${cabsSrpState.cabSrpNavigateModel?.airportTerminalDetailModel?.airportCode}_${cabsSrpState.cabSrpNavigateModel?.airportTerminalDetailModel?.terminalCode}',
      Parameters.selected_location.name: cabsSrpState
          .cabSrpNavigateModel?.locationAddressDetailModel?.formattedAddress,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name:
          cabsSrpState.cabSrpNavigateModel?.isFromAirport ?? true
              ? 'from_airport'
              : 'to_airport',
    };
    ClickEvents.cab_booking_reset_schedule.logEvent(parameters: obj);
  }

  /// 8)use  for sending parameters in Cab Selection - schedule book ////
  void sendGAParametersScheduleBookInitiated(CabsSrpState cabsSrpState) {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.vendor.name: cabsSrpState.selectedProviderInfo?.providerName,
      Parameters.currency.name: cabsSrpState.currencyCode,
      Parameters.place_id.name:
          cabsSrpState.cabSrpNavigateModel?.locationAddressDetailModel?.placeId,
      Parameters.cab_name.name:
          cabsSrpState.selectedCabItinerary?.vehicleCategory?.vehicleType,
      Parameters.login_status.name: logInStatus,
      Parameters.terminal.name: cabsSrpState
          .cabSrpNavigateModel?.airportTerminalDetailModel?.terminalCode,
      Parameters.date_time.name: DateFormat(Constant.dateFormat24)
          .format(cabsSrpState.selectedDate ?? DateTime.now()),
      Parameters.user_id.name: userId,
      Parameters.trip_type.name:
          cabsSrpState.cabSrpNavigateModel?.selectedDate != null
              ? 'Schedule'
              : 'NowRide',
      Parameters.airport_name.name:
          '${cabsSrpState.cabSrpNavigateModel?.airportTerminalDetailModel?.airportCode}_${cabsSrpState.cabSrpNavigateModel?.airportTerminalDetailModel?.terminalCode}',
      Parameters.selected_location.name: cabsSrpState
          .cabSrpNavigateModel?.locationAddressDetailModel?.formattedAddress,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name:
          cabsSrpState.cabSrpNavigateModel?.isFromAirport ?? true
              ? 'from_airport'
              : 'to_airport',
    };
    ClickEvents.cab_booking_schedule_initiated.logEvent(parameters: obj);
  }

  /// 9)use  for sending parameters in schedule ride/ cab_booking_schedule_select ////
  void sendGAParametersCabBookingScheduleSelect(CabsSrpState cabsSrpState) {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name:
          cabsSrpState.selectedCabItinerary?.vehicleCategory?.vehicleType,
      Parameters.vendor.name: cabsSrpState.selectedProviderInfo?.providerName,
      Parameters.currency.name: cabsSrpState.currencyCode,
      Parameters.place_id.name:
          cabsSrpState.cabSrpNavigateModel?.locationAddressDetailModel?.placeId,
      Parameters.terminal.name: cabsSrpState
          .cabSrpNavigateModel?.airportTerminalDetailModel?.terminalCode,
      Parameters.date_time.name: DateFormat(Constant.dateFormat24)
          .format(cabsSrpState.selectedDate ?? DateTime.now()),
      Parameters.user_id.name: userId,
      Parameters.airport_name.name:
          '${cabsSrpState.cabSrpNavigateModel?.airportTerminalDetailModel?.airportCode}_${cabsSrpState.cabSrpNavigateModel?.airportTerminalDetailModel?.terminalCode}',
      Parameters.login_status.name: logInStatus,
      Parameters.selected_location.name: cabsSrpState
          .cabSrpNavigateModel?.locationAddressDetailModel?.formattedAddress,
      Parameters.trip_type.name:
          cabsSrpState.cabSrpNavigateModel?.selectedDate != null
              ? 'Schedule'
              : 'NowRide',
      Parameters.travel_type.name:
          cabsSrpState.cabSrpNavigateModel?.isFromAirport ?? true
              ? 'from_airport'
              : 'to_airport',
    };
    ClickEvents.cab_booking_schedule_select.logEvent(parameters: obj);
  }

  /// 10)use  for sending parameters in offers
  void sendGAParametersAvailableOffers(
    PaymentMethodState? paymentMethodViewModel,
  ) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (paymentMethodViewModel?.cabCartDetailResponseModel?.cartDetail?.tripInfo
                  ?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cab_booking_offer_selection',
      Parameters.vendor.name: paymentMethodViewModel
          ?.cabCartDetailResponseModel?.cartDetail?.securityKey?.providerName,
      Parameters.currency.name:
          paymentMethodViewModel?.cabCartDetailResponseModel?.currencyCode,
      Parameters.terminal.name: paymentMethodViewModel
          ?.cabCartDetailResponseModel?.cartDetail?.tripInfo?.terminal,
      Parameters.place_id.name: paymentMethodViewModel
          ?.cabCartDetailResponseModel?.cartDetail?.drop?.placeId,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.user_id.name: userId,
      Parameters.airport_name.name: paymentMethodViewModel
          ?.cabCartDetailResponseModel?.cartDetail?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name: paymentMethodViewModel
                  ?.cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.trip_type.name: paymentMethodViewModel
                  ?.cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isRideNow ??
              true
          ? 'NowRide'
          : 'Schedule',
    };
    ClickEvents.cab_booking_offers_view.logEvent(parameters: obj);
  }

  /// 11)use  for sending parameters in rewards
  void sendGAParametersRewards(
    PaymentMethodState? paymentMethodViewModel,
  ) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (paymentMethodViewModel?.cabCartDetailResponseModel?.cartDetail?.tripInfo
                  ?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cab_booking_rewards',
      Parameters.vendor.name: paymentMethodViewModel
          ?.cabCartDetailResponseModel?.cartDetail?.securityKey?.providerName,
      Parameters.currency.name:
          paymentMethodViewModel?.cabCartDetailResponseModel?.currencyCode,
      Parameters.place_id.name: paymentMethodViewModel
          ?.cabCartDetailResponseModel?.cartDetail?.drop?.placeId,
      Parameters.rewards_burned.name: paymentMethodViewModel
          ?.cabCartDetailResponseModel
          ?.cartDetail
          ?.priceInfo
          ?.loyaltyPoints
          ?.burnedRewardPoints,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.user_id.name: userId,
      Parameters.terminal.name: paymentMethodViewModel
          ?.cabCartDetailResponseModel?.cartDetail?.tripInfo?.terminal,
      Parameters.airport_name.name: paymentMethodViewModel
          ?.cabCartDetailResponseModel?.cartDetail?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name: paymentMethodViewModel
                  ?.cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.trip_type.name: paymentMethodViewModel
                  ?.cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isRideNow ??
              true
          ? 'NowRide'
          : 'Schedule',
    };

    ClickEvents.cab_booking_rewards_view.logEvent(parameters: obj);
  }

  /// 12)use  for sending parameters in apply coupon ////
  void sendGAParametersApplyCoupon(
    CabCartDetailResponseModel? cabCartDetailResponseModel,
    String couponCode,
    CouponDetails? couponDataItem,
  ) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabCartDetailResponseModel?.cartDetail?.tripInfo?.bookingDate ?? 0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.vendor.name:
          cabCartDetailResponseModel?.cartDetail?.securityKey?.providerName,
      Parameters.currency.name: cabCartDetailResponseModel?.currencyCode,
      Parameters.cab_name.name:
          cabCartDetailResponseModel?.cartDetail?.vehicleDetails?.vehicleType,
      Parameters.place_id.name:
          cabCartDetailResponseModel?.cartDetail?.drop?.placeId,
      Parameters.label.name: 'cab_booking_coupon',
      Parameters.coupon.name: couponCode.isEmpty
          ? '${couponDataItem?.description} / ${couponDataItem?.couponCode}'
          : couponCode,
      Parameters.trip_type.name:
          (cabCartDetailResponseModel?.cartDetail?.tripInfo?.isRideNow ?? true)
              ? 'NowRide'
              : 'schedule',
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.user_id.name: userId,
      Parameters.terminal.name:
          cabCartDetailResponseModel?.cartDetail?.tripInfo?.terminal,
      Parameters.airport_name.name:
          cabCartDetailResponseModel?.cartDetail?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name:
          cabCartDetailResponseModel?.cartDetail?.tripInfo?.isFromAirport ??
                  true
              ? 'from_airport'
              : 'to_airport',
    };
    ClickEvents.cab_booking_select_coupon.logEvent(parameters: obj);
  }

  /// 13) use  for sending parameters in apply coupon/ cab_booking_coupon_applied_successful ////
  void sendGAParametersApplyCouponAppliedSuccessful(
    CabBookingApplyCouponResponse applyCouponResponse,
  ) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (applyCouponResponse.cartDetail?.tripInfo?.bookingDate ?? 0) * 1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cab_booking_coupon',
      Parameters.trip_type.name:
          (applyCouponResponse.cartDetail?.tripInfo?.isRideNow ?? true)
              ? 'NowRide'
              : 'schedule',
      Parameters.cab_name.name:
          applyCouponResponse.cartDetail?.vehicleDetails?.vehicleType,
      Parameters.coupon.name:
          applyCouponResponse.cartDetail?.promoDetails?.promoCode,
      Parameters.currency.name: applyCouponResponse.currencyCode,
      Parameters.place_id.name: applyCouponResponse.cartDetail?.drop?.placeId,
      Parameters.vendor.name:
          applyCouponResponse.cartDetail?.securityKey?.providerName,
      Parameters.coupon_value.name:
          applyCouponResponse.cartDetail?.promoDetails?.promoValue,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.user_id.name: userId,
      Parameters.terminal.name:
          applyCouponResponse.cartDetail?.tripInfo?.terminal,
      Parameters.airport_name.name:
          applyCouponResponse.cartDetail?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name:
          applyCouponResponse.cartDetail?.tripInfo?.isFromAirport ?? true
              ? 'from_airport'
              : 'to_airport',
    };
    ClickEvents.cab_booking_coupon_applied_successful.logEvent(parameters: obj);
  }

  /// 13) use  for sending parameters in apply coupon/ cab_booking_coupon_applied_successful ////
  void sendGAParametersRemoveCoupon(
    CabBookingApplyCouponResponse applyCouponResponse,
  ) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (applyCouponResponse.cartDetail?.tripInfo?.bookingDate ?? 0) * 1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cab_booking_coupon',
      Parameters.trip_type.name:
          (applyCouponResponse.cartDetail?.tripInfo?.isRideNow ?? true)
              ? 'NowRide'
              : 'schedule',
      Parameters.coupon.name:
          applyCouponResponse.cartDetail?.promoDetails?.promoCode,
      Parameters.currency.name: applyCouponResponse.currencyCode,
      Parameters.place_id.name: applyCouponResponse.cartDetail?.drop?.placeId,
      Parameters.vendor.name:
          applyCouponResponse.cartDetail?.securityKey?.providerName,
      Parameters.coupon_value.name:
          applyCouponResponse.cartDetail?.promoDetails?.promoValue,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.user_id.name: userId,
      Parameters.terminal.name:
          applyCouponResponse.cartDetail?.tripInfo?.terminal,
      Parameters.airport_name.name:
          applyCouponResponse.cartDetail?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name:
          applyCouponResponse.cartDetail?.tripInfo?.isFromAirport ?? true
              ? 'from_airport'
              : 'to_airport',
    };

    ClickEvents.cab_booking_coupon_removed.logEvent(parameters: obj);
  }

  /// 14) use  for sending parameters in cab booking detail ////
  void sendGAParametersCabBookingDetail(
    CabBookingDetailState cabBookingDetailState,
  ) {
    final totalAmount = (cabBookingDetailState.cabCartDetailResponseModel
                ?.cartDetail?.priceInfo?.totalAmount ??
            0) -
        (cabBookingDetailState.cabCartDetailResponseModel?.cartDetail
                ?.promoDetails?.promoValue ??
            0);
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabBookingDetailState.cabCartDetailResponseModel?.cartDetail?.tripInfo
                  ?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cab_booking_details',
      Parameters.coupon.name: cabBookingDetailState
          .cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoCode,
      Parameters.coupon_value.name: cabBookingDetailState
          .cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoValue,
      Parameters.cab_name.name: cabBookingDetailState
          .cabCartDetailResponseModel?.cartDetail?.vehicleDetails?.vehicleType,
      Parameters.trip_type.name: (cabBookingDetailState
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.cart_amount.name: cabBookingDetailState
          .cabCartDetailResponseModel?.cartDetail?.priceInfo?.totalAmount,
      Parameters.total_price.name: totalAmount,
      Parameters.purchase_revenue.name: totalAmount,
      Parameters.value.name: totalAmount,
      Parameters.rewards_earned.name: cabBookingDetailState
          .cabCartDetailResponseModel
          ?.cartDetail
          ?.priceInfo
          ?.loyaltyPoints
          ?.earnedRewardPoints,
      Parameters.vendor.name: cabBookingDetailState
          .cabCartDetailResponseModel?.cartDetail?.securityKey?.providerName,
      Parameters.currency.name:
          cabBookingDetailState.cabCartDetailResponseModel?.currencyCode,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.user_id.name: userId,
      Parameters.place_id.name: cabBookingDetailState
          .cabCartDetailResponseModel?.cartDetail?.drop?.placeId,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name: cabBookingDetailState
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.trip_type.name: cabBookingDetailState
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isRideNow ??
              true
          ? 'NowRide'
          : 'Schedule',
      Parameters.selected_location.name: cabBookingDetailState
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isFromAirport ??
              true
          ? cabBookingDetailState
                  .cabCartDetailResponseModel?.cartDetail?.drop?.locationCode ??
              ''
          : cabBookingDetailState.cabCartDetailResponseModel?.cartDetail?.pickup
                  ?.locationCode ??
              '',
    };
    ClickEvents.cab_booking_details.logEvent(parameters: obj);
  }

  /// 15) use  for sending parameters in Offers snapshot/ cab_booking_coupon_failed ////

  void sendGAParametersCabBookingCouponFailed(
    CabCartDetailResponseModel? cabCartDetailResponseModel,
    String couponCode,
    CouponDetails? couponDataItem,
    String errorMessage,
  ) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabCartDetailResponseModel?.cartDetail?.tripInfo?.bookingDate ?? 0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.vendor.name:
          cabCartDetailResponseModel?.cartDetail?.securityKey?.providerName,
      Parameters.currency.name: cabCartDetailResponseModel?.currencyCode,
      Parameters.cab_name.name:
          cabCartDetailResponseModel?.cartDetail?.vehicleDetails?.vehicleType,
      Parameters.label.name: 'cab_booking_coupon_failed',
      Parameters.coupon.name: couponCode.isEmpty
          ? '${couponDataItem?.description} / ${couponDataItem?.couponCode}'
          : couponCode,
      Parameters.trip_type.name:
          (cabCartDetailResponseModel?.cartDetail?.tripInfo?.isRideNow ?? true)
              ? 'NowRide'
              : 'schedule',
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.user_id.name: userId,
      Parameters.place_id.name:
          cabCartDetailResponseModel?.cartDetail?.drop?.placeId,
      Parameters.error_text.name: errorMessage,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name:
          cabCartDetailResponseModel?.cartDetail?.tripInfo?.isFromAirport ??
                  true
              ? 'from_airport'
              : 'to_airport',
      Parameters.selected_location.name: cabCartDetailResponseModel
                  ?.cartDetail?.tripInfo?.isFromAirport ??
              true
          ? cabCartDetailResponseModel?.cartDetail?.drop?.locationCode ?? ''
          : cabCartDetailResponseModel?.cartDetail?.pickup?.locationCode ?? '',
    };
    ClickEvents.cab_booking_coupon_failed.logEvent(parameters: obj);
  }

  /// 16) use  for sending parameters in payment page/ add_payment_info
  void sendGAParametersAddPaymentInfo(
    PaymentMethodState paymentMethodViewModel, {
    String? errorText,
    String? label,
  }) {
    final totalAmount = (paymentMethodViewModel.cabCartDetailResponseModel
                ?.cartDetail?.priceInfo?.totalAmount ??
            0) -
        (paymentMethodViewModel.cabCartDetailResponseModel?.cartDetail
                ?.promoDetails?.promoValue ??
            0);
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (paymentMethodViewModel.cabCartDetailResponseModel?.cartDetail?.tripInfo
                  ?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: label ?? 'add_payment_info',
      Parameters.payment_type.name:
          paymentMethodViewModel.payNowRequest?.paymentMode,
      Parameters.cart_amount.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.priceInfo?.totalAmount,
      Parameters.total_price.name: totalAmount,
      Parameters.purchase_revenue.name: totalAmount,
      Parameters.value.name: totalAmount,
      Parameters.error_text.name: errorText,
      Parameters.rewards_burned.name:
          paymentMethodViewModel.payNowRequest?.loyalty,
      Parameters.rewards_earned.name: paymentMethodViewModel
          .cabCartDetailResponseModel
          ?.cartDetail
          ?.priceInfo
          ?.loyaltyPoints
          ?.earnedRewardPoints,
      Parameters.cab_name.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.vehicleDetails?.vehicleType,
      Parameters.user_id.name: userId,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.total_discount.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoValue,
      Parameters.coupon.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoCode,
      Parameters.coupon_value.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoValue,
      Parameters.payment_bank.name: '',
      Parameters.trip_type.name: (paymentMethodViewModel
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.payment_gateway.name: '',
      Parameters.place_id.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.drop?.placeId,
      Parameters.airport_name.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.user_id.name: userId,
      Parameters.travel_type.name: paymentMethodViewModel
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.selected_location.name: paymentMethodViewModel
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isFromAirport ??
              true
          ? paymentMethodViewModel
                  .cabCartDetailResponseModel?.cartDetail?.drop?.locationCode ??
              ''
          : paymentMethodViewModel.cabCartDetailResponseModel?.cartDetail
                  ?.pickup?.locationCode ??
              '',
    };
    ClickEvents.add_payment_info.logEvent(parameters: obj);
    sendGAParametersCabBookPaymentSubmit(
      paymentMethodViewModel,
    );
  }

  /// 17) use  for sending parameters in payment page/ cab_book_payment_submit ////
  void sendGAParametersCabBookPaymentSubmit(
    PaymentMethodState paymentMethodViewModel,
  ) {
    final totalAmount = (paymentMethodViewModel.cabCartDetailResponseModel
                ?.cartDetail?.priceInfo?.totalAmount ??
            0) -
        (paymentMethodViewModel.cabCartDetailResponseModel?.cartDetail
                ?.promoDetails?.promoValue ??
            0);
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (paymentMethodViewModel.cabCartDetailResponseModel?.cartDetail?.tripInfo
                  ?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cab_book_payment_submit_page',
      Parameters.payment_type.name:
          paymentMethodViewModel.payNowRequest?.paymentMode,
      Parameters.cart_amount.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.priceInfo?.totalAmount,
      Parameters.total_price.name: totalAmount,
      Parameters.purchase_revenue.name: totalAmount,
      Parameters.value.name: totalAmount,
      Parameters.rewards_burned.name:
          paymentMethodViewModel.payNowRequest?.loyalty,
      Parameters.rewards_earned.name: paymentMethodViewModel
          .cabCartDetailResponseModel
          ?.cartDetail
          ?.priceInfo
          ?.loyaltyPoints
          ?.earnedRewardPoints,
      Parameters.user_id.name: userId,
      Parameters.trip_type.name: (paymentMethodViewModel
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.total_discount.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoValue,
      Parameters.coupon.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoCode,
      Parameters.coupon_value.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoValue,
      Parameters.payment_bank.name: '',
      Parameters.payment_gateway.name: '',
      Parameters.place_id.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.drop?.placeId,
      Parameters.airport_name.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.user_id.name: userId,
      Parameters.travel_type.name: paymentMethodViewModel
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.selected_location.name: paymentMethodViewModel
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isFromAirport ??
              true
          ? paymentMethodViewModel
                  .cabCartDetailResponseModel?.cartDetail?.drop?.locationCode ??
              ''
          : paymentMethodViewModel.cabCartDetailResponseModel?.cartDetail
                  ?.pickup?.locationCode ??
              '',
    };
    ClickEvents.cab_book_payment_submit.logEvent(parameters: obj);
  }

  /// 18) use  for sending parameters in cab booking confirmation page
  void sendGAParametersBookingConfirmationPage(
    CabBookingConfirmationState cabBookingConfirmationState,
  ) {
    final totalAmount = (cabBookingConfirmationState
                .cabOrderDetailResponseModel?.priceInfo?.totalAmount ??
            0) -
        (cabBookingConfirmationState
                .cabOrderDetailResponseModel?.promoDetails?.promoValue ??
            0);
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
      Parameters.cab_status.name:
          cabBookingConfirmationState.cabBookingOrderStatus.name,
      Parameters.payment_type.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.priceInfo?.paymentMode,
      Parameters.trip_type.name: (cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.cart_amount.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.priceInfo?.totalAmount,
      Parameters.total_price.name: totalAmount,
      Parameters.purchase_revenue.name: totalAmount,
      Parameters.value.name: totalAmount,
      Parameters.rewards_burned.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel
          ?.priceInfo
          ?.loyaltyPoints
          ?.burnedRewardPoints,
      Parameters.rewards_earned.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel
          ?.priceInfo
          ?.loyaltyPoints
          ?.earnedRewardPoints,
      Parameters.currency.name: cabBookingConfirmationState
          .commonOrderDetailBaseResponse?.orderDetail?.currencyCode,
      Parameters.user_id.name: userId,
      Parameters.total_discount.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoValue,
      Parameters.transaction_id.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.bookingInfo?.bookingID,
      Parameters.coupon_value.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoValue,
      Parameters.coupon.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoCode,
      Parameters.place_id.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.drop?.placeId,
      Parameters.vendor.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.securityKey?.providerName,
      Parameters.cab_name.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
      Parameters.payment_gateway.name: '',
      Parameters.payment_aggregator.name: '',
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.terminal.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.tripInfo?.terminal,
      Parameters.airport_name.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.selected_location.name: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.drop?.locationCode ??
              ''
          : cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.pickup?.locationCode ??
              '',
    };

    ClickEvents.cab_booking_confirmation.logEvent(parameters: obj);
  }

  /// 19) use  for sending parameters in cab booking confirmation page/cab_booking_call_driver ////
  void sendGAParametersBookingConfirmationCabBookingCallDriver(
    CabOrderDetailResponseModel? cabOrderDetailResponseModel,
    String? currencyCode,
  ) {
    final totalAmount =
        (cabOrderDetailResponseModel?.priceInfo?.totalAmount ?? 0) -
            (cabOrderDetailResponseModel?.promoDetails?.promoValue ?? 0);

    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabOrderDetailResponseModel?.tripInfo?.bookingDate ?? 0) * 1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cab_booked',
      Parameters.payment_type.name:
          cabOrderDetailResponseModel?.priceInfo?.paymentMode,
      Parameters.cart_amount.name:
          cabOrderDetailResponseModel?.priceInfo?.totalAmount,
      Parameters.total_price.name: totalAmount,
      Parameters.purchase_revenue.name: totalAmount,
      Parameters.value.name: totalAmount,
      Parameters.rewards_burned.name: cabOrderDetailResponseModel
          ?.priceInfo?.loyaltyPoints?.burnedRewardPoints,
      Parameters.user_id.name: userId,
      Parameters.cab_name.name:
          cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
      Parameters.trip_type.name:
          (cabOrderDetailResponseModel?.tripInfo?.isRideNow ?? true)
              ? 'NowRide'
              : 'schedule',
      Parameters.coupon_value.name:
          cabOrderDetailResponseModel?.promoDetails?.promoValue,
      Parameters.total_discount.name:
          cabOrderDetailResponseModel?.promoDetails?.promoValue,
      Parameters.vendor.name:
          cabOrderDetailResponseModel?.securityKey?.providerName,
      Parameters.transaction_id.name:
          cabOrderDetailResponseModel?.bookingInfo?.bookingID,
      Parameters.currency.name: currencyCode,
      Parameters.payment_gateway.name: '',
      Parameters.payment_aggregator.name: '',
      Parameters.coupon.name:
          cabOrderDetailResponseModel?.promoDetails?.promoCode,
      Parameters.payment_bank.name:
          cabOrderDetailResponseModel?.priceInfo?.paymentMode,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.place_id.name: cabOrderDetailResponseModel?.drop?.placeId,
      Parameters.terminal.name: cabOrderDetailResponseModel?.tripInfo?.terminal,
      Parameters.airport_name.name:
          cabOrderDetailResponseModel?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name:
          cabOrderDetailResponseModel?.tripInfo?.isFromAirport ?? true
              ? 'from_airport'
              : 'to_airport',
      Parameters.selected_location.name:
          cabOrderDetailResponseModel?.tripInfo?.isFromAirport ?? true
              ? cabOrderDetailResponseModel?.drop?.locationCode ?? ''
              : cabOrderDetailResponseModel?.pickup?.locationCode ?? '',
    };
    ClickEvents.cab_booking_call_driver.logEvent(parameters: obj);
  }

  /// 20) use  for sending parameters in  cab booking re-shceduling/cab_booking_bottom_pannel_select
  void sendGAParametersCabBookingBottomPanelSelect(
    CabBookingConfirmationState cabBookingConfirmationState,
  ) {
    final totalAmount = (cabBookingConfirmationState
                .cabOrderDetailResponseModel?.priceInfo?.totalAmount ??
            0) -
        (cabBookingConfirmationState
                .cabOrderDetailResponseModel?.promoDetails?.promoValue ??
            0);

    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cab_booking_bottom_pannel_select',
      Parameters.payment_type.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.priceInfo?.paymentMode,
      Parameters.cart_amount.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.priceInfo?.totalAmount,
      Parameters.total_price.name: totalAmount,
      Parameters.purchase_revenue.name: totalAmount,
      Parameters.value.name: totalAmount,
      Parameters.rewards_burned.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel
          ?.priceInfo
          ?.loyaltyPoints
          ?.burnedRewardPoints,
      Parameters.user_id.name: userId,
      Parameters.total_discount.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoValue,
      Parameters.currency.name: cabBookingConfirmationState
          .commonOrderDetailBaseResponse?.orderDetail?.currencyCode,
      Parameters.transaction_id.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.bookingInfo?.bookingID,
      Parameters.vendor.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.securityKey?.providerName,
      Parameters.payment_gateway.name: '',
      Parameters.payment_aggregator.name: '',
      Parameters.trip_type.name: (cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.selected_location.name: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.drop?.locationCode ??
              ''
          : cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.pickup?.locationCode ??
              '',
      Parameters.coupon.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoCode,
      Parameters.payment_bank.name: '',
      Parameters.cab_name.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.place_id.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.drop?.placeId,
      Parameters.terminal.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.tripInfo?.terminal,
      Parameters.airport_name.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.tripInfo?.airportCode,
      Parameters.cab_name.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
    };
    ClickEvents.cab_booking_bottom_pannel_select.logEvent(parameters: obj);
  }

  /// 21) use  for sending parameters in  cab order confirmation page/cab_booking_success ////
  void sendGAParametersCabBookingSuccess(
    CabBookingConfirmationState cabBookingConfirmationState,
  ) {
    final totalAmount = (cabBookingConfirmationState
                .cabOrderDetailResponseModel?.priceInfo?.totalAmount ??
            0) -
        (cabBookingConfirmationState
                .cabOrderDetailResponseModel?.promoDetails?.promoValue ??
            0);

    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cab_booked',
      Parameters.payment_type.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.priceInfo?.paymentMode,
      Parameters.cart_amount.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.priceInfo?.totalAmount,
      Parameters.total_price.name: totalAmount,
      Parameters.purchase_revenue.name: totalAmount,
      Parameters.value.name: totalAmount,
      Parameters.cab_name.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
      Parameters.rewards_burned.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel
          ?.priceInfo
          ?.loyaltyPoints
          ?.burnedRewardPoints,
      Parameters.rewards_earned.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel
          ?.priceInfo
          ?.loyaltyPoints
          ?.earnedRewardPoints,
      Parameters.user_id.name: userId,
      Parameters.total_discount.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoValue,
      Parameters.currency.name: cabBookingConfirmationState
          .commonOrderDetailBaseResponse?.orderDetail?.currencyCode,
      Parameters.place_id.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.drop?.placeId,
      Parameters.transaction_id.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.bookingInfo?.bookingID,
      Parameters.vendor.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.securityKey?.providerName,
      Parameters.trip_type.name: (cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.payment_gateway.name: '',
      Parameters.payment_aggregator.name: '',
      Parameters.coupon_value.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoValue,
      Parameters.coupon.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoCode,
      Parameters.payment_bank.name: '',
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.terminal.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.tripInfo?.terminal,
      Parameters.airport_name.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.selected_location.name: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.drop?.locationCode ??
              ''
          : cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.pickup?.locationCode ??
              '',
      Parameters.af_revenue.name: totalAmount,
      Parameters.af_currency.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.priceInfo?.currencyCode,
    };
    ClickEvents.cab_booking_success.logEvent(parameters: obj);
  }

  /// 23) use  for sending parameters in cab_booking_failed
  void sendGAParametersCabBookingFailed(
    PaymentMethodState paymentMethodViewModel,
    ADResponseState responseState,
  ) {
    final totalAmount = (paymentMethodViewModel.cabCartDetailResponseModel
                ?.cartDetail?.priceInfo?.totalAmount ??
            0) -
        (paymentMethodViewModel.cabCartDetailResponseModel?.cartDetail
                ?.promoDetails?.promoValue ??
            0);
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (paymentMethodViewModel.cabCartDetailResponseModel?.cartDetail?.tripInfo
                  ?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'booking_failed',
      Parameters.label.name: 'cab_booking_failed',
      Parameters.payment_type.name:
          paymentMethodViewModel.payNowRequest?.paymentMode,
      Parameters.cart_amount.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.priceInfo?.totalAmount,
      Parameters.total_price.name: totalAmount,
      Parameters.purchase_revenue.name: totalAmount,
      Parameters.value.name: totalAmount,
      Parameters.rewards_burned.name:
          paymentMethodViewModel.payNowRequest?.loyalty,
      Parameters.transaction_id.name:
          paymentMethodViewModel.paymentConfirmRequest?.orderId,
      Parameters.trip_type.name: (paymentMethodViewModel
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.currency.name:
          paymentMethodViewModel.cabCartDetailResponseModel?.currencyCode,
      Parameters.user_id.name: userId,
      Parameters.login_status.name: logInStatus,
      Parameters.total_discount.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoValue,
      Parameters.vendor.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.securityKey?.providerName,
      Parameters.error_text.name: responseState.message,
      Parameters.payment_gateway.name: '',
      Parameters.payment_aggregator.name: '',
      Parameters.coupon.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoCode,
      Parameters.coupon_value.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoValue,
      Parameters.payment_bank.name: '',
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.place_id.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.drop?.placeId,
      Parameters.terminal.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.tripInfo?.terminal,
      Parameters.airport_name.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.tripInfo?.airportCode,
      Parameters.travel_type.name: paymentMethodViewModel
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.selected_location.name: paymentMethodViewModel
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isFromAirport ??
              true
          ? paymentMethodViewModel
                  .cabCartDetailResponseModel?.cartDetail?.drop?.locationCode ??
              ''
          : paymentMethodViewModel.cabCartDetailResponseModel?.cartDetail
                  ?.pickup?.locationCode ??
              '',
    };
    ClickEvents.cab_booking_failed.logEvent(parameters: obj);
  }

  /// 24) use  for sending parameters in order and bookings page - cab confirmation page/cab_booking_cancel_button ////
  void sendGAParametersCabBookingCancelButton(
    CabBookingConfirmationState cabBookingConfirmationState,
  ) {
    final totalAmount = (cabBookingConfirmationState
                .cabOrderDetailResponseModel?.priceInfo?.totalAmount ??
            0) -
        (cabBookingConfirmationState
                .cabOrderDetailResponseModel?.promoDetails?.promoValue ??
            0);

    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'cancellation',
      Parameters.label.name: 'cab_cancellation',
      Parameters.payment_type.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.priceInfo?.paymentMode,
      Parameters.cart_amount.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.priceInfo?.totalAmount,
      Parameters.total_price.name: totalAmount,
      Parameters.purchase_revenue.name: totalAmount,
      Parameters.cab_name.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
      Parameters.rewards_burned.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel
          ?.priceInfo
          ?.loyaltyPoints
          ?.burnedRewardPoints,
      Parameters.transaction_id.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.bookingInfo?.bookingID,
      Parameters.currency.name: cabBookingConfirmationState
          .commonOrderDetailBaseResponse?.orderDetail?.currencyCode,
      Parameters.vendor.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.securityKey?.providerName,
      Parameters.place_id.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.drop?.placeId,
      Parameters.payment_gateway.name: '',
      Parameters.payment_aggregator.name: '',
      Parameters.user_id.name: userId,
      Parameters.trip_type.name: (cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.total_discount.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoValue,
      Parameters.coupon.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoCode,
      Parameters.payment_bank.name: '',
      Parameters.coupon_value.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoValue,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.terminal.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.tripInfo?.terminal,
      Parameters.airport_name.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.selected_location.name: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.drop?.locationCode ??
              ''
          : cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.pickup?.locationCode ??
              '',
    };
    ClickEvents.cab_booking_cancel_button.logEvent(parameters: obj);
  }

  /// 26) use  for sending parameters in why are you cancelling page/cab_booking_cancellation_reason_text ////
  void sendGAParametersCabBookingCancellationReasonText(
    CabBookingCancellationState cabBookingCancellationState,
    CabOrderDetailResponseModel? cabOrderDetailResponseModel,
    String? currencyCode,
  ) {
    final totalAmount =
        (cabOrderDetailResponseModel?.priceInfo?.totalAmount ?? 0) -
            (cabOrderDetailResponseModel?.promoDetails?.promoValue ?? 0);

    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabOrderDetailResponseModel?.tripInfo?.bookingDate ?? 0) * 1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'cancellation',
      Parameters.label.name: 'cab_cancellation',
      Parameters.cart_amount.name:
          cabOrderDetailResponseModel?.priceInfo?.totalAmount,
      Parameters.total_price.name: totalAmount,
      Parameters.purchase_revenue.name: totalAmount,
      Parameters.value.name: totalAmount,
      Parameters.vendor.name:
          cabOrderDetailResponseModel?.securityKey?.providerName,
      Parameters.cab_name.name:
          cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
      Parameters.currency.name: currencyCode,
      Parameters.place_id.name: cabOrderDetailResponseModel?.drop?.placeId,
      Parameters.payment_gateway.name: '',
      Parameters.payment_aggregator.name: '',
      Parameters.payment_bank.name: '',
      Parameters.payment_type.name:
          cabOrderDetailResponseModel?.priceInfo?.paymentMode,
      Parameters.user_id.name: userId,
      Parameters.trip_type.name:
          (cabOrderDetailResponseModel?.tripInfo?.isRideNow ?? true)
              ? 'NowRide'
              : 'schedule',
      Parameters.cancel_reason.name: cabBookingCancellationState
          .cabBookingCancellationRequest.cancelReason,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.terminal.name: cabOrderDetailResponseModel?.tripInfo?.terminal,
      Parameters.airport_name.name:
          cabOrderDetailResponseModel?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name:
          cabOrderDetailResponseModel?.tripInfo?.isFromAirport ?? true
              ? 'from_airport'
              : 'to_airport',
      Parameters.selected_location.name:
          cabOrderDetailResponseModel?.tripInfo?.isFromAirport ?? true
              ? cabOrderDetailResponseModel?.drop?.locationCode ?? ''
              : cabOrderDetailResponseModel?.pickup?.locationCode ?? '',
    };
    ClickEvents.cab_booking_cancellation_reason_text.logEvent(parameters: obj);
  }

  /// 27) use  for sending parameters in cancelled/cab_booking_cancellation_confirmed ////
  void sendGAParametersCabBookingCancellationConfirmed(
    CabOrderDetailResponseModel? cabOrderDetailResponseModel,
    String? currencyCode,
  ) {
    final totalAmount =
        (cabOrderDetailResponseModel?.priceInfo?.totalAmount ?? 0) -
            (cabOrderDetailResponseModel?.promoDetails?.promoValue ?? 0);

    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabOrderDetailResponseModel?.tripInfo?.bookingDate ?? 0) * 1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'cancellation',
      Parameters.label.name: 'cab_cancellation',
      Parameters.payment_type.name:
          cabOrderDetailResponseModel?.priceInfo?.paymentMode,
      Parameters.cart_amount.name:
          cabOrderDetailResponseModel?.priceInfo?.totalAmount,
      Parameters.total_price.name: totalAmount,
      Parameters.purchase_revenue.name: totalAmount,
      Parameters.value.name: totalAmount,
      Parameters.rewards_returned.name:
          cabOrderDetailResponseModel?.refundInfo?.loyaltyRefund,
      Parameters.cab_name.name:
          cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
      Parameters.user_id.name: userId,
      Parameters.transaction_id.name:
          cabOrderDetailResponseModel?.bookingInfo?.bookingID,
      Parameters.currency.name: currencyCode,
      Parameters.place_id.name: cabOrderDetailResponseModel?.drop?.placeId,
      Parameters.total_discount.name:
          cabOrderDetailResponseModel?.promoDetails?.promoValue,
      Parameters.vendor.name:
          cabOrderDetailResponseModel?.securityKey?.providerName,
      Parameters.payment_gateway.name: '',
      Parameters.payment_aggregator.name: '',
      Parameters.trip_type.name:
          (cabOrderDetailResponseModel?.tripInfo?.isRideNow ?? true)
              ? 'NowRide'
              : 'schedule',
      Parameters.coupon.name:
          cabOrderDetailResponseModel?.promoDetails?.promoCode,
      Parameters.payment_bank.name: '',
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.terminal.name: cabOrderDetailResponseModel?.tripInfo?.terminal,
      Parameters.airport_name.name:
          cabOrderDetailResponseModel?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name:
          cabOrderDetailResponseModel?.tripInfo?.isFromAirport ?? true
              ? 'from_airport'
              : 'to_airport',
      Parameters.selected_location.name:
          cabOrderDetailResponseModel?.tripInfo?.isFromAirport ?? true
              ? cabOrderDetailResponseModel?.drop?.locationCode ?? ''
              : cabOrderDetailResponseModel?.pickup?.locationCode ?? '',
    };
    ClickEvents.cab_booking_cancellation_confirmed.logEvent(parameters: obj);
  }

  /// 28) use  for sending parameters in Cab Tracking/cab_booking_track_location ////
  void sendgaparameterscabbookingtracklocation(
    CabLiveTrackingNavigateModel? cabLiveTrackingNavigateModel,
  ) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cab_booking_track_location',
      Parameters.vendor.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.securityKey?.providerName,
      Parameters.user_id.name: userId,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.cab_name.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
      Parameters.trip_type.name: (cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.terminal.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.tripInfo?.terminal,
      Parameters.place_id.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.drop?.placeId,
      Parameters.airport_name.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.tripInfo?.airportCode,
      Parameters.travel_type.name: cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.selected_location.name: cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.drop?.locationCode ??
              ''
          : cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.pickup?.locationCode ??
              '',
    };
    ClickEvents.cab_booking_track_location.logEvent(parameters: obj);
  }

  /// 29) use  for sending parameters in SOS Contact/cab_booking_sos_page ////
  void sendGAParametersCabBookingSosPage(
    CabLiveTrackingNavigateModel? cabLiveTrackingNavigateModel,
  ) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.vendor.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.securityKey?.providerName,
      Parameters.label.name: 'cab_booking_sos',
      Parameters.user_id.name: userId,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.terminal.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.tripInfo?.terminal,
      Parameters.trip_type.name: (cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.cab_name.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
      Parameters.place_id.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.drop?.placeId,
      Parameters.airport_name.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.selected_location.name: cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.drop?.locationCode ??
              ''
          : cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.pickup?.locationCode ??
              '',
      Parameters.travel_type.name: cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
    };
    ClickEvents.cab_booking_sos_page.logEvent(parameters: obj);
  }

  /// 30) use  for sending parameters in SOS Contact/cab_booking_sos_page_called_police ////
  void sendGAParametersCabBookingSosPageCalledPolice(
    CabLiveTrackingNavigateModel? cabLiveTrackingNavigateModel,
  ) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.vendor.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.securityKey?.providerName,
      Parameters.label.name: 'cab_booking_sos',
      Parameters.user_id.name: userId,
      Parameters.cab_name.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.terminal.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.tripInfo?.terminal,
      Parameters.trip_type.name: (cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.place_id.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.drop?.placeId,
      Parameters.airport_name.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name: cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.selected_location.name: cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.drop?.locationCode ??
              ''
          : cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.pickup?.locationCode ??
              '',
    };
    ClickEvents.cab_booking_sos_page_called_police.logEvent(parameters: obj);
  }

  /// 31) use  for sending parameters in SOS Contact/cab_booking_sos_page_alert_carzonrent ////
  void sendGAParametersCabBookingSosPageAlertCarZonRent(
    CabLiveTrackingNavigateModel? cabLiveTrackingNavigateModel,
  ) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cab_booked_sos',
      Parameters.user_id.name: userId,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.terminal.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.tripInfo?.terminal,
      Parameters.place_id.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.drop?.placeId,
      Parameters.trip_type.name: (cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.airport_name.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name: cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.selected_location.name: cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.drop?.locationCode ??
              ''
          : cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.pickup?.locationCode ??
              '',
    };
    ClickEvents.cab_booking_sos_page_alert_carzonrent.logEvent(parameters: obj);
  }

  /// 32) use  for sending parameters in Cab Tracking/cab_booking_share ////
  void sendGAParametersCabBookingShare(
    CabLiveTrackingNavigateModel? cabLiveTrackingNavigateModel,
  ) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cab_booked',
      Parameters.user_id.name: userId,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.cab_name.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
      Parameters.terminal.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.tripInfo?.terminal,
      Parameters.place_id.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.drop?.placeId,
      Parameters.trip_type.name: (cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.airport_name.name: cabLiveTrackingNavigateModel
          ?.cabOrderDetailResponseModel?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name: cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.selected_location.name: cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.drop?.locationCode ??
              ''
          : cabLiveTrackingNavigateModel
                  ?.cabOrderDetailResponseModel?.pickup?.locationCode ??
              '',
    };
    ClickEvents.cab_booking_share.logEvent(parameters: obj);
  }

  /// 33) use  for sending parameters in cancellation policies/cab_booking_cancellation_policy_view ////
  void sendGAParametersCabBookingCancellationPolicyView(
    CabBookingConfirmationState cabBookingConfirmationState,
  ) {
    final totalAmount = (cabBookingConfirmationState
                .cabOrderDetailResponseModel?.priceInfo?.totalAmount ??
            0) -
        (cabBookingConfirmationState
                .cabOrderDetailResponseModel?.promoDetails?.promoValue ??
            0);

    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cab_booked',
      Parameters.payment_type.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.priceInfo?.paymentMode,
      Parameters.cart_amount.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.priceInfo?.totalAmount,
      Parameters.total_price.name: totalAmount,
      Parameters.purchase_revenue.name: totalAmount,
      Parameters.value.name: totalAmount,
      Parameters.cab_name.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
      Parameters.rewards_burned.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel
          ?.priceInfo
          ?.loyaltyPoints
          ?.burnedRewardPoints,
      Parameters.user_id.name: userId,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.place_id.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.drop?.placeId,
      Parameters.total_discount.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoValue,
      Parameters.currency.name: cabBookingConfirmationState
          .commonOrderDetailBaseResponse?.orderDetail?.currencyCode,
      Parameters.trip_type.name: (cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.vendor.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.securityKey?.providerName,
      Parameters.payment_aggregator.name: '',
      Parameters.coupon.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoCode,
      Parameters.coupon_value.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoValue,
      Parameters.payment_bank.name: '',
      Parameters.payment_gateway.name: '',
      Parameters.terminal.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.tripInfo?.terminal,
      Parameters.page_ref.name: '',
      Parameters.airport_name.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.tripInfo?.airportCode,
      Parameters.rewards_earned.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel
          ?.priceInfo
          ?.loyaltyPoints
          ?.earnedRewardPoints,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.selected_location.name: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.drop?.locationCode ??
              ''
          : cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.pickup?.locationCode ??
              '',
    };

    ClickEvents.cab_booking_cancellation_policy_view.logEvent(parameters: obj);
  }

  /// 34) use  for sending parameters in cab location modification/cab_booking_modification ////
  void sendGAParametersCabBookingModification(
    CabBookingConfirmationState cabBookingConfirmationState,
  ) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cab_booked',
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.user_id.name: userId,
      Parameters.cab_name.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
      Parameters.currency.name: cabBookingConfirmationState
          .commonOrderDetailBaseResponse?.orderDetail?.currencyCode,
      Parameters.vendor.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.securityKey?.providerName,
      Parameters.terminal.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.tripInfo?.terminal,
      Parameters.place_id.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.drop?.placeId,
      Parameters.airport_name.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.tripInfo?.airportCode,
      Parameters.trip_type.name: (cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.cab_status.name:
          cabBookingConfirmationState.cabBookingOrderStatus.name,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.selected_location.name: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.drop?.locationCode ??
              ''
          : cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.pickup?.locationCode ??
              '',
    };
    ClickEvents.cab_booking_modification.logEvent(parameters: obj);
  }

  /// 35) use  for sending parameters in Cab confirmation/cab_booking_download_invoice ////
  void sendGAParametersCabBookingDownloadInvoice(
    CabBookingConfirmationState cabBookingConfirmationState,
  ) {
    final totalAmount = (cabBookingConfirmationState
                .cabOrderDetailResponseModel?.priceInfo?.totalAmount ??
            0) -
        (cabBookingConfirmationState
                .cabOrderDetailResponseModel?.promoDetails?.promoValue ??
            0);

    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cab_booked',
      Parameters.payment_type.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.priceInfo?.paymentMode,
      Parameters.cart_amount.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.priceInfo?.totalAmount,
      Parameters.total_price.name: totalAmount,
      Parameters.purchase_revenue.name: totalAmount,
      Parameters.value.name: totalAmount,
      Parameters.rewards_burned.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel
          ?.priceInfo
          ?.loyaltyPoints
          ?.burnedRewardPoints,
      Parameters.user_id.name: userId,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.cab_name.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
      Parameters.total_discount.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoValue,
      Parameters.transaction_id.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.bookingInfo?.bookingID,
      Parameters.currency.name: cabBookingConfirmationState
          .commonOrderDetailBaseResponse?.orderDetail?.currencyCode,
      Parameters.vendor.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.securityKey?.providerName,
      Parameters.terminal.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.tripInfo?.terminal,
      Parameters.payment_aggregator.name: '',
      Parameters.coupon.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoCode,
      Parameters.payment_bank.name: '',
      Parameters.payment_gateway.name: '',
      Parameters.place_id.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.drop?.placeId,
      Parameters.trip_type.name: (cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.airport_name.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.selected_location.name: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.drop?.locationCode ??
              ''
          : cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.pickup?.locationCode ??
              '',
    };
    ClickEvents.cab_booking_download_invoice.logEvent(parameters: obj);
  }

  /// 36) use  for sending parameters in payment page/purchase
  void sendGAParametersPurchase(
    CabBookingConfirmationState cabBookingConfirmationState,
  ) {
    final totalAmount = (cabBookingConfirmationState
                .cabOrderDetailResponseModel?.priceInfo?.totalAmount ??
            0) -
        (cabBookingConfirmationState
                .cabOrderDetailResponseModel?.promoDetails?.promoValue ??
            0);

    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'booking',
      Parameters.label.name: 'cab_booked',
      Parameters.payment_type.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.priceInfo?.paymentMode,
      Parameters.cart_amount.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.priceInfo?.totalAmount,
      Parameters.total_price.name: totalAmount,
      Parameters.purchase_revenue.name: totalAmount,
      Parameters.value.name: '$totalAmount',
      Parameters.transaction_id.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.bookingInfo?.bookingID,
      Parameters.cab_name.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
      Parameters.user_id.name: userId,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.rewards_burned.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel
          ?.priceInfo
          ?.loyaltyPoints
          ?.burnedRewardPoints,
      Parameters.arrival_station.name: '',
      Parameters.currency.name: cabBookingConfirmationState
          .commonOrderDetailBaseResponse?.orderDetail?.currencyCode,
      Parameters.place_id.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.drop?.placeId,
      Parameters.vendor.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.securityKey?.providerName,
      Parameters.total_discount.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoValue,
      Parameters.coupon.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoCode,
      Parameters.payment_aggregator.name: '',
      Parameters.payment_bank.name: '',
      Parameters.payment_gateway.name: '',
      Parameters.trip_type.name: (cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.terminal.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.tripInfo?.terminal,
      Parameters.airport_name.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.tripInfo?.airportCode,
      Parameters.cab_status.name:
          cabBookingConfirmationState.cabBookingOrderStatus.name,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.selected_location.name: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.drop?.locationCode ??
              ''
          : cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.pickup?.locationCode ??
              '',
    };
    ClickEvents.purchase.logEvent(parameters: obj);
  }

  /// 37) use  for sending parameters in  Cab booking completed/cab_booking_journey_completed
  void sendGAParametersCabBookingJourneyCompleted(
    CabOrderDetailResponseModel? cabOrderDetailResponseModel,
    String? currencyCode,
  ) {
    final totalAmount =
        (cabOrderDetailResponseModel?.priceInfo?.totalAmount ?? 0) -
            (cabOrderDetailResponseModel?.promoDetails?.promoValue ?? 0);

    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabOrderDetailResponseModel?.tripInfo?.bookingDate ?? 0) * 1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'Cab_complete',
      Parameters.payment_type.name:
          cabOrderDetailResponseModel?.priceInfo?.paymentMode,
      Parameters.cart_amount.name:
          cabOrderDetailResponseModel?.priceInfo?.totalAmount,
      Parameters.total_price.name: totalAmount,
      Parameters.purchase_revenue.name: totalAmount,
      Parameters.value.name: totalAmount,
      Parameters.user_id.name: userId,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.rewards_burned.name: cabOrderDetailResponseModel
          ?.priceInfo?.loyaltyPoints?.burnedRewardPoints,
      Parameters.arrival_station.name: '',
      Parameters.cab_name.name:
          cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
      Parameters.trip_type.name:
          (cabOrderDetailResponseModel?.tripInfo?.isRideNow ?? true)
              ? 'NowRide'
              : 'schedule',
      Parameters.currency.name: currencyCode,
      Parameters.place_id.name: cabOrderDetailResponseModel?.drop?.placeId,
      Parameters.vendor.name:
          cabOrderDetailResponseModel?.securityKey?.providerName,
      Parameters.total_discount.name:
          cabOrderDetailResponseModel?.promoDetails?.promoValue,
      Parameters.coupon.name:
          cabOrderDetailResponseModel?.promoDetails?.promoCode,
      Parameters.payment_aggregator.name: '',
      Parameters.payment_bank.name: '',
      Parameters.payment_gateway.name: '',
      Parameters.terminal.name: cabOrderDetailResponseModel?.tripInfo?.terminal,
      Parameters.airport_name.name:
          cabOrderDetailResponseModel?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name:
          cabOrderDetailResponseModel?.tripInfo?.isFromAirport ?? true
              ? 'from_airport'
              : 'to_airport',
      Parameters.selected_location.name:
          cabOrderDetailResponseModel?.tripInfo?.isFromAirport ?? true
              ? cabOrderDetailResponseModel?.drop?.locationCode ?? ''
              : cabOrderDetailResponseModel?.pickup?.locationCode ?? '',
    };
    ClickEvents.cab_booking_journey_completed.logEvent(parameters: obj);
  }

  /// 38) use  for sending parameters in  cab booking 2 mins cancellation/cab_booking_free_cancellation ////
  void sendGAParametersCabBookingFreeCancellation(
    CabBookingConfirmationState cabBookingConfirmationState,
    int start,
  ) {
    final totalAmount = (cabBookingConfirmationState
                .cabOrderDetailResponseModel?.priceInfo?.totalAmount ??
            0) -
        (cabBookingConfirmationState
                .cabOrderDetailResponseModel?.promoDetails?.promoValue ??
            0);

    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cab_cancellation',
      Parameters.payment_type.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.priceInfo?.paymentMode,
      Parameters.cart_amount.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.priceInfo?.totalAmount,
      Parameters.total_price.name: totalAmount,
      Parameters.purchase_revenue.name: totalAmount,
      Parameters.value.name: totalAmount,
      Parameters.user_id.name: userId,
      Parameters.cab_name.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
      Parameters.trip_type.name: (cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.rewards_burned.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel
          ?.priceInfo
          ?.loyaltyPoints
          ?.burnedRewardPoints,
      Parameters.arrival_station.name: '',
      Parameters.cancel_duration.name: totalTime - start,
      Parameters.currency.name: cabBookingConfirmationState
          .commonOrderDetailBaseResponse?.orderDetail?.currencyCode,
      Parameters.vendor.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.securityKey?.providerName,
      Parameters.total_discount.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoValue,
      Parameters.coupon_value.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoValue,
      Parameters.coupon.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.promoDetails?.promoCode,
      Parameters.payment_aggregator.name: '',
      Parameters.payment_bank.name: '',
      Parameters.payment_gateway.name: '',
      Parameters.place_id.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.drop?.placeId,
      Parameters.terminal.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.tripInfo?.terminal,
      Parameters.airport_name.name: cabBookingConfirmationState
          .cabOrderDetailResponseModel?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.selected_location.name: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.tripInfo?.isFromAirport ??
              true
          ? cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.drop?.locationCode ??
              ''
          : cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.pickup?.locationCode ??
              '',
    };
    ClickEvents.cab_booking_free_cancellation.logEvent(parameters: obj);
  }

  /// 39) use  for sending parameters in All pages/cab_booking_back_click
  void sendGAParametersCabBookingBackClick() {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'booking',
      Parameters.label.name: '',
      Parameters.payment_type.name: '',
      Parameters.amount.name: '',
      Parameters.user_id.name: userId,
      Parameters.date_time.name: '',
      Parameters.rewards_burned.name: '',
      Parameters.arrival_station.name: '',
      Parameters.payment_type.name: '',
      Parameters.currency.name: '',
      Parameters.vendor.name: '',
      Parameters.total_discount.name: '',
      Parameters.coupon.name: '',
      Parameters.payment_aggregator.name: '',
      Parameters.payment_bank.name: '',
      Parameters.payment_gateway.name: '',
      Parameters.place_id.name: '',
      Parameters.terminal.name: '',
      Parameters.airport_name.name: '',
    };
    ClickEvents.cab_booking_back_click.logEvent(parameters: obj);
  }

  /// 40) use  for sending parameters in Cab Selection/cab_booking_edit_location ////
  void sendGAParametersCabBookingEditLocation(
    CabsSrpState cabSrpState,
  ) {
    final dateTime = cabSrpState.selectedDate ?? DateTime.now();
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'booking',
      Parameters.label.name:
          cabSrpState.selectedCabItinerary?.vehicleCategory?.vehicleType,
      Parameters.place_id.name:
          cabSrpState.cabSrpNavigateModel?.locationAddressDetailModel?.placeId,
      Parameters.selected_location.name: cabSrpState
          .cabSrpNavigateModel?.locationAddressDetailModel?.formattedAddress,
      Parameters.vendor.name: cabSrpState.selectedProviderInfo?.providerName,
      Parameters.currency.name: cabSrpState.currencyCode,
      Parameters.value.name:
          cabSrpState.selectedCabItinerary?.priceInfo?.totalAmount,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.user_id.name: userId,
      Parameters.airport_name.name: cabSrpState
          .cabSrpNavigateModel?.airportTerminalDetailModel?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.trip_type.name:
          cabSrpState.cabSrpNavigateModel?.selectedDate != null
              ? 'NowRide'
              : 'schedule',
      Parameters.travel_type.name:
          cabSrpState.cabSrpNavigateModel?.isFromAirport ?? true
              ? 'from_airport'
              : 'to_airport',
    };
    ClickEvents.cab_booking_edit_location.logEvent(parameters: obj);
  }

  /// 41) use  for sending parameters in cab location modification/cab_booking_login
  void sendGAParametersCabBookingLogin(
    CabBookingDetailState cabBookingDetailState,
  ) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabBookingDetailState.cabCartDetailResponseModel?.cartDetail?.tripInfo
                  ?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cab_booking',
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.cab_name.name: cabBookingDetailState
          .cabCartDetailResponseModel?.cartDetail?.vehicleDetails?.vehicleType,
      Parameters.user_id.name: userId,
      Parameters.place_id.name: cabBookingDetailState
          .cabCartDetailResponseModel?.cartDetail?.drop?.placeId,
      Parameters.currency.name:
          cabBookingDetailState.cabCartDetailResponseModel?.currencyCode,
      Parameters.vendor.name: cabBookingDetailState
          .cabCartDetailResponseModel?.cartDetail?.securityKey?.providerName,
      Parameters.terminal.name: cabBookingDetailState
          .cabCartDetailResponseModel?.cartDetail?.tripInfo?.terminal,
      Parameters.trip_type.name: (cabBookingDetailState
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.airport_name.name: cabBookingDetailState
          .cabCartDetailResponseModel?.cartDetail?.tripInfo?.airportCode,
      Parameters.cab_status.name: cabBookingDetailState
          .cabCartDetailResponseModel?.cartDetail?.bookingInfo?.status,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name: cabBookingDetailState
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.selected_location.name: cabBookingDetailState
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isFromAirport ??
              true
          ? cabBookingDetailState
                  .cabCartDetailResponseModel?.cartDetail?.drop?.locationCode ??
              ''
          : cabBookingDetailState.cabCartDetailResponseModel?.cartDetail?.pickup
                  ?.locationCode ??
              '',
    };

    ClickEvents.cab_booking_login.logEvent(parameters: obj);
  }

  /// 42) use  for sending parameters in Cab Selection/add_to_cart
  void sendGAParametersAddToCart(
    CabsSrpState cabsSrpState,
    int? expandedPosition,
  ) {
    final dateTime = cabsSrpState.selectedDate ?? DateTime.now();
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.airport_name.name: cabsSrpState
          .cabSrpNavigateModel?.airportTerminalDetailModel?.airportCode,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.selected_location.name: cabsSrpState
          .cabSrpNavigateModel?.locationAddressDetailModel?.formattedAddress,
      Parameters.cart_amount.name:
          cabsSrpState.selectedCabItinerary?.priceInfo?.totalAmount,
      Parameters.purchase_revenue.name:
          cabsSrpState.selectedCabItinerary?.priceInfo?.totalAmount,
      Parameters.total_price.name:
          cabsSrpState.selectedCabItinerary?.priceInfo?.totalAmount,
      Parameters.currency.name: cabsSrpState.currencyCode,
      Parameters.cab_name.name:
          cabsSrpState.selectedCabItinerary?.vehicleCategory?.vehicleType,
      Parameters.value.name:
          cabsSrpState.selectedCabItinerary?.priceInfo?.totalAmount,
      Parameters.place_id.name:
          cabsSrpState.cabSrpNavigateModel?.locationAddressDetailModel?.placeId,
      Parameters.items.name: cabsSrpState.selectedProviderInfo?.providerName,
      Parameters.item_id.name:
          '${cabsSrpState.selectedProviderInfo?.providerName}-${cabsSrpState.selectedCabItinerary?.vehicleCategory?.vehicleType}',
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name:
          cabsSrpState.cabSrpNavigateModel?.isFromAirport ?? true
              ? 'from_airport'
              : 'to_airport',
    };

    final List<AnalyticsEventItem> dataOfEcommerce = <AnalyticsEventItem>[
      AnalyticsEventItem(
        itemName:
            cabsSrpState.selectedCabItinerary?.vehicleCategory?.vehicleType,
        itemBrand: cabsSrpState.selectedProviderInfo?.providerName,
        price: cabsSrpState.selectedCabItinerary?.priceInfo?.totalAmount,
        discount: 0,
        index: expandedPosition,
      ),
    ];
    ClickEvents.add_to_cart
        .logAnalyticsEventItem(parameters: obj, items: dataOfEcommerce);
  }

  /// 43) use  for sending parameters cab Booking view Order
  void sendGAParametersCabBookingViewOrder(
    MyBookingListItem? currentOrdersList,
  ) {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: currentOrdersList?.status,
      Parameters.login_status.name: logInStatus,
    };
    ClickEvents.cab_booking_view_order.logEvent(parameters: obj);
  }

  /// 44) use  for sending parameters in cab_booking_payment_retry
  void sendGAParametersCabBookingPaymentRetry(
    PaymentMethodState paymentMethodViewModel,
  ) {
    final totalAmount = (paymentMethodViewModel.cabCartDetailResponseModel
                ?.cartDetail?.priceInfo?.totalAmount ??
            0) -
        (paymentMethodViewModel.cabCartDetailResponseModel?.cartDetail
                ?.promoDetails?.promoValue ??
            0);
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (paymentMethodViewModel.cabCartDetailResponseModel?.cartDetail?.tripInfo
                  ?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'booking_retry',
      Parameters.label.name: 'cab_booking_retry',
      Parameters.payment_type.name:
          paymentMethodViewModel.payNowRequest?.paymentMode,
      Parameters.cart_amount.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.priceInfo?.totalAmount,
      Parameters.cab_name.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.vehicleDetails?.vehicleType,
      Parameters.total_price.name: totalAmount,
      Parameters.purchase_revenue.name: totalAmount,
      Parameters.value.name: totalAmount,
      Parameters.value.name: totalAmount,
      Parameters.rewards_burned.name: paymentMethodViewModel
          .cabCartDetailResponseModel
          ?.cartDetail
          ?.priceInfo
          ?.loyaltyPoints
          ?.burnedRewardPoints,
      Parameters.trip_type.name: paymentMethodViewModel
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isRideNow ??
              true
          ? 'NowRide'
          : 'schedule',
      Parameters.transaction_id.name: paymentMethodViewModel.orderId,
      Parameters.currency.name:
          paymentMethodViewModel.cabCartDetailResponseModel?.currencyCode,
      Parameters.user_id.name: userId,
      Parameters.total_discount.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoValue,
      Parameters.place_id.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.drop?.placeId,
      Parameters.vendor.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.securityKey?.providerName,
      Parameters.coupon.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoCode,
      Parameters.coupon_value.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoValue,
      Parameters.login_status.name: logInStatus,
      Parameters.trip_type.name: (paymentMethodViewModel
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.terminal.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.tripInfo?.terminal,
      Parameters.airport_name.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.tripInfo?.airportCode,
      Parameters.travel_type.name: paymentMethodViewModel
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.selected_location.name: paymentMethodViewModel
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isFromAirport ??
              true
          ? paymentMethodViewModel
                  .cabCartDetailResponseModel?.cartDetail?.drop?.locationCode ??
              ''
          : paymentMethodViewModel.cabCartDetailResponseModel?.cartDetail
                  ?.pickup?.locationCode ??
              '',
    };
    ClickEvents.cab_booking_payment_retry.logEvent(parameters: obj);
  }

  /// 45) use  for sending parameters in cab_booking_payment_try_other
  void sendGAParametersCabBookingPaymentTryOther(
    PaymentMethodState paymentMethodViewModel,
  ) {
    final totalAmount = (paymentMethodViewModel.cabCartDetailResponseModel
                ?.cartDetail?.priceInfo?.totalAmount ??
            0) -
        (paymentMethodViewModel.cabCartDetailResponseModel?.cartDetail
                ?.promoDetails?.promoValue ??
            0);
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (paymentMethodViewModel.cabCartDetailResponseModel?.cartDetail?.tripInfo
                  ?.bookingDate ??
              0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'booking_retry',
      Parameters.label.name: 'cab_booking_retry',
      Parameters.payment_type.name:
          paymentMethodViewModel.payNowRequest?.paymentMode,
      Parameters.cab_name.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.vehicleDetails?.vehicleType,
      Parameters.cart_amount.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.priceInfo?.totalAmount,
      Parameters.trip_type.name: (paymentMethodViewModel
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.total_price.name: totalAmount,
      Parameters.transaction_id.name: paymentMethodViewModel.orderId,
      Parameters.currency.name:
          paymentMethodViewModel.cabCartDetailResponseModel?.currencyCode,
      Parameters.user_id.name: userId,
      Parameters.total_discount.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoValue,
      Parameters.place_id.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.drop?.placeId,
      Parameters.purchase_revenue.name: totalAmount,
      Parameters.value.name: totalAmount,
      Parameters.vendor.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.securityKey?.providerName,
      Parameters.coupon.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoCode,
      Parameters.coupon_value.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoValue,
      Parameters.login_status.name: logInStatus,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.terminal.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.tripInfo?.terminal,
      Parameters.trip_type.name: (paymentMethodViewModel
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isRideNow ??
              true)
          ? 'NowRide'
          : 'schedule',
      Parameters.airport_name.name: paymentMethodViewModel
          .cabCartDetailResponseModel?.cartDetail?.tripInfo?.airportCode,
      Parameters.travel_type.name: paymentMethodViewModel
                  .cabCartDetailResponseModel
                  ?.cartDetail
                  ?.tripInfo
                  ?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
    };
    ClickEvents.cab_booking_payment_try_other.logEvent(parameters: obj);
  }

  /// 46) use  for sending parameters in cart_view
  void sendGAParametersViewCart(
    CabsSrpState cabsSrpState,
  ) {
    final dateTime = cabsSrpState.selectedDate ?? DateTime.now();
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.airport_name.name: cabsSrpState
          .cabSrpNavigateModel?.airportTerminalDetailModel?.airportCode,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.total_price.name:
          '${cabsSrpState.selectedCabItinerary?.priceInfo?.totalAmount}',
      Parameters.value.name:
          '${cabsSrpState.selectedCabItinerary?.priceInfo?.totalAmount}',
      Parameters.purchase_revenue.name:
          '${cabsSrpState.selectedCabItinerary?.priceInfo?.totalAmount}',
      Parameters.cart_amount.name:
          '${cabsSrpState.selectedCabItinerary?.priceInfo?.totalAmount}',
      Parameters.currency.name: cabsSrpState.currencyCode,
      Parameters.selected_location.name: cabsSrpState
          .cabSrpNavigateModel?.locationAddressDetailModel?.formattedAddress,
      Parameters.login_status.name: logInStatus,
      Parameters.place_id.name:
          cabsSrpState.cabSrpNavigateModel?.locationAddressDetailModel?.placeId,
      Parameters.travel_type.name:
          cabsSrpState.cabSrpNavigateModel?.isFromAirport ?? true
              ? 'from_airport'
              : 'to_airport',
    };
    final List<AnalyticsEventItem> dataOfEcommerce = <AnalyticsEventItem>[];
    for (int vendorIndex = 0;
        vendorIndex < (cabsSrpState.cabItineraries.length);
        vendorIndex++) {
      for (int index = 0;
          index <
              (cabsSrpState.cabItineraries[vendorIndex].cabItinerary?.length ??
                  0);
          index++) {
        dataOfEcommerce.add(
          AnalyticsEventItem(
            itemName: cabsSrpState.cabItineraries[vendorIndex]
                .cabItinerary?[index].vehicleCategory?.vehicleType,
            itemBrand: cabsSrpState
                .cabItineraries[vendorIndex].securityKey?.providerName,
            price: cabsSrpState.cabItineraries[vendorIndex].cabItinerary?[index]
                .priceInfo?.totalAmount,
            itemId:
                '${cabsSrpState.cabItineraries[vendorIndex].cabItinerary?[index].vehicleCategory?.vehicleType}_${cabsSrpState.cabItineraries[vendorIndex].securityKey?.providerName}',
          ),
        );
      }
    }
    ClickEvents.view_cart
        .logAnalyticsEventItem(parameters: obj, items: dataOfEcommerce);
  }

  /// 47) use  for sending parameters when user Click on SearchCabs Button
  void sendGACabBookingSearchCabs(CabBookingState cabBookingState) {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'booking',
      Parameters.travel_type.name:
          cabBookingState.isFromAirport ? 'from_airport' : 'to_airport',
      Parameters.selected_location.name:
          cabBookingState.selectedAddressDetailModel?.description ?? '',
      Parameters.airport_name.name:
          cabBookingState.selectedAirportTerminalDetailModel?.airportName ?? '',
      Parameters.date_time.name: DateFormat(Constant.dateFormat24)
          .format(cabBookingState.selectedDate ?? DateTime.now()),
      Parameters.trip_type.name:
          cabBookingState.selectedDate != null ? 'Schedule' : 'NowRide',
      Parameters.login_status.name: logInStatus,
    };
    ClickEvents.cab_booking_search.logEvent(parameters: obj);
  }

  /// 48) use  for sending parameters when User Search on Drop And Pickup TextBox and geting no Result
  void sendGACabBookingPickupDrop(
    SelectDestinationState selectDestinationState,
  ) {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'booking',
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name: selectDestinationState
                  .selectDestinationNavigateModel?.isFromAirport ??
              true
          ? 'from_airport'
          : 'to_airport',
      Parameters.selected_location.name: selectDestinationState
              .selectDestinationNavigateModel
              ?.selectedLocationDetailModel
              ?.description ??
          '',
      Parameters.date_time.name: DateFormat(Constant.dateFormat24).format(
        selectDestinationState.selectDestinationNavigateModel?.selectedDate ??
            DateTime.now(),
      ),
      Parameters.trip_type.name:
          selectDestinationState.selectDestinationNavigateModel?.selectedDate !=
                  null
              ? 'Schedule'
              : 'NowRide',
      Parameters.airport_name.name: selectDestinationState
              .selectDestinationNavigateModel
              ?.airportTerminalDetailModel
              ?.airportName ??
          '',
      Parameters.error_text.name: 'destination_error',
    };
    ClickEvents.cab_booking_drop_location_search.logEvent(parameters: obj);
  }

  /// 49) use  for sending parameters when User Search on AirportSearchBox and geting no Result
  void sendGACabBookingAirportSearch(
    SelectDestinationNavigateModel? selectDestinationNavigateModel,
  ) {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'booking',
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name:
          selectDestinationNavigateModel?.isFromAirport ?? true
              ? 'from_airport'
              : 'to_airport',
      Parameters.selected_location.name: selectDestinationNavigateModel
              ?.selectedLocationDetailModel?.description ??
          '',
      Parameters.date_time.name: DateFormat(Constant.dateFormat24).format(
        selectDestinationNavigateModel?.selectedDate ?? DateTime.now(),
      ),
      Parameters.trip_type.name:
          selectDestinationNavigateModel?.selectedDate != null
              ? 'Schedule'
              : 'NowRide',
      Parameters.airport_name.name: selectDestinationNavigateModel
              ?.airportTerminalDetailModel?.airportName ??
          '',
      Parameters.error_text.name: 'No city or airport found.',
    };
    ClickEvents.cab_booking_airport_search.logEvent(parameters: obj);
  }

  /// 50) use  for sending parameters when User  submit detail on Traveller Detail Page
  void sendGACabBookingTravellerPageOnSubmit(
    CabCartDetailResponseModel? cabCartDetailResponseModel,
  ) {
    final totalAmount =
        (cabCartDetailResponseModel?.cartDetail?.priceInfo?.totalAmount ?? 0) -
            (cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoValue ??
                0);
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabCartDetailResponseModel?.cartDetail?.tripInfo?.bookingDate ?? 0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'booking',
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name:
          cabCartDetailResponseModel?.cartDetail?.tripInfo?.isFromAirport ??
                  true
              ? 'from_airport'
              : 'to_airport',
      Parameters.selected_location.name: cabCartDetailResponseModel
                  ?.cartDetail?.tripInfo?.isFromAirport ??
              true
          ? cabCartDetailResponseModel?.cartDetail?.drop?.locationCode ?? ''
          : cabCartDetailResponseModel?.cartDetail?.pickup?.locationCode ?? '',
      Parameters.date_time.name: dateTime,
      Parameters.trip_type.name:
          cabCartDetailResponseModel?.cartDetail?.tripInfo?.isRideNow ?? false
              ? 'NowRide'
              : 'Schedule',
      Parameters.airport_name.name:
          cabCartDetailResponseModel?.cartDetail?.tripInfo?.airportCode,
      Parameters.cart_amount.name:
          cabCartDetailResponseModel?.cartDetail?.priceInfo?.totalAmount,
      Parameters.total_price.name: totalAmount,
      Parameters.purchase_revenue.name: totalAmount,
      Parameters.value.name: totalAmount,
      Parameters.rewards_earned.name: cabCartDetailResponseModel
          ?.cartDetail?.priceInfo?.loyaltyPoints?.earnedRewardPoints,
      Parameters.vendor.name:
          cabCartDetailResponseModel?.cartDetail?.securityKey?.providerName,
      Parameters.currency.name:
          cabCartDetailResponseModel?.cartDetail?.priceInfo?.currencyCode,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.user_id.name: userId,
      Parameters.place_id.name:
          cabCartDetailResponseModel?.cartDetail?.drop?.placeId,
      Parameters.coupon_value.name:
          cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoValue,
      Parameters.coupon.name:
          cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoCode,
    };
    ClickEvents.cab_booking_traveller_details_submit.logEvent(parameters: obj);
  }

  /// 51) use  for sending parameters in apply coupon/ cab_booking_coupon_applied_successful ////
  void sendGAParametersApplyCouponStart(
    CabCartDetailResponseModel? cabCartDetailResponseModel,
  ) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      (cabCartDetailResponseModel?.cartDetail?.tripInfo?.bookingDate ?? 0) *
          1000,
    );
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cab_booking_coupon',
      Parameters.trip_type.name:
          (cabCartDetailResponseModel?.cartDetail?.tripInfo?.isRideNow ?? true)
              ? 'NowRide'
              : 'schedule',
      Parameters.cab_name.name:
          cabCartDetailResponseModel?.cartDetail?.vehicleDetails?.vehicleType,
      Parameters.coupon.name:
          cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoCode,
      Parameters.currency.name:
          cabCartDetailResponseModel?.cartDetail?.priceInfo?.currencyCode,
      Parameters.place_id.name:
          cabCartDetailResponseModel?.cartDetail?.drop?.placeId,
      Parameters.vendor.name:
          cabCartDetailResponseModel?.cartDetail?.securityKey?.providerName,
      Parameters.coupon_value.name:
          cabCartDetailResponseModel?.cartDetail?.promoDetails?.promoValue,
      Parameters.date_time.name:
          DateFormat(Constant.dateFormat24).format(dateTime),
      Parameters.user_id.name: userId,
      Parameters.terminal.name:
          cabCartDetailResponseModel?.cartDetail?.tripInfo?.terminal,
      Parameters.airport_name.name:
          cabCartDetailResponseModel?.cartDetail?.tripInfo?.airportCode,
      Parameters.login_status.name: logInStatus,
      Parameters.travel_type.name:
          cabCartDetailResponseModel?.cartDetail?.tripInfo?.isFromAirport ??
                  true
              ? 'from_airport'
              : 'to_airport',
    };
    ClickEvents.cab_booking_apply_coupon_start.logEvent(parameters: obj);
  }

  /// 52) use  for sending parameters when cab not available at this moment error
  void sendGACabNotAvailable(
    CabSrpNavigateModel? cabSrpNavigateModel,
    DateTime? selectedDate,
  ) {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'booking',
      Parameters.travel_type.name: cabSrpNavigateModel?.isFromAirport ?? true
          ? 'from_airport'
          : 'to_airport',
      Parameters.selected_location.name:
          cabSrpNavigateModel?.locationAddressDetailModel?.formattedAddress ??
              '',
      Parameters.airport_name.name:
          cabSrpNavigateModel?.airportTerminalDetailModel?.airportName ?? '',
      Parameters.date_time.name: DateFormat(Constant.dateFormat24)
          .format(selectedDate ?? DateTime.now()),
      Parameters.trip_type.name: selectedDate != null ? 'Schedule' : 'NowRide',
      Parameters.login_status.name: logInStatus,
      Parameters.error_text.name: 'Cab not available at this moment',
    };
    ClickEvents.cab_booking_cabs_not_available.logEvent(parameters: obj);
  }

  /// login and otp verification GA Events
  void signInAnalyticsData() {
    final signInObject = <String, Object?>{
      Parameters.category.name: 'cab_booking',
      Parameters.sub_category.name: 'sign_in',
    };
    ClickEvents.login_submit.logEvent(parameters: signInObject);
  }

  /// login and otp verification GA Events
  void otpSuccessAnalyticsData({
    required String type,
    required String label,
    bool? signInFromPopup,
  }) {
    final isSignInFromPopup = signInFromPopup ?? false;
    final signInObject = <String, Object?>{
      Parameters.category.name:
          isSignInFromPopup ? 'home_screen_popup' : 'cab_booking',
      Parameters.sub_category.name: 'sign_in',
      Parameters.type.name: type,
      Parameters.label.name: label,
    };
    ClickEvents.otp_verification.logEvent(parameters: signInObject);
  }

  /// login and otp verification GA Events
  void otpVerifiedSuccessAnalyticsData(
    String type,
    String label, {
    bool isRegistered = false,
    bool? signInFromPopup,
  }) {
    final isSignInFromPopup = signInFromPopup ?? false;
    final signInObject = <String, Object?>{
      Parameters.category.name:
          isSignInFromPopup ? 'home_screen_popup' : 'cab_booking',
      Parameters.sub_category.name: 'sign_in',
      Parameters.is_registered.name: isRegistered,
      Parameters.label.name: label,
      Parameters.type.name: type,
    };
    ClickEvents.otp_verification_success.logEvent(parameters: signInObject);
  }

  /// login and otp verification GA Events
  void loginAndLogoutSuccessfulAnalyticsData(
    String userId, {
    bool isRegistered = true,
    required String type,
    required String label,
    bool? signInFromPopup,
  }) {
    final isSignInFromPopup = signInFromPopup ?? false;
    final signInObject = <String, Object?>{
      Parameters.category.name:
          isSignInFromPopup ? 'home_screen_popup' : 'cab_booking',
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
}
