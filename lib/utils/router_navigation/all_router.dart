/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/web_view_pranaam_book_with_header.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/web_view_with_header.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/home_bottom_assets.dart';
import 'package:adani_airport_mobile/modules/businesses/business_screen.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/cab_booking_confirmation_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/cab_live_tracking_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/cab_srp_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/cab_traveller_details_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/cancellation_screen_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/select_destination_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/srp_loading_navigation_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_cart_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_cancellation_screen/cab_booking_cancellation_screen.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_confirmation_screen/cab_booking_confirmation_screen.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/cab_booking_detail_screen.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_home_screen/cab_booking_home_screen.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_live_tracking/cab_live_tracking_screen.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_srp_loading_screen/cab_srp_loading_screen.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_traveller_details_screen/cab_traveller_detail_screen.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cabs_srp_screen/cabs_srp_screen.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/select_destination_screen/select_destination_screen.dart';
import 'package:adani_airport_mobile/modules/car_parking/screens/car_parking.dart';
import 'package:adani_airport_mobile/modules/car_parking/screens/car_parking_owner_details.dart';
import 'package:adani_airport_mobile/modules/car_parking/screens/parking_booking_confirmation.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart';
import 'package:adani_airport_mobile/modules/currency_exchange/currency_exchange_detail_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/deal_product_model.dart';
// import 'package:adani_airport_mobile/modules/duty_free/models/response/duty_free_cancel_order/duty_free_cancel_order_details_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/ad_coupon_list/ad_coupon_list.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/apply_coupon_screen/views/apply_coupon_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/catalog/catalog_list_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/customer_information_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/duty_free_confirmation_order.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/duty_free_order_cancel_reason.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/duty_free_review_details.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/reschedule_page.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/order_confirmation/duty_free_order_confirmation_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/payment_confirmation/duty_free_payment_confirmation_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/duty_free_story_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/duty_free_view_product_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/product_detail_duty_free_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/shopping_cart/ad_duty_free_shopping_cart_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_booking_cancel_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_create_itinerary_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/flight_view_trip_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/payment_info.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_view_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/flight_booking_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/pranaam_banner_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/traveller_detail/display_model/traveller_passenger_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/airports_landing_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_cancel/flight_booking_cancel_review_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_cancel/flight_cancel_reason_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_confirm/booking_confirmation.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_list/flight_booking_item_details.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_cancel/select_flight_traveller.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/flight_listing_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/baggage_and_cancellation_policies_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/review_flight_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_search/flight_booking_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_search/views/choose_traveller_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/home_screen/home_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/travellers_details/traveller_detail_navigate_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/travellers_details/travellers_details_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/travellers_details/views/billing_details_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/fids_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/flight_search_navigate_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/flight_status_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/add_flight_information/add_flight_information_screen.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_search/flight_search_screen.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_detail_screen/flight_status_detail_screen.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_screen/flight_status_screen.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/saved_flights/saved_flights.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/models/model/airport_shop/airport_shop_list_model.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/screens/airport_food/airport_food_category_screen.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/screens/airport_food/airport_food_detail_screen.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/screens/airport_food/airport_food_list_screen.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/screens/airport_shop/airport_shop_category_screen.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/screens/airport_shop/airport_shop_detail_screen.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/screens/airport_shop/airport_shop_list_screen.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/loyalty_dashboard_main.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_history/loyalty_history_screen.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/refer_and_earn/refer_and_earn.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/modules/more/screens/customer_feedback/customer_feedback.dart';
import 'package:adani_airport_mobile/modules/more/screens/language_screen.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/update_profile.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/utils/verify_email_call_back_model.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/views/change_email_screen.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/views/change_phone_number_screen.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/views/image_cropper_screen.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/views/verify_email_screen.dart';
import 'package:adani_airport_mobile/modules/more/screens/order_and_bookings_screen.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/offers/screens/offer_dashboard_main_screen.dart';
import 'package:adani_airport_mobile/modules/offers/screens/offer_detail_screen.dart';
import 'package:adani_airport_mobile/modules/payment/models/response/pay_now_response/pay_now_response.dart';
import 'package:adani_airport_mobile/modules/payment/screens/generic_payment_screen.dart';
import 'package:adani_airport_mobile/modules/payment/screens/payment_webview/ad_web_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/create_booking_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/addons/addons_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/cancellation_data.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/cancellation_details.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/cancellation_review_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/widget_view/pranaam_order_cancellation_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation_comfirmation/widget_view/pranaam_cancellation_confirmation.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/cart_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/generic_cart_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/view/empty_cart_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/widget_view/pranaam_confirmation_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/departure/departure.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/pranaam_home.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/widget_view/pranaam_order_detail_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/package_service/select_package.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/pranaam_traveller_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/reschedule/pranaam_reschedule_page.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/reschedule/pranaam_reschedule_review_page.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/saved_traveller_details/saved_traveller_detail_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/service_booking_screen.dart';
import 'package:adani_airport_mobile/modules/republic_reward/republic_main_screen.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/sign_in_screen.dart';
import 'package:adani_airport_mobile/modules/session/screens/otp/verify_otp_screen.dart';
import 'package:adani_airport_mobile/modules/session/screens/sign_up/sign_up_screen.dart';
import 'package:adani_airport_mobile/modules/session/utils/login_model_utils.dart';
import 'package:adani_airport_mobile/modules/settings.dart';
import 'package:adani_airport_mobile/modules/splash/screens/splash_screen.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/home/stand_alone_dashboard_screen.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/review_detail/stand_alone_review_detail_screen.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/stand_alone_service_booking_form_screen.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_state_management.dart';
import 'package:adani_airport_mobile/modules/themes/republic_day_theme/republic_day_theme.dart';
import 'package:adani_airport_mobile/modules/themes/state_management/theme_state_management.dart';
import 'package:adani_airport_mobile/modules/train/train_booking.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/deep_link_manager/deep_link_manager.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/initial_launch_screen.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/maintenance_widget.dart';
import 'package:adani_airport_mobile/utils/internet_connection/no_network_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart'
    as routes;
import 'package:adani_mobile_utility/app_utils/navigator/ad_material_page_route.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';

///which we can pass the arguments from one widget to other.
///and we can get that argument back from *[RouteSettings] itself
///e.g. settings.arguments as String/bool/int/any model type

class AllRouter {
  static String _lastRoute = '/';
  static String get lastRoute => _lastRoute;
  static Route<dynamic> generateRoute(RouteSettings settings) {
    _lastRoute = settings.name ?? '/';
    switch (settings.name) {
      case routes.republicDayTheme:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ChangeNotifierProvider(
            create: (BuildContext context) => ThemeStateManagement(),
            child: const RepublicDayTheme(),
          ),
        );
      case routes.splashRoute:
        return getSplashRouteType(settings);
      case routes.tabRoute:
        return getBottomTabRouteType(settings);
      //used for on-boarding section
      case routes.signInScreen:
      case routes.airportRoute:
      case routes.airportsLandingScreen:
      case routes.signupScreen:
      case routes.otp:
      case routes.sendOtp:
      case routes.languageRoute:
      case routes.businessScreen:
      case routes.updateProfile:
        return getOnboardRouteByType(settings);
      //used for airport food/shop
      case routes.airportShopCategory:
      case routes.airportShopList:
      case routes.airportShopDetail:
      case routes.airportFoodList:
      case routes.airportFoodDetail:
      case routes.airportFoodCategory:
        return getAirportShopFoodRouteByType(settings);
      //used for duty free
      case routes.applyCouponRoute:
      case routes.dutyFreeScreen:
      case routes.dutyFreeCatalogScreen:

      case routes.productDetailDutyFreeScreen:
      case routes.dutyFreeShoppingCartRoute:
      case routes.dutyFreeViewProductImageRoute:
      case routes.dutyPaymentConfirmation:
      case routes.dutyFreeOrderConfirmation:
      case routes.customerInformationScreen:
      case routes.applyCouponScreen:
      case routes.dutyFreeRescheduleDetails:
      case routes.dutyFreeOrderCancelReason:
      case routes.dutyFreeReschedule:
      case routes.dutyFreeConfirmationOrder:
        return getDutyFreeRouteByType(settings);
      //used for pranaam
      case routes.pranaamService:
      case routes.selectPackage:
      case routes.departure:
      case routes.adOnsScreen:
      case routes.pranaamTravellerDetailScreen:
      case routes.savedTravellerDetails:
      case routes.cart:
      case routes.genericCartScreen:
      case routes.serviceBookingScreen:
      case routes.emptyCartScreen:
      case routes.pranaamConfirmationScreen:
      case routes.customerFeedback:
      case routes.myAccountView:
        return getPranaamRouteByType(settings);
      case routes.pranaamOrderCancellation:
      case routes.cancellationDetails:
      case routes.pranaamCancelReviewDetails:
      case routes.pranaamCancellationConfirmation:
        return getPranaamCancellationRouteByType(settings);
      case routes.standAloneDashboard:
      case routes.standAloneReview:
      case routes.standAloneBookingFormScreen:
        return getStandAloneRouteByType(settings);
      case routes.pranaamReschedulePage:
      case routes.pranaamRescheduleReviewPage:
        return getPranaamResheduleRoutesByType(settings);
      //used for flight booking
      case routes.flightListingScreen:
      case routes.travellersDetails:
      case routes.baggageAndCancellationPolicies:
      case routes.chooseTravellersRoute:
      case routes.flightBooking:
      case routes.reviewFlightDetails:
      case routes.paymentScreen:
      case routes.paymentWebView:
      case routes.flightBookingConfirmation:
      case routes.flightBookingUpdateConfirmation:
      case routes.genericPaymentScreen:
      case routes.savedFlights:
      case routes.genericBillingScreen:
      case routes.trainBooking:
        return getFlightBookingRouteByType(settings);
      //used for flight status
      case routes.flightStatusScreen:
      case routes.flightStatusDetailScreen:
      case routes.flightStatusSearchScreen:
      case routes.addFlightInformation:
        return getFlightStatusRouteByType(settings);
      case routes.noDataFound:
        return getNoInternetRouteType(settings);

      //used for Car Parking
      case routes.carParking:
      case routes.carParkingOwnerDetails:
      case routes.carParkingBookingConfirmation:
        return getCarParkingRouteByType(settings);
      //used for Cabs
      case routes.cabBookingHomeScreen:
      case routes.selectDestinationScreen:
      case routes.cabSrpLoadingScreen:
      case routes.cabSrpScreen:
      case routes.cabBookingDetailScreen:
      case routes.cabTravellerDetailScreen:
      case routes.cabLiveTracking:
      case routes.cabBookingConfirmationScreen:
      case routes.cabBookingCancellationScreen:
        return getCabsRouteByType(settings);
      case routes.selectFlightTraveller:
      case routes.flightBookingReviewDetailScreen:
      case routes.flightBookingItemDetails:
      case routes.selectReasonScreen:
        return getBookingCancellationRouteByType(settings);
      case routes.loyaltyHistoryScreen:
      case routes.loyaltyDashboard:
      case routes.loyaltyReferEarn:
      case routes.dialogiew:
      case routes.loyaltyDialogue:
        return getLoyaltyRouteType(settings);
      case routes.orderAndBookingsScreen:
        return getOrdersAndBookingsRoute(settings);
      case routes.offersDashboard:
      case routes.offerDetail:
        return getOffersRouteType(settings);
      case routes.republicReward:
        return getRepublicRewardRouteType(settings);
      //used for my profile
      case routes.imageCropperScreen:
      case routes.changeEmail:
      case routes.changePhoneNumber:
      case routes.verifyEmail:
        return getMyProfileRouteByType(settings);
      // used for web view
      case routes.webViewContainer:
        return getWebViewRouteByType(settings);
      case routes.webViewContainerPranaamBook:
        return getWebViewPranaamBookRouteByType(settings);
      case routes.settings:
        return getDeleteAccount(settings);
      case routes.currencyExchangePoints:
      case routes.currencyExchangeDetails:
        return getCurrencyExchangeRouteType(settings);
      case routes.maintenance:
        return getMaintenanceRouteType(settings);
      default:
        return getRouteOnEmptyType(settings);
    }
  }
}

//to return my profile navigation route based on their type
ADMaterialPageRoute getMyProfileRouteByType(RouteSettings settings) {
  switch (settings.name) {
    case routes.imageCropperScreen:
      final arguments = settings.arguments as List;
      final image = arguments.first;
      final saveImageCallback = arguments[1];
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: ImageCropperScreen(
          image: image,
          saveImageCallback: saveImageCallback,
        ),
      );
    case routes.changeEmail:
      final arguments = settings.arguments as VerifyEmailCallBackModel;
      final emailId = arguments.emailIdControllerValue;
      final fromChangeScreen = arguments.changeScreenValue;
      final verifyEmail = arguments.emailVerify;
      final fromBottomSheet = arguments.fromBottomSheet;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: ChangeEmailScreen(
          emailId: emailId ?? '',
          fromChangeScreen: fromChangeScreen,
          verifyEmail: verifyEmail as ADTapCallbackWithValue,
          fromBottomSheet: fromBottomSheet,
        ),
      );
    case routes.changePhoneNumber:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const ChangePhoneNumberScreen(),
      );
    case routes.verifyEmail:
      final arguments = settings.arguments as VerifyEmailCallBackModel;
      final emailId = arguments.emailIdControllerValue;
      final fromChangeScreen = arguments.changeScreenValue;
      final verifyEmail = arguments.emailVerify;
      final sourceId = arguments.sourceId;
      final fromBottomSheet = arguments.fromBottomSheet;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: VerifyEmailScreen(
          emailId: emailId ?? '',
          fromChangeScreen: fromChangeScreen,
          verifyEmail: verifyEmail as ADTapCallbackWithValue,
          sourceId: sourceId,
          fromBottomSheet: fromBottomSheet,
        ),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

//to return web view navigation route based on their type
ADMaterialPageRoute getWebViewRouteByType(RouteSettings settings) {
  switch (settings.name) {
    case routes.webViewContainer:
      final WebViewModel data = settings.arguments as WebViewModel;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: WebViewWithHeader(url: data.url, title: data.title),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

//to return web view pranaam book navigation route based on their type
ADMaterialPageRoute getWebViewPranaamBookRouteByType(RouteSettings settings) {
  switch (settings.name) {
    case routes.webViewContainerPranaamBook:
      final WebViewModel data = settings.arguments as WebViewModel;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget:
            WebViewPranaamBookWithHeader(url: data.url, title: data.title),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

//to return web view pranaam book navigation route based on their type
ADMaterialPageRoute getDeleteAccount(RouteSettings settings) {
  switch (settings.name) {
    case routes.settings:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const Settings(),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

//to return Car Parking navigation route based on their type
ADMaterialPageRoute getCarParkingRouteByType(RouteSettings settings) {
  switch (settings.name) {
    case routes.carParking:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: CarParking(),
      );
    case routes.carParkingOwnerDetails:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: CarParkingOwnerDetails(),
      );
    case routes.carParkingBookingConfirmation:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: ParkingBookingConfirmation(),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

//to return Cabs navigation route based on their type
ADMaterialPageRoute getCabsRouteByType(RouteSettings settings) {
  switch (settings.name) {
    case routes.cabBookingHomeScreen:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const CabBookingHomeScreen(),
      );
    case routes.selectDestinationScreen:
      final SelectDestinationNavigateModel selectDestinationNavigateModel =
          settings.arguments as SelectDestinationNavigateModel;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: SelectDestinationScreen(
          selectDestinationNavigateModel: selectDestinationNavigateModel,
        ),
      );
    case routes.cabSrpLoadingScreen:
      final SrpLoadingNavigationModel srpLoadingNavigationModel =
          settings.arguments as SrpLoadingNavigationModel;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: CabSrpLoadingScreen(
          srpLoadingNavigationModel: srpLoadingNavigationModel,
        ),
      );
    case routes.cabSrpScreen:
      final CabSrpNavigateModel cabSrpNavigateModel =
          settings.arguments as CabSrpNavigateModel;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: CabsSrpScreen(
          cabSrpNavigateModel: cabSrpNavigateModel,
        ),
      );

    case routes.cabLiveTracking:
      final CabLiveTrackingNavigateModel cabLiveTrackingNavigateModel =
          settings.arguments as CabLiveTrackingNavigateModel;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: CabLiveTrackingScreen(
          cabLiveTrackingNavigateModel: cabLiveTrackingNavigateModel,
        ),
      );
    case routes.cabBookingDetailScreen:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const CabBookingDetailScreen(),
      );
    case routes.cabTravellerDetailScreen:
      final CabTravellerDetailsNavigateModel cabTravellerDetailsNavigateModel =
          settings.arguments as CabTravellerDetailsNavigateModel;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: CabTravellerDetailScreen(
          cabTravellerDetailsNavigateModel: cabTravellerDetailsNavigateModel,
        ),
      );
    case routes.cabBookingConfirmationScreen:
      final CabBookingConfirmationNavigateModel
          cabBookingConfirmationNavigateModel =
          settings.arguments as CabBookingConfirmationNavigateModel;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: CabBookingConfirmationScreen(
          orderReferenceId:
              cabBookingConfirmationNavigateModel.orderReferenceId,
          isFromHomeView: cabBookingConfirmationNavigateModel.isFromHomeView,
        ),
      );
    case routes.cabBookingCancellationScreen:
      final CancellationScreenNavigateModel cancellationScreenNavigateModel =
          settings.arguments as CancellationScreenNavigateModel;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: CabBookingCancellationScreen(
          cabOrderDetailResponseModel:
              cancellationScreenNavigateModel.cabOrderDetailResponseModel,
          successCallBack: cancellationScreenNavigateModel.successCallBack,
          infoDetails: cancellationScreenNavigateModel.infoDetails,
          orderReferenceId: cancellationScreenNavigateModel.orderReferenceId,
          currencyCode: cancellationScreenNavigateModel.currencyCode,
        ),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

//to return flight booking navigation route based on their type
ADMaterialPageRoute getFlightBookingRouteByType(
  RouteSettings settings,
) {
  switch (settings.name) {
    case routes.savedFlights:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const SavedFlights(),
      );

    case routes.reviewFlightDetails:
      final SelectedFlightModel selectedFlightModel =
          settings.arguments as SelectedFlightModel;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: ReviewFlightScreen(
          selectedFlightModel: selectedFlightModel,
        ),
      );

    case routes.flightBookingConfirmation:
      final SelectedItineraryToConfirmation selectedItineraryToConfirmation =
          settings.arguments as SelectedItineraryToConfirmation;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: BookingConfirmation(
          selectedItineraryToConfirmation: selectedItineraryToConfirmation,
        ),
      );

    case routes.genericPaymentScreen:
      PaymentModule paymentModule = PaymentModule.flight;
      SelectedTravelPassengerDetail selectedTravelPassengerDetail =
          SelectedTravelPassengerDetail();
      CabCartDetailResponseModel cabCartDetailResponseModel =
          CabCartDetailResponseModel();
      if (settings.arguments is PaymentModule) {
        paymentModule = settings.arguments as PaymentModule;
      } else {
        if (settings.arguments is SelectedTravelPassengerDetail) {
          selectedTravelPassengerDetail =
              settings.arguments as SelectedTravelPassengerDetail;
        } else if (settings.arguments is CabCartDetailResponseModel) {
          cabCartDetailResponseModel =
              settings.arguments as CabCartDetailResponseModel;
          paymentModule = PaymentModule.cabBooking;
        }
      }

      return ADMaterialPageRoute(
        settings: settings,
        childWidget: ADSelectorStateLessWidget(
          viewModel: PaymentMethodState.fromModule(paymentModule),
          child: GenericPaymentScreen(
            selectedTravelPassengerDetail: selectedTravelPassengerDetail,
            cabCartDetailResponseModel: cabCartDetailResponseModel,
          ),
        ),
      );
    case routes.travellersDetails:
      final FlightViewItineraryResponseModel flightViewItineraryResponseModel =
          settings.arguments as FlightViewItineraryResponseModel;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: TravellersDetailsScreen(
          flightViewItineraryResponseModel: flightViewItineraryResponseModel,
        ),
      );
    case routes.baggageAndCancellationPolicies:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const BaggageAndCancellationPoliciesScreen(),
      );
    case routes.flightBooking:
      ClickEvents.click.logEvent(
        parameters: {
          AnalyticsKey.keyCategory: Category.ListItem.name,
          AnalyticsKey.keyLabel: Label.book_flight.name,
        },
      );
      final FlightBookingDeepLinkModel? flightBookingDeepLinkModel =
          settings.arguments as FlightBookingDeepLinkModel?;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: FlightBookingScreen(
          flightBookingDeepLinkModel: flightBookingDeepLinkModel,
        ),
      );
    case routes.flightListingScreen:
      final List data = settings.arguments as List;
      final FlightBookingModel flightBookingModel =
          data.first as FlightBookingModel;
      return ADMaterialPageRoute(
        childWidget: FlightListingScreen(
          flightBookingModel: flightBookingModel,
        ),
        settings: settings,
      );
    case routes.chooseTravellersRoute:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: ChooseTravellerScreen(
          ///TODO
          callBack: (val) => null,
        ),
      );
    case routes.genericBillingScreen:
      TravellerDetailNavigateModel? travellerDetailNavigateModel;
      if (settings.arguments != null) {
        travellerDetailNavigateModel =
            settings.arguments as TravellerDetailNavigateModel;
      }
      return ADMaterialPageRoute(
        settings: settings,
        fullscreenDialog: true,
        childWidget: BillingDetailsScreen(
          travellerDetailNavigateModel: travellerDetailNavigateModel,
        ),
      );
    case routes.paymentWebView:
      final PayNowResponse data = settings.arguments as PayNowResponse;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: ADWebView(
          data: data,
        ),
      );
    case routes.pranaamOrderCancellation:
      final List args = settings.arguments as List;
      final CancellationData cancellationData = args.first as CancellationData;
      final bool isFromBottomSheet = args[1] as bool;
      adLog('CancellationData router ${cancellationData.bookingId}');
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: PranaamOrderCancellationScreen(
          cancellationData: cancellationData,
          isFromBottomSheet: isFromBottomSheet,
        ),
      );
    case routes.trainBooking:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: TrainBooking(
          bookingID: settings.arguments as String?,
        ),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

//to return airport shop/food navigation route based on their type
ADMaterialPageRoute getAirportShopFoodRouteByType(RouteSettings settings) {
  switch (settings.name) {
    case routes.airportShopList:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const AirportShopListScreen(),
      );
    case routes.airportShopDetail:
      Items? shopItem;
      if (settings.arguments != null) {
        shopItem = settings.arguments as Items;
      }
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: AirportShopDetailScreen(
          shopItem: shopItem,
        ),
      );
    case routes.airportFoodList:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const AirportFoodListScreen(),
      );
    case routes.airportFoodDetail:
      Items? shopItem;
      if (settings.arguments != null) {
        shopItem = settings.arguments as Items;
      }
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: AirportFoodDetailScreen(
          shopItem: shopItem,
        ),
      );
    case routes.airportFoodCategory:
      int selectedIndex = 0;
      if (settings.arguments != null) {
        selectedIndex = settings.arguments as int;
      }
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: AirportFoodCategoryScreen(selectedItem: selectedIndex),
      );
    case routes.airportShopCategory:
      int selectedIndex = 0;
      if (settings.arguments != null) {
        selectedIndex = settings.arguments as int;
      }
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: AirportShopCategoryScreen(
          selectedItem: selectedIndex,
        ),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

//to return pranaam related navigation route based on their type
ADMaterialPageRoute getPranaamRouteByType(RouteSettings settings) {
  switch (settings.name) {
    case routes.pranaamConfirmationScreen:
      CreateBookingRequestModel? createBookingModel;
      String? orderReferenceId;
      if (settings.arguments != null) {
        createBookingModel = (settings.arguments as List).first;
        orderReferenceId = (settings.arguments as List)[1];
      }
      final routePath = PranaamConfirmationScreen(
        createBookingModel: createBookingModel,
        orderReferenceId: orderReferenceId ?? '',
      );
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: routePath,
      );
    case routes.serviceBookingScreen:
      final List list = settings.arguments as List;
      final bool showImage = list.first as bool;
      final bool fromDashboard = list[1] as bool;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: ServiceBookingScreen(
          showCross: showImage,
          fromDashboard: fromDashboard,
        ),
      );

    case routes.pranaamTravellerDetailScreen:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const PranaamTravellerScreen(),
      );
    case routes.departure:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const Departure(),
      );
    case routes.adOnsScreen:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const AddonsScreen(),
      );

    case routes.selectPackage:
      bool isFromUpgrade = false;
      if (settings.arguments != null) {
        isFromUpgrade = settings.arguments as bool;
      }
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: SelectPackage(
          isFromUpgrade: isFromUpgrade,
        ),
      );
    case routes.savedTravellerDetails:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const SavedTravellerDetailScreen(),
      );
    case routes.pranaamService:
      final UpSellLink? upSellLink = settings.arguments as UpSellLink?;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: PranaamHome(upSellLink: upSellLink),
      );
    case routes.cart:
      bool isFromUpgrade = false;
      if (settings.arguments != null) {
        isFromUpgrade = settings.arguments as bool;
      }
      return ADMaterialPageRoute(
        settings: settings,
        fullscreenDialog: true,
        childWidget: CartScreen(
          showTopBar: true,
          isFromUpgrade: isFromUpgrade,
        ),
      );
    case routes.genericCartScreen:
      bool isFromUpgrade = false;
      if (settings.arguments != null) {
        isFromUpgrade = settings.arguments as bool;
      }
      return ADMaterialPageRoute(
        settings: settings,
        fullscreenDialog: true,
        childWidget: GenericCartScreen(
          isFromUpgrade: isFromUpgrade,
        ),
      );

    case routes.emptyCartScreen:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const EmptyCartScreen(),
      );
    case routes.myAccountView:
      final List args = settings.arguments as List;
      final String? referenceID = args.first as String;
      final bool isFromBottomSheet = args[1] as bool;
      final bool isRoundTrip = args[2] as bool;
      final bool isRoundTripDeparture = args[3] as bool;

      return ADMaterialPageRoute(
        settings: settings,
        childWidget: PranaamOrderDetailScreen(
          bookingID: referenceID,
          isFromBottomSheet: isFromBottomSheet,
          isRoundTrip: isRoundTrip,
          isRoundTripDeparture: isRoundTripDeparture,
        ),
      );
    case routes.customerFeedback:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const CustomerFeedback(),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

ADMaterialPageRoute getPranaamCancellationRouteByType(RouteSettings settings) {
  switch (settings.name) {
    case routes.cancellationDetails:
      final List args = settings.arguments as List;
      final CommonOrderDetailBaseResponse bookingDetailsResponseModel =
          args.first as CommonOrderDetailBaseResponse;

      final SiteCoreStateManagement siteCoreStateManagement =
          args[1] as SiteCoreStateManagement;
      final CancellationData cancellationData = args[2] as CancellationData;
      final String bookingId = args[3] as String;

      return ADMaterialPageRoute(
        settings: settings,
        childWidget: CancellationDetails(
          bookingDetailsResponseModel: bookingDetailsResponseModel,
          siteCoreStateManagement: siteCoreStateManagement,
          cancellationData: cancellationData,
          bookingId: bookingId,
        ),
      );
    case routes.pranaamOrderCancellation:
      final List args = settings.arguments as List;
      final CancellationData cancellationData = args.first as CancellationData;

      final String? bookingId = args[1] as String;
      final bool isFromBottomSheet = args[2] as bool;
      final bool isRoundTrip = args[3] as bool;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: PranaamOrderCancellationScreen(
          cancellationData: cancellationData,
          bookingID: bookingId,
          isFromBottomSheet: isFromBottomSheet,
          isRoundTrip: isRoundTrip,
        ),
      );
    case routes.pranaamCancelReviewDetails:
      final List args = settings.arguments as List;
      final CommonOrderDetailBaseResponse bookingDetailsResponseModel =
          args.first as CommonOrderDetailBaseResponse;
      final List<Traveler> travellersModel = args[1] as List<Traveler>;
      final String bookingId = args[2] as String;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: CancellationReviewScreen(
          bookingDetailsResponseModel: bookingDetailsResponseModel,
          travellersModel: travellersModel,
          bookingId: bookingId,
        ),
      );
    case routes.pranaamCancellationConfirmation:
      final String args = settings.arguments as String;
      final String bookingId = args;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: PranaamCancellationConfirmation(
          bookingId: bookingId,
        ),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

ADMaterialPageRoute getPranaamResheduleRoutesByType(RouteSettings settings) {
  switch (settings.name) {
    case routes.pranaamReschedulePage:
      final args = settings.arguments as CommonOrderDetailBaseResponse;
      return ADMaterialPageRoute(
        childWidget: PranaamReschedulePage(
          bookingDetailsResponseModel: args,
        ),
      );
    case routes.pranaamRescheduleReviewPage:
      final args = settings.arguments as CommonOrderDetailBaseResponse;
      return ADMaterialPageRoute(
        childWidget: PranaamRescheduleReviewPage(
          bookingDetailsResponseModel: args,
        ),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

//to return porter related navigation route based on their type
ADMaterialPageRoute getStandAloneRouteByType(RouteSettings settings) {
  switch (settings.name) {
    case routes.standAloneDashboard:
      StandAloneServiceType? standAloneServiceType;
      if (settings.arguments != null) {
        standAloneServiceType = settings.arguments as StandAloneServiceType;
      }
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: StandAloneDashBoardScreen(
          standAloneServiceType: standAloneServiceType,
        ),
      );
    case routes.standAloneReview:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const StandAloneReviewDetailScreen(),
      );
    case routes.standAloneBookingFormScreen:
      final DashboardItem item = settings.arguments as DashboardItem;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: StandAloneServiceBookingFormScreen(
          item: item,
        ),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

//to return duty free related navigation route based on their type
ADMaterialPageRoute getDutyFreeRouteByType(RouteSettings settings) {
  switch (settings.name) {
    case routes.customerInformationScreen:
      CustomerInfoArguments? customerInfoArguments;
      if (settings.arguments != null) {
        customerInfoArguments = settings.arguments as CustomerInfoArguments;
      }
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: CustomerInformationScreen(
          aguments: customerInfoArguments,
          classType: InvokeClassType.dutyFree,
        ),
      );
    case routes.dutyFreeOrderConfirmation:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: DutyFreeOrderConfirmationScreen(
          item: settings.arguments as CommonOrderDetailBaseResponse,
        ),
      );
    case routes.dutyPaymentConfirmation:
      CustomerInfoArguments? customerInfoArguments;
      if (settings.arguments != null) {
        customerInfoArguments = settings.arguments as CustomerInfoArguments;
      }
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: DutyFreePaymentConfirmationScreen(
          customerInfoArguments: customerInfoArguments,
        ),
      );
    case routes.dutyFreeShoppingCartRoute:
      return ADMaterialPageRoute(
        settings: settings,
        //fullscreenDialog: true,
        childWidget: const GenericCartScreen(),
      );
    case routes.dutyFreeViewProductImageRoute:
      List<DutyStory>? stories = [];
      if (settings.arguments != null) {
        stories = (settings.arguments as List<dynamic>)[1];
      }
      return ADMaterialPageRoute(
        settings: settings,
        fullscreenDialog: true,
        childWidget: DutyFreeViewProductImage(
          stories: stories,
          index: (settings.arguments as List<dynamic>).first,
        ),
      );
    case routes.productDetailDutyFreeScreen:
      final DealProductModel dealProduct =
          settings.arguments as DealProductModel;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: ProductDetailDutyFreeScreen(dealProductModel: dealProduct),
      );

    case routes.dutyFreeCatalogScreen:
      final List<String> args = (settings.arguments ?? ['']) as List<String>;
      final String code = args.first;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: CatalogListScreen(
          catalogType: code,
          slug: args.length > 1 ? args[1] : null,
        ),
      );
    case routes.dutyFreeScreen:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const DutyFreeScreen(),
      );
    case routes.applyCouponScreen:

      ///TODO
      //final CartData cartData = settings.arguments as CartData;
      final double mrp = settings.arguments as double;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: ApplyCouponScreen(
          baseFareAmount: mrp,
          adGenericCallback: (value) => {},
        ),
      );
    case routes.applyCouponRoute:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const AdCouponList(),
      );
    case routes.dutyFreeOrderCancelReason:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const DutyFreeOrderCancelReason(),
      );
    case routes.dutyFreeRescheduleDetails:
      final SelectedFlightToPass selectedFlightToPass =
          settings.arguments as SelectedFlightToPass;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: DutyFreeReviewDetails(
          selectedFlightToPass: selectedFlightToPass,
        ),
      );
    case routes.dutyFreeReschedule:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const ReschedulePage(),
      );

    case routes.dutyFreeConfirmationOrder:
      final String id = settings.arguments as String;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: DutyFreeConfirmationOrder(
          referenceId: id,
        ),
      );

    default:
      return getRouteOnEmptyType(settings);
  }
}

//to return user onboard related navigation route based on their type
PageRoute getOnboardRouteByType(RouteSettings settings) {
  switch (settings.name) {
    case routes.airportRoute:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: HomeScreen(
          key: homeScreenKey,
        ),
      );
    case routes.airportsLandingScreen:
      return ADFadePageRoute(
        settings: settings,
        pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) =>
            AirportsLandingScreen(
          airportStateData: selectedAirportsData,
        ),
      );
    case routes.otp:
      LoginModelUtils? loginModelUtils;
      if (settings.arguments != null) {
        loginModelUtils = settings.arguments as LoginModelUtils;
      }
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: VerifyOTPScreen(loginModelUtils: loginModelUtils),
      );

    case routes.sendOtp:
      LoginModelUtils? loginModelUtils;
      if (settings.arguments != null) {
        loginModelUtils = settings.arguments as LoginModelUtils;
      }
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: VerifyOTPScreen(
          loginModelUtils: loginModelUtils,
          // isSendRequired: false,
        ),
      );

    case routes.signupScreen:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const SignUpScreen(),
      );
    case routes.signInScreen:
      SignInStatusModel? signInStatusModel;
      if (settings.arguments != null) {
        signInStatusModel = settings.arguments as SignInStatusModel;
      }
      return ADMaterialPageRoute(
        fullscreenDialog: true,
        settings: settings,
        childWidget: SignInScreen(
          signInStatusModel: signInStatusModel,
        ),
      );
    case routes.businessScreen:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const BusinessScreen(),
      );
    case routes.languageRoute:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const LanguageScreen(),
      );
    case routes.updateProfile:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const UpdateProfile(),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

//to return flight status related navigation route based on their type
ADMaterialPageRoute getFlightStatusRouteByType(RouteSettings settings) {
  switch (settings.name) {
    case routes.flightStatusDetailScreen:
      final FlightStatusDetailModel flightStatusDetailModel =
          settings.arguments as FlightStatusDetailModel;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: FlightStatusDetailScreen(
          flightStatusDetailModel: flightStatusDetailModel,
        ),
      );
    case routes.flightStatusScreen:
      final FidsModel fidsModel = settings.arguments as FidsModel;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: FlightStatusScreen(
          fidsModel: fidsModel,
        ),
      );
    case routes.flightStatusSearchScreen:
      final FlightSearchNavigateModel flightSearchNavigateModel =
          settings.arguments as FlightSearchNavigateModel;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: FlightSearchScreen(
          flightSearchNavigateModel: flightSearchNavigateModel,
        ),
      );
    case routes.addFlightInformation:
      final String? appBarTitle = settings.arguments as String?;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: AddFlightInformationScreen(
          appBarTitle: appBarTitle,
        ),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

//to return default navigation route in case of error or empty
ADMaterialPageRoute getRouteOnEmptyType(RouteSettings settings) {
  return ADMaterialPageRoute(
    settings: settings,
    childWidget: Scaffold(
      body: Center(
        child: Text('No path for ${settings.name}'),
      ),
    ),
  );
}

//to return BottomBar navigation route
// MaterialPageRoute getBottomTabRouteType(RouteSettings settings) {
//   return MaterialPageRoute(
//     settings: settings,
//     builder: (context) => CupertinoTheme(
//       data: CupertinoThemeData(
//         textTheme: CupertinoTextThemeData(
//           tabLabelTextStyle: ADTextStyle600.size10,
//         ),
//       ),
//       child: BottomBar(
//         bottomNavigationItemsList:
//             HomeBottomAssets.getHomeBottomTabItemsList(context),
//         widgetMap: HomeBottomAssets.homeBottomPages,
//       ),
//     ),
//   );
// }

//to return BottomBar navigation route
PageRoute getBottomTabRouteType(RouteSettings settings) {
  // Utils.changeStatusBarColor();
  return ADFadePageRoute(
    settings: settings,
    pageBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) =>
        CupertinoTheme(
      data: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          tabLabelTextStyle: ADTextStyle600.size10,
        ),
      ),
      child: BottomBar(
        bottomNavigationItemsList:
            HomeBottomAssets.getHomeBottomTabItemsList(context),
        widgetMap: HomeBottomAssets.homeBottomPages,
      ),
    ),
  );
}

//to return splash navigation route
MaterialPageRoute getSplashRouteType(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => const SplashScreen(),
  );
}

//to return splash navigation route
ADMaterialPageRoute getNoInternetRouteType(RouteSettings settings) {
  // final NoInternetCallBack retryTap = settings.arguments as NoInternetCallBack;
  return ADMaterialPageRoute(
    settings: settings,
    childWidget: const NoNetworkView(),
  );
}

//to return flight booking cancellation navigation route based on their type
ADMaterialPageRoute getBookingCancellationRouteByType(RouteSettings settings) {
  switch (settings.name) {
    case routes.flightBookingReviewDetailScreen:
      final SelectedPaxTripToCancel selectedPaxTripToCancel =
          settings.arguments as SelectedPaxTripToCancel;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: FlightBookingCancelReviewScreen(
          selectedPaxTripToCancel: selectedPaxTripToCancel,
        ),
      );
    case routes.flightBookingItemDetails:
      String orderRefID = '';
      String cancelId = '';
      if (settings.arguments is String) {
        orderRefID = settings.arguments as String;
      } else if (settings.arguments is Map<String, String>) {
        final cancelIdObj = settings.arguments as Map<String, String>;
        cancelId = cancelIdObj['cancelledID'] ?? '';
        orderRefID = cancelIdObj['tripId'] ?? '';
      }
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: FlightBookingItemDetails(
          orderRefID: orderRefID,
          cancelId: cancelId,
        ),
      );
    case routes.selectFlightTraveller:
      final FlightViewTripResponseModel flightBookingResponseModel =
          settings.arguments as FlightViewTripResponseModel;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: SelectFlightTraveller(
          flightBookingResponseModel: flightBookingResponseModel,
        ),
      );
    case routes.selectReasonScreen:
      final SelectedPaxTripToCancel selectedPaxTripToCancel =
          settings.arguments as SelectedPaxTripToCancel;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: FlightCancelReasonScreen(
          selectedPaxTripToCancel: selectedPaxTripToCancel,
        ),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

//get loyalty routes based on their type
ADMaterialPageRoute getLoyaltyRouteType(RouteSettings settings) {
  switch (settings.name) {
    case routes.loyaltyHistoryScreen:
      final List args = settings.arguments as List;
      final String rewardBalance = args.first as String;
      final String pendingBalance = args[1] as String;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: LoyaltyHistoryScreen(
          rewardBalance: rewardBalance,
          pendingBalance: pendingBalance,
        ),
      );
    case routes.loyaltyDashboard:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const LoyaltyDashboardMain(),
      );
    case routes.loyaltyReferEarn:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const ReferAndEarn(),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

//get Offer routes based on their type
ADMaterialPageRoute getOffersRouteType(RouteSettings settings) {
  switch (settings.name) {
    case routes.offersDashboard:
      final OfferDashKeyModel? args = settings.arguments as OfferDashKeyModel?;
      final String? airportName = args?.airportName;
      final String? offerTitle = args?.selectedOffersTabTitle;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: OfferDashboardMainScreen(
          selectedOffersTabTitle: offerTitle ?? '',
          airportName: airportName,
        ),
      );
    case routes.offerDetail:
      final OfferKeyModel args = settings.arguments as OfferKeyModel;
      final String offerUniqueID = args.id ?? '';
      final String offerTitle = args.title ?? '';
      final String? airportPrefixName = args.airportPrefixName;
      final bool fetchDataFromPromoCode = args.fetchDataFromPromoCode;
      final bool showBookNowButton = args.showBookNowButton;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: OfferDetailScreen(
          offerUniqueID: offerUniqueID,
          offerTitle: offerTitle,
          fetchDataFromPromoCode: fetchDataFromPromoCode,
          showBookNowButton: showBookNowButton,
          airportPrefixName: airportPrefixName,
        ),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

//get Currency Exchange routes based on their type
ADMaterialPageRoute getCurrencyExchangeRouteType(RouteSettings settings) {
  switch (settings.name) {
    case routes.currencyExchangePoints:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const CurrencyExchangeDetailScreen(),
      );
    case routes.currencyExchangeDetails:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const CurrencyExchangeDetailScreen(),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

ADMaterialPageRoute getRepublicRewardRouteType(RouteSettings settings) {
  switch (settings.name) {
    case routes.republicReward:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const RepublicMainScreen(),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

ADMaterialPageRoute getMaintenanceRouteType(RouteSettings settings) {
  switch (settings.name) {
    case routes.maintenance:
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: const MaintenanceWidget(),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}

//get loyalty routes based on their type
ADMaterialPageRoute getOrdersAndBookingsRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.orderAndBookingsScreen:
      final bool isFromBottomSheet = settings.arguments as bool;
      return ADMaterialPageRoute(
        settings: settings,
        childWidget: OrderAndBookingsScreen(
          fromMoreScreen: isFromBottomSheet,
          fromBottomTab: false,
        ),
      );
    default:
      return getRouteOnEmptyType(settings);
  }
}
