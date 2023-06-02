/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/card_image_icon_list.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/otp_pop_up_form.dart';
import 'package:flutter/cupertino.dart';

@immutable
class CardOption {
  final List<CardImageIconList>? cardImageIconList;
  final String? cardNumberLabel;
  final String? validThruLabel;
  final String? cvvLabel;
  final String? nameOnCardLabel;
  final String? secureCardLabel;
  final String? cardImageSmall;
  final String? cardImageBig;
  final String? requiredCardNumberErrMsg;
  final String? incorrectCardNumberErrMsg;
  final String? requiredValidThruErrMsg;
  final String? incorrectValidThruErrMsg;
  final String? incorrectNameCardErrMsg;
  final OtpPopUpForm? otpPopUpForm;

  const CardOption({
    this.cardImageIconList,
    this.cardNumberLabel,
    this.validThruLabel,
    this.cvvLabel,
    this.nameOnCardLabel,
    this.secureCardLabel,
    this.cardImageSmall,
    this.cardImageBig,
    this.requiredCardNumberErrMsg,
    this.incorrectCardNumberErrMsg,
    this.requiredValidThruErrMsg,
    this.incorrectValidThruErrMsg,
    this.incorrectNameCardErrMsg,
    this.otpPopUpForm,
  });

  @override
  String toString() {
    return 'CardOption(cardImageIconList: $cardImageIconList, cardNumberLabel: $cardNumberLabel, validThruLabel: $validThruLabel, cvvLabel: $cvvLabel, nameOnCardLabel: $nameOnCardLabel, secureCardLabel: $secureCardLabel, cardImageSmall: $cardImageSmall, cardImageBig: $cardImageBig, requiredCardNumberErrMsg: $requiredCardNumberErrMsg, incorrectCardNumberErrMsg: $incorrectCardNumberErrMsg, requiredValidThruErrMsg: $requiredValidThruErrMsg, incorrectValidThruErrMsg: $incorrectValidThruErrMsg, incorrectNameCardErrMsg: $incorrectNameCardErrMsg, otpPopUpForm: $otpPopUpForm)';
  }

  factory CardOption.fromJson(Map<String, dynamic> json) => CardOption(
        cardImageIconList: (json['cardImageIconList'] as List<dynamic>?)
            ?.map((e) => CardImageIconList.fromJson(e as Map<String, dynamic>))
            .toList(),
        cardNumberLabel: json['cardNumberLabel'] as String?,
        validThruLabel: json['validThruLabel'] as String?,
        cvvLabel: json['cvvLabel'] as String?,
        nameOnCardLabel: json['nameOnCardLabel'] as String?,
        secureCardLabel: json['secureCardLabel'] as String?,
        cardImageSmall: json['cardImageSmall'] as String?,
        cardImageBig: json['cardImageBig'] as String?,
        requiredCardNumberErrMsg: json['requiredCardNumberErrMsg'] as String?,
        incorrectCardNumberErrMsg: json['incorrectCardNumberErrMsg'] as String?,
        requiredValidThruErrMsg: json['requiredValidThruErrMsg'] as String?,
        incorrectValidThruErrMsg: json['incorrectValidThruErrMsg'] as String?,
        incorrectNameCardErrMsg: json['incorrectNameCardErrMsg'] as String?,
        otpPopUpForm: json['otpPopUpForm'] == null
            ? null
            : OtpPopUpForm.fromJson(
                json['otpPopUpForm'] as Map<String, dynamic>,
              ),
      );

  Map<String, dynamic> toJson() => {
        'cardImageIconList': cardImageIconList?.map((e) => e.toJson()).toList(),
        'cardNumberLabel': cardNumberLabel,
        'validThruLabel': validThruLabel,
        'cvvLabel': cvvLabel,
        'nameOnCardLabel': nameOnCardLabel,
        'secureCardLabel': secureCardLabel,
        'cardImageSmall': cardImageSmall,
        'cardImageBig': cardImageBig,
        'requiredCardNumberErrMsg': requiredCardNumberErrMsg,
        'incorrectCardNumberErrMsg': incorrectCardNumberErrMsg,
        'requiredValidThruErrMsg': requiredValidThruErrMsg,
        'incorrectValidThruErrMsg': incorrectValidThruErrMsg,
        'incorrectNameCardErrMsg': incorrectNameCardErrMsg,
        'otpPopUpForm': otpPopUpForm?.toJson(),
      };

  CardOption copyWith({
    List<CardImageIconList>? cardImageIconList,
    String? cardNumberLabel,
    String? validThruLabel,
    String? cvvLabel,
    String? nameOnCardLabel,
    String? secureCardLabel,
    String? cardImageSmall,
    String? cardImageBig,
    String? requiredCardNumberErrMsg,
    String? incorrectCardNumberErrMsg,
    String? requiredValidThruErrMsg,
    String? incorrectValidThruErrMsg,
    String? incorrectNameCardErrMsg,
    OtpPopUpForm? otpPopUpForm,
  }) {
    return CardOption(
      cardImageIconList: cardImageIconList ?? this.cardImageIconList,
      cardNumberLabel: cardNumberLabel ?? this.cardNumberLabel,
      validThruLabel: validThruLabel ?? this.validThruLabel,
      cvvLabel: cvvLabel ?? this.cvvLabel,
      nameOnCardLabel: nameOnCardLabel ?? this.nameOnCardLabel,
      secureCardLabel: secureCardLabel ?? this.secureCardLabel,
      cardImageSmall: cardImageSmall ?? this.cardImageSmall,
      cardImageBig: cardImageBig ?? this.cardImageBig,
      requiredCardNumberErrMsg:
          requiredCardNumberErrMsg ?? this.requiredCardNumberErrMsg,
      incorrectCardNumberErrMsg:
          incorrectCardNumberErrMsg ?? this.incorrectCardNumberErrMsg,
      requiredValidThruErrMsg:
          requiredValidThruErrMsg ?? this.requiredValidThruErrMsg,
      incorrectValidThruErrMsg:
          incorrectValidThruErrMsg ?? this.incorrectValidThruErrMsg,
      incorrectNameCardErrMsg:
          incorrectNameCardErrMsg ?? this.incorrectNameCardErrMsg,
      otpPopUpForm: otpPopUpForm ?? this.otpPopUpForm,
    );
  }
}
