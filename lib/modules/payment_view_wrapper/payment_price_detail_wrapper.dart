/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/response_models/search_cab_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/cab_fare_details_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/insurance.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pax_info_list.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/priced_itinerary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pricing_summary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/zero_cancellation_summary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_payment/views/price_details_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/payment/models/price_detail_model.dart';
import 'package:adani_airport_mobile/modules/payment/screens/components/price_details_duty.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/price_details_view.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class PaymentPriceDetailWrapper extends StatelessWidget {
  const PaymentPriceDetailWrapper({
    this.cabPriceInfo,
    this.totalMRP,
    this.cGst,
    this.sGst,
    this.totalAmount,
    this.addOnsAmount,
    this.expressFareAmount,
    this.discountAmount,
    required this.shakeKey,
    this.showApplyCoupon = false,
    this.packageName,
    this.adTapCallback,
    this.isPaidVisible = false,
    Key? key,
    this.modeOfPayment = '',
    this.reward = 0,
    this.priceDetailList,
    this.baseFare,
    this.discountOnFare,
    this.taxes,
    this.convenienceFee,
    this.pricedItineraryList,
    this.paxInfoList,
    this.discountedCCFFee = 0,
    required this.paymentModule,
    this.priceSummary,
    this.insurance,
    this.promoType,
    this.zeroCancellationSummary,
    this.pranaamAddOnList,
  }) : super(key: key);
  final PriceInfo? cabPriceInfo;
  final double? totalMRP;
  final double? addOnsAmount;
  final double? reward;
  final double? cGst;
  final double? sGst;
  final double? totalAmount;
  final double? discountAmount;
  final double? expressFareAmount;
  final bool? showApplyCoupon;
  final ADTapCallback? adTapCallback;
  final String? packageName;
  final bool? isPaidVisible;
  final GlobalKey<ShakeWidgetState> shakeKey;
  final String? modeOfPayment;
  final List<PriceDetailModel>? priceDetailList;
  final PricingSummary? priceSummary;
  final Insurance? insurance;
  final String? promoType;
  final ZeroCancellationSummary? zeroCancellationSummary;
  final List? pranaamAddOnList;

  /// this defines the base fair of the flight.
  final String? baseFare;

  /// this defines the taxes application to the base fair.
  final String? taxes;

  /// this defines the total amount.

  /// this defines the total amount.
  final String? discountOnFare;

  /// this defines the convenience fee amount.
  final String? convenienceFee;

  /// this defines the loyalty amount.
  final double? discountedCCFFee;

  final List<PaxInfoList>? paxInfoList;
  final List<PricedItinerary>? pricedItineraryList;
  final PaymentModule paymentModule;

  @override
  Widget build(BuildContext context) {
    if (paymentModule == PaymentModule.dutyFree) {
      return PriceDetailsDuty(
        priceDetailList: priceDetailList ?? [],
        totalAmount: totalAmount ?? 0,
        shakeKey: shakeKey,
        tapInfoIcon: () => adLog('testing'),
        reward: (reward ?? 0) > (totalAmount ?? 0)
            ? totalAmount?.floorToDouble() ?? 0
            : reward ?? 0,
      );
    } else if (paymentModule == PaymentModule.pranaam) {
      final double _rewardPoints =
          (reward ?? 0) > (totalAmount ?? 0) ? totalAmount ?? 0 : reward ?? 0;
      return PriceDetailsView(
        addOnsList: pranaamAddOnList ?? const [],
        promoType: promoType ?? '0',
        expressFareAmount: expressFareAmount ?? 0,
        totalMRP: totalMRP ?? 0,
        cGst: cGst ?? 0,
        sGst: sGst ?? 0,
        totalAmount: (totalAmount ?? 0) - _rewardPoints,
        addOnsAmount: addOnsAmount ?? 0,
        discountAmount: discountAmount ?? 0,
        showApplyCoupon: true,
        packageName: packageName,
        shakeKey: shakeKey,
        reward: _rewardPoints.floor().toDouble(),        
      );
    } else if (paymentModule == PaymentModule.standAlone) {
      final double _rewardPoints =
          (reward ?? 0) > (totalAmount ?? 0) ? totalAmount ?? 0 : reward ?? 0;
      return PriceDetailsView(
        addOnsList: const [],
        promoType: promoType ?? '0',
        expressFareAmount: expressFareAmount ?? 0,
        totalMRP: totalMRP ?? 0,
        cGst: cGst ?? 0,
        sGst: sGst ?? 0,
        totalAmount: (totalAmount ?? 0) - _rewardPoints,
        addOnsAmount: addOnsAmount ?? 0,
        discountAmount: discountAmount ?? 0,
        //showApplyCoupon: true,
        packageName: packageName,
        shakeKey: shakeKey,
        reward: _rewardPoints.floor().toDouble(),
      );
    } else if (paymentModule == PaymentModule.cabBooking) {
      return CabFareDetailsView(
        shakeKey: shakeKey,
        priceInfo: cabPriceInfo,
        couponDiscount: discountAmount,
        totalAmount: totalAmount,
        rewardPoints: reward?.floorToDouble() ?? 0,
      ).paddingBySide(
        left: context.k_16,
        top: context.k_30,
        right: context.k_16,
      );
    } else {
      return PriceDetailsScreen(
        baseFare: '$baseFare',
        discountOnFare: priceSummary?.discount.toString() ?? '',
        taxes: '$taxes',
        totalAmount: '$totalAmount',
        convenienceFee: '$convenienceFee',
        shakeKey: shakeKey,
        paxInfoList: paxInfoList ?? [],
        pricedItineraryList: pricedItineraryList,
        loyaltyPoints: reward ?? 0,
        discountedCCFFee: (discountedCCFFee ?? 0).toDouble(),
        insurance: insurance,
        zeroCancellationSummary: zeroCancellationSummary,
      );
    }
  }
}
