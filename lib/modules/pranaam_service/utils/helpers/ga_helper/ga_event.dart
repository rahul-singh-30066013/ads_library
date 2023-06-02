/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:collection';

import 'package:adani_airport_mobile/analytics/analytics.dart';
import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/service_booking_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class GaEvent {
  static final GaEvent _gaEvent = GaEvent._singleTonInstance();

  static GaEvent getInstance() {
    return _gaEvent;
  }

  GaEvent._singleTonInstance();

  final HashMap<String, Object> parameterMap = HashMap();

  HashMap fireBookPranaamStartEvent(
    PranaamAppDataStateManagement pranaamAppDataStateManagement,
  ) {
    final ServiceBookingModel serviceBookingData =
        pranaamAppDataStateManagement.serviceBookingData;
    parameterMap[Parameters.category.name] = 'pranaam';
    parameterMap[Parameters.express_type.name] = (pranaamAppDataStateManagement
                    .cartDataResponse?.pricingInfo.totalExpressFare?.amount ??
                0) >
            0
        ? 'Yes'
        : 'No';
    parameterMap[Parameters.express_price.name] = pranaamAppDataStateManagement
            .cartDataResponse?.pricingInfo.totalExpressFare?.amount ??
        0;
    parameterMap[Parameters.category.name] = 'pranaam';
    parameterMap[Parameters.sub_category.name] =
        GaEvent.getInstance().parameterMap[Parameters.sub_category.name] ??
            'purchase';
    parameterMap[Parameters.booking_type.name] =
        GaEvent.getInstance().parameterMap[Parameters.booking_type.name] ??
            'normal_purchase';

    parameterMap[Parameters.sector_type.name] = pranaamAppDataStateManagement
            .serviceBookingData.selectedTravelSector?.travelSectorTitle ??
        pranaamAppDataStateManagement
            .cartDataResponse?.tripDetail.travelSector ??
        '';
    parameterMap[Parameters.departure_date.name] = formatGaDate(
      pranaamAppDataStateManagement
              .serviceBookingData.dateOfJourney?.dateOfJourney
              .toString() ??
          formatGaDate(
            pranaamAppDataStateManagement
                    .cartDataResponse?.tripDetail.flightDate
                    .toString() ??
                '',
          ),
    );
    parameterMap[Parameters.outbound_flight_number.name] =
        pranaamAppDataStateManagement
                    .serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement.serviceBookingData
                    .roundTripTransitFlights?.flightFinalNumber ??
                ''
            : pranaamAppDataStateManagement.serviceBookingData
                    .selectedFlightDetailModel?.flightFinalNumber ??
                pranaamAppDataStateManagement
                    .cartDataResponse?.tripDetail.flightName ??
                '';
    parameterMap[
        Parameters.outbound_airline.name] = pranaamAppDataStateManagement
            .serviceBookingData.selectedFlightDetailModel?.airlineCode ??
        '${pranaamAppDataStateManagement.cartDataResponse?.tripDetail.flightName[0]}${pranaamAppDataStateManagement.cartDataResponse?.tripDetail.flightName[1]}';
    parameterMap[Parameters.departure_station.name] =
        pranaamAppDataStateManagement
                .serviceBookingData.selectedCityDetailFrom?.airportCode ??
            pranaamAppDataStateManagement
                .cartDataResponse?.tripDetail.originAirport ??
            '';
    parameterMap[Parameters.arrival_station.name] =
        pranaamAppDataStateManagement
                .serviceBookingData.selectedCityDetailTo?.airportCode ??
            pranaamAppDataStateManagement
                .cartDataResponse?.tripDetail.destinationAirport ??
            '';
    parameterMap[Parameters.return_date.name] =
        serviceBookingData.selectedService?.serviceTitle == 'Round Trip'
            ? formatGaDate(
                pranaamAppDataStateManagement
                        .serviceBookingData.roundTripTransitDate?.dateOfJourney
                        .toString() ??
                    '',
              )
            : '';
    parameterMap[Parameters.inbound_flight_number.name] =
        pranaamAppDataStateManagement.serviceBookingData.roundTripTransitFlights
                ?.flightFinalNumber ??
            '';
    parameterMap[Parameters.inbound_airline.name] =
        pranaamAppDataStateManagement
                .serviceBookingData.roundTripTransitFlights?.airlineCode ??
            '';
    updateTransitMap(
      pranaamAppDataStateManagement,
    );
    parameterMap[Parameters.pax_count.name] = (pranaamAppDataStateManagement
                .serviceBookingData.travellers?.children ??
            0) +
        (pranaamAppDataStateManagement.serviceBookingData.travellers?.adults ??
            0);
    parameterMap[Parameters.child_count.name] =
        pranaamAppDataStateManagement.serviceBookingData.travellers?.children ??
            0;
    parameterMap[Parameters.infant_count.name] =
        pranaamAppDataStateManagement.serviceBookingData.travellers?.infants ??
            0;
    timeHolder(
      pranaamAppDataStateManagement
          .serviceBookingData.selectedService?.serviceTitle,
      pranaamAppDataStateManagement,
    );

    return parameterMap;
  }

  void updateTransitMap(
    PranaamAppDataStateManagement pranaamAppDataStateManagement,
  ) {
    parameterMap[Parameters.inbound_departure_station.name] =
        pranaamAppDataStateManagement
                .serviceBookingData.arriveFrom?.airportCode ??
            '';
    parameterMap[Parameters.inbound_arrival_station.name] =
        pranaamAppDataStateManagement
                    .serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement
                    .serviceBookingData.arriveFrom?.airportCode ??
                ''
            : pranaamAppDataStateManagement
                    .serviceBookingData.selectedCityDetailFrom?.airportCode ??
                '';
    parameterMap[Parameters.transit_date.name] = pranaamAppDataStateManagement
                .serviceBookingData.selectedService?.serviceTitle ==
            'Transit'
        ? formatGaDate(
            pranaamAppDataStateManagement
                    .serviceBookingData.roundTripTransitDate?.dateOfJourney
                    .toString() ??
                '',
          )
        : '';
    parameterMap[Parameters.transit_flight.name] = pranaamAppDataStateManagement
                .serviceBookingData.selectedService?.serviceTitle ==
            'Transit'
        ? pranaamAppDataStateManagement
                .serviceBookingData.selectedFlightDetailModel?.flightNo ??
            ''
        : '';
    parameterMap[Parameters.transit_at.name] = pranaamAppDataStateManagement
            .serviceBookingData.selectedCityDetailTo?.airportCode ??
        pranaamAppDataStateManagement
            .cartDataResponse?.tripDetail.destinationAirport ??
        '';
    parameterMap[Parameters.transit_airline.name] =
        pranaamAppDataStateManagement
                    .serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement
                    .serviceBookingData.roundTripTransitFlights?.airlineCode ??
                ''
            : '';
  }

  void tripTye(PranaamAppDataStateManagement pranaamAppDataStateManagement) {
    parameterMap[Parameters.trip_type.name] = pranaamAppDataStateManagement
            .serviceBookingData.selectedService?.serviceTitle ??
        pranaamAppDataStateManagement
            .cartDataResponse?.tripDetail.serviceType ??
        '';
  }

  void applyCouponCodeEvent(
    PranaamAppDataStateManagement pranaamAppDataStateManagement,
  ) {
    final HashMap dataMap =
        fireBookPranaamStartEvent(pranaamAppDataStateManagement);
    adLog('$dataMap');
    parameterMap[Parameters.package.name] =
        pranaamAppDataStateManagement.cartDataResponse?.packageDetail.name ??
            '';
    parameterMap[Parameters.package_price.name] = (pranaamAppDataStateManagement
                .cartDataResponse
                ?.packageDetail
                .pricingInfo
                .totalBaseFare
                .amount ??
            0) +
        (pranaamAppDataStateManagement
                .cartDataResponse?.packageDetail.pricingInfo.totalTax.amount ??
            0);
    parameterMap[Parameters.total_price.name] = pranaamAppDataStateManagement
            .cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ??
        '';
  }

  void applyCouponEventMap(
    PranaamAppDataStateManagement pranaamAppDataStateManagement,
  ) {
    final HashMap dataMap =
        fireBookPranaamStartEvent(pranaamAppDataStateManagement);
    adLog('$dataMap');
    applyCouponCodeEvent(pranaamAppDataStateManagement);
    parameterMap[Parameters.coupon_code.name] =
        pranaamAppDataStateManagement.getCouponValue;
  }

  void pranaamBookNowEvent(
    PranaamAppDataStateManagement pranaamAppDataStateManagement,
  ) {
    final HashMap dataMap =
        fireBookPranaamStartEvent(pranaamAppDataStateManagement);
    adLog('$dataMap');
    parameterMap[Parameters.category.name] = 'pranaam';
    parameterMap[Parameters.sub_category.name] = 'purchase';
    tripTye(pranaamAppDataStateManagement);
  }

  void pranaamBookModifyEvent(
    PranaamAppDataStateManagement pranaamAppDataStateManagement,
  ) {
    final HashMap dataMap =
        fireBookPranaamStartEvent(pranaamAppDataStateManagement);
    adLog('$dataMap');
    parameterMap[Parameters.category.name] = 'pranaam';
    parameterMap[Parameters.sub_category.name] = 'modifyBooking';
    tripTye(pranaamAppDataStateManagement);
  }

  void selectPackageEvent(
    PranaamAppDataStateManagement pranaamAppDataStateManagement, {
    required bool isForUpgrade,
  }) {
    final HashMap dataMap =
        fireBookPranaamStartEvent(pranaamAppDataStateManagement);

    adLog('$dataMap');
    parameterMap[Parameters.sub_category.name] =
        isForUpgrade ? 'upgrade' : 'purchase';

    parameterMap[Parameters.group_booking.name] =
        pranaamAppDataStateManagement.selectedPackageDetail.isGroupPackage
            ? 'yes'
            : 'no';
    parameterMap[Parameters.trip_type.name] = pranaamAppDataStateManagement
            .serviceBookingData.selectedService?.serviceTitle ??
        '';
    parameterMap[Parameters.package.name] =
        pranaamAppDataStateManagement.cartDataResponse?.packageDetail.name ??
            '';
    parameterMap[Parameters.package.name] =
        pranaamAppDataStateManagement.selectedPackageDetail.name;
    parameterMap[Parameters.package_price.name] = (pranaamAppDataStateManagement
            .selectedPackageDetail.pricingInfo.totalBaseFare.amount) +
        (pranaamAppDataStateManagement
            .selectedPackageDetail.pricingInfo.totalTax.amount);
    parameterMap[Parameters.cart_amount.name] = pranaamAppDataStateManagement
        .selectedPackageDetail.pricingInfo.totalFare.amount;
    parameterMap[Parameters.total_price.name] = pranaamAppDataStateManagement
        .selectedPackageDetail.pricingInfo.totalFare.amount;
    parameterMap[Parameters.booking_type.name] =
        isForUpgrade ? 'upgrade' : 'normal_purchase';

    if (isForUpgrade) {
      parameterMap[Parameters.purchase_revenue.name] =
          pranaamAppDataStateManagement
              .selectedPackageDetail.pricingInfo.totalFare.amount;
      parameterMap[Parameters.value.name] = pranaamAppDataStateManagement
          .selectedPackageDetail.pricingInfo.totalFare.amount;
    }
  }

  void addToCartEcommerceEvent(
    PranaamAppDataStateManagement pranaamAppDataStateManagement,
  ) {
    final HashMap dataMap =
        fireBookPranaamStartEvent(pranaamAppDataStateManagement);
    adLog('$dataMap');
    parameterMap[Parameters.trip_type.name] = pranaamAppDataStateManagement
            .serviceBookingData.selectedService?.serviceTitle ??
        '';
    parameterMap[Parameters.package.name] =
        pranaamAppDataStateManagement.cartDataResponse?.packageDetail.name ??
            '';
    parameterMap[Parameters.amount.name] = pranaamAppDataStateManagement
            .cartDataResponse?.packageDetail.pricingInfo.totalBaseFare.amount ??
        '';
    parameterMap[Parameters.total_amount.name] = pranaamAppDataStateManagement
            .cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ??
        '';
    final List<AnalyticsEventItem> itemList = [];
    adLog('testing');
    final String itemIdPackage = pranaamAppDataStateManagement
            .cartDataResponse?.packageDetail.packageId
            .toString() ??
        '';
    final String itemNamePackage =
        pranaamAppDataStateManagement.cartDataResponse?.packageDetail.name ??
            '';
    final String serviceAirport = pranaamAppDataStateManagement
            .serviceBookingData.selectedCityDetailFrom?.airportCode ??
        '';
    // final String codeValue=pranaamAppDataStateManagement
    //     .serviceBookingData.selectedCityDetailFrom?.airportCode ??
    //     '';
    itemList.add(
      AnalyticsEventItem(
        affiliation: 'N/A',
        currency: 'INR',
        index: -1,
        itemBrand: 'N/A',
        itemCategory: 'Pranaam/Add On',
        itemCategory2: 'N/A',
        itemCategory3: 'N/A',
        itemListId: 'N/A',
        itemListName: 'N/A',
        itemId: 'Pranaam $itemIdPackage',
        itemName: 'Pranaam $itemNamePackage $serviceAirport',
        itemVariant: pranaamAppDataStateManagement
                .serviceBookingData.selectedService?.serviceTitle ??
            '',
        locationId: 'N/A',
        price: pranaamAppDataStateManagement
                .cartDataResponse
                ?.packageDetail
                .pricingInfo
                .passengerTypeQuantity
                .first
                .totalFare
                .perPaxAmount ??
            0,
        quantity: pranaamAppDataStateManagement.cartDataResponse?.packageDetail
                .pricingInfo.passengerTypeQuantity.first.quantity ??
            0,
      ),
    );
    parameterMap[Parameters.items.name] = itemList;
  }

  void removeCartEvent(
    PranaamAppDataStateManagement pranaamAppDataStateManagement,
  ) {
    final HashMap dataMap =
        fireBookPranaamStartEvent(pranaamAppDataStateManagement);
    adLog('$dataMap');
    parameterMap[Parameters.source.name] = 'cartPage';
  }

  void firePopUpDisplay() {
    parameterMap[Parameters.label.name] = 'yes';
  }

  void proceedToPayEvent(
    PranaamAppDataStateManagement pranaamAppDataStateManagement,
    String totalPortersPrice,
  ) {
    final HashMap dataMap =
        fireBookPranaamStartEvent(pranaamAppDataStateManagement);
    adLog('$dataMap');
    adLog(
      pranaamAppDataStateManagement.pranaamCreateBooking.billingInfo
          ?.addressModel.countryDetails.countryName,
    );
    parameterMap[Parameters.country.name] = pranaamAppDataStateManagement
            .pranaamCreateBooking
            .billingInfo
            ?.addressModel
            .countryDetails
            .countryName ??
        '';
    parameterMap[Parameters.cart_amount.name] = (pranaamAppDataStateManagement
                .cartDataResponse
                ?.packageDetail
                .pricingInfo
                .totalBaseFare
                .amount ??
            0) +
        (pranaamAppDataStateManagement
                .cartDataResponse?.packageDetail.pricingInfo.totalTax.amount ??
            0);
    parameterMap['purchase_revenue'] = pranaamAppDataStateManagement
            .cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ??
        0;

    parameterMap[Parameters.total_price.name] = pranaamAppDataStateManagement
            .cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ??
        0;
    parameterMap[Parameters.package_price.name] = (pranaamAppDataStateManagement
                .cartDataResponse
                ?.packageDetail
                .pricingInfo
                .totalBaseFare
                .amount ??
            0) +
        (pranaamAppDataStateManagement
                .cartDataResponse?.packageDetail.pricingInfo.totalTax.amount ??
            0);
    parameterMap[Parameters.coupon_value.name] = pranaamAppDataStateManagement
            .cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        0;
    parameterMap[Parameters.porter_price.name] = totalPortersPrice;
    parameterMap[Parameters.reward_points.name] = pranaamAppDataStateManagement
            .cartDataResponse?.potentialLoyaltyEarning ??
        '';
    parameterMap['adult_count'] =
        pranaamAppDataStateManagement.serviceBookingData.travellers?.adults ??
            0;
    parameterMap['child_count'] =
        pranaamAppDataStateManagement.serviceBookingData.travellers?.children ??
            0;
    parameterMap['infant_count'] =
        pranaamAppDataStateManagement.serviceBookingData.travellers?.infants ??
            0;
    parameterMap['value'] = pranaamAppDataStateManagement
            .cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ??
        0;

    // parameterMap[PranaamParameters.add_on.name] =
    //     pranaamAppDataStateManagement
    //             .cartDataResponse?.packageAddOn.first.addOnServiceName ??
    //         '';
    // parameterMap[PranaamParameters.add_on_price.name] =
    //     pranaamAppDataStateManagement
    //             .cartDataResponse?.packageAddOn.first.price ??
    //         '';
  }

  /// GA analytics method for payment screen on pay now button
  void addPaymentInfoEvent(
    PranaamAppDataStateManagement pranaamAppDataStateManagement,
    ClickEvents events,
    String? errorText,
  ) {
    final HashMap dataMap =
        fireBookPranaamStartEvent(pranaamAppDataStateManagement);
    adLog('$dataMap');
    tripTye(pranaamAppDataStateManagement);
    parameterMap[Parameters.package.name] =
        pranaamAppDataStateManagement.cartDataResponse?.packageDetail.name ??
            '';
    parameterMap[Parameters.coupon.name] =
        pranaamAppDataStateManagement.getCouponValue;
    parameterMap[Parameters.total_price.name] = pranaamAppDataStateManagement
            .cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ??
        '';
    parameterMap[Parameters.reward_points.name] = pranaamAppDataStateManagement
            .cartDataResponse?.potentialLoyaltyEarning ??
        '';
    parameterMap[Parameters.country.name] = pranaamAppDataStateManagement
            .pranaamCreateBooking
            .billingInfo
            ?.addressModel
            .countryDetails
            .countryName ??
        '';
    if ((pranaamAppDataStateManagement
                .cartDataResponse?.packageDetail.packageAddOn.length ??
            0) >
        0) {
      parameterMap[Parameters.add_on_price.name] = pranaamAppDataStateManagement
              .cartDataResponse?.packageDetail.packageAddOn.first.price ??
          '';
      parameterMap[Parameters.add_on_name.name] = pranaamAppDataStateManagement
              .cartDataResponse
              ?.packageDetail
              .packageAddOn
              .first
              .addOnServiceName ??
          '';
    }
    // payment_type: credit_card/debit_card/upi/wallet/net_banking
    // payment_method: sub_categories/bank names e.g. phonepe/googlepay/paytm/axis/icici
    // payment_gateway:
    // payment_aggregator
    // value: Total purchase value
    // currency:
    // porter_price: Total Amount of Porter Service
    final payNowBookingObject = <String, Object?>{
      Parameters.gst_flag.name: '',
      Parameters.pax_title.name: '',
      Parameters.error_text.name: errorText ?? '',
    };
    events.logEvent(parameters: payNowBookingObject);
  }

  void fireBookPranaamPaymentFailEvent() {
    parameterMap[Parameters.error_type.name] = '';
  }

  void fireOrderAndBookingItemSelect() {
    parameterMap[Parameters.category.name] = 'services';
    parameterMap[Parameters.sub_category.name] = 'order_history';
    parameterMap[Parameters.label.name] = 'Bookings';
  }

  void viewCartEvent(
    PranaamAppDataStateManagement pranaamAppDataStateManagement,
  ) {
    final HashMap dataMap =
        fireBookPranaamStartEvent(pranaamAppDataStateManagement);
    adLog('$dataMap');
    //trip type getting value
    tripTye(pranaamAppDataStateManagement);
    parameterMap[Parameters.package.name] =
        pranaamAppDataStateManagement.cartDataResponse?.packageDetail.name ??
            '';
    parameterMap[Parameters.package_price.name] = (pranaamAppDataStateManagement
                .cartDataResponse
                ?.packageDetail
                .pricingInfo
                .totalBaseFare
                .amount ??
            0) +
        (pranaamAppDataStateManagement
                .cartDataResponse?.packageDetail.pricingInfo.totalTax.amount ??
            0);
    parameterMap[Parameters.total_price.name] = pranaamAppDataStateManagement
            .cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ??
        0;
    parameterMap[Parameters.cart_amount.name] = (pranaamAppDataStateManagement
                .cartDataResponse
                ?.packageDetail
                .pricingInfo
                .totalBaseFare
                .amount ??
            0) +
        (pranaamAppDataStateManagement
                .cartDataResponse?.packageDetail.pricingInfo.totalTax.amount ??
            0);
    parameterMap[Parameters.coupon.name] = pranaamAppDataStateManagement
            .cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponCode ??
        '';
    parameterMap[Parameters.coupon_value.name] = pranaamAppDataStateManagement
            .cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        0;
    parameterMap[Parameters.total_discount.name] = pranaamAppDataStateManagement
            .cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        0;
    parameterMap[Parameters.reward_earned.name] = pranaamAppDataStateManagement
            .cartDataResponse?.potentialLoyaltyEarning ??
        '';
    // parameterMap[PranaamParameters.source.name] = 'viewCart';
  }

  void continueButtonBeginCheckEvent(
    PranaamAppDataStateManagement pranaamAppDataStateManagement,
  ) {
    final HashMap dataMap =
        fireBookPranaamStartEvent(pranaamAppDataStateManagement);
    adLog('$dataMap');
    tripTye(pranaamAppDataStateManagement);
    parameterMap[Parameters.package.name] =
        pranaamAppDataStateManagement.cartDataResponse?.packageDetail.name ??
            '';
    parameterMap[Parameters.coupon.name] =
        pranaamAppDataStateManagement.getCouponValue;
    parameterMap[Parameters.total_price.name] = pranaamAppDataStateManagement
            .cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ??
        '';
    removeCartEvent(pranaamAppDataStateManagement);
    if ((pranaamAppDataStateManagement
                .cartDataResponse?.packageDetail.packageAddOn.length ??
            0) >
        0) {
      parameterMap[Parameters.add_on_price.name] = pranaamAppDataStateManagement
              .cartDataResponse?.packageDetail.packageAddOn.first.price ??
          '';
      parameterMap[Parameters.add_on_name.name] = pranaamAppDataStateManagement
              .cartDataResponse
              ?.packageDetail
              .packageAddOn
              .first
              .addOnServiceName ??
          '';
    }
  }

  void backToStartShopEvent(
    PranaamAppDataStateManagement pranaamAppDataStateManagement,
  ) {
    parameterMap[Parameters.category.name] = 'pranaam';
    parameterMap[Parameters.sub_category.name] = 'purchase';
    parameterMap[Parameters.sector_type.name] =
        parameterMap[Parameters.sector_type.name] =
            pranaamAppDataStateManagement.serviceBookingData
                    .selectedTravelSector?.travelSectorTitle ??
                '';
    parameterMap[Parameters.trip_type.name] = pranaamAppDataStateManagement
            .serviceBookingData.selectedService?.serviceTitle ??
        '';
  }

  void bookPranaamAddOnEvent() {
    parameterMap[Parameters.add_on.name] = '';
    parameterMap[Parameters.add_on_price.name] = '';
  }

  void helpAndSupportEvent() {
    parameterMap[Parameters.package.name] = 'help';
  }

  void cancelOrderBeginEvent(
    PranaamAppDataStateManagement pranaamAppDataStateManagement,
  ) {
    bookPranaamAddOnEvent();
    helpAndSupportEvent();
    parameterMap[Parameters.country.name] = pranaamAppDataStateManagement
            .pranaamCreateBooking
            .billingInfo
            ?.addressModel
            .countryDetails
            .countryName ??
        '';
    // parameterMap[PranaamParameters.porter_price.name]=pranaamAppDataStateManagement.;
    parameterMap[Parameters.reward_points.name] = pranaamAppDataStateManagement
            .cartDataResponse?.potentialLoyaltyEarning ??
        '';
  }

  void cancelOrderCompleteEvent(
    PranaamAppDataStateManagement pranaamAppDataStateManagement,
  ) {
    cancelOrderBeginEvent(pranaamAppDataStateManagement);
    parameterMap[Parameters.payment_type.name] = '';
    parameterMap[Parameters.error_type.name] = '';
    parameterMap[Parameters.payment_method.name] = '';
  }

  void orderAndMenuSelectEvent(
    PranaamAppDataStateManagement pranaamAppDataStateManagement,
  ) {
    cancelOrderCompleteEvent(pranaamAppDataStateManagement);
    parameterMap[Parameters.sub_category.name] = 'order_history';
    parameterMap[Parameters.label.name] = 'All';
  }

  void feedbackEvent(String source) {
    parameterMap.clear();
    parameterMap[Parameters.category.name] = 'services';
    parameterMap[Parameters.sub_category.name] = 'feedback';
    parameterMap[Parameters.source.name] = source;
  }

  void offersAndDiscountEvent() {
    parameterMap.clear();
    parameterMap[Parameters.category.name] = 'profile';
    parameterMap[Parameters.sub_category.name] = 'offers_and_discount';
  }

  void offersCouponApplyEvent(
    String description,
    String code,
    String category,
  ) {
    parameterMap.clear();
    parameterMap[Parameters.category.name] = category;
    parameterMap[Parameters.sub_category.name] = 'purchase';
    parameterMap['coupon_value'] = 0;
    parameterMap['coupon_unit'] = '';
    parameterMap['text'] = description;
    parameterMap[Parameters.coupon.name] = code;
  }

  void offersCouponRemoveEvent(
    String code,
    String category,
  ) {
    parameterMap.clear();
    parameterMap[Parameters.category.name] = category;
    parameterMap[Parameters.sub_category.name] = 'purchase';
    parameterMap[Parameters.coupon_value.name] =
        Analytics.flightBookingGAObject?[Parameters.coupon_value.name] ?? '';
    parameterMap[Parameters.coupon.name] = code;
  }

  void offersCouponApplyErrorEvent(String? message, String? errorCode) {
    parameterMap[Parameters.error_text.name] =
        message ?? 'Looks like you entered invalid coupon. Please try again.';
    parameterMap[Parameters.error_code.name] = errorCode ?? '';
  }

  void pranaamUpCellBanner() {
    parameterMap.clear();
    parameterMap[Parameters.category.name] = 'cross_sell';
    parameterMap[Parameters.sub_category.name] = 'pranaam';
    parameterMap[Parameters.source.name] = 'book_flight';
    parameterMap[Parameters.booking_type.name] = 'cross_sell';
  }

  void timeHolder(
    String? tripType,
    PranaamAppDataStateManagement pranaamAppDataStateManagement,
  ) {
    if (tripType == 'Departure') {
      parameterMap[Parameters.departure_service_time.name] =
          pranaamAppDataStateManagement.flightFirstTimeTextValue.value;
      parameterMap[Parameters.departure_time.name] =
          pranaamAppDataStateManagement.flightSecondTimeTextValue.value;
    }
    if (tripType == 'Arrival') {
      parameterMap[Parameters.arrival_service_time.name] =
          pranaamAppDataStateManagement.flightFirstTimeTextValue.value;
      parameterMap[Parameters.arrival_time.name] =
          pranaamAppDataStateManagement.flightSecondTimeTextValue.value;
    }
    if (tripType == 'Round Trip') {
      parameterMap[Parameters.departure_service_time.name] =
          pranaamAppDataStateManagement.flightFirstTimeTextValue.value;
      parameterMap[Parameters.arrival_service_time.name] =
          pranaamAppDataStateManagement.flightSecondTimeTextValue.value;
    }
    if (tripType == 'Transit') {
      parameterMap[Parameters.transit_service_time.name] =
          pranaamAppDataStateManagement.flightFirstTimeTextValue.value;
      parameterMap[Parameters.departure_service_time.name] =
          pranaamAppDataStateManagement.flightSecondTimeTextValue.value;
    }
  }
}
