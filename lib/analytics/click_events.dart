/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/analytics.dart';
import 'package:adani_airport_mobile/analytics/transposition.dart';
import 'package:adani_airport_mobile/modules/session/models/profile/profile_model.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/apps_flyer/apps_flyer_manager.dart';
import 'package:adani_mobile_utility/app_utils/analytics/mixpanel.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:webengage_flutter/webengage_flutter.dart';

///This class contains all the related to click events that
///we are going to register on analytics.
// ignore_for_file: constant_identifier_names

enum ClickEvents {
  ///Identify User (Not an Actual Event)
  identify_user,

  /// Deep Link Events
  deeplink_select,
  deeplink_success,
  deeplink_fail,

  ///Event Types
  click,
  book_flight_search,
  book_flight_search_modify,
  book_flight_select,
  book_flight_baggage_cancellation_policy_viewed,
  book_flight_review,
  login_start,
  login_submit,
  login,
  login_fail,
  otp_verification,
  otp_verification_success,
  otp_verification_options,
  otp_verification_fail,
  otp_resend,
  otp_more_options,
  book_flight_add_payment_info,
  book_flight_coupon_code_removed,
  book_flight_coupon_applied,
  book_flight_summary_details,
  book_flight_payment_start,
  book_flight_payment_submit,
  book_flight_payment_submit_fail,
  book_flight_payment_success,
  book_flight_payment_fail,
  book_flight_success,
  book_flight_fail,
  book_flight_failure_try_other_method,
  book_flight_failure_retry,
  book_flight_traveller_detail_submit,
  cancel_flight_start,
  book_flight_cancellation_passenger_selection,
  book_flight_cancellation_reason,
  book_flight_confirm_cancellation,
  book_flight_confirm_cancellation_popup,
  book_flight_cancellation_success,
  view_more_options,
  book_pranaam_coupon_click,
  profile_update,
  file_download,
  email_itinerary_start,
  email_itinerary_complete,
  sign_up,
  change_flight,
  book_flight_apply_coupon_click,
  flight_not_available,

  /// DutyFree
  select_item,
  add_to_cart,
  remove_from_cart,
  cart_updated,
  remove_from_cart_request,
  view_cart,
  begin_checkout,
  view_item_list,
  sort_select,
  filter_select,
  duty_free_age_confirmation,
  purchase,
  view_item,
  filter_reset,
  duty_free_slick_list_selection,
  duty_free_purchase_success,
  duty_free_payment_fail,
  duty_free_add_details,
  duty_free_coupon,
  duty_free_apply_coupon_click,
  clear_cart,

  //cancellation
  duty_free_order_cancellation_start,
  duty_free_cancellation_reason,
  duty_free_confirm_cancellation_popup,
  duty_free_cancellation_success,
  //reschedule
  duty_free_reschedule_start,
  duty_free_reschedule_submit,
  duty_free_reschedule_submit_fail,
  duty_free_reschedule_success,
  duty_free_reschedule_fail,
  duty_free_coupon_applied,
  duty_free_coupon_removed,

  ///FIDS
  flight_status_search,
  flight_status_search_modify,
  select_refresh,
  select_flight_detail,
  add_flight,
  remove_flight_initiated,
  remove_flight_confirm,
  remove_flight_cancel,
  saved_flight,
  check_flight,
  saved_flight_option_select,
  duty_free_checkout_fail,
  duty_free_other_services,

  /// more
  view_profile_icon,
  view_profile_select,
  logout_popup_select,
  logout,
  edit_profile,
  view_order_and_bookings,
  select_order_and_bookings,
  select_start_exploring,
  select_refer_and_invite,
  select_back_to_order_and_bookings,
  chat_click,
  verify_email,
  otp_verification_submit,
  edit_email,
  submit_email,
  submit_email_success,
  submit_email_fail,
  verify_email_success,
  email_change,
  email_change_success,

  /// Feedback
  feedback_start,
  feedback_submit,
  feedback_submit_success,
  feedback_submit_fail,

  /// Offer and Discount
  select_offers_discount_tab,
  offers_coupon_code_error,
  offers_coupon_apply,
  offers_book_now_select,
  view_offers_tnc,
  book_offer_popup,
  view_booking,

  ///Adani Rewards
  view_all_loyalty_rewards,
  view_reward_points_tab,
  view_pending_rewards_tab,
  view_reward_history,
  rewards_joins_now,
  view_banner,
  view_see_all,
  view_faq,
  duty_free_retry_payment,
  duty_free_other_payment,

  ///Pranaam UpCell
  cross_sell_banner_select,

  /// cab Booking
  cab_booking_destination_search,
  cab_booking_video_played,
  cab_booking_lp_cancellation_policy,
  cab_booking_terms_and_condtitions,
  cab_booking_destination_select,
  cab_booking_location_not_found,
  cab_booking_change_drop_location,
  cab_booking_select_package,
  cab_booking_now,
  cab_booking_scheduled,
  cab_booking_reset_schedule,
  cab_booking_schedule_initiated,
  cab_booking_schedule_select,
  cab_booking_offers_view,
  cab_booking_rewards_view,
  cab_booking_select_coupon,
  cab_booking_coupon_applied_successful,
  cab_booking_details,
  cab_booking_coupon_failed,
  cab_book_payment_submit,
  cab_booking_confirmation,
  cab_booking_call_driver,
  cab_booking_bottom_pannel_select,
  cab_booking_success,
  cab_booking_pending,
  cab_booking_failed,
  cab_booking_cancel_button,
  cab_booking_cancellation_reason,
  cab_booking_cancellation_reason_text,
  cab_booking_cancellation_confirmed,
  cab_booking_track_location,
  cab_booking_sos_page,
  cab_booking_sos_page_called_police,
  cab_booking_sos_page_alert_carzonrent,
  cab_booking_share,
  cab_booking_cancellation_policy_view,
  cab_booking_top_navigation_interaction,
  cab_booking_modification,
  cab_booking_download_invoice,
  cab_booking_journey_completed,
  cab_booking_free_cancellation,
  cab_booking_back_click,
  cab_booking_edit_location,
  cab_booking_login,
  cab_booking_view_status,
  cab_booking_view_order,
  cab_booking_payment_retry,
  cab_booking_payment_try_other,
  cart_view,
  cab_booking_search,
  cab_booking_drop_location_search,
  cab_booking_airport_search,
  cab_booking_coupon_removed,
  cab_booking_traveller_details_submit,
  cab_booking_apply_coupon_start,
  cab_booking_cabs_not_available,

  /// pranaam events
  book_pranaam_service_unavailable,
  book_pranaam_start,
  book_pranaam_error,
  book_pranaam_modify,
  book_pranaam_select_package,
  book_pranaam_coupon,
  book_pranaam_coupon_applied,
  book_pranaam_remove_from_cart_start,
  book_pranaam_coupon_remove_from_cart_start,
  book_pranaam_coupon_removed,
  book_pranaam_coupon_remove_start,
  book_pranaam_services_unavailable,
  book_pranaam_back_to_shopping,
  book_pranaam_add_on,
  popup_display,
  book_pranaam_add_traveller_details,
  book_pranaam_payment_submit,
  book_pranaam_payment_fail,
  help_and_support,
  view_help_and_support,
  order_and_booking_item_select,
  order_and_booking_menu_select,
  cancel_order_begin,
  cancel_order_complete,
  book_pranaam_retry_other_payment_method,
  book_pranaam_retry_payment,
  add_payment_info,
  rewards_tool_tip,
  book_pranaam_cancel_order_begin,
  book_pranaam_cancel_order_confirm,
  book_pranaam_cancel_order_complete,
  book_pranaam_cancel_order_fail,
  book_pranaam_success,
  book_pranaam_retry_other_payment_bank,
  cvv_tool_tip,
  tap_to_salute,
  book_pranaam_reschedule_start,
  book_pranaam_reschedule_submit,
  book_pranaam_reschedule_confirm,
  book_pranaam_reschedule_success,
  book_pranaam_upgrade_start,
  add_to_wallet,

  ///StandAloneEvents
  book_porter_select,
  remove_from_cart_start,
  porter_cart_clean,
  book_porter_service_unavailable,
  book_porter_add_guest_detail,
  book_porter_payment_submit,
  book_porter_payment_success,
  book_porter_payment_retry,
  book_porter_payment_try_other,
  book_porter_payment_fail,
  book_porter_fail,
  book_porter_success,

  ///Offer Banner
  view_popup_banner,
  view_popup_banner_dismiss,
}

/// Events For home widgets and Airports selection
enum HomeAndAirportSelectionClickEvents {
  airport_selection,
  lob_selection,
  view_banner,
  view_bottom_tiles,
}

/// Parameters For home widgets and Airports selection
enum HomeAndAirportSelectionParameters {
  category,
  sub_category,
  business_unit,
  label,
  banner_category,
}

enum Parameters {
  //common param
  category,
  sub_category,
  is_registered,

  //airport param
  trip_type,
  travel_type,
  booking_class,
  departure_station,
  arrival_station,
  market,
  departure_date,
  departure_date_with_iso,
  return_date,
  return_date_with_iso,
  arrival_datetime_with_iso,
  return_arrival_datetime_with_iso,
  departure_datetime,
  arrival_datetime,
  return_arrival_datetime,
  arrival_date,
  return_arrival_date,
  return_datetime,
  round_trip_departure_time,
  round_trip_arrival_time,
  pax_count,
  child_count,
  infant_count,
  outbound_airline,
  inbound_airline,
  outbound_price,
  inbound_price,
  outbound_total_travel_time,
  inbound_total_travel_time,
  outbound_layover_time,
  inbound_layover_time,
  outbound_stops,
  inbound_stops,
  adult_price,
  child_price,
  total_price,
  cart_amount,
  selected_filters,
  gst_flag,
  pax_title,
  pax_age,
  payment_type,
  payment_bank,
  error_text,
  attempt_count,
  user_id,
  payment_gateway,
  payment_aggregator,
  value,
  coupon,
  label,
  cancel_reason,
  seats_left,
  insurance_opt,
  insurance_price,
  purchase_revenue,
  booking_id,
  convenience_fee,
  zero_cancellation_opt,
  zero_cancellation_amount,
  af_currency,
  af_revenue,

  ///Feedback
  source,
  business_unit,
  issue_type,

//duty free param
  page_type,
  currency,
  item_category,
  item_category2,
  item_total,
  item_name,
  item_id,
  item_brand,
  price,
  quantity,
  offer_price,
  amount_total,
  discount,
  country,
  click_text,
  page_path,
  user_type,
  cart_item,
  items,
  passenger_count,
  type,
  selection_type,
  product_category,
  station,
  date,
  airline,
  flight_number,
  terminal,
  scheduled_time,
  status,
  baggage_belt,
  search_text,
  rescheduled_time,
  rescheduled_flight_number,
  rescheduled_date,
  item_id_list,
  item_name_list,
  pick_up_time,
  estimated_time,
  departure_gate,
  check_in_row,
  airport_name,

  ///Adani Rewards
  rewards_earned,
  faq_category,
  banner_category,
  pick_up_date,
  picked_date,
  transaction_id,
  order_id,
  affiliation,
  shipping,
  tax,
  rewards_multiplier,
  rewards_burned,
  nationality,
  cart_items,
  total_discount,
  duty_free_purchase_success,
  service_select,
  select_airport,

  ///profile param
  date_of_birth,
  count,
  remove_item_quantity,
  error_code,
  coupon_value,
  coupon_unit,
  filter_category,
  gender,

  ///deeplink
  medium,
  campaign_name,
  destination,
  deeplink,

  ///Cab Booking
  date_time,
  selected_location,
  origin_pincode,
  destination_pincode,
  place_id,
  latlan,
  vendor,
  amount,
  location_id,
  rewards_returned,
  page_ref,
  cab_status,
  cancel_duration,
  item_list_id,
  item_list_name,
  item_variant,
  items_index,
  login_status,
  total_amount,
  cab_name,

  ///Pranaam
  add_on,
  add_on_name,
  add_on_price,
  adult_count,
  arrival_reschedule_date,
  arrival_reschedule_flight_number,
  arrival_scheduled_time,
  arrival_service_time,
  arrival_time,
  booking_type,
  cancel_count,
  coupon_code,
  departure_reschedule_date,
  departure_reschedule_flight_number,
  departure_scheduled_time,
  departure_service_time,
  departure_time,
  error_type,
  inbound_arrival_station,
  inbound_departure_station,
  inbound_flight_number,
  outbound_flight_number,
  package,
  package_price,
  payment_method,
  porter_price,
  reward_earned,
  reward_points,
  scheduled_date,
  sector_type,
  transaction_id1,
  transit_airline,
  transit_at,
  transit_date,
  transit_flight,
  transit_reschedule_date,
  transit_reschedule_flight_number,
  transit_scheduled_time,
  transit_service_time,
  traveller_country,
  country_code,
  group_booking,
  return_time,
  express_type,
  express_price,
}

enum Category {
  ///Categories
  Button,
  IconButton,
  Link,
  CheckboxType,
  TabView,
  ListItem,
  FloatingActionButton,
  BannerView,
}

enum AppsflyerClickEvents {
  af_app_opened,
  af_view_list,
  af_content_view,
  af_add_to_cart,
  af_purchase,
  duty_free_view_item_list,
  duty_free_view_item,
  duty_free_add_to_cart,
  duty_free_remove_from_cart,
  duty_free_view_cart,
  duty_free_begin_checkout,
  duty_free_add_details,
  duty_free_add_payment_info,
  duty_free_purchase,
  duty_free_purchase_success,
  duty_free_payment_fail,
}

List<String> _appsFlyerValidEvents = [
  // Login / SignUp
  ClickEvents.login.name,
  ClickEvents.sign_up.name,

  // Flight Booking
  ClickEvents.book_flight_search.name,
  ClickEvents.book_flight_select.name,
  ClickEvents.book_flight_review.name,
  ClickEvents.book_flight_traveller_detail_submit.name,
  ClickEvents.book_flight_payment_submit.name,
  ClickEvents.book_flight_payment_success.name,
  ClickEvents.book_flight_success.name,
  ClickEvents.book_flight_payment_fail.name,

  // Pranaam
  ClickEvents.book_pranaam_start.name,
  ClickEvents.book_pranaam_error.name,
  ClickEvents.book_pranaam_coupon_applied.name,
  ClickEvents.book_pranaam_select_package.name,
  ClickEvents.book_pranaam_add_traveller_details.name,
  ClickEvents.book_pranaam_payment_submit.name,
  ClickEvents.book_pranaam_success.name,
  ClickEvents.book_pranaam_payment_fail.name,

  // Cab
  ClickEvents.cab_booking_destination_search.name,
  ClickEvents.cab_booking_destination_select.name,
  ClickEvents.cab_booking_select_package.name,
  ClickEvents.cab_booking_now.name,
  ClickEvents.cab_booking_scheduled.name,
  ClickEvents.cab_booking_details.name,
  ClickEvents.cab_book_payment_submit.name,
  ClickEvents.cab_booking_success.name,
  ClickEvents.cab_booking_failed.name,
  ClickEvents.cab_booking_free_cancellation.name,
  ClickEvents.cab_booking_cancellation_confirmed.name,

  // Duty Free
  ClickEvents.duty_free_add_details.name,
  ClickEvents.duty_free_purchase_success.name,
];

enum Label {
  ///Labels
  Close,
  SKIP,
  book_flight,
}

enum OtpLabel { direct, resend }

class AnalyticsKey {
  static const String keyLabel = 'label';
  static const String keyCategory = 'category';
}

extension ClickEventExtension on ClickEvents {
  void logEvent({Map<String, Object?>? parameters}) {
    Analytics().logEvent(event: name, parameters: parameters);
    MixpanelManager().trackEvent(event: name, properties: parameters);
    WebEngagePlugin.trackEvent(name, parameters);
    _logAppsflyerEvent(name: name, parameters: parameters);
  }

  void logUserId({
    required String userId,
  }) {
    /// Identify GA User
    Analytics().logUserId(uid: userId);

    /// Identify Mixpanel User
    MixpanelManager().identify(distinctId: userId);

    /// Identify WebEngage User
    WebEngagePlugin.userLogin(userId);

    /// Identify Appsflyer User
    AppsFlyerManager().logUserId(userId: userId);
  }

  void logUserProfileData({
    required ProfileModel profileData,
  }) {
    adLog('--------User Info-------------');
    adLog(profileData.personInfo.toString());
    // Primary Email
    final primaryEmail = profileData.personInfo?.emails?.isNotEmpty ?? false
        ? profileData.personInfo?.emails?.firstWhere(
            (element) => element.type == 'P',
            orElse: () =>
                profileData.personInfo?.emails?.first ?? const Emails(),
          )
        : null;

    //Primary PhoneNumber
    final primaryPhoneNumber =
        profileData.personInfo?.phones?.isNotEmpty ?? false
            ? profileData.personInfo?.phones?.firstWhere(
                (element) => element.type == 'P',
                orElse: () =>
                    profileData.personInfo?.phones?.first ?? const Phones(),
              )
            : null;

    if (profileData.personInfo?.firstName != null) {
      WebEngagePlugin.setUserFirstName(
        profileData.personInfo?.firstName ?? '',
      );
    }
    if (profileData.personInfo?.lastName != null) {
      WebEngagePlugin.setUserLastName(profileData.personInfo?.lastName ?? '');
    }
    if (primaryEmail?.emailAddress != null) {
      WebEngagePlugin.setUserEmail(primaryEmail?.emailAddress ?? '');
    }
    if (profileData.personInfo?.gender != null) {
      WebEngagePlugin.setUserGender(
        profileData.personInfo?.gender?.toLowerCase() ?? '',
      );
    }
    if (primaryPhoneNumber?.number != null) {
      final String phoneNumber = (primaryPhoneNumber?.countryCode ?? '') +
          (primaryPhoneNumber?.number ?? '');
      _addUserProperty(
        name: Parameters.country_code.name,
        countryCode: primaryPhoneNumber?.countryCode ?? '',
      );
      WebEngagePlugin.setUserPhone(
        phoneNumber,
      );
    }
  }

  void logAnalyticsEventItem({
    required Map<String, dynamic> parameters,
    required List<AnalyticsEventItem> items,
  }) {
    try {
      adLog('Analytics Event Name -> $name');

      final mixpanelProperties = Transposition.getMixpanelEventItems(
        analyticsEventItemList: items,
      );
      parameters[Parameters.items.name] = mixpanelProperties;
      //Log MixpanelEvent
      MixpanelManager().trackEvent(event: name, properties: parameters);

      final List<Map<String, dynamic>> webEngageProperties =
          Transposition.getWebEngageEventItems(analyticsEventItemList: items);

      parameters[Parameters.items.name] = webEngageProperties;

      WebEngagePlugin.trackEvent(
        name,
        parameters,
      );

      //Add Items to params in request
      parameters[Parameters.items.name] = items;
      //Log GA Event
      Analytics().logEvent(event: name, parameters: parameters);
      _logAppsflyerEvent(name: name, parameters: parameters);
    } catch (e) {
      adLog(e.toString());
    }
  }
}

/// TODO: Shift to Click Events
/// Events Extension For home and Airports selection
extension HomeAndAirportEventsExtension on HomeAndAirportSelectionClickEvents {
  void logEvent({Map<String, Object?>? parameters}) {
    Analytics().logEvent(event: name, parameters: parameters);
    MixpanelManager().trackEvent(event: name, properties: parameters);
    WebEngagePlugin.trackEvent(name, parameters);
    _logAppsflyerEvent(name: name, parameters: parameters);
  }
}

ClickEvents? getEventFromName(String? name) {
  final Map<String, ClickEvents>? eventMap = ClickEvents.values.asNameMap();
  final ClickEvents? event = eventMap?[name];
  return event;
}

void _logAppsflyerEvent({
  required String name,
  Map<String, Object?>? parameters,
}) {
  if (_appsFlyerValidEvents.contains(name)) {
    logAppsFlyerEvent(name, parameters);
  }
  final ClickEvents? event = getEventFromName(name);
  switch (event) {
    case ClickEvents.book_flight_search:
    case ClickEvents.book_pranaam_start:
    case ClickEvents.view_item_list:
      logAppsFlyerEvent(
        AppsflyerClickEvents.af_view_list.name,
        parameters,
      );
      if (isFromDutyFreeCategory(parameters)) {
        logAppsFlyerEvent(
          AppsflyerClickEvents.duty_free_view_item_list.name,
          parameters,
        );
      }
      break;
    case ClickEvents.view_item:
      if (isFromDutyFreeCategory(parameters)) {
        logAppsFlyerEvent(
          AppsflyerClickEvents.duty_free_view_item.name,
          parameters,
        );
      }
      logAppsFlyerEvent(
        AppsflyerClickEvents.af_content_view.name,
        parameters,
      );
      break;
    case ClickEvents.select_item:
    case ClickEvents.book_flight_select:
      logAppsFlyerEvent(
        AppsflyerClickEvents.af_content_view.name,
        parameters,
      );
      break;
    case ClickEvents.add_to_cart:
      if (isFromDutyFreeCategory(parameters)) {
        logAppsFlyerEvent(
          AppsflyerClickEvents.af_add_to_cart.name,
          parameters,
        );
        logAppsFlyerEvent(
          AppsflyerClickEvents.duty_free_add_to_cart.name,
          parameters,
        );
      }
      break;
    case ClickEvents.book_flight_review:
    case ClickEvents.book_pranaam_select_package:
      logAppsFlyerEvent(
        AppsflyerClickEvents.af_add_to_cart.name,
        parameters,
      );
      break;
    case ClickEvents.purchase:
      if (isFromDutyFreeCategory(parameters)) {
        logAppsFlyerEvent(
          AppsflyerClickEvents.duty_free_purchase.name,
          parameters,
        );
      }
      logAppsFlyerEvent(
        AppsflyerClickEvents.af_purchase.name,
        parameters,
      );
      break;
    case ClickEvents.remove_from_cart:
      if (isFromDutyFreeCategory(parameters)) {
        logAppsFlyerEvent(
          AppsflyerClickEvents.duty_free_remove_from_cart.name,
          parameters,
        );
      }
      break;
    case ClickEvents.view_cart:
      if (isFromDutyFreeCategory(parameters)) {
        logAppsFlyerEvent(
          AppsflyerClickEvents.duty_free_view_cart.name,
          parameters,
        );
      }
      break;
    case ClickEvents.begin_checkout:
      if (isFromDutyFreeCategory(parameters)) {
        logAppsFlyerEvent(
          AppsflyerClickEvents.duty_free_begin_checkout.name,
          parameters,
        );
      }
      break;
    case ClickEvents.add_payment_info:
      if (isFromDutyFreeCategory(parameters)) {
        logAppsFlyerEvent(
          AppsflyerClickEvents.duty_free_add_payment_info.name,
          parameters,
        );
      }
      break;
    case ClickEvents.duty_free_payment_fail:
      if (isFromDutyFreeCategory(parameters)) {
        logAppsFlyerEvent(
          AppsflyerClickEvents.duty_free_payment_fail.name,
          parameters,
        );
      }
      break;
    default:
      adLog('No associated event');
  }
}

void logAppsFlyerEvent(String eventName, Map<String, dynamic>? params) {
  AppsFlyerManager().logEvent(
    eventName: eventName,
    eventValues: params,
  );
}

bool isFromDutyFreeCategory(Map<String, dynamic>? parameters) {
  final String? catKey = parameters?[Parameters.category.name] as String?;
  return catKey == 'duty_free';
}

void _addUserProperty({
  required String name,
  required String countryCode,
}) {
  adLog('Set User Property -> $name with value -> $countryCode');
  Analytics().logUserProperty(property: name, value: countryCode);
  MixpanelManager().setOneProperty(property: name, value: countryCode);
  WebEngagePlugin.setUserAttribute(name, countryCode);
}
