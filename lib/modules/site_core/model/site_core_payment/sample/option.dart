/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/payment/utils/enums/payment_mode.dart';

class Option {
  final String? code;
  final String? name;
  final bool? isActive;
  final String? smallIcon;
  final String? largeIcon;
  final String? viewOtherBanksLabel;
  final String? searchBankLabel;
  final String? unavailableTxtMsg;
  final String? serverSlowTxtMsg;
  final String? regexForCardNumber;
  final String? packageName;
  final String? cvvLength;
  PaymentMode? mode;
  PaymentOptionType? paymentOptionType;
  final bool? isShowInPage;
  final bool? isDownTime;

  Option({
    this.code,
    this.name,
    this.isActive,
    this.smallIcon,
    this.largeIcon,
    this.viewOtherBanksLabel,
    this.searchBankLabel,
    this.unavailableTxtMsg,
    this.serverSlowTxtMsg,
    this.mode,
    this.regexForCardNumber,
    this.cvvLength,
    this.paymentOptionType,
    this.isShowInPage,
    this.isDownTime,
    this.packageName,
  });

  factory Option.fromJson(
    Map<String, dynamic> json,
    PaymentMode mode,
  ) {
    final String smallIcon = json['smallIcon'];
    // final String? code = json['code'];
    const PaymentOptionType paymentType = PaymentOptionType.registered;
    // if (code != null) {
    //   paymentType = code == 'OTHERS'
    //       ? PaymentOptionType.addNew
    //       : PaymentOptionType.registered;
    // }

    return Option(
      code: json['code'] as String?,
      name: json['name'] as String?,
      cvvLength: json['cvvLength'] as String?,
      regexForCardNumber: json['regexForCardNumber'] as String?,
      isActive: json['isActive'] as bool?,
      isShowInPage: json['isShowInPage'] as bool?,
      isDownTime: json['isDownTime'] as bool?,
      smallIcon: smallIcon,
      largeIcon: json['largeIcon'] as String?,
      viewOtherBanksLabel: json['viewOtherBanksLabel'] as String?,
      searchBankLabel: json['searchBankLabel'] as String?,
      unavailableTxtMsg: json['unavailableTxtMsg'] as String?,
      serverSlowTxtMsg: json['serverSlowTxtMsg'] as String?,
      packageName: json['packageName'] as String?,
      mode: mode,
      paymentOptionType: paymentType,
    );
  }

  Map<String, dynamic> toJson() => {
        'netBankingCode': code,
        'cvvLength': cvvLength,
        'regexForCardNumber': regexForCardNumber,
        'name': name,
        'isActive': isActive,
        'isShowInPage': isShowInPage,
        'isDownTime': isDownTime,
        'bankIconSmall': smallIcon,
        'bankIconLarge': largeIcon,
        'viewOtherBanksLabel': viewOtherBanksLabel,
        'searchBankLabel': searchBankLabel,
        'unavailableTxtMsg': unavailableTxtMsg,
        'serverSlowTxtMsg': serverSlowTxtMsg,
        'packageName': packageName,
      };
}

class ActiveRule {
  final String? amountlimit;
  final String? title;
  final String? message;

  ActiveRule({
    this.amountlimit,
    this.title,
    this.message,
  });

  factory ActiveRule.fromJson(
    Map<String, dynamic> json,
  ) {
    return ActiveRule(
      amountlimit: json['amountlimit'] as String?,
      title: json['title'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'amountlimit': amountlimit,
        'title': title,
        'message': message,
      };
}
