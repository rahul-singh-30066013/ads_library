/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class CardDetail {
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
  final String? expireIconSmall;
  final String? expireIconBig;
  final String? infoIconSmall;
  final String? infoIconBig;
  final String? requiredCvvErrMsg;
  final String? incorrectCvvErrMsg;
  final String? viewOtherBankLabel;

  const CardDetail({
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
    this.expireIconSmall,
    this.expireIconBig,
    this.infoIconSmall,
    this.infoIconBig,
    this.requiredCvvErrMsg,
    this.incorrectCvvErrMsg,
    this.viewOtherBankLabel,
  });

  factory CardDetail.fromJson(Map<String, dynamic> json) => CardDetail(
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
        expireIconSmall: json['expireIconSmall'] as String?,
        expireIconBig: json['expireIconBig'] as String?,
        infoIconSmall: json['infoIconSmall'] as String?,
        infoIconBig: json['infoIconBig'] as String?,
        requiredCvvErrMsg: json['requiredCvvErrMsg'] as String?,
        incorrectCvvErrMsg: json['incorrectCvvErrMsg'] as String?,
        viewOtherBankLabel: json['viewOtherBankLabel'] as String?,
      );

  Map<String, dynamic> toJson() => {
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
        'expireIconSmall': expireIconSmall,
        'expireIconBig': expireIconBig,
        'infoIconSmall': infoIconSmall,
        'infoIconBig': infoIconBig,
        'requiredCvvErrMsg': requiredCvvErrMsg,
        'incorrectCvvErrMsg': incorrectCvvErrMsg,
        'viewOtherBankLabel': viewOtherBankLabel,
      };

  CardDetail copyWith({
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
    String? expireIconSmall,
    String? expireIconBig,
    String? infoIconSmall,
    String? infoIconBig,
    String? requiredCvvErrMsg,
    String? incorrectCvvErrMsg,
    String? viewOtherBankLabel,
  }) {
    return CardDetail(
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
      expireIconSmall: expireIconSmall ?? this.expireIconSmall,
      expireIconBig: expireIconBig ?? this.expireIconBig,
      infoIconSmall: infoIconSmall ?? this.infoIconSmall,
      infoIconBig: infoIconBig ?? this.infoIconBig,
      requiredCvvErrMsg: requiredCvvErrMsg ?? this.requiredCvvErrMsg,
      incorrectCvvErrMsg: incorrectCvvErrMsg ?? this.incorrectCvvErrMsg,
      viewOtherBankLabel: viewOtherBankLabel ?? this.viewOtherBankLabel,
    );
  }

// @override
// List<Object?> get props {
// 	return [
// 			cardNumberLabel,
// 			validThruLabel,
// 			cvvLabel,
// 			nameOnCardLabel,
// 			secureCardLabel,
// 			cardImageSmall,
// 			cardImageBig,
// 			requiredCardNumberErrMsg,
// 			incorrectCardNumberErrMsg,
// 			requiredValidThruErrMsg,
// 			incorrectValidThruErrMsg,
// 			incorrectNameCardErrMsg,
// 			expireIconSmall,
// 			expireIconBig,
// 			infoIconSmall,
// 			infoIconBig,
// 			requiredCvvErrMsg,
// 			incorrectCvvErrMsg,
// 			viewOtherBankLabel,
// 	];
// }
}
