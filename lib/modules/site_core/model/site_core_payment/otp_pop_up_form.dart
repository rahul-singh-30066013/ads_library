/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';

@immutable
class OtpPopUpForm {
  final String? enterOtpLabel;
  final String? enterOtpDesc;
  final String? continueLabel;
  final String? receiveTextMsg;
  final String? resendOtpLabel;
  final String? receiveErrTextMsg;

  const OtpPopUpForm({
    this.enterOtpLabel,
    this.enterOtpDesc,
    this.continueLabel,
    this.receiveTextMsg,
    this.resendOtpLabel,
    this.receiveErrTextMsg,
  });

  @override
  String toString() {
    return 'OtpPopUpForm(enterOtpLabel: $enterOtpLabel, enterOtpDesc: $enterOtpDesc, continueLabel: $continueLabel, receiveTextMsg: $receiveTextMsg, resendOtpLabel: $resendOtpLabel, receiveErrTextMsg: $receiveErrTextMsg)';
  }

  factory OtpPopUpForm.fromJson(Map<String, dynamic> json) => OtpPopUpForm(
        enterOtpLabel: json['enterOtpLabel'] as String?,
        enterOtpDesc: json['enterOtpDesc'] as String?,
        continueLabel: json['continueLabel'] as String?,
        receiveTextMsg: json['receiveTextMsg'] as String?,
        resendOtpLabel: json['resendOtpLabel'] as String?,
        receiveErrTextMsg: json['receiveErrTextMsg'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'enterOtpLabel': enterOtpLabel,
        'enterOtpDesc': enterOtpDesc,
        'continueLabel': continueLabel,
        'receiveTextMsg': receiveTextMsg,
        'resendOtpLabel': resendOtpLabel,
        'receiveErrTextMsg': receiveErrTextMsg,
      };

  OtpPopUpForm copyWith({
    String? enterOtpLabel,
    String? enterOtpDesc,
    String? continueLabel,
    String? receiveTextMsg,
    String? resendOtpLabel,
    String? receiveErrTextMsg,
  }) {
    return OtpPopUpForm(
      enterOtpLabel: enterOtpLabel ?? this.enterOtpLabel,
      enterOtpDesc: enterOtpDesc ?? this.enterOtpDesc,
      continueLabel: continueLabel ?? this.continueLabel,
      receiveTextMsg: receiveTextMsg ?? this.receiveTextMsg,
      resendOtpLabel: resendOtpLabel ?? this.resendOtpLabel,
      receiveErrTextMsg: receiveErrTextMsg ?? this.receiveErrTextMsg,
    );
  }
}
