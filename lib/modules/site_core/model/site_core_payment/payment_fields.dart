/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/card_detail.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/card_option.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/net_banking_option_list.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/offer_text.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/payment_type_list.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/promo_card.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/sample/option.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/security_card_detail.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/upi_option_list.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/wallet_option_list.dart';

class PaymentFields {
  final String? choosePaymentHeading;
  final String? payText;
  final String? hostname;
  final List<PaymentTypeList>? paymentTypeList;
  final CardOption? cardOption;
  final List<PromoCard>? promoCards;
  final List<UpiOptionList>? upiOptionList;
  final List<WalletOptionList>? walletOptionList;
  final List<NetBankingOptionList>? netBankingOptionList;
  List<Option>? upiImageList;
  final CardDetail? cardDetail;
  final SecurityCardDetail? securityCardDetail;
  final OfferText? offerText;

  PaymentFields({
    this.choosePaymentHeading,
    this.payText,
    this.paymentTypeList,
    this.cardOption,
    this.promoCards,
    this.upiOptionList,
    this.walletOptionList,
    this.netBankingOptionList,
    this.securityCardDetail,
    this.hostname,
    this.upiImageList,
    this.cardDetail,
    this.offerText,
  });

  @override
  String toString() {
    return 'Fields(choosePaymentHeading: $choosePaymentHeading, payText: $payText, paymentTypeList: $paymentTypeList, cardOption: $cardOption, promoCards: $promoCards, upiOptionList: $upiOptionList, walletOptionList: $walletOptionList, netBankingOptionList: $netBankingOptionList, securityCardDetail: $securityCardDetail,hostname:$hostname,cardDetail:$cardDetail)';
  }

  factory PaymentFields.fromJson(Map<String, dynamic> json) {
    final String hostname = json['hostname'];
    return PaymentFields(
      choosePaymentHeading: json['choosePaymentHeading'] as String?,
      payText: json['payText'] as String?,
      hostname: hostname,
      paymentTypeList: (json['paymentTypeList'] as List<dynamic>?)
          ?.map(
            (e) => PaymentTypeList.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      promoCards: (json['promoCards'] as List<dynamic>?)
          ?.map(
            (e) => PromoCard.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      cardDetail: json['cardDetail'] == null
          ? null
          : CardDetail.fromJson(json['cardDetail'] as Map<String, dynamic>),
      offerText: json['offerText'] == null
          ? null
          : OfferText.fromJson(json['offerText'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'choosePaymentHeading': choosePaymentHeading,
        'payText': payText,
        'paymentTypeList': paymentTypeList?.map((e) => e.toJson()).toList(),
      };

  PaymentFields copyWith({
    String? choosePaymentHeading,
    String? payText,
    List<PaymentTypeList>? paymentTypeList,
    CardOption? cardOption,
    List<PromoCard>? promoCards,
    List<UpiOptionList>? upiOptionList,
    List<WalletOptionList>? walletOptionList,
    List<NetBankingOptionList>? netBankingOptionList,
    SecurityCardDetail? securityCardDetail,
    final OfferText? offerText,
  }) {
    return PaymentFields(
      choosePaymentHeading: choosePaymentHeading ?? this.choosePaymentHeading,
      payText: payText ?? this.payText,
      paymentTypeList: paymentTypeList ?? this.paymentTypeList,
      cardOption: cardOption ?? this.cardOption,
      promoCards: promoCards ?? this.promoCards,
      upiOptionList: upiOptionList ?? this.upiOptionList,
      walletOptionList: walletOptionList ?? this.walletOptionList,
      netBankingOptionList: netBankingOptionList ?? this.netBankingOptionList,
      securityCardDetail: securityCardDetail ?? this.securityCardDetail,
      offerText: offerText ?? this.offerText,
    );
  }
}
