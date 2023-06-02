/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/payment/models/request/pay_now_request/billing_address.dart';
import 'package:adani_airport_mobile/modules/payment/models/request/pay_now_request/net_banking.dart';
import 'package:adani_airport_mobile/modules/payment/models/request/pay_now_request/payment_card.dart';
import 'package:adani_airport_mobile/modules/payment/models/request/pay_now_request/upi_request.dart';
import 'package:adani_airport_mobile/modules/payment/models/request/pay_now_request/wallet.dart';

class PayNowRequest {
  PayNowRequest({
    this.paymentMode,
    this.amount,
    this.tripId,
    this.currency,
    this.orderDesc,
    this.countryCode,
    this.mobile,
    this.emailId,
    this.callBackUrl,
    this.rfu1,
    this.billingAddress,
    this.shippingAddress,
    this.card,
    this.netBanking,
    this.wallet,
    this.itineraryId,
    this.upiRequest,
    this.loyalty,
    this.removeInstantDiscount = false,
    this.isUrlMode = true,
  });

  final String? paymentMode;
  final String? itineraryId;
  final num? amount;
  final String? tripId;
  final String? currency;
  final String? orderDesc;
  final String? countryCode;
  final String? mobile;
  final String? emailId;
  final String? callBackUrl;
  final String? rfu1;
  final BillingAddress? billingAddress;
  final BillingAddress? shippingAddress;
  final PaymentCard? card;
  final NetBanking? netBanking;
  final Wallet? wallet;
  final UpiRequest? upiRequest;
  final num? loyalty;
  bool? removeInstantDiscount;
  bool? isUrlMode;

  @override
  String toString() {
    return 'PayNowRequest(paymentMode: $paymentMode, amount: $amount, tripId: $tripId, currency: $currency, orderDesc: $orderDesc, countryCode: $countryCode, mobile: $mobile, emailId: $emailId, callBackUrl: $callBackUrl, rfu1: $rfu1, billingAddress: $billingAddress, shipingAddress: $shippingAddress, card: $card, netBanking: $netBanking, wallet: $wallet,ItineraryId:$itineraryId,upiRequest: $upiRequest,isUrlMode: $isUrlMode)';
  }

  factory PayNowRequest.fromJson(Map<String, dynamic> json) => PayNowRequest(
        paymentMode: json['paymentMode'] as String?,
        amount: json['amount'] as num?,
        tripId: json['tripId'] as String?,
        itineraryId: json['ItineraryId'] as String?,
        currency: json['currency'] as String?,
        orderDesc: json['orderDesc'] as String?,
        countryCode: json['countryCode'] as String?,
        mobile: json['mobile'] as String?,
        emailId: json['emailId'] as String?,
        callBackUrl: json['callBackUrl'] as String?,
        rfu1: json['rfu1'] as String?,
        billingAddress: json['billingAddress'] == null
            ? null
            : BillingAddress.fromJson(
                json['billingAddress'] as Map<String, dynamic>,
              ),
        shippingAddress: json['shipingAddress'] == null
            ? null
            : BillingAddress.fromJson(
                json['shipingAddress'] as Map<String, dynamic>,
              ),
        card: json['card'] == null
            ? null
            : PaymentCard.fromJson(json['card'] as Map<String, dynamic>),
        netBanking: json['netBanking'] == null
            ? null
            : NetBanking.fromJson(json['netBanking'] as Map<String, dynamic>),
        wallet: json['wallet'] == null
            ? null
            : Wallet.fromJson(json['wallet'] as Map<String, dynamic>),
        upiRequest: json['upiRequest'] == null
            ? null
            : UpiRequest.fromJson(json['upiRequest'] as Map<String, dynamic>),
        loyalty: json['loyalty'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'paymentMode': paymentMode,
        'amount': amount,
        'tripId': tripId,
        'ItineraryId': itineraryId,
        'currency': currency,
        'orderDesc': orderDesc,
        'countryCode': countryCode,
        'mobile': mobile,
        'emailId': emailId,
        'callBackUrl': callBackUrl,
        'rfu1': rfu1,
        'billingAddress': billingAddress?.toJson(),
        'shipingAddress': shippingAddress?.toJson(),
        'card': card?.toJson(),
        'netBanking': netBanking?.toJson(),
        'wallet': wallet?.toJson(),
        'upiRequest': upiRequest?.toJson(),
        'loyalty': loyalty,
        'removeInstantDiscount': removeInstantDiscount,
        'isUrlMode': isUrlMode,
      };
}
