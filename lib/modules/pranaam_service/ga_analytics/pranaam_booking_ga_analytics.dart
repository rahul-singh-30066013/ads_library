/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:collection';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/booking_details/api_response_model/booking_details_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/cart_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_addon.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/service_booking_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:collection/collection.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class PranaamBookingGaAnalytics {
  final Map<String, Object?> purchaseEventAnalytics = HashMap();
  final List<AnalyticsEventItem> itemList = <AnalyticsEventItem>[];
  final bookingType = GaEvent.getInstance()
      .parameterMap[Parameters.booking_type.name] as String?;

  void eventConstants({
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  }) {
    purchaseEventAnalytics[Parameters.category.name] = 'pranaam';
    purchaseEventAnalytics[Parameters.express_type.name] =
        (pranaamAppDataStateManagement?.cartDataResponse?.pricingInfo
                        .totalExpressFare?.amount ??
                    0) >
                0
            ? 'Yes'
            : 'No';
    purchaseEventAnalytics[Parameters.express_price.name] =
        pranaamAppDataStateManagement
                ?.cartDataResponse?.pricingInfo.totalExpressFare?.amount ??
            0;

    if (isUpgradeBooking(
      pranaamAppDataStateManagement?.cartDataResponse?.pranaamBookingType ?? '',
    )) {
      purchaseEventAnalytics[Parameters.booking_type.name] = 'upgrade';
      purchaseEventAnalytics[Parameters.sub_category.name] = 'upgrade';
    } else if (isReschedule(
      pranaamAppDataStateManagement?.cartDataResponse?.pranaamBookingType ?? '',
    )) {
      purchaseEventAnalytics[Parameters.booking_type.name] = 'reschedule';
      purchaseEventAnalytics[Parameters.sub_category.name] = 'reschedule';
    } else {
      purchaseEventAnalytics[Parameters.booking_type.name] =
          bookingType ?? 'normal_purchase';
      purchaseEventAnalytics[Parameters.sub_category.name] =
          bookingType ?? 'purchase';
    }
  }

  void paxCount(
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    purchaseEventAnalytics[Parameters.pax_count.name] =
        (pranaamAppDataStateManagement?.serviceBookingData.travellers?.adults ??
                0) +
            (pranaamAppDataStateManagement
                    ?.serviceBookingData.travellers?.children ??
                0);
    purchaseEventAnalytics[Parameters.adult_count.name] =
        pranaamAppDataStateManagement?.serviceBookingData.travellers?.adults ??
            0;
    purchaseEventAnalytics[Parameters.child_count.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.travellers?.children ??
            0;
    purchaseEventAnalytics[Parameters.infant_count.name] =
        pranaamAppDataStateManagement?.serviceBookingData.travellers?.infants ??
            0;
  }

  void returnDate(
    PranaamAppDataStateManagement? pranaamAppDataStateManagement, {
    bool isForUpgrade = false,
  }) {
    purchaseEventAnalytics[Parameters.return_date.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Round Trip'
            ? isForUpgrade
                ? formatGaDate(
                    pranaamAppDataStateManagement?.cartDataResponse?.tripDetail
                            .transitRoundTripSecFlightDate
                            .toString() ??
                        '',
                  )
                : formatGaDate(
                    pranaamAppDataStateManagement?.serviceBookingData
                            .roundTripTransitDate?.dateOfJourney
                            .toString() ??
                        '',
                  )
            : '';
  }

  void transitCart(
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    if (pranaamAppDataStateManagement
            ?.serviceBookingData.selectedService?.serviceTitle ==
        'Transit') {
      purchaseEventAnalytics[Parameters.transit_airline.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
              '';
      purchaseEventAnalytics[Parameters.transit_date.name] = formatGaDate(
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                .toString() ??
            '',
      );
      purchaseEventAnalytics[Parameters.transit_flight.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.selectedFlightDetailModel?.flightNo ??
              '';
      purchaseEventAnalytics[Parameters.transit_at.name] =
          pranaamAppDataStateManagement
              ?.serviceBookingData.selectedCityDetailTo?.airportCode;
    }
  }

  void ecommerceEventAddCart(
    ClickEvents events,
    PranaamAppDataStateManagement? pranaamAppDataStateManagement, {
    bool isForUpgrade = false,
  }) {
    final ServiceBookingModel? serviceBookingData =
        pranaamAppDataStateManagement?.serviceBookingData;
    eventConstants();
    purchaseEventAnalytics[Parameters.purchase_revenue.name] =
        pranaamAppDataStateManagement
            ?.selectedPackageDetail.pricingInfo.totalFare.amount;
    purchaseEventAnalytics[Parameters.trip_type.name] =
        serviceBookingData?.selectedService?.serviceTitle ?? '';
    purchaseEventAnalytics[Parameters.sector_type.name] =
        serviceBookingData?.selectedTravelSector?.travelSectorTitle ?? '';
    purchaseEventAnalytics[Parameters.departure_date.name] = isForUpgrade
        ? universalDateFormatter(
            requiredFormat: "'~t'yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
            dateString: pranaamAppDataStateManagement
                    ?.cartDataResponse?.tripDetail.flightDate ??
                '',
            inCommingFormat: 'yyyy-MM-dd',
          )
        : universalDateFormatter(
            requiredFormat: "'~t'yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
            dateString:
                serviceBookingData?.selectedFlightDetailModel?.serviceDate,
            inCommingFormat: 'dd-MM-yyyy',
          );
    purchaseEventAnalytics[Parameters.departure_station.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.selectedCityDetailFrom?.cityCode ??
            '';
    purchaseEventAnalytics[Parameters.inbound_departure_station.name] =
        isForUpgrade
            ? pranaamAppDataStateManagement
                ?.cartDataResponse?.tripDetail.destinationAirport
            : pranaamAppDataStateManagement
                    ?.serviceBookingData.arriveFrom?.cityCode ??
                '';
    purchaseEventAnalytics[Parameters.arrival_station.name] = isForUpgrade
        ? pranaamAppDataStateManagement
            ?.cartDataResponse?.tripDetail.destinationAirport
        : pranaamAppDataStateManagement
                ?.serviceBookingData.selectedCityDetailTo?.airportCode ??
            '';
    purchaseEventAnalytics[Parameters.inbound_arrival_station.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement
                    ?.serviceBookingData.arriveFrom?.cityCode ??
                ''
            : pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedCityDetailFrom?.cityCode ??
                '';
    purchaseEventAnalytics[Parameters.outbound_flight_number.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? isForUpgrade
                ? pranaamAppDataStateManagement?.cartDataResponse?.tripDetail
                    .transitRoundTripSecFlightNumber
                : pranaamAppDataStateManagement?.serviceBookingData
                        .roundTripTransitFlights?.flightFinalNumber ??
                    ''
            : isForUpgrade
                ? pranaamAppDataStateManagement
                        ?.cartDataResponse?.tripDetail.flightName ??
                    ''
                : serviceBookingData?.selectedFlightDetailModel?.flightNo ?? '';
    purchaseEventAnalytics[Parameters.outbound_airline.name] = isForUpgrade
        ? pranaamAppDataStateManagement?.cartDataResponse?.tripDetail.flightName
                .split('-')
                .firstOrNull ??
            ''
        : pranaamAppDataStateManagement
                ?.serviceBookingData.selectedFlightDetailModel?.airlineCode ??
            '';
    returnDate(pranaamAppDataStateManagement, isForUpgrade: isForUpgrade);

    purchaseEventAnalytics[Parameters.inbound_flight_number.name] = isForUpgrade
        ? pranaamAppDataStateManagement
                        ?.cartDataResponse?.tripDetail.serviceType ==
                    'Transit' ||
                pranaamAppDataStateManagement
                        ?.cartDataResponse?.tripDetail.serviceType ==
                    'Round Trip'
            ? pranaamAppDataStateManagement?.cartDataResponse?.tripDetail
                    .transitRoundTripSecFlightNumber ??
                ''
            : ''
        : pranaamAppDataStateManagement?.serviceBookingData
                .roundTripTransitFlights?.flightFinalNumber ??
            '';
    purchaseEventAnalytics[Parameters.inbound_airline.name] = isForUpgrade
        ? pranaamAppDataStateManagement
            ?.cartDataResponse?.tripDetail.transitRoundTripSecFlightName
            .split('-')
            .firstOrNull
        : pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
            '';

    transitCart(pranaamAppDataStateManagement);

    purchaseEventAnalytics[Parameters.package.name] =
        pranaamAppDataStateManagement?.selectedPackageDetail.name ?? '';
    purchaseEventAnalytics[Parameters.group_booking.name] =
        pranaamAppDataStateManagement?.selectedPackageDetail.isGroupPackage ??
                false
            ? 'yes'
            : 'no';
    purchaseEventAnalytics[Parameters.package_price.name] =
        (pranaamAppDataStateManagement
                    ?.selectedPackageDetail.pricingInfo.totalBaseFare.amount ??
                0) +
            (pranaamAppDataStateManagement
                    ?.selectedPackageDetail.pricingInfo.totalTax.amount ??
                0);
    paxCount(pranaamAppDataStateManagement);

    purchaseEventAnalytics[Parameters.cart_amount.name] =
        (pranaamAppDataStateManagement
                    ?.selectedPackageDetail.pricingInfo.totalBaseFare.amount ??
                0) +
            (pranaamAppDataStateManagement
                    ?.selectedPackageDetail.pricingInfo.totalTax.amount ??
                0);
    purchaseEventAnalytics[Parameters.total_price.name] =
        pranaamAppDataStateManagement
                ?.selectedPackageDetail.pricingInfo.totalFare.amount ??
            0;
    purchaseEventAnalytics[Parameters.currency.name] = 'INR';
    purchaseEventAnalytics[Parameters.value.name] =
        pranaamAppDataStateManagement
            ?.selectedPackageDetail.pricingInfo.totalFare.amount;
    timeHolder(
      pranaamAppDataStateManagement
          ?.serviceBookingData.selectedService?.serviceTitle,
      pranaamAppDataStateManagement,
      isForUpgrade: isForUpgrade,
    );
    for (int index = 0;
        index <
            (pranaamAppDataStateManagement?.selectPackageData.packagesList.first
                    .pricingInfo.passengerTypeQuantity.length ??
                0);
        index++) {
      itemList.add(
        AnalyticsEventItem(
          currency: 'INR',
          itemBrand: 'N/A',
          itemCategory: 'Pranaam',
          itemCategory2: pranaamAppDataStateManagement?.selectPackageData
              .packagesList.first.pricingInfo.passengerTypeQuantity[index].code,
          itemId:
              'Pranaam ${pranaamAppDataStateManagement?.selectedPackageDetail.packageId}',
          itemName:
              'Pranaam ${pranaamAppDataStateManagement?.selectedPackageDetail.packageId} ${serviceBookingData?.goingTo?.cityCode}',
          price: (pranaamAppDataStateManagement
                      ?.selectedPackageDetail
                      .pricingInfo
                      .passengerTypeQuantity
                      .first
                      .totalFare
                      .perPaxAmount ??
                  0)
              .toDouble(),
          index: -1,
          affiliation: 'N/A',
          coupon: 'N/A',
          creativeName: 'N/A',
          creativeSlot: 'N/A',
          itemCategory3: 'N/A',
          itemCategory4: 'N/A',
          itemCategory5: 'N/A',
          itemListId: 'N/A',
          itemListName: 'N/A',
          itemVariant: serviceBookingData?.selectedService?.serviceTitle,
          locationId: 'N/A',
          promotionId: 'N/A',
          promotionName: 'N/A',
          quantity: pranaamAppDataStateManagement
                  ?.selectPackageData
                  .packagesList
                  .first
                  .pricingInfo
                  .passengerTypeQuantity[index]
                  .quantity ??
              0,
        ),
      );
    }

    events.logAnalyticsEventItem(
      parameters: purchaseEventAnalytics,
      items: itemList,
    );
  }

  double? addOnPrice(List<PackageAddOn>? packageAddOn) {
    double addOnPrice = 0;
    for (int index = 0; index < (packageAddOn?.length ?? 0); index++) {
      addOnPrice += packageAddOn?[index].totalPrice ?? 0;
    }
    return addOnPrice;
  }

  String? addOnName(List<PackageAddOn>? packagelist) {
    final packageAddOn = [...packagelist ?? []];
    if (packageAddOn.isNotEmpty) {
      packageAddOn
          .sort((a, b) => a.addOnServiceName.compareTo(b.addOnServiceName));
    }
    final StringBuffer addonName = StringBuffer();
    for (int index = 0; index < (packageAddOn.length); index++) {
      addonName.write(
        '${packageAddOn[index].addOnServiceName}${index < ((packageAddOn.length) - 1) ? ' |' : ''}',
      );
    }
    return addonName.toString();
  }

  double? addOnPriceConfirmation(List<AddOnService>? packageAddOn) {
    double addOnPrice = 0;
    for (int index = 0; index < (packageAddOn?.length ?? 0); index++) {
      addOnPrice += packageAddOn?[index].totalPrice ?? 0;
    }
    return addOnPrice;
  }

  String? addOnNameConfirmation(List<AddOnService>? packageList) {
    final packageAddOn = [...packageList ?? []];
    if (packageAddOn.isNotEmpty) {
      packageAddOn.sort((a, b) => (a.serviceName).compareTo(b.serviceName));
    }
    final StringBuffer addonName = StringBuffer();
    for (int index = 0; index < (packageAddOn.length); index++) {
      addonName.write(
        '${packageAddOn[index].serviceName}${index < ((packageAddOn.length) - 1) ? ' |' : ''}',
      );
    }
    return addonName.toString();
  }

  void ecommerceEventCartAddOn(
    ClickEvents events,
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    final CartResponse? cartDataResponse =
        pranaamAppDataStateManagement?.cartDataResponse;

    eventConstants();
    purchaseEventAnalytics[Parameters.trip_type.name] =
        cartDataResponse?.tripDetail.serviceType ?? '';
    purchaseEventAnalytics[Parameters.sector_type.name] =
        cartDataResponse?.tripDetail.travelSector ?? '';
    purchaseEventAnalytics[Parameters.departure_date.name] =
        cartDataResponse?.tripDetail.flightDate ?? '';
    purchaseEventAnalytics[Parameters.outbound_airline.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.selectedFlightDetailModel?.airlineCode ??
            '';
    purchaseEventAnalytics[Parameters.outbound_flight_number.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement?.serviceBookingData
                    .roundTripTransitFlights?.flightFinalNumber ??
                ''
            : cartDataResponse?.tripDetail.flightName ?? '';
    purchaseEventAnalytics[Parameters.departure_station.name] =
        cartDataResponse?.tripDetail.originAirport ?? '';
    returnDate(pranaamAppDataStateManagement);
    purchaseEventAnalytics[Parameters.inbound_flight_number.name] =
        pranaamAppDataStateManagement?.serviceBookingData
                .roundTripTransitFlights?.flightFinalNumber ??
            '';
    purchaseEventAnalytics[Parameters.inbound_airline.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
            '';
    purchaseEventAnalytics[Parameters.inbound_arrival_station.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement
                    ?.serviceBookingData.arriveFrom?.cityCode ??
                ''
            : pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedCityDetailFrom?.cityCode ??
                '';
    purchaseEventAnalytics[Parameters.inbound_departure_station.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.selectedCityDetailFrom?.airportCode ??
            '';
    if (cartDataResponse?.tripDetail.serviceType == 'Transit') {
      purchaseEventAnalytics[Parameters.transit_airline.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
              '';
      purchaseEventAnalytics[Parameters.transit_at.name] =
          cartDataResponse?.tripDetail.serviceAirport ?? '';
      purchaseEventAnalytics[Parameters.transit_date.name] = formatGaDate(
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                .toString() ??
            '',
      );
      purchaseEventAnalytics[Parameters.transit_flight.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.selectedFlightDetailModel?.flightNo ??
              '';
    }
    purchaseEventAnalytics[Parameters.package.name] =
        cartDataResponse?.packageDetail.name ?? '';
    purchaseEventAnalytics[Parameters.group_booking.name] =
        pranaamAppDataStateManagement?.selectedPackageDetail.isGroupPackage ??
                false
            ? 'yes'
            : 'no';
    paxCount(pranaamAppDataStateManagement);
    purchaseEventAnalytics[Parameters.cart_amount.name] =
        (pranaamAppDataStateManagement?.cartDataResponse?.packageDetail
                    .pricingInfo.totalBaseFare.amount ??
                0) +
            (pranaamAppDataStateManagement?.cartDataResponse?.packageDetail
                    .pricingInfo.totalTax.amount ??
                0) +
            (addOnPrice(
                  pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn,
                ) ??
                0);
    purchaseEventAnalytics[Parameters.total_price.name] =
        (pranaamAppDataStateManagement?.cartDataResponse?.packageDetail
                    .pricingInfo.totalFare.amount ??
                0) +
            (addOnPrice(
                  pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn,
                ) ??
                0);
    purchaseEventAnalytics[Parameters.coupon.name] =
        cartDataResponse?.pricingInfo.discountCouponDetail.couponCode ?? '';
    purchaseEventAnalytics[Parameters.coupon_value.name] = cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        '';
    purchaseEventAnalytics[Parameters.coupon_unit.name] = cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        '';
    purchaseEventAnalytics[Parameters.reward_earned.name] =
        cartDataResponse?.potentialLoyaltyEarning ?? '';
    timeHolder(
      pranaamAppDataStateManagement
          ?.serviceBookingData.selectedService?.serviceTitle,
      pranaamAppDataStateManagement,
    );
    for (int index = 0;
        index <
            (cartDataResponse
                    ?.packageDetail.pricingInfo.passengerTypeQuantity.length ??
                0);
        index++) {
      itemList.add(
        AnalyticsEventItem(
          currency: 'INR',
          discount: cartDataResponse
              ?.pricingInfo.discountCouponDetail.couponDiscountAmount,
          itemBrand: 'N/A',
          itemCategory: 'Pranaam',
          itemCategory2: (cartDataResponse?.packageDetail.pricingInfo
                          .passengerTypeQuantity.length ??
                      0) ==
                  0
              ? '0'
              : cartDataResponse
                  ?.packageDetail.pricingInfo.passengerTypeQuantity[index].code,
          itemId: 'Pranaam ${cartDataResponse?.packageDetail.packageId}',
          itemName:
              'Pranaam ${cartDataResponse?.packageDetail.name} ${cartDataResponse?.tripDetail.destinationAirport}',
          // price: cartDataResponse?.pricingInfo.passengerTypeQuantity.first
          //         .totalFare.perPaxAmount ??
          //     0,
          index: -1,
          affiliation: 'N/A',
          coupon:
              cartDataResponse?.pricingInfo.discountCouponDetail.couponCode ??
                  'N/A',
          creativeName: 'N/A',
          creativeSlot: 'N/A',
          itemCategory3: 'N/A',
          itemCategory4: 'N/A',
          itemCategory5: 'N/A',
          itemListId: 'N/A',
          itemListName: 'N/A',
          itemVariant: cartDataResponse?.tripDetail.serviceType,
          locationId: 'N/A',
          promotionId: 'N/A',
          promotionName: 'N/A',
          quantity: cartDataResponse?.packageDetail.pricingInfo
                  .passengerTypeQuantity[index].quantity ??
              0,
        ),
      );
    }
    if (pranaamAppDataStateManagement?.cartDataResponse?.availiableAddOn !=
        null) {
      for (int index = 0;
          index <
              (pranaamAppDataStateManagement
                      ?.cartDataResponse?.packageAddOn.length ??
                  0);
          index++) {
        itemList.add(
          AnalyticsEventItem(
            currency: 'INR',
            discount: 0,
            itemBrand: 'N/A',
            itemCategory: 'Pranaam Add-On',
            itemCategory2: 'ADD-ON',
            itemId:
                'Pranaam ${cartDataResponse?.packageAddOn[index].addOnServiceId}',
            itemName:
                'Pranaam ${cartDataResponse?.packageAddOn[index].addOnServiceName}' /*${cartDataResponse?.tripDetail.destinationAirport}*/,
            price: cartDataResponse?.packageAddOn[index].totalPrice ?? 0,
            index: -1,
            affiliation: 'N/A',
            coupon: 'N/A',
            creativeName: 'N/A',
            creativeSlot: 'N/A',
            itemCategory3: 'N/A',
            itemCategory4: 'N/A',
            itemCategory5: 'N/A',
            itemListId: 'N/A',
            itemListName: 'N/A',
            itemVariant: cartDataResponse?.tripDetail.serviceType,
            locationId: 'N/A',
            promotionId: 'N/A',
            promotionName: 'N/A',
            quantity: cartDataResponse?.packageAddOn[index].qty,
          ),
        );
      }
    }

    events.logAnalyticsEventItem(
      parameters: purchaseEventAnalytics,
      items: itemList,
    );
  }

  void ecommerceEventAddOn(
    ClickEvents events,
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    final CartResponse? cartDataResponse =
        pranaamAppDataStateManagement?.cartDataResponse;

    eventConstants();
    purchaseEventAnalytics[Parameters.trip_type.name] =
        cartDataResponse?.tripDetail.serviceType ?? '';
    purchaseEventAnalytics[Parameters.sector_type.name] =
        cartDataResponse?.tripDetail.travelSector ?? '';
    purchaseEventAnalytics[Parameters.departure_date.name] =
        cartDataResponse?.tripDetail.flightDate ?? '';
    purchaseEventAnalytics[Parameters.outbound_airline.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.selectedFlightDetailModel?.airlineCode ??
            '';
    purchaseEventAnalytics[Parameters.outbound_flight_number.name] =
        cartDataResponse?.tripDetail.serviceType == 'Transit'
            ? pranaamAppDataStateManagement?.serviceBookingData
                    .roundTripTransitFlights?.flightFinalNumber ??
                ''
            : cartDataResponse?.tripDetail.flightName ?? '';
    purchaseEventAnalytics[Parameters.departure_station.name] =
        cartDataResponse?.tripDetail.originAirport ?? '';
    purchaseEventAnalytics[Parameters.return_date.name] =
        cartDataResponse?.tripDetail.serviceType == 'Round Trip'
            ? formatGaDate(
                pranaamAppDataStateManagement
                        ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                        .toString() ??
                    '',
              )
            : '';
    purchaseEventAnalytics[Parameters.inbound_flight_number.name] =
        pranaamAppDataStateManagement?.serviceBookingData
                .roundTripTransitFlights?.flightFinalNumber ??
            '';
    purchaseEventAnalytics[Parameters.inbound_airline.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
            '';
    purchaseEventAnalytics[Parameters.inbound_arrival_station.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement
                    ?.serviceBookingData.arriveFrom?.cityCode ??
                ''
            : pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedCityDetailFrom?.cityCode ??
                '';
    purchaseEventAnalytics[Parameters.inbound_departure_station.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.selectedCityDetailFrom?.airportCode ??
            '';
    if (cartDataResponse?.tripDetail.serviceType == 'Transit') {
      purchaseEventAnalytics[Parameters.transit_airline.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
              '';
      purchaseEventAnalytics[Parameters.transit_at.name] =
          cartDataResponse?.tripDetail.serviceAirport ?? '';
      purchaseEventAnalytics[Parameters.transit_date.name] = formatGaDate(
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                .toString() ??
            '',
      );
      purchaseEventAnalytics[Parameters.transit_flight.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.selectedFlightDetailModel?.flightNo ??
              '';
    }
    purchaseEventAnalytics[Parameters.package.name] =
        cartDataResponse?.packageDetail.name ?? '';
    purchaseEventAnalytics[Parameters.group_booking.name] =
        pranaamAppDataStateManagement?.selectedPackageDetail.isGroupPackage ??
                false
            ? 'yes'
            : 'no';
    paxCount(pranaamAppDataStateManagement);
    purchaseEventAnalytics[Parameters.amount.name] =
        cartDataResponse?.packageDetail.pricingInfo.totalBaseFare.amount ?? 0;
    purchaseEventAnalytics[Parameters.total_price.name] =
        (cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ?? 0) +
            (addOnPrice(cartDataResponse?.packageAddOn) ?? 0);
    purchaseEventAnalytics[Parameters.coupon.name] =
        cartDataResponse?.pricingInfo.discountCouponDetail.couponCode ?? '';
    purchaseEventAnalytics[Parameters.coupon_value.name] = cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        '';
    purchaseEventAnalytics[Parameters.coupon_unit.name] = cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        '';
    purchaseEventAnalytics[Parameters.add_on.name] = addOnName(
      pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn,
    );
    purchaseEventAnalytics[Parameters.add_on_price.name] = addOnPrice(
      pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn,
    );
    timeHolder(
      pranaamAppDataStateManagement
          ?.serviceBookingData.selectedService?.serviceTitle,
      pranaamAppDataStateManagement,
    );

    for (int index = 0;
        index <
            (cartDataResponse
                    ?.packageDetail.pricingInfo.passengerTypeQuantity.length ??
                0);
        index++) {
      itemList.add(
        AnalyticsEventItem(
          currency: 'INR',
          discount: cartDataResponse
              ?.pricingInfo.discountCouponDetail.couponDiscountAmount,
          itemBrand: 'N/A',
          itemCategory: 'Pranaam',
          itemCategory2: (cartDataResponse?.packageDetail.pricingInfo
                          .passengerTypeQuantity.length ??
                      0) ==
                  0
              ? '0'
              : cartDataResponse
                  ?.packageDetail.pricingInfo.passengerTypeQuantity[index].code,
          itemId: 'Pranaam ${cartDataResponse?.packageDetail.packageId}',
          itemName:
              'Pranaam ${cartDataResponse?.packageDetail.name} ${cartDataResponse?.tripDetail.destinationAirport}',
          price: cartDataResponse?.pricingInfo.totalFare.amount ?? 0,
          index: -1,
          affiliation: 'N/A',
          coupon:
              cartDataResponse?.pricingInfo.discountCouponDetail.couponCode ??
                  'N/A',
          creativeName: 'N/A',
          creativeSlot: 'N/A',
          itemCategory3: 'N/A',
          itemCategory4: 'N/A',
          itemCategory5: 'N/A',
          itemListId: 'N/A',
          itemListName: 'N/A',
          itemVariant: cartDataResponse?.tripDetail.serviceType,
          locationId: 'N/A',
          promotionId: 'N/A',
          promotionName: 'N/A',
          quantity: cartDataResponse?.packageDetail.pricingInfo
                  .passengerTypeQuantity[index].quantity ??
              0,
        ),
      );
    }

    if (pranaamAppDataStateManagement?.cartDataResponse?.availiableAddOn !=
        null) {
      for (int index = 0;
          index <
              (pranaamAppDataStateManagement
                      ?.cartDataResponse?.packageAddOn.length ??
                  0);
          index++) {
        itemList.add(
          AnalyticsEventItem(
            currency: 'INR',
            discount: 0,
            itemBrand: 'N/A',
            itemCategory: 'Pranaam Add-On',
            itemCategory2: 'ADD ON',
            itemId:
                'Pranaam ${cartDataResponse?.packageAddOn[index].addOnServiceId}',
            itemName:
                'Pranaam ${cartDataResponse?.packageAddOn[index].addOnServiceName}' /*${cartDataResponse?.tripDetail.destinationAirport}*/,
            price: cartDataResponse?.packageAddOn[index].totalPrice ?? 0,
            index: -1,
            affiliation: 'N/A',
            coupon: 'N/A',
            creativeName: 'N/A',
            creativeSlot: 'N/A',
            itemCategory3: 'N/A',
            itemCategory4: 'N/A',
            itemCategory5: 'N/A',
            itemListId: 'N/A',
            itemListName: 'N/A',
            itemVariant: cartDataResponse?.tripDetail.serviceType,
            locationId: 'N/A',
            promotionId: 'N/A',
            promotionName: 'N/A',
            quantity: cartDataResponse?.packageAddOn[index].qty,
          ),
        );
      }
    }

    events.logAnalyticsEventItem(
      parameters: purchaseEventAnalytics,
      items: itemList,
    );
  }

  void ecommerceEventRemoveCart(
    ClickEvents events,
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    final CartResponse? cartDataResponse =
        pranaamAppDataStateManagement?.cartDataResponse;

    eventConstants();
    purchaseEventAnalytics[Parameters.purchase_revenue.name] =
        (cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ?? 0) +
            (addOnPrice(cartDataResponse?.packageAddOn) ?? 0);
    purchaseEventAnalytics[Parameters.value.name] =
        (cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ?? 0) +
            (addOnPrice(cartDataResponse?.packageAddOn) ?? 0);
    purchaseEventAnalytics[Parameters.trip_type.name] =
        cartDataResponse?.tripDetail.serviceType ?? '';
    purchaseEventAnalytics[Parameters.sector_type.name] =
        cartDataResponse?.tripDetail.travelSector ?? '';
    purchaseEventAnalytics[Parameters.departure_date.name] =
        cartDataResponse?.tripDetail.flightDate ?? '';
    purchaseEventAnalytics[Parameters.outbound_airline.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.selectedFlightDetailModel?.airlineCode ??
            '';
    purchaseEventAnalytics[Parameters.outbound_flight_number.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement?.serviceBookingData
                    .roundTripTransitFlights?.flightFinalNumber ??
                ''
            : cartDataResponse?.tripDetail.flightName ?? '';
    purchaseEventAnalytics[Parameters.departure_station.name] =
        cartDataResponse?.tripDetail.originAirport ?? '';
    returnDate(pranaamAppDataStateManagement);
    purchaseEventAnalytics[Parameters.inbound_flight_number.name] =
        pranaamAppDataStateManagement?.serviceBookingData
                .roundTripTransitFlights?.flightFinalNumber ??
            '';
    purchaseEventAnalytics[Parameters.inbound_airline.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
            '';
    purchaseEventAnalytics[Parameters.inbound_arrival_station.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement
                    ?.serviceBookingData.arriveFrom?.cityCode ??
                ''
            : pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedCityDetailFrom?.cityCode ??
                '';
    purchaseEventAnalytics[Parameters.inbound_departure_station.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.arriveFrom?.cityCode ??
            '';
    if (cartDataResponse?.tripDetail.serviceType == 'Transit') {
      purchaseEventAnalytics[Parameters.transit_airline.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
              '';
      purchaseEventAnalytics[Parameters.transit_at.name] =
          cartDataResponse?.tripDetail.serviceAirport ?? '';
      purchaseEventAnalytics[Parameters.transit_date.name] = formatGaDate(
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                .toString() ??
            '',
      );
      purchaseEventAnalytics[Parameters.transit_flight.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.selectedFlightDetailModel?.flightNo ??
              '';
    }
    purchaseEventAnalytics[Parameters.package.name] =
        cartDataResponse?.packageDetail.name ?? '';
    purchaseEventAnalytics[Parameters.group_booking.name] =
        pranaamAppDataStateManagement?.selectedPackageDetail.isGroupPackage ??
                false
            ? 'yes'
            : 'no';
    paxCount(pranaamAppDataStateManagement);
    purchaseEventAnalytics[Parameters.cart_amount.name] =
        (cartDataResponse?.packageDetail.pricingInfo.totalBaseFare.amount ??
                0) +
            (cartDataResponse?.packageDetail.pricingInfo.totalTax.amount ?? 0) +
            (addOnPrice(
                  pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn,
                ) ??
                0);
    purchaseEventAnalytics[Parameters.total_price.name] =
        (cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ?? 0) +
            (addOnPrice(cartDataResponse?.packageAddOn) ?? 0);
    purchaseEventAnalytics[Parameters.coupon.name] = cartDataResponse
            ?.packageDetail.pricingInfo.discountCouponDetail.couponCode ??
        '';
    purchaseEventAnalytics[Parameters.coupon_value.name] = cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        '';
    purchaseEventAnalytics[Parameters.total_discount.name] = cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        '';
    purchaseEventAnalytics[Parameters.reward_earned.name] =
        cartDataResponse?.potentialLoyaltyEarning ?? '';
    timeHolder(
      pranaamAppDataStateManagement
          ?.serviceBookingData.selectedService?.serviceTitle,
      pranaamAppDataStateManagement,
    );
    for (int index = 0;
        index <
            (cartDataResponse
                    ?.packageDetail.pricingInfo.passengerTypeQuantity.length ??
                0);
        index++) {
      itemList.add(
        AnalyticsEventItem(
          currency: 'INR',
          discount: cartDataResponse?.packageDetail.pricingInfo
              .discountCouponDetail.couponDiscountAmount,
          itemBrand: 'N/A',
          itemCategory: 'Pranaam',
          itemCategory2: (cartDataResponse?.packageDetail.pricingInfo
                          .passengerTypeQuantity.length ??
                      0) ==
                  0
              ? '0'
              : cartDataResponse
                  ?.packageDetail.pricingInfo.passengerTypeQuantity[index].code,
          itemId: 'Pranaam ${cartDataResponse?.packageDetail.packageId}',
          itemName:
              'Pranaam ${cartDataResponse?.packageDetail.name} ${cartDataResponse?.tripDetail.destinationAirport}',
          price: cartDataResponse?.packageDetail.pricingInfo
                  .passengerTypeQuantity.first.totalFare.perPaxAmount ??
              0,
          index: -1,
          affiliation: 'N/A',
          coupon: pranaamAppDataStateManagement?.getCouponValue ?? 'N/A',
          creativeName: 'N/A',
          creativeSlot: 'N/A',
          itemCategory3: 'N/A',
          itemCategory4: 'N/A',
          itemCategory5: 'N/A',
          itemListId: 'N/A',
          itemListName: 'N/A',
          itemVariant: cartDataResponse?.tripDetail.serviceType,
          locationId: 'N/A',
          promotionId: 'N/A',
          promotionName: 'N/A',
          quantity: cartDataResponse?.packageDetail.pricingInfo
                  .passengerTypeQuantity[index].quantity ??
              0,
        ),
      );
    }

    if (pranaamAppDataStateManagement?.cartDataResponse?.availiableAddOn !=
        null) {
      for (int index = 0;
          index <
              (pranaamAppDataStateManagement
                      ?.cartDataResponse?.packageAddOn.length ??
                  0);
          index++) {
        itemList.add(
          AnalyticsEventItem(
            currency: 'INR',
            discount: 0,
            itemBrand: 'N/A',
            itemCategory: 'Pranaam Add-On',
            itemCategory2: 'ADD ON',
            itemId:
                'Pranaam ${cartDataResponse?.packageAddOn[index].addOnServiceId}',
            itemName:
                'Pranaam ${cartDataResponse?.packageAddOn[index].addOnServiceName}' /*${cartDataResponse?.tripDetail.destinationAirport}*/,
            price: cartDataResponse?.packageAddOn[index].totalPrice ?? 0,
            index: -1,
            affiliation: 'N/A',
            coupon: 'N/A',
            creativeName: 'N/A',
            creativeSlot: 'N/A',
            itemCategory3: 'N/A',
            itemCategory4: 'N/A',
            itemCategory5: 'N/A',
            itemListId: 'N/A',
            itemListName: 'N/A',
            itemVariant: cartDataResponse?.tripDetail.serviceType,
            locationId: 'N/A',
            promotionId: 'N/A',
            promotionName: 'N/A',
            quantity: cartDataResponse?.packageAddOn[index].qty,
          ),
        );
      }
    }

    events.logAnalyticsEventItem(
      parameters: purchaseEventAnalytics,
      items: itemList,
    );
  }

  void amount(double? amount, List<PackageAddOn>? packageAddOn) {
    purchaseEventAnalytics[Parameters.value.name] =
        (amount ?? 0) + (addOnPrice(packageAddOn) ?? 0);
    purchaseEventAnalytics[Parameters.purchase_revenue.name] =
        (amount ?? 0) + (addOnPrice(packageAddOn) ?? 0);
    purchaseEventAnalytics[Parameters.total_price.name] =
        (amount ?? 0) + (addOnPrice(packageAddOn) ?? 0);
  }

  void transitCheckout(
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    if (pranaamAppDataStateManagement
            ?.cartDataResponse?.tripDetail.serviceType ==
        'Transit') {
      purchaseEventAnalytics[Parameters.transit_date.name] = formatGaDate(
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                .toString() ??
            '',
      );
      purchaseEventAnalytics[Parameters.transit_airline.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
              '';
      purchaseEventAnalytics[Parameters.transit_at.name] =
          pranaamAppDataStateManagement
                  ?.cartDataResponse?.tripDetail.serviceAirport ??
              '';
      purchaseEventAnalytics[Parameters.transit_flight.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.selectedFlightDetailModel?.flightNo ??
              '';
    }
  }

  void ecommerceEventCheckout(
    ClickEvents events,
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    final CartResponse? cartDataResponse =
        pranaamAppDataStateManagement?.cartDataResponse;

    eventConstants();
    amount(
      cartDataResponse?.packageDetail.pricingInfo.totalFare.amount,
      pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn,
    );
    tripSectorPackage(pranaamAppDataStateManagement);
    paxCount(pranaamAppDataStateManagement);
    transitCheckout(pranaamAppDataStateManagement);
    purchaseEventAnalytics[Parameters.departure_date.name] =
        formatGaDate(cartDataResponse?.tripDetail.flightDate ?? '');
    purchaseEventAnalytics[Parameters.outbound_airline.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.selectedFlightDetailModel?.airlineCode ??
            '';
    purchaseEventAnalytics[Parameters.outbound_flight_number.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement?.serviceBookingData
                    .roundTripTransitFlights?.flightFinalNumber ??
                ''
            : cartDataResponse?.tripDetail.flightName ?? '';
    purchaseEventAnalytics[Parameters.departure_station.name] =
        cartDataResponse?.tripDetail.originAirport ?? '';
    returnDate(pranaamAppDataStateManagement);
    purchaseEventAnalytics[Parameters.inbound_flight_number.name] =
        pranaamAppDataStateManagement?.serviceBookingData
                .roundTripTransitFlights?.flightFinalNumber ??
            '';
    purchaseEventAnalytics[Parameters.inbound_airline.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
            '';
    purchaseEventAnalytics[Parameters.inbound_arrival_station.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement
                    ?.serviceBookingData.arriveFrom?.cityCode ??
                ''
            : pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedCityDetailFrom?.cityCode ??
                '';
    purchaseEventAnalytics[Parameters.inbound_departure_station.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.arriveFrom?.airportCode ??
            '';
    purchaseEventAnalytics[Parameters.cart_amount.name] =
        (cartDataResponse?.packageDetail.pricingInfo.totalBaseFare.amount ??
                0) +
            (cartDataResponse?.packageDetail.pricingInfo.totalTax.amount ?? 0) +
            (addOnPrice(
                  pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn,
                ) ??
                0);
    purchaseEventAnalytics[Parameters.coupon.name] = cartDataResponse
            ?.packageDetail.pricingInfo.discountCouponDetail.couponCode ??
        '';
    purchaseEventAnalytics[Parameters.coupon_value.name] = cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        '';
    purchaseEventAnalytics[Parameters.total_discount.name] = cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        '';
    purchaseEventAnalytics[Parameters.coupon_unit.name] = cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        '';
    purchaseEventAnalytics[Parameters.add_on.name] = addOnName(
      pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn,
    );
    purchaseEventAnalytics[Parameters.add_on_price.name] = addOnPrice(
      pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn,
    ).toString();
    purchaseEventAnalytics[Parameters.reward_earned.name] =
        cartDataResponse?.potentialLoyaltyEarning ?? '';
    timeHolder(
      pranaamAppDataStateManagement
          ?.serviceBookingData.selectedService?.serviceTitle,
      pranaamAppDataStateManagement,
    );
    for (int index = 0;
        index <
            (cartDataResponse
                    ?.packageDetail.pricingInfo.passengerTypeQuantity.length ??
                0);
        index++) {
      itemList.add(
        AnalyticsEventItem(
          currency: 'INR',
          discount: cartDataResponse?.packageDetail.pricingInfo
              .discountCouponDetail.couponDiscountAmount,
          itemBrand: 'N/A',
          itemCategory: 'Pranaam',
          itemCategory2: (cartDataResponse?.packageDetail.pricingInfo
                          .passengerTypeQuantity.length ??
                      0) ==
                  0
              ? '0'
              : cartDataResponse
                  ?.packageDetail.pricingInfo.passengerTypeQuantity[index].code,
          itemId: 'Pranaam ${cartDataResponse?.packageDetail.packageId}',
          itemName:
              'Pranaam ${cartDataResponse?.packageDetail.name} ${cartDataResponse?.tripDetail.destinationAirport}',
          price: cartDataResponse?.packageDetail.pricingInfo
                  .passengerTypeQuantity.first.totalFare.perPaxAmount ??
              0,
          index: -1,
          affiliation: 'N/A',
          coupon: cartDataResponse
                  ?.packageDetail.pricingInfo.discountCouponDetail.couponCode ??
              'N/A',
          creativeName: 'N/A',
          creativeSlot: 'N/A',
          itemCategory3: 'N/A',
          itemCategory4: 'N/A',
          itemCategory5: 'N/A',
          itemListId: 'N/A',
          itemListName: 'N/A',
          itemVariant: cartDataResponse?.tripDetail.serviceType,
          locationId: 'N/A',
          promotionId: 'N/A',
          promotionName: 'N/A',
          quantity: cartDataResponse?.packageDetail.pricingInfo
                  .passengerTypeQuantity[index].quantity ??
              0,
        ),
      );
    }

    if (pranaamAppDataStateManagement?.cartDataResponse?.availiableAddOn !=
        null) {
      for (int index = 0;
          index <
              (pranaamAppDataStateManagement
                      ?.cartDataResponse?.packageAddOn.length ??
                  0);
          index++) {
        itemList.add(
          AnalyticsEventItem(
            currency: 'INR',
            discount: 0,
            itemBrand: 'N/A',
            itemCategory: 'Pranaam Add-On',
            itemCategory2: 'ADD ON',
            itemId:
                'Pranaam ${cartDataResponse?.packageAddOn[index].addOnServiceId}',
            itemName:
                'Pranaam ${cartDataResponse?.packageAddOn[index].addOnServiceName}' /*${cartDataResponse?.tripDetail.destinationAirport}*/,
            price: cartDataResponse?.packageAddOn[index].totalPrice ?? 0,
            index: -1,
            affiliation: 'N/A',
            coupon: 'N/A',
            creativeName: 'N/A',
            creativeSlot: 'N/A',
            itemCategory3: 'N/A',
            itemCategory4: 'N/A',
            itemCategory5: 'N/A',
            itemListId: 'N/A',
            itemListName: 'N/A',
            itemVariant: cartDataResponse?.tripDetail.serviceType,
            locationId: 'N/A',
            promotionId: 'N/A',
            promotionName: 'N/A',
            quantity: cartDataResponse?.packageAddOn[index].qty,
          ),
        );
      }
    }

    events.logAnalyticsEventItem(
      parameters: purchaseEventAnalytics,
      items: itemList,
    );
  }

  void paymentGatewayAggrigator() {
    purchaseEventAnalytics[Parameters.payment_gateway.name] = 'RazorPaY';
    purchaseEventAnalytics[Parameters.payment_aggregator.name] = 'PineLabs';
  }

  void confirmationSubMethod(
    PranaamDetail? createBooking,
    BookingAndCancellationState? bookingAndCancellationState,
  ) {
    final PackageDetail packageDeatil = bookingAndCancellationState
            ?.bookingDetailsResponse
            ?.orderDetail
            ?.pranaamDetail
            ?.packageDetail ??
        const PackageDetail();
    purchaseEventAnalytics[Parameters.trip_type.name] =
        createBooking?.tripDetails?.serviceType ?? '';
    purchaseEventAnalytics[Parameters.sector_type.name] =
        createBooking?.tripDetails?.travelSector ?? '';
    purchaseEventAnalytics[Parameters.departure_date.name] =
        universalDateFormatter(
      dateTimeObject: createBooking?.tripDetails?.flightDate,
      requiredFormat: "'~t'yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
    );
    purchaseEventAnalytics[Parameters.outbound_airline.name] =
        '${createBooking?.tripDetails?.flightName}';

    purchaseEventAnalytics[Parameters.outbound_flight_number.name] =
        createBooking?.tripDetails?.serviceType == 'Transit'
            ? createBooking?.tripDetails?.transitRoundTripSecFlightName ?? ''
            : createBooking?.tripDetails?.flightName ?? '';
    purchaseEventAnalytics[Parameters.departure_station.name] =
        createBooking?.tripDetails?.originAirport ?? '';
    purchaseEventAnalytics[Parameters.arrival_station.name] =
        createBooking?.tripDetails?.destinationAirport ?? '';
    purchaseEventAnalytics[Parameters.return_date.name] =
        createBooking?.tripDetails?.serviceType == 'Round Trip'
            ? universalDateFormatter(
                dateTimeObject: createBooking?.roundTripDetail?.flightDate,
                requiredFormat: "'~t'yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
              )
            : '';
    purchaseEventAnalytics[Parameters.inbound_flight_number.name] =
        createBooking?.roundTripDetail?.flightNumber ?? '';

    purchaseEventAnalytics[Parameters.inbound_airline.name] =
        '${createBooking?.roundTripDetail?.flightName}';
    purchaseEventAnalytics[Parameters.inbound_arrival_station.name] =
        createBooking?.roundTripDetail?.destinationAirport ?? '';
    purchaseEventAnalytics[Parameters.inbound_departure_station.name] =
        createBooking?.roundTripDetail?.originAirport ?? '';

    if (createBooking?.tripDetails?.serviceType == 'Transit') {
      purchaseEventAnalytics[Parameters.transit_airline.name] =
          '${createBooking?.tripDetails?.transitRoundTripSecFlightName}';
      purchaseEventAnalytics[Parameters.transit_at.name] =
          createBooking?.tripDetails?.serviceAirport ?? '';
      purchaseEventAnalytics[Parameters.transit_date.name] =
          universalDateFormatter(
        requiredFormat: "'~t'yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
        // dateTimeObject: createBooking?.tripDetails?.serviceDateTime,
      );
      purchaseEventAnalytics[Parameters.transit_flight.name] =
          createBooking?.tripDetails?.flightNumber ?? '';
    }
    purchaseEventAnalytics[Parameters.package.name] = packageDeatil.name ?? '';
    purchaseEventAnalytics[Parameters.group_booking.name] =
        packageDeatil.isGroupPackage ?? false ? 'yes' : 'no';
    purchaseEventAnalytics[Parameters.package_price.name] =
        (packageDeatil.pricingInfo?.totalBaseFare?.amount ?? 0) +
            (packageDeatil.pricingInfo?.totalTax?.amount ?? 0);

    // purchaseEventAnalytics[Parameters.purchase_revenue.name] =
    //     (packageDeatil.pricingInfo?.totalFare?.amount ??
    //             0) +
    //         (bookingAndCancellationState?.bookingDetailsResponse?.createBooking
    //                 .loyaltyPoint?.burnedRewardPoints ??
    //             0) +
    //         (addOnPriceConfirmation(
    //               bookingAndCancellationState
    //                   ?.bookingDetailsResponse?.createBooking.addOnsList,
    //             ) ??
    //             0);
    // purchaseEventAnalytics[Parameters.total_price.name] =
    //     (packageDeatil
    //                 .pricingInfo?.totalFare?.amount ??
    //             0) +
    //         (bookingAndCancellationState?.bookingDetailsResponse?.createBooking
    //                 .loyaltyPoint?.burnedRewardPoints ??
    //             0) +
    //         (addOnPriceConfirmation(
    //               bookingAndCancellationState
    //                   ?.bookingDetailsResponse?.createBooking.addOnsList,
    //             ) ??
    //             0);
    // purchaseEventAnalytics[Parameters.cart_amount.name] =
    //     (packageDeatil
    //                 .pricingInfo?.totalBaseFare?.amount ??
    //             0) +
    //         (packageDeatil
    //                 .pricingInfo?.totalTax?.amount ??
    //             0) +
    //         (addOnPriceConfirmation(
    //               bookingAndCancellationState
    //                   ?.bookingDetailsResponse?.createBooking.addOnsList,
    //             ) ??
    //             0);
    purchaseEventAnalytics[Parameters.total_discount.name] = packageDeatil
            .pricingInfo?.discountCouponDetails?.couponDiscountAmount ??
        '';

    purchaseEventAnalytics[Parameters.coupon.name] =
        packageDeatil.pricingInfo?.discountCouponDetails?.couponCode ?? '';
    purchaseEventAnalytics[Parameters.coupon_value.name] = packageDeatil
            .pricingInfo?.discountCouponDetails?.couponDiscountAmount ??
        '';
    purchaseEventAnalytics[Parameters.coupon_unit.name] = packageDeatil
            .pricingInfo?.discountCouponDetails?.couponDiscountAmount ??
        '';
  }

  /// purchase event
  void ecommerceEventConfirmation(
    ClickEvents events,
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
    BookingAndCancellationState? bookingAndCancellationState,
  ) {
    final CartResponse? cartDataResponse =
        pranaamAppDataStateManagement?.cartDataResponse;
    final PranaamDetail? createBooking = bookingAndCancellationState
        ?.bookingDetailsResponse?.orderDetail?.pranaamDetail;
    final List<AddOnService>? addOnsList = createBooking?.addOnServices;
    final PackageDetail packageDeatil =
        createBooking?.packageDetail ?? const PackageDetail();

    eventConstants(
      pranaamAppDataStateManagement: pranaamAppDataStateManagement,
    );
    paxCount(pranaamAppDataStateManagement);
    confirmationSubMethod(createBooking, bookingAndCancellationState);
    paymentGatewayAggrigator();
    purchaseEventAnalytics[Parameters.add_on.name] = addOnNameConfirmation(
      createBooking?.addOnServices,
    );
    purchaseEventAnalytics[Parameters.add_on_price.name] =
        addOnPriceConfirmation(
      createBooking?.addOnServices,
    );
    purchaseEventAnalytics[Parameters.country.name] =
        pranaamAppDataStateManagement?.pranaamCreateBooking.billingInfo
            ?.addressModel.countryDetails.countryName;
    purchaseEventAnalytics[Parameters.payment_type.name] = '';
    // createBooking?.paymentDetails.first.transactionMode;

    purchaseEventAnalytics[Parameters.value.name] =
        (packageDeatil.pricingInfo?.totalFare?.amount ?? 0) +
            (
                // bookingAndCancellationState?.bookingDetailsResponse?.
                //     .loyaltyPoint?.burnedRewardPoints ??
                0) +
            (addOnPriceConfirmation(
                  createBooking?.addOnServices,
                ) ??
                0);
    purchaseEventAnalytics[Parameters.currency.name] = 'INR';
    purchaseEventAnalytics[Parameters.af_currency.name] = 'INR';
    purchaseEventAnalytics[Parameters.af_revenue.name] =
        pranaamAppDataStateManagement
            ?.selectedPackageDetail.pricingInfo.totalFare.amount;
    purchaseEventAnalytics[Parameters.porter_price.name] =
        addOnsList?.length == 1 ? addOnsList?.first.unitPrice : 0;
    purchaseEventAnalytics[Parameters.coupon_code.name] =
        cartDataResponse?.pricingInfo.discountCouponDetail.couponCode ?? '';
    purchaseEventAnalytics[Parameters.reward_earned.name] = 0;

    ///TODO: ADD loyaltyPoint after api start giving
    // createBooking?.loyaltyPoint?.earnedRewardPoints ?? 0;
    purchaseEventAnalytics[Parameters.rewards_burned.name] = 0;
    // createBooking?.loyaltyPoint?.burnedRewardPoints ?? 0;
    purchaseEventAnalytics[Parameters.transaction_id.name] =
        bookingAndCancellationState
            ?.bookingDetailsResponse?.transactionReferenceId;
    purchaseEventAnalytics[Parameters.order_id.name] =
        createBooking?.tripDetails?.tripBookingNumber;
    purchaseEventAnalytics[Parameters.tax.name] =
        createBooking?.packageDetail?.pricingInfo?.totalTax?.amount;
    timeHolder(
      pranaamAppDataStateManagement
          ?.serviceBookingData.selectedService?.serviceTitle,
      pranaamAppDataStateManagement,
    );
    for (int index = 0;
        index < (packageDeatil.pricingInfo?.passengerTypeQuantity?.length ?? 0);
        index++) {
      itemList.add(
        AnalyticsEventItem(
          currency: 'INR',
          discount: packageDeatil
              .pricingInfo?.discountCouponDetails?.couponDiscountAmount,
          itemBrand: 'N/A',
          itemCategory: 'Pranaam',
          itemCategory2:
              packageDeatil.pricingInfo?.passengerTypeQuantity?[index].code,
          itemId: 'Pranaam ${packageDeatil.packageId}',
          itemName:
              'Pranaam ${packageDeatil.name} ${createBooking?.tripDetails?.destinationAirport}',
          price: packageDeatil.pricingInfo?.passengerTypeQuantity?.first
                  .baseFare?.perPaxAmount ??
              0,
          index: -1,
          affiliation: 'N/A',
          coupon:
              packageDeatil.pricingInfo?.discountCouponDetails?.couponCode ??
                  'N/A',
          creativeName: 'N/A',
          creativeSlot: 'N/A',
          itemCategory3: 'N/A',
          itemCategory4: 'N/A',
          itemCategory5: 'N/A',
          itemListId: 'N/A',
          itemListName: 'N/A',
          itemVariant: createBooking?.tripDetails?.serviceType,
          locationId: 'N/A',
          promotionId: 'N/A',
          promotionName: 'N/A',
          quantity: packageDeatil
                  .pricingInfo?.passengerTypeQuantity?[index].quantity ??
              0,
        ),
      );
    }
    if (createBooking?.addOnServices?.length != null) {
      for (int index = 0; index < (addOnsList?.length ?? 0); index++) {
        itemList.add(
          AnalyticsEventItem(
            currency: 'INR',
            discount: 0,
            itemBrand: 'N/A',
            itemCategory: 'Pranaam Add-On',
            itemCategory2: 'ADD ON',
            itemId: 'Pranaam ${addOnsList?[index].addOnServiceId}',
            itemName:
                'Pranaam ${addOnsList?[index].serviceName}' /*${cartDataResponse?.tripDetail.destinationAirport}*/,
            price: addOnsList?[index].totalPrice ?? 0,
            index: -1,
            affiliation: 'N/A',
            coupon: 'N/A',
            creativeName: 'N/A',
            creativeSlot: 'N/A',
            itemCategory3: 'N/A',
            itemCategory4: 'N/A',
            itemCategory5: 'N/A',
            itemListId: 'N/A',
            itemListName: 'N/A',
            itemVariant: createBooking?.tripDetails?.serviceType,
            locationId: 'N/A',
            promotionId: 'N/A',
            promotionName: 'N/A',
            quantity: addOnsList?[index].quantity,
          ),
        );
      }
    }

    events.logAnalyticsEventItem(
      parameters: purchaseEventAnalytics,
      items: itemList,
    );

    ClickEvents.book_pranaam_success
        .logEvent(parameters: purchaseEventAnalytics);
  }

  void applyCouponCodeGaAnalytics(
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    final CartResponse? cartDataResponse =
        pranaamAppDataStateManagement?.cartDataResponse;

    eventConstants();
    purchaseEventAnalytics[Parameters.trip_type.name] =
        cartDataResponse?.tripDetail.serviceType ?? '';
    purchaseEventAnalytics[Parameters.sector_type.name] =
        cartDataResponse?.tripDetail.travelSector ?? '';

    purchaseEventAnalytics[Parameters.departure_date.name] =
        formatGaDate(cartDataResponse?.tripDetail.flightDate.toString() ?? '');
    purchaseEventAnalytics[Parameters.outbound_airline.name] =
        '${cartDataResponse?.tripDetail.flightName[0]}${cartDataResponse?.tripDetail.flightName[1]}';
    purchaseEventAnalytics[Parameters.outbound_flight_number.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement?.serviceBookingData
                    .roundTripTransitFlights?.flightFinalNumber ??
                ''
            : cartDataResponse?.tripDetail.flightName ?? '';
    purchaseEventAnalytics[Parameters.departure_station.name] =
        cartDataResponse?.tripDetail.originAirport ?? '';
    purchaseEventAnalytics[Parameters.arrival_station.name] =
        cartDataResponse?.tripDetail.destinationAirport ?? '';

    /// Return Date
    purchaseEventAnalytics[Parameters.return_date.name] =
        cartDataResponse?.tripDetail.serviceType == 'Round Trip'
            ? formatGaDate(
                pranaamAppDataStateManagement
                        ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                        .toString() ??
                    '',
              )
            : '';
    purchaseEventAnalytics[Parameters.inbound_flight_number.name] =
        pranaamAppDataStateManagement?.serviceBookingData
                .roundTripTransitFlights?.flightFinalNumber ??
            '';
    purchaseEventAnalytics[Parameters.inbound_airline.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
            '';

    /// Inbound Arrival Station
    purchaseEventAnalytics[Parameters.inbound_arrival_station.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement
                    ?.serviceBookingData.arriveFrom?.cityCode ??
                ''
            : pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedCityDetailFrom?.cityCode ??
                '';

    /// Inbound Departure Station
    purchaseEventAnalytics[Parameters.inbound_departure_station.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.arriveFrom?.airportCode ??
            '';

    if (cartDataResponse?.tripDetail.serviceType == 'Transit') {
      purchaseEventAnalytics[Parameters.transit_airline.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
              '';
      purchaseEventAnalytics[Parameters.transit_at.name] =
          cartDataResponse?.tripDetail.serviceAirport ?? '';
      purchaseEventAnalytics[Parameters.transit_date.name] = formatGaDate(
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                .toString() ??
            '',
      );
      purchaseEventAnalytics[Parameters.transit_flight.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.selectedFlightDetailModel?.flightNo ??
              '';
    }

    purchaseEventAnalytics[Parameters.package.name] =
        cartDataResponse?.packageDetail.name ?? '';
    purchaseEventAnalytics[Parameters.group_booking.name] =
        pranaamAppDataStateManagement?.selectedPackageDetail.isGroupPackage ??
                false
            ? 'yes'
            : 'no';
    purchaseEventAnalytics[Parameters.package_price.name] =
        (cartDataResponse?.packageDetail.pricingInfo.totalBaseFare.amount ??
                0) +
            (cartDataResponse?.packageDetail.pricingInfo.totalTax.amount ?? 0);

    /// Pax Count
    purchaseEventAnalytics[Parameters.pax_count.name] =
        (pranaamAppDataStateManagement?.serviceBookingData.travellers?.adults ??
                0) +
            (pranaamAppDataStateManagement
                    ?.serviceBookingData.travellers?.children ??
                0);
    purchaseEventAnalytics[Parameters.coupon.name] = cartDataResponse
            ?.packageDetail.pricingInfo.discountCouponDetail.couponCode ??
        0;
    purchaseEventAnalytics[Parameters.coupon_value.name] = cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        0;
    purchaseEventAnalytics[Parameters.total_discount.name] = cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        0;
    purchaseEventAnalytics[Parameters.cart_amount.name] =
        (cartDataResponse?.packageDetail.pricingInfo.totalBaseFare.amount ??
                0) +
            (cartDataResponse?.packageDetail.pricingInfo.totalTax.amount ?? 0) +
            (addOnPrice(
                  pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn,
                ) ??
                0);
    purchaseEventAnalytics[Parameters.total_price.name] =
        (cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ?? 0) +
            (addOnPrice(cartDataResponse?.packageAddOn) ?? 0);

    /// Coupon
    purchaseEventAnalytics[Parameters.coupon.name] = cartDataResponse
            ?.packageDetail.pricingInfo.discountCouponDetail.couponCode ??
        '';
    timeHolder(
      pranaamAppDataStateManagement
          ?.serviceBookingData.selectedService?.serviceTitle,
      pranaamAppDataStateManagement,
    );

    ClickEvents.book_pranaam_coupon_applied
        .logEvent(parameters: purchaseEventAnalytics);
  }

  void removeCouponGaAnalytics(
    ClickEvents events,
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    final CartResponse? cartDataResponse =
        pranaamAppDataStateManagement?.cartDataResponse;

    eventConstants();
    purchaseEventAnalytics[Parameters.trip_type.name] =
        cartDataResponse?.tripDetail.serviceType ?? '';
    purchaseEventAnalytics[Parameters.sector_type.name] =
        cartDataResponse?.tripDetail.travelSector ?? '';

    purchaseEventAnalytics[Parameters.departure_date.name] =
        formatGaDate(cartDataResponse?.tripDetail.flightDate.toString() ?? '');
    purchaseEventAnalytics[Parameters.outbound_airline.name] =
        '${cartDataResponse?.tripDetail.flightName[0]}${cartDataResponse?.tripDetail.flightName[1]}';
    purchaseEventAnalytics[Parameters.outbound_flight_number.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement?.serviceBookingData
                    .roundTripTransitFlights?.flightFinalNumber ??
                ''
            : cartDataResponse?.tripDetail.flightName ?? '';
    purchaseEventAnalytics[Parameters.departure_station.name] =
        cartDataResponse?.tripDetail.originAirport ?? '';
    purchaseEventAnalytics[Parameters.arrival_station.name] =
        cartDataResponse?.tripDetail.destinationAirport ?? '';

    /// Return Date
    purchaseEventAnalytics[Parameters.return_date.name] =
        cartDataResponse?.tripDetail.serviceType == 'Round Trip'
            ? formatGaDate(
                pranaamAppDataStateManagement
                        ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                        .toString() ??
                    '',
              )
            : '';
    purchaseEventAnalytics[Parameters.inbound_flight_number.name] =
        pranaamAppDataStateManagement?.serviceBookingData
                .roundTripTransitFlights?.flightFinalNumber ??
            '';
    purchaseEventAnalytics[Parameters.inbound_airline.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
            '';

    /// Inbound Arrival Station
    purchaseEventAnalytics[Parameters.inbound_arrival_station.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement
                    ?.serviceBookingData.arriveFrom?.cityCode ??
                ''
            : pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedCityDetailFrom?.cityCode ??
                '';

    /// Inbound Departure Station
    purchaseEventAnalytics[Parameters.inbound_departure_station.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.arriveFrom?.airportCode ??
            '';

    if (cartDataResponse?.tripDetail.serviceType == 'Transit') {
      purchaseEventAnalytics[Parameters.transit_airline.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
              '';
      purchaseEventAnalytics[Parameters.transit_at.name] =
          cartDataResponse?.tripDetail.serviceAirport ?? '';

      purchaseEventAnalytics[Parameters.transit_date.name] = formatGaDate(
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                .toString() ??
            '',
      );
      purchaseEventAnalytics[Parameters.transit_flight.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.selectedFlightDetailModel?.flightNo ??
              '';
    }
    purchaseEventAnalytics[Parameters.package.name] =
        cartDataResponse?.packageDetail.name ?? '';
    purchaseEventAnalytics[Parameters.group_booking.name] =
        pranaamAppDataStateManagement?.selectedPackageDetail.isGroupPackage ??
                false
            ? 'yes'
            : 'no';

    /// Pax Count
    purchaseEventAnalytics[Parameters.pax_count.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.travellers?.totalTravellers ??
            0;
    purchaseEventAnalytics[Parameters.amount.name] =
        cartDataResponse?.packageDetail.pricingInfo.totalBaseFare.amount ?? 0;
    purchaseEventAnalytics[Parameters.total_price.name] =
        (cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ?? 0) +
            (addOnPrice(cartDataResponse?.packageAddOn) ?? 0);

    purchaseEventAnalytics[Parameters.coupon.name] =
        cartDataResponse?.pricingInfo.discountCouponDetail.couponCode;
    purchaseEventAnalytics[Parameters.coupon_value.name] =
        cartDataResponse?.pricingInfo.discountCouponDetail.couponDiscountAmount;
    purchaseEventAnalytics[Parameters.coupon_unit.name] = '';
    timeHolder(
      pranaamAppDataStateManagement
          ?.serviceBookingData.selectedService?.serviceTitle,
      pranaamAppDataStateManagement,
    );

    events.logEvent(parameters: purchaseEventAnalytics);
  }

  void serviceUnavailableGaAnalytics(
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    final CartResponse? cartDataResponse =
        pranaamAppDataStateManagement?.cartDataResponse;

    eventConstants();
    purchaseEventAnalytics[Parameters.trip_type.name] =
        cartDataResponse?.tripDetail.serviceType ?? '';
    purchaseEventAnalytics[Parameters.sector_type.name] =
        cartDataResponse?.tripDetail.travelSector ?? '';

    purchaseEventAnalytics[Parameters.departure_date.name] =
        formatGaDate(cartDataResponse?.tripDetail.flightDate.toString() ?? '');
    purchaseEventAnalytics[Parameters.outbound_airline.name] =
        '${cartDataResponse?.tripDetail.flightName[0]}${cartDataResponse?.tripDetail.flightName[1]}';
    purchaseEventAnalytics[Parameters.outbound_flight_number.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement?.serviceBookingData
                    .roundTripTransitFlights?.flightFinalNumber ??
                ''
            : cartDataResponse?.tripDetail.flightName ?? '';
    purchaseEventAnalytics[Parameters.departure_station.name] =
        cartDataResponse?.tripDetail.originAirport ?? '';
    purchaseEventAnalytics[Parameters.arrival_station.name] =
        cartDataResponse?.tripDetail.destinationAirport ?? '';

    /// Return Date
    purchaseEventAnalytics[Parameters.return_date.name] =
        cartDataResponse?.tripDetail.serviceType == 'Round Trip'
            ? formatGaDate(
                pranaamAppDataStateManagement
                        ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                        .toString() ??
                    '',
              )
            : '';
    purchaseEventAnalytics[Parameters.inbound_flight_number.name] =
        pranaamAppDataStateManagement?.serviceBookingData
                .roundTripTransitFlights?.flightFinalNumber ??
            '';
    purchaseEventAnalytics[Parameters.inbound_airline.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
            '';

    /// Inbound Arrival Station
    purchaseEventAnalytics[Parameters.inbound_arrival_station.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement
                    ?.serviceBookingData.arriveFrom?.cityCode ??
                ''
            : pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedCityDetailFrom?.cityCode ??
                '';

    /// Inbound Departure Station
    purchaseEventAnalytics[Parameters.inbound_departure_station.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.arriveFrom?.airportCode ??
            '';

    if (cartDataResponse?.tripDetail.serviceType == 'Transit') {
      purchaseEventAnalytics[Parameters.transit_airline.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
              '';
      purchaseEventAnalytics[Parameters.transit_at.name] =
          cartDataResponse?.tripDetail.serviceAirport ?? '';

      purchaseEventAnalytics[Parameters.transit_date.name] = formatGaDate(
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                .toString() ??
            '',
      );
      purchaseEventAnalytics[Parameters.transit_flight.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.selectedFlightDetailModel?.flightNo ??
              '';
    }

    purchaseEventAnalytics[Parameters.package.name] =
        cartDataResponse?.packageDetail.name ?? '';
    purchaseEventAnalytics[Parameters.group_booking.name] =
        pranaamAppDataStateManagement?.selectedPackageDetail.isGroupPackage ??
                false
            ? 'yes'
            : 'no';

    /// Pax Count
    purchaseEventAnalytics[Parameters.pax_count.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.travellers?.totalTravellers ??
            0;
    purchaseEventAnalytics[Parameters.amount.name] =
        cartDataResponse?.packageDetail.pricingInfo.totalBaseFare.amount ?? 0;
    purchaseEventAnalytics[Parameters.total_price.name] =
        (cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ?? 0) +
            (addOnPrice(cartDataResponse?.packageAddOn) ?? 0);
    purchaseEventAnalytics[Parameters.coupon.name] =
        cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ?? 0;
    purchaseEventAnalytics[Parameters.coupon_value.name] =
        cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ?? '';
    purchaseEventAnalytics[Parameters.coupon_unit.name] =
        cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ?? '';
    purchaseEventAnalytics[Parameters.error_text.name] =
        cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ?? '';
    purchaseEventAnalytics[Parameters.error_code.name] =
        cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ?? '';
    timeHolder(
      pranaamAppDataStateManagement
          ?.serviceBookingData.selectedService?.serviceTitle,
      pranaamAppDataStateManagement,
    );

    ClickEvents.book_pranaam_service_unavailable
        .logEvent(parameters: purchaseEventAnalytics);
  }

  void rewardToolTipAnalyticsData() {
    final cvToolTipGAObject = <String, Object?>{
      Parameters.category.name: 'pranaam',
      Parameters.sub_category.name: 'purchase',
    };
    ClickEvents.rewards_tool_tip.logEvent(
      parameters: cvToolTipGAObject,
    );
  }

  void popupDisplayGaAnalytics(
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    final CartResponse? cartDataResponse =
        pranaamAppDataStateManagement?.cartDataResponse;

    eventConstants();
    purchaseEventAnalytics[Parameters.trip_type.name] =
        cartDataResponse?.tripDetail.serviceType ?? '';
    purchaseEventAnalytics[Parameters.sector_type.name] =
        cartDataResponse?.tripDetail.travelSector ?? '';
    purchaseEventAnalytics[Parameters.departure_date.name] =
        formatGaDate(cartDataResponse?.tripDetail.flightDate.toString() ?? '');
    purchaseEventAnalytics[Parameters.outbound_airline.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.selectedFlightDetailModel?.airlineCode ??
            '';
    purchaseEventAnalytics[Parameters.outbound_flight_number.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement?.serviceBookingData
                    .roundTripTransitFlights?.flightFinalNumber ??
                ''
            : cartDataResponse?.tripDetail.flightName ?? '';
    purchaseEventAnalytics[Parameters.departure_station.name] =
        cartDataResponse?.tripDetail.originAirport ?? '';
    purchaseEventAnalytics[Parameters.return_date.name] =
        cartDataResponse?.tripDetail.serviceType == 'Round Trip'
            ? formatGaDate(
                pranaamAppDataStateManagement
                        ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                        .toString() ??
                    '',
              )
            : '';
    purchaseEventAnalytics[Parameters.inbound_flight_number.name] =
        pranaamAppDataStateManagement?.serviceBookingData
                .roundTripTransitFlights?.flightFinalNumber ??
            '';
    purchaseEventAnalytics[Parameters.inbound_airline.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
            '';
    purchaseEventAnalytics[Parameters.inbound_arrival_station.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement
                    ?.serviceBookingData.arriveFrom?.cityCode ??
                ''
            : pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedCityDetailFrom?.cityCode ??
                '';
    purchaseEventAnalytics[Parameters.inbound_departure_station.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.arriveFrom?.airportCode ??
            '';
    if (cartDataResponse?.tripDetail.serviceType == 'Transit') {
      purchaseEventAnalytics[Parameters.transit_airline.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
              '';
      purchaseEventAnalytics[Parameters.transit_at.name] =
          cartDataResponse?.tripDetail.serviceAirport ?? '';
      purchaseEventAnalytics[Parameters.transit_date.name] = formatGaDate(
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                .toString() ??
            '',
      );
      purchaseEventAnalytics[Parameters.transit_flight.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.selectedFlightDetailModel?.flightNo ??
              '';
    }
    purchaseEventAnalytics[Parameters.package.name] =
        cartDataResponse?.packageDetail.name ?? '';
    purchaseEventAnalytics[Parameters.group_booking.name] =
        pranaamAppDataStateManagement?.selectedPackageDetail.isGroupPackage ??
                false
            ? 'yes'
            : 'no';
    purchaseEventAnalytics[Parameters.pax_count.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.travellers?.totalTravellers ??
            0;
    purchaseEventAnalytics[Parameters.amount.name] =
        cartDataResponse?.packageDetail.pricingInfo.totalBaseFare.amount ?? 0;
    purchaseEventAnalytics[Parameters.total_price.name] =
        (cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ?? 0) +
            (addOnPrice(cartDataResponse?.packageAddOn) ?? 0);
    purchaseEventAnalytics[Parameters.coupon.name] =
        cartDataResponse?.pricingInfo.discountCouponDetail.couponCode ?? '';
    purchaseEventAnalytics[Parameters.coupon_value.name] = cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        '';
    purchaseEventAnalytics[Parameters.coupon_unit.name] = cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        '';
    purchaseEventAnalytics[Parameters.add_on.name] = addOnName(
      pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn,
    );
    purchaseEventAnalytics[Parameters.add_on_price.name] = addOnPrice(
      pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn,
    );
    purchaseEventAnalytics[Parameters.country.name] =
        pranaamAppDataStateManagement?.pranaamCreateBooking.billingInfo
            ?.addressModel.countryDetails.countryName;
    purchaseEventAnalytics[Parameters.payment_gateway.name] = 'RazorPaY';
    purchaseEventAnalytics[Parameters.payment_aggregator.name] = 'PineLabs';
    purchaseEventAnalytics[Parameters.value.name] =
        (cartDataResponse?.totalFare.amount ?? 0) +
            (addOnPrice(
                  cartDataResponse?.packageAddOn,
                ) ??
                0);
    purchaseEventAnalytics[Parameters.currency.name] = 'INR';
    purchaseEventAnalytics[Parameters.coupon_code.name] =
        cartDataResponse?.pricingInfo.discountCouponDetail.couponCode ?? '';
    purchaseEventAnalytics[Parameters.reward_earned.name] =
        cartDataResponse?.potentialLoyaltyEarning ?? 0;

    /// not available here
    // purchaseEventAnalytics[PranaamParameters.reward_burned.name]=burnedPoint1;

    ClickEvents.popup_display.logEvent(
      parameters: purchaseEventAnalytics,
    );
  }

  void pranaamCancelBeginGaAnalytics(
    BookingAndCancellationState? bookingAndCancellationStateData,
    ClickEvents event,
  ) {
    final PranaamDetail? createBooking = bookingAndCancellationStateData
        ?.bookingDetailsResponse?.orderDetail?.pranaamDetail;
    final PackageDetail packageDeatil =
        createBooking?.packageDetail ?? const PackageDetail();
    purchaseEventAnalytics[Parameters.category.name] = 'pranaam';
    purchaseEventAnalytics[Parameters.sub_category.name] = 'cancellation';
    purchaseEventAnalytics[Parameters.booking_type.name] =
        bookingType ?? 'normal_purchase';
    purchaseEventAnalytics[Parameters.sector_type.name] =
        createBooking?.tripDetails?.travelSector ?? '';
    purchaseEventAnalytics[Parameters.pax_count.name] =
        createBooking?.travelers?.length ?? 0;
    purchaseEventAnalytics[Parameters.adult_count.name] =
        packageDeatil.adultCount ?? 0;
    purchaseEventAnalytics[Parameters.child_count.name] =
        packageDeatil.childCount ?? 0;
    purchaseEventAnalytics[Parameters.infant_count.name] =
        packageDeatil.infantCount ?? 0;
    purchaseEventAnalytics[Parameters.scheduled_date.name] =
        universalDateFormatter(
      requiredFormat: 'dd MMM yyyy',
      // dateTimeObject: createBooking?.tripDetails?.serviceDateTime,
    );
    purchaseEventAnalytics[Parameters.station.name] =
        createBooking?.tripDetails?.serviceAirport ?? '';
    purchaseEventAnalytics[Parameters.flight_number.name] =
        createBooking?.tripDetails?.flightNumber ?? '';
    purchaseEventAnalytics[Parameters.transaction_id.name] =
        bookingAndCancellationStateData
                ?.bookingDetailsResponse?.transactionReferenceId ??
            '';

    event.logEvent(
      parameters: purchaseEventAnalytics,
    );
  }

  void pranaamCancelPartialCancelGaAnalytics(
    CommonOrderDetailBaseResponse? bookingAndCancellationStateData,
    ClickEvents event,
    String type,
    int cancelCount,
  ) {
    purchaseEventAnalytics[Parameters.category.name] = 'pranaam';
    purchaseEventAnalytics[Parameters.sub_category.name] = 'cancellation';
    purchaseEventAnalytics[Parameters.sector_type.name] =
        bookingAndCancellationStateData
                ?.orderDetail?.pranaamDetail?.tripDetails?.travelSector ??
            '';
    purchaseEventAnalytics[Parameters.pax_count.name] =
        bookingAndCancellationStateData
                ?.orderDetail?.pranaamDetail?.travelers?.length ??
            0;
    purchaseEventAnalytics[Parameters.adult_count.name] =
        bookingAndCancellationStateData
                ?.orderDetail?.pranaamDetail?.packageDetail?.adultCount ??
            0;
    purchaseEventAnalytics[Parameters.child_count.name] =
        bookingAndCancellationStateData
                ?.orderDetail?.pranaamDetail?.packageDetail?.childCount ??
            0;
    purchaseEventAnalytics[Parameters.infant_count.name] =
        bookingAndCancellationStateData
                ?.orderDetail?.pranaamDetail?.packageDetail?.infantCount ??
            0;
    purchaseEventAnalytics[Parameters.scheduled_date.name] = formatCouponDate(
      bookingAndCancellationStateData
              ?.orderDetail?.pranaamDetail?.tripDetails?.serviceDateTime
              .toString() ??
          '',
    );
    purchaseEventAnalytics[Parameters.type.name] = type;
    purchaseEventAnalytics[Parameters.cancel_count.name] = cancelCount;
    purchaseEventAnalytics[Parameters.station.name] =
        bookingAndCancellationStateData
                ?.orderDetail?.pranaamDetail?.tripDetails?.serviceAirport ??
            '';
    purchaseEventAnalytics[Parameters.flight_number.name] =
        bookingAndCancellationStateData
                ?.orderDetail?.pranaamDetail?.tripDetails?.flightNumber ??
            '';
    purchaseEventAnalytics[Parameters.transaction_id.name] =
        bookingAndCancellationStateData?.orderDetail?.transactionReferenceId ??
            '';

    event.logEvent(
      parameters: purchaseEventAnalytics,
    );
  }

  void pranaamCancelOrderFailGaAnalytics(
    BookingAndCancellationState? bookingAndCancellationStateData,
    ClickEvents event,
    ADResponseState<dynamic> responseState,
    String type,
    int cancelCount,
  ) {
    final PranaamDetail? createBooking = bookingAndCancellationStateData
        ?.bookingDetailsResponse?.orderDetail?.pranaamDetail;
    final PackageDetail packageDeatil =
        createBooking?.packageDetail ?? const PackageDetail();
    purchaseEventAnalytics[Parameters.category.name] = 'pranaam';
    purchaseEventAnalytics[Parameters.sub_category.name] = 'cancellation';
    purchaseEventAnalytics[Parameters.sector_type.name] =
        createBooking?.tripDetails?.travelSector ?? '';
    purchaseEventAnalytics[Parameters.pax_count.name] =
        createBooking?.travelers?.length ?? 0;
    purchaseEventAnalytics[Parameters.adult_count.name] =
        packageDeatil.adultCount ?? 0;
    purchaseEventAnalytics[Parameters.child_count.name] =
        packageDeatil.childCount ?? 0;
    purchaseEventAnalytics[Parameters.infant_count.name] =
        packageDeatil.infantCount ?? 0;
    purchaseEventAnalytics[Parameters.error_code.name] =
        responseState.errorCode ?? '';
    purchaseEventAnalytics[Parameters.error_text.name] =
        responseState.message ?? '';
    purchaseEventAnalytics[Parameters.scheduled_date.name] =
        universalDateFormatter(
      requiredFormat: 'dd MMM yyyy',
      // dateTimeObject: createBooking?.tripDetails?.serviceDateTime,
    );
    purchaseEventAnalytics[Parameters.type.name] = type;
    purchaseEventAnalytics[Parameters.cancel_count.name] = cancelCount;
    purchaseEventAnalytics[Parameters.station.name] =
        createBooking?.tripDetails?.serviceAirport ?? '';
    purchaseEventAnalytics[Parameters.flight_number.name] =
        createBooking?.tripDetails?.flightNumber ?? '';
    purchaseEventAnalytics[Parameters.transaction_id.name] =
        bookingAndCancellationStateData
                ?.bookingDetailsResponse?.transactionReferenceId ??
            '';

    event.logEvent(
      parameters: purchaseEventAnalytics,
    );
  }

  void pranaamBookGaAnalytics() {
    purchaseEventAnalytics[Parameters.category.name] = 'pranaam';
    purchaseEventAnalytics[Parameters.sub_category.name] = 'purchase';
  }

  void pranaamModifyGaEvent(
    BookingAndCancellationState? bookingAndCancellationState,
    ClickEvents events,
  ) {
    final PranaamDetail? createBooking = bookingAndCancellationState
        ?.bookingDetailsResponse?.orderDetail?.pranaamDetail;
    eventConstants();
    purchaseEventAnalytics[Parameters.trip_type.name] =
        createBooking?.tripDetails?.serviceType ?? '';
    purchaseEventAnalytics[Parameters.sector_type.name] =
        createBooking?.tripDetails?.travelSector ?? '';
    purchaseEventAnalytics[Parameters.departure_date.name] =
        createBooking?.tripDetails?.flightDate ?? '';
    purchaseEventAnalytics[Parameters.outbound_flight_number.name] =
        createBooking?.tripDetails?.flightName ?? '';
    purchaseEventAnalytics[Parameters.departure_station.name] =
        createBooking?.tripDetails?.originAirport ?? '';
    purchaseEventAnalytics[Parameters.inbound_arrival_station.name] =
        createBooking?.roundTripDetail?.destinationAirport ?? '';
    purchaseEventAnalytics[Parameters.inbound_departure_station.name] =
        createBooking?.roundTripDetail?.originAirport ?? '';
    purchaseEventAnalytics[Parameters.inbound_flight_number.name] =
        createBooking?.roundTripDetail?.flightNumber ?? '';
    purchaseEventAnalytics[Parameters.return_date.name] =
        createBooking?.roundTripDetail?.flightDate ?? '';
    purchaseEventAnalytics[Parameters.transit_at.name] =
        createBooking?.tripDetails?.serviceAirport ?? '';
    purchaseEventAnalytics[Parameters.transit_date.name] =
        createBooking?.tripDetails?.serviceDateTime ?? '';
    purchaseEventAnalytics[Parameters.transit_flight.name] =
        createBooking?.tripDetails?.flightNumber ?? '';

    events.logEvent(
      parameters: purchaseEventAnalytics,
    );
  }

  void pranaamPaymentSubmitGaEvent(ClickEvents events) {
    purchaseEventAnalytics[Parameters.category.name] = 'pranaam';
    purchaseEventAnalytics[Parameters.sub_category.name] = 'purchase';
    purchaseEventAnalytics[Parameters.booking_type.name] =
        bookingType ?? 'normal_purchase';
    events.logEvent(
      parameters: purchaseEventAnalytics,
    );
  }

  void pranaamPaymentFailGaEvent(
    ClickEvents events,
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    final CartResponse? cartDataResponse =
        pranaamAppDataStateManagement?.cartDataResponse;

    eventConstants(
      pranaamAppDataStateManagement: pranaamAppDataStateManagement,
    );
    purchaseEventAnalytics[Parameters.trip_type.name] =
        cartDataResponse?.tripDetail.serviceType ?? '';
    purchaseEventAnalytics[Parameters.error_text.name] = 'Transaction Failed';
    purchaseEventAnalytics[Parameters.sector_type.name] =
        cartDataResponse?.tripDetail.travelSector ?? '';

    purchaseEventAnalytics[Parameters.departure_date.name] =
        formatGaDate(cartDataResponse?.tripDetail.flightDate.toString() ?? '');
    purchaseEventAnalytics[Parameters.outbound_airline.name] =
        '${cartDataResponse?.tripDetail.flightName[0]}${cartDataResponse?.tripDetail.flightName[1]}';
    purchaseEventAnalytics[Parameters.outbound_flight_number.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement?.serviceBookingData
                    .roundTripTransitFlights?.flightFinalNumber ??
                ''
            : cartDataResponse?.tripDetail.flightName ?? '';
    purchaseEventAnalytics[Parameters.departure_station.name] =
        cartDataResponse?.tripDetail.originAirport ?? '';
    purchaseEventAnalytics[Parameters.arrival_station.name] =
        cartDataResponse?.tripDetail.destinationAirport ?? '';

    /// Return Date
    purchaseEventAnalytics[Parameters.return_date.name] =
        cartDataResponse?.tripDetail.serviceType == 'Round Trip'
            ? formatGaDate(
                pranaamAppDataStateManagement
                        ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                        .toString() ??
                    '',
              )
            : '';
    purchaseEventAnalytics[Parameters.inbound_flight_number.name] =
        pranaamAppDataStateManagement?.serviceBookingData
                .roundTripTransitFlights?.flightFinalNumber ??
            '';
    purchaseEventAnalytics[Parameters.inbound_airline.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
            '';

    /// Inbound Arrival Station
    purchaseEventAnalytics[Parameters.inbound_arrival_station.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement
                    ?.serviceBookingData.arriveFrom?.cityCode ??
                ''
            : pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedCityDetailFrom?.cityCode ??
                '';

    /// Inbound Departure Station
    purchaseEventAnalytics[Parameters.inbound_departure_station.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.arriveFrom?.airportCode ??
            '';

    if (cartDataResponse?.tripDetail.serviceType == 'Transit') {
      purchaseEventAnalytics[Parameters.transit_airline.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
              '';
      purchaseEventAnalytics[Parameters.transit_at.name] =
          cartDataResponse?.tripDetail.serviceAirport ?? '';

      purchaseEventAnalytics[Parameters.transit_date.name] = formatGaDate(
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                .toString() ??
            '',
      );
      purchaseEventAnalytics[Parameters.transit_flight.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.selectedFlightDetailModel?.flightNo ??
              '';
    }

    purchaseEventAnalytics[Parameters.package.name] =
        cartDataResponse?.packageDetail.name ?? '';
    purchaseEventAnalytics[Parameters.group_booking.name] =
        pranaamAppDataStateManagement?.selectedPackageDetail.isGroupPackage ??
                false
            ? 'yes'
            : 'no';
    purchaseEventAnalytics[Parameters.package_price.name] =
        cartDataResponse?.packageDetail.pricingInfo.totalBaseFare.amount ?? 0;

    /// Pax Count
    paxCount(pranaamAppDataStateManagement);
    purchaseEventAnalytics[Parameters.cart_amount.name] =
        (cartDataResponse?.packageDetail.pricingInfo.totalBaseFare.amount ??
                0) +
            (cartDataResponse?.packageDetail.pricingInfo.totalTax.amount ?? 0) +
            (addOnPrice(
                  pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn,
                ) ??
                0);
    purchaseEventAnalytics[Parameters.total_price.name] =
        (cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ?? 0) +
            (addOnPrice(cartDataResponse?.packageAddOn) ?? 0);
    purchaseEventAnalytics[Parameters.purchase_revenue.name] =
        (cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ?? 0) +
            (addOnPrice(cartDataResponse?.packageAddOn) ?? 0);
    purchaseEventAnalytics[Parameters.value.name] =
        (cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ?? 0) +
            (addOnPrice(cartDataResponse?.packageAddOn) ?? 0);

    purchaseEventAnalytics[Parameters.coupon.name] = cartDataResponse
            ?.packageDetail.pricingInfo.discountCouponDetail.couponCode ??
        '';
    purchaseEventAnalytics[Parameters.coupon.name] = cartDataResponse
            ?.packageDetail.pricingInfo.discountCouponDetail.couponCode ??
        '';
    purchaseEventAnalytics[Parameters.coupon_value.name] = cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        '';
    purchaseEventAnalytics[Parameters.total_discount.name] = cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        '';

    events.logEvent(
      parameters: purchaseEventAnalytics,
    );
  }

  void pranaamPaymentOtherGaEvent(
    ClickEvents events,
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    final CartResponse? cartDataResponse =
        pranaamAppDataStateManagement?.cartDataResponse;

    eventConstants(
      pranaamAppDataStateManagement: pranaamAppDataStateManagement,
    );
    purchaseEventAnalytics[Parameters.trip_type.name] =
        cartDataResponse?.tripDetail.serviceType ?? '';
    purchaseEventAnalytics[Parameters.sector_type.name] =
        cartDataResponse?.tripDetail.travelSector ?? '';

    purchaseEventAnalytics[Parameters.departure_date.name] =
        formatGaDate(cartDataResponse?.tripDetail.flightDate.toString() ?? '');
    purchaseEventAnalytics[Parameters.outbound_airline.name] =
        '${cartDataResponse?.tripDetail.flightName[0]}${cartDataResponse?.tripDetail.flightName[1]}';
    purchaseEventAnalytics[Parameters.outbound_flight_number.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement?.serviceBookingData
                    .roundTripTransitFlights?.flightFinalNumber ??
                ''
            : cartDataResponse?.tripDetail.flightName ?? '';
    purchaseEventAnalytics[Parameters.departure_station.name] =
        cartDataResponse?.tripDetail.originAirport ?? '';
    purchaseEventAnalytics[Parameters.arrival_station.name] =
        cartDataResponse?.tripDetail.destinationAirport ?? '';
    purchaseEventAnalytics[Parameters.return_date.name] =
        cartDataResponse?.tripDetail.serviceType == 'Round Trip'
            ? formatGaDate(
                pranaamAppDataStateManagement
                        ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                        .toString() ??
                    '',
              )
            : '';
    purchaseEventAnalytics[Parameters.inbound_flight_number.name] =
        pranaamAppDataStateManagement?.serviceBookingData
                .roundTripTransitFlights?.flightFinalNumber ??
            '';
    purchaseEventAnalytics[Parameters.inbound_airline.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
            '';
    purchaseEventAnalytics[Parameters.inbound_arrival_station.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement
                    ?.serviceBookingData.arriveFrom?.cityCode ??
                ''
            : pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedCityDetailFrom?.cityCode ??
                '';
    purchaseEventAnalytics[Parameters.inbound_departure_station.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.arriveFrom?.airportCode ??
            '';

    if (cartDataResponse?.tripDetail.serviceType == 'Transit') {
      purchaseEventAnalytics[Parameters.transit_airline.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
              '';
      purchaseEventAnalytics[Parameters.transit_at.name] =
          cartDataResponse?.tripDetail.serviceAirport ?? '';
      purchaseEventAnalytics[Parameters.transit_date.name] = formatGaDate(
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                .toString() ??
            '',
      );
      purchaseEventAnalytics[Parameters.transit_flight.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.selectedFlightDetailModel?.flightNo ??
              '';
    }
    purchaseEventAnalytics[Parameters.package.name] =
        cartDataResponse?.packageDetail.name ?? '';
    purchaseEventAnalytics[Parameters.group_booking.name] =
        pranaamAppDataStateManagement?.selectedPackageDetail.isGroupPackage ??
                false
            ? 'yes'
            : 'no';
    purchaseEventAnalytics[Parameters.pax_count.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.travellers?.totalTravellers ??
            0;
    purchaseEventAnalytics[Parameters.cart_amount.name] =
        cartDataResponse?.packageDetail.pricingInfo.totalBaseFare.amount ?? 0;
    purchaseEventAnalytics[Parameters.total_price.name] =
        (cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ?? 0) +
            (addOnPrice(cartDataResponse?.packageAddOn) ?? 0);
    purchaseEventAnalytics[Parameters.coupon.name] = cartDataResponse
            ?.packageDetail.pricingInfo.discountCouponDetail.couponCode ??
        '';
    purchaseEventAnalytics[Parameters.coupon_value.name] = cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        '';
    purchaseEventAnalytics[Parameters.total_discount.name] = cartDataResponse
            ?.packageDetail
            .pricingInfo
            .discountCouponDetail
            .couponDiscountAmount ??
        '';

    events.logEvent(
      parameters: purchaseEventAnalytics,
    );
  }

  void pranaamPaymentRetryGaEvent(
    ClickEvents events,
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    final CartResponse? cartDataResponse =
        pranaamAppDataStateManagement?.cartDataResponse;

    eventConstants();
    purchaseEventAnalytics[Parameters.trip_type.name] =
        cartDataResponse?.tripDetail.serviceType ?? '';
    purchaseEventAnalytics[Parameters.sector_type.name] =
        cartDataResponse?.tripDetail.travelSector ?? '';

    purchaseEventAnalytics[Parameters.departure_date.name] =
        formatGaDate(cartDataResponse?.tripDetail.flightDate.toString() ?? '');
    purchaseEventAnalytics[Parameters.outbound_airline.name] =
        '${cartDataResponse?.tripDetail.flightName[0]}${cartDataResponse?.tripDetail.flightName[1]}';
    purchaseEventAnalytics[Parameters.outbound_flight_number.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement?.serviceBookingData
                    .roundTripTransitFlights?.flightFinalNumber ??
                ''
            : cartDataResponse?.tripDetail.flightName ?? '';
    purchaseEventAnalytics[Parameters.departure_station.name] =
        cartDataResponse?.tripDetail.originAirport ?? '';
    purchaseEventAnalytics[Parameters.arrival_station.name] =
        cartDataResponse?.tripDetail.destinationAirport ?? '';
    purchaseEventAnalytics[Parameters.return_date.name] =
        cartDataResponse?.tripDetail.serviceType == 'Round Trip'
            ? formatGaDate(
                pranaamAppDataStateManagement
                        ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                        .toString() ??
                    '',
              )
            : '';
    purchaseEventAnalytics[Parameters.inbound_flight_number.name] =
        pranaamAppDataStateManagement?.serviceBookingData
                .roundTripTransitFlights?.flightFinalNumber ??
            '';
    purchaseEventAnalytics[Parameters.inbound_airline.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
            '';
    purchaseEventAnalytics[Parameters.inbound_arrival_station.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? pranaamAppDataStateManagement
                    ?.serviceBookingData.arriveFrom?.cityCode ??
                ''
            : pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedCityDetailFrom?.cityCode ??
                '';
    purchaseEventAnalytics[Parameters.inbound_departure_station.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.arriveFrom?.airportCode ??
            '';

    if (cartDataResponse?.tripDetail.serviceType == 'Transit') {
      purchaseEventAnalytics[Parameters.transit_airline.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
              '';
      purchaseEventAnalytics[Parameters.transit_at.name] =
          cartDataResponse?.tripDetail.serviceAirport ?? '';
      purchaseEventAnalytics[Parameters.transit_date.name] = formatGaDate(
        pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitDate?.dateOfJourney
                .toString() ??
            '',
      );
      purchaseEventAnalytics[Parameters.transit_flight.name] =
          pranaamAppDataStateManagement
                  ?.serviceBookingData.selectedFlightDetailModel?.flightNo ??
              '';
    }
    purchaseEventAnalytics[Parameters.package.name] =
        cartDataResponse?.packageDetail.name ?? '';
    purchaseEventAnalytics[Parameters.group_booking.name] =
        pranaamAppDataStateManagement?.selectedPackageDetail.isGroupPackage ??
                false
            ? 'yes'
            : 'no';
    purchaseEventAnalytics[Parameters.pax_count.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.travellers?.totalTravellers ??
            0;
    purchaseEventAnalytics[Parameters.amount.name] =
        cartDataResponse?.packageDetail.pricingInfo.totalBaseFare.amount ?? 0;
    purchaseEventAnalytics[Parameters.total_price.name] =
        (cartDataResponse?.packageDetail.pricingInfo.totalFare.amount ?? 0) +
            (addOnPrice(cartDataResponse?.packageAddOn) ?? 0);
    timeHolder(
      pranaamAppDataStateManagement
          ?.serviceBookingData.selectedService?.serviceTitle,
      pranaamAppDataStateManagement,
    );

    events.logEvent(
      parameters: purchaseEventAnalytics,
    );
  }

  void tripSectorPackage(
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    purchaseEventAnalytics[Parameters.trip_type.name] =
        pranaamAppDataStateManagement
                ?.cartDataResponse?.tripDetail.serviceType ??
            '';
    purchaseEventAnalytics[Parameters.sector_type.name] =
        pranaamAppDataStateManagement
                ?.cartDataResponse?.tripDetail.travelSector ??
            '';
    purchaseEventAnalytics[Parameters.package.name] =
        pranaamAppDataStateManagement?.cartDataResponse?.packageDetail.name ??
            '';
    purchaseEventAnalytics[Parameters.group_booking.name] =
        pranaamAppDataStateManagement?.selectedPackageDetail.isGroupPackage ??
                false
            ? 'yes'
            : 'no';
    purchaseEventAnalytics[Parameters.package_price.name] =
        (pranaamAppDataStateManagement?.cartDataResponse?.packageDetail
                    .pricingInfo.totalBaseFare.amount ??
                0) +
            (pranaamAppDataStateManagement?.cartDataResponse?.packageDetail
                    .pricingInfo.totalTax.amount ??
                0);
  }

  void journeyDate(
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    final bool isForUpgrade = isUpgradeBooking(
      pranaamAppDataStateManagement?.cartDataResponse?.pranaamBookingType ?? '',
    );
    purchaseEventAnalytics[Parameters.departure_date.name] = formatGaDate(
      pranaamAppDataStateManagement?.cartDataResponse?.tripDetail.flightDate
              .toString() ??
          '',
    );

    purchaseEventAnalytics[Parameters.return_date.name] =
        pranaamAppDataStateManagement
                    ?.cartDataResponse?.tripDetail.serviceType ==
                'Round Trip'
            ? isForUpgrade
                ? formatGaDate(
                    pranaamAppDataStateManagement?.cartDataResponse?.tripDetail
                            .transitRoundTripSecFlightDate
                            .toString() ??
                        '',
                  )
                : formatGaDate(
                    pranaamAppDataStateManagement?.serviceBookingData
                            .roundTripTransitDate?.dateOfJourney
                            .toString() ??
                        '',
                  )
            : '';
  }

  void airlineAndFlight(
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    final bool isForUpgrade = isUpgradeBooking(
      pranaamAppDataStateManagement?.cartDataResponse?.pranaamBookingType ?? '',
    );
    purchaseEventAnalytics[Parameters.outbound_airline.name] = isForUpgrade
        ? pranaamAppDataStateManagement?.cartDataResponse?.tripDetail.flightName
                .split('-')
                .firstOrNull ??
            ''
        : pranaamAppDataStateManagement
                ?.serviceBookingData.selectedFlightDetailModel?.airlineCode ??
            '';
    purchaseEventAnalytics[Parameters.outbound_flight_number.name] =
        pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedService?.serviceTitle ==
                'Transit'
            ? isForUpgrade
                ? pranaamAppDataStateManagement?.cartDataResponse?.tripDetail
                    .transitRoundTripSecFlightNumber
                : pranaamAppDataStateManagement?.serviceBookingData
                        .roundTripTransitFlights?.flightFinalNumber ??
                    ''
            : isForUpgrade
                ? pranaamAppDataStateManagement
                        ?.cartDataResponse?.tripDetail.flightName ??
                    ''
                : pranaamAppDataStateManagement
                        ?.cartDataResponse?.tripDetail.flightName ??
                    '';
  }

  void departureArrival(
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    purchaseEventAnalytics[Parameters.departure_station.name] =
        pranaamAppDataStateManagement
                ?.cartDataResponse?.tripDetail.originAirport ??
            '';
    purchaseEventAnalytics[Parameters.arrival_station.name] =
        pranaamAppDataStateManagement
                ?.cartDataResponse?.tripDetail.destinationAirport ??
            '';
  }

  void cartAmount(
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    purchaseEventAnalytics[Parameters.cart_amount.name] =
        (pranaamAppDataStateManagement?.cartDataResponse?.packageDetail
                    .pricingInfo.totalBaseFare.amount ??
                0) +
            (pranaamAppDataStateManagement?.cartDataResponse?.packageDetail
                    .pricingInfo.totalTax.amount ??
                0) +
            (addOnPrice(
                  pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn,
                ) ??
                0);
  }

  void addOn(PranaamAppDataStateManagement? pranaamAppDataStateManagement) {
    purchaseEventAnalytics[Parameters.add_on.name] = addOnName(
      pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn,
    );
    purchaseEventAnalytics[Parameters.add_on_price.name] = addOnPrice(
      pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn,
    );
  }

  /// Payment Submit and Add payment info event
  void ecommerceAddPaymentInfoGaAnalytics(
    ClickEvents events,
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
    PaymentMethodState paymentMethodState,
    AppSessionState appSessionState, {
    String? errorText,
    String? label,
  }) {
    eventConstants(
      pranaamAppDataStateManagement: pranaamAppDataStateManagement,
    );
    amount(
      pranaamAppDataStateManagement
          ?.cartDataResponse?.packageDetail.pricingInfo.totalFare.amount,
      pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn,
    );
    tripSectorPackage(pranaamAppDataStateManagement);
    journeyDate(pranaamAppDataStateManagement);
    airlineAndFlight(pranaamAppDataStateManagement);
    departureArrival(pranaamAppDataStateManagement);
    transitInbound(pranaamAppDataStateManagement);
    paxCount(pranaamAppDataStateManagement);
    cartAmount(pranaamAppDataStateManagement);
    addOn(pranaamAppDataStateManagement);
    purchaseEventAnalytics[Parameters.coupon.name] =
        pranaamAppDataStateManagement?.cartDataResponse?.packageDetail
                .pricingInfo.discountCouponDetail.couponCode ??
            '';
    purchaseEventAnalytics[Parameters.coupon_value.name] =
        pranaamAppDataStateManagement?.cartDataResponse?.packageDetail
                .pricingInfo.discountCouponDetail.couponDiscountAmount ??
            '';
    purchaseEventAnalytics[Parameters.total_discount.name] =
        pranaamAppDataStateManagement?.cartDataResponse?.packageDetail
                .pricingInfo.discountCouponDetail.couponDiscountAmount ??
            '';
    purchaseEventAnalytics[Parameters.coupon_unit.name] =
        pranaamAppDataStateManagement?.cartDataResponse?.packageDetail
                .pricingInfo.discountCouponDetail.couponDiscountAmount ??
            '';
    purchaseEventAnalytics[Parameters.payment_type.name] =
        paymentMethodState.selectedOption?.mode?.name ?? '';
    purchaseEventAnalytics[Parameters.payment_bank.name] =
        paymentMethodState.selectedOption?.name ?? '';
    purchaseEventAnalytics[Parameters.label.name] = label;
    purchaseEventAnalytics[Parameters.error_text.name] = errorText;
    purchaseEventAnalytics[Parameters.country.name] =
        pranaamAppDataStateManagement?.pranaamCreateBooking.billingInfo
                ?.addressModel.countryDetails.countryName ??
            '';
    purchaseEventAnalytics[Parameters.payment_gateway.name] = 'RazorPaY';
    purchaseEventAnalytics[Parameters.payment_aggregator.name] = 'PineLabs';
    purchaseEventAnalytics[Parameters.reward_earned.name] =
        pranaamAppDataStateManagement
                ?.cartDataResponse?.potentialLoyaltyEarning ??
            0;
    purchaseEventAnalytics[Parameters.rewards_burned.name] =
        paymentMethodState.isRedeemPointsChecked
            ? (((paymentMethodState.totalAmount) <
                    appSessionState.rewardBalance.value)
                ? paymentMethodState.totalAmount
                : appSessionState.rewardBalance.value)
            : 0;
    timeHolder(
      pranaamAppDataStateManagement
          ?.serviceBookingData.selectedService?.serviceTitle,
      pranaamAppDataStateManagement,
    );

    for (int index = 0;
        index <
            (pranaamAppDataStateManagement?.cartDataResponse?.packageDetail
                    .pricingInfo.passengerTypeQuantity.length ??
                0);
        index++) {
      itemList.add(
        AnalyticsEventItem(
          currency: 'INR',
          discount: pranaamAppDataStateManagement
              ?.cartDataResponse
              ?.packageDetail
              .pricingInfo
              .discountCouponDetail
              .couponDiscountAmount,
          itemBrand: 'N/A',
          itemCategory: 'Pranaam',
          itemCategory2: (pranaamAppDataStateManagement
                          ?.cartDataResponse
                          ?.packageDetail
                          .pricingInfo
                          .passengerTypeQuantity
                          .length ??
                      0) ==
                  0
              ? '0'
              : pranaamAppDataStateManagement?.cartDataResponse?.packageDetail
                  .pricingInfo.passengerTypeQuantity[index].code,
          itemId:
              'Pranaam ${pranaamAppDataStateManagement?.cartDataResponse?.packageDetail.packageId}',
          itemName:
              'Pranaam ${pranaamAppDataStateManagement?.cartDataResponse?.packageDetail.name} ${pranaamAppDataStateManagement?.cartDataResponse?.tripDetail.destinationAirport}',
          price: pranaamAppDataStateManagement
                  ?.cartDataResponse
                  ?.packageDetail
                  .pricingInfo
                  .passengerTypeQuantity
                  .first
                  .totalFare
                  .perPaxAmount ??
              0,
          index: -1,
          affiliation: 'N/A',
          coupon: pranaamAppDataStateManagement?.cartDataResponse?.packageDetail
                  .pricingInfo.discountCouponDetail.couponCode ??
              'N/A',
          creativeName: 'N/A',
          creativeSlot: 'N/A',
          itemCategory3: 'N/A',
          itemCategory4: 'N/A',
          itemCategory5: 'N/A',
          itemListId: 'N/A',
          itemListName: 'N/A',
          itemVariant: pranaamAppDataStateManagement
              ?.cartDataResponse?.tripDetail.serviceType,
          locationId: 'N/A',
          promotionId: 'N/A',
          promotionName: 'N/A',
          quantity: pranaamAppDataStateManagement?.cartDataResponse?.pricingInfo
                  .passengerTypeQuantity.length ??
              0,
        ),
      );
    }

    if (pranaamAppDataStateManagement?.cartDataResponse?.availiableAddOn !=
        null) {
      for (int index = 0;
          index <
              (pranaamAppDataStateManagement
                      ?.cartDataResponse?.packageAddOn.length ??
                  0);
          index++) {
        itemList.add(
          AnalyticsEventItem(
            currency: 'INR',
            discount: 0,
            itemBrand: 'N/A',
            itemCategory: 'Pranaam Add-On',
            itemCategory2: 'ADD ON',
            itemId:
                'Pranaam ${pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn[index].addOnServiceId}',
            itemName:
                'Pranaam ${pranaamAppDataStateManagement?.cartDataResponse?.packageAddOn[index].addOnServiceName}' /*${cartDataResponse?.tripDetail.destinationAirport}*/,
            price: pranaamAppDataStateManagement
                    ?.cartDataResponse?.packageAddOn[index].totalPrice ??
                0,
            index: -1,
            affiliation: 'N/A',
            coupon: 'N/A',
            creativeName: 'N/A',
            creativeSlot: 'N/A',
            itemCategory3: 'N/A',
            itemCategory4: 'N/A',
            itemCategory5: 'N/A',
            itemListId: 'N/A',
            itemListName: 'N/A',
            itemVariant: pranaamAppDataStateManagement
                ?.cartDataResponse?.tripDetail.serviceType,
            locationId: 'N/A',
            promotionId: 'N/A',
            promotionName: 'N/A',
            quantity: pranaamAppDataStateManagement
                ?.cartDataResponse?.packageAddOn[index].qty,
          ),
        );
      }
    }
    events.logAnalyticsEventItem(
      parameters: purchaseEventAnalytics,
      items: itemList,
    );
    ClickEvents.book_pranaam_payment_submit.logAnalyticsEventItem(
      parameters: purchaseEventAnalytics,
      items: itemList,
    );
  }

  void transitInbound(
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    final bool isForUpgrade = isUpgradeBooking(
      pranaamAppDataStateManagement?.cartDataResponse?.pranaamBookingType ?? '',
    );
    final String tripType = pranaamAppDataStateManagement
            ?.cartDataResponse?.tripDetail.serviceType ??
        '';
    purchaseEventAnalytics[Parameters.inbound_flight_number.name] = isForUpgrade
        ? pranaamAppDataStateManagement
                        ?.cartDataResponse?.tripDetail.serviceType ==
                    'Transit' ||
                pranaamAppDataStateManagement
                        ?.cartDataResponse?.tripDetail.serviceType ==
                    'Round Trip'
            ? pranaamAppDataStateManagement?.cartDataResponse?.tripDetail
                    .transitRoundTripSecFlightNumber ??
                ''
            : ''
        : pranaamAppDataStateManagement?.serviceBookingData
                .roundTripTransitFlights?.flightFinalNumber ??
            '';
    purchaseEventAnalytics[Parameters.inbound_airline.name] = isForUpgrade
        ? pranaamAppDataStateManagement
            ?.cartDataResponse?.tripDetail.transitRoundTripSecFlightName
            .split('-')
            .firstOrNull
        : pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
            '';
    purchaseEventAnalytics[Parameters.inbound_arrival_station.name] =
        isForUpgrade
            ? _getInboundArrivalStation(pranaamAppDataStateManagement)
            : pranaamAppDataStateManagement
                        ?.serviceBookingData.selectedService?.serviceTitle ==
                    'Transit'
                ? pranaamAppDataStateManagement
                        ?.serviceBookingData.arriveFrom?.cityCode ??
                    ''
                : pranaamAppDataStateManagement
                        ?.serviceBookingData.selectedCityDetailFrom?.cityCode ??
                    '';
    purchaseEventAnalytics[Parameters.inbound_departure_station.name] =
        pranaamAppDataStateManagement
                ?.serviceBookingData.arriveFrom?.airportCode ??
            '';
    purchaseEventAnalytics[Parameters.transit_airline.name] = isForUpgrade
        ? pranaamAppDataStateManagement
                ?.cartDataResponse?.tripDetail.transitRoundTripSecFlightName
                .split('-')
                .firstOrNull ??
            ''
        : pranaamAppDataStateManagement
                ?.serviceBookingData.roundTripTransitFlights?.airlineCode ??
            '';
    purchaseEventAnalytics[Parameters.transit_at.name] = (tripType == 'Transit')
        ? pranaamAppDataStateManagement
                ?.cartDataResponse?.tripDetail.serviceAirport ??
            ''
        : '';
    purchaseEventAnalytics[Parameters.transit_date.name] =
        pranaamAppDataStateManagement
                    ?.cartDataResponse?.tripDetail.serviceType ==
                'Transit'
            ? isForUpgrade
                ? formatGaDate(
                    pranaamAppDataStateManagement?.cartDataResponse?.tripDetail
                            .transitRoundTripSecFlightDate
                            .toString() ??
                        '',
                  )
                : formatGaDate(
                    pranaamAppDataStateManagement?.serviceBookingData
                            .roundTripTransitDate?.dateOfJourney
                            .toString() ??
                        '',
                  )
            : '';
    purchaseEventAnalytics[Parameters.transit_flight.name] =
        (isForUpgrade && tripType == 'Transit')
            ? pranaamAppDataStateManagement
                ?.cartDataResponse?.tripDetail.transitRoundTripSecFlightName
            : pranaamAppDataStateManagement
                    ?.serviceBookingData.selectedFlightDetailModel?.flightNo ??
                '';
  }

  void cvToolTipAnalyticsData() {
    final cvToolTipGAObject = <String, Object?>{
      Parameters.category.name: 'pranaam',
      Parameters.sub_category.name: 'purchase',
      Parameters.label.name: 'cvv_tool_tip',
    };
    ClickEvents.cvv_tool_tip.logEvent(
      parameters: cvToolTipGAObject,
    );
  }

  void helpAnalyticsData(
    ClickEvents events,
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    final helpGAObject = <String, Object?>{
      Parameters.category.name: 'pranaam',
      Parameters.sub_category.name: 'service',
      Parameters.label.name: 'help',
      Parameters.sector_type.name: pranaamAppDataStateManagement
              ?.serviceBookingData.selectedTravelSector?.travelSectorTitle ??
          '',
      Parameters.trip_type.name: pranaamAppDataStateManagement
              ?.serviceBookingData.selectedService?.serviceTitle ??
          '',
    };
    events.logEvent(
      parameters: helpGAObject,
    );
  }

  void timeHolder(
    String? tripType,
    PranaamAppDataStateManagement? pranaamAppDataStateManagement, {
    bool? isForUpgrade,
  }) {
    if (tripType == 'Departure') {
      if (isForUpgrade ?? false) {
        purchaseEventAnalytics[Parameters.departure_service_time.name] =
            universalDateFormatter(
          requiredFormat: 'hh:mm a',
          dateString: pranaamAppDataStateManagement
                  ?.cartDataResponse?.tripDetail.serviceDateTime ??
              '',
          inCommingFormat: 'yyyy-mm-dd hh:mm:ss',
        );
        purchaseEventAnalytics[Parameters.departure_time.name] =
            pranaamAppDataStateManagement
                    ?.cartDataResponse?.tripDetail.flightTime ??
                '';
      } else {
        purchaseEventAnalytics[Parameters.departure_service_time.name] =
            pranaamAppDataStateManagement?.flightFirstTimeTextValue.value;
        purchaseEventAnalytics[Parameters.departure_time.name] =
            pranaamAppDataStateManagement?.flightSecondTimeTextValue.value;
      }
    }
    if (tripType == 'Arrival') {
      if (isForUpgrade ?? false) {
        purchaseEventAnalytics[Parameters.arrival_service_time.name] =
            universalDateFormatter(
          requiredFormat: 'hh:mm a',
          dateString: pranaamAppDataStateManagement
                  ?.cartDataResponse?.tripDetail.serviceDateTime ??
              '',
          inCommingFormat: 'yyyy-mm-dd hh:mm:ss',
        );
        purchaseEventAnalytics[Parameters.arrival_time.name] =
            pranaamAppDataStateManagement
                    ?.cartDataResponse?.tripDetail.flightTime ??
                '';
      } else {
        purchaseEventAnalytics[Parameters.arrival_service_time.name] =
            pranaamAppDataStateManagement?.flightFirstTimeTextValue.value;
        purchaseEventAnalytics[Parameters.arrival_time.name] =
            pranaamAppDataStateManagement?.flightSecondTimeTextValue.value;
      }
    }
    if (tripType == 'Round Trip') {
      if (isForUpgrade ?? false) {
        purchaseEventAnalytics[Parameters.departure_service_time.name] =
            universalDateFormatter(
          requiredFormat: 'hh:mm a',
          dateString: pranaamAppDataStateManagement
                  ?.cartDataResponse?.tripDetail.serviceDateTime ??
              '',
          inCommingFormat: 'yyyy-mm-dd hh:mm:ss',
        );
        purchaseEventAnalytics[Parameters.arrival_service_time.name] =
            universalDateFormatter(
          requiredFormat: 'hh:mm a',
          dateString: pranaamAppDataStateManagement
              ?.cartDataResponse?.tripDetail.roundTripSecServiceDateTime,
          inCommingFormat: 'yyyy-mm-dd hh:mm:ss',
        );
      } else {
        purchaseEventAnalytics[Parameters.departure_service_time.name] =
            pranaamAppDataStateManagement?.flightFirstTimeTextValue.value;
        purchaseEventAnalytics[Parameters.arrival_service_time.name] =
            pranaamAppDataStateManagement?.flightSecondTimeTextValue.value;
      }
    }
    if (tripType == 'Transit') {
      if (isForUpgrade ?? false) {
        purchaseEventAnalytics[Parameters.transit_service_time.name] =
            universalDateFormatter(
          requiredFormat: 'hh:mm a',
          dateString: pranaamAppDataStateManagement
                  ?.cartDataResponse?.tripDetail.serviceDateTime ??
              '',
          inCommingFormat: 'yyyy-mm-dd hh:mm:ss',
        );
        purchaseEventAnalytics[Parameters.departure_service_time.name] =
            universalDateFormatter(
          requiredFormat: 'hh:mm a',
          dateString: pranaamAppDataStateManagement
                  ?.cartDataResponse?.tripDetail.roundTripSecServiceDateTime ??
              '',
          inCommingFormat: 'yyyy-mm-dd hh:mm:ss',
        );
      } else {
        purchaseEventAnalytics[Parameters.transit_service_time.name] =
            pranaamAppDataStateManagement?.flightFirstTimeTextValue.value;
        purchaseEventAnalytics[Parameters.departure_service_time.name] =
            pranaamAppDataStateManagement?.flightSecondTimeTextValue.value;
      }
    }
  }

  String _getInboundArrivalStation(
    PranaamAppDataStateManagement? pranaamAppDataStateManagement,
  ) {
    final String tripType = pranaamAppDataStateManagement
            ?.cartDataResponse?.tripDetail.serviceType ??
        '';
    if (tripType == 'Round Trip') {
      return pranaamAppDataStateManagement
              ?.cartDataResponse?.tripDetail.originAirport ??
          '';
    } else if (tripType == 'Transit') {
      return '';
    }
    return '';
  }

  void addToWalletEvent(
    ClickEvents events,
    CreateBooking? createBookingModel,
  ) {
    final addToWalletGAObject = <String, Object?>{
      Parameters.category.name: 'pranaam',
      Parameters.sub_category.name: 'wallet',
      Parameters.pax_count.name: (createBookingModel?.travelers ?? []).length,
    };
    events.logEvent(
      parameters: addToWalletGAObject,
    );
  }
}
