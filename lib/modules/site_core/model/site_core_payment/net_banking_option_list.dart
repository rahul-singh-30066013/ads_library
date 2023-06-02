/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';

@immutable
class NetBankingOptionList {
  final String? netBankingCode;
  final String? netBankingName;
  final bool? isActive;
  final String? bankIconSmall;
  final String? bankIconLarge;
  final String? viewOtherBanksLabel;
  final String? searchBankLabel;
  final String? unavailableTxtMsg;
  final String? serverSlowTxtMsg;

  const NetBankingOptionList({
    this.netBankingCode,
    this.netBankingName,
    this.isActive,
    this.bankIconSmall,
    this.bankIconLarge,
    this.viewOtherBanksLabel,
    this.searchBankLabel,
    this.unavailableTxtMsg,
    this.serverSlowTxtMsg,
  });

  @override
  String toString() {
    return 'NetBankingOptionList(netBankingCode: $netBankingCode, netBankingName: $netBankingName, isActive: $isActive, bankIconSmall: $bankIconSmall, bankIconLarge: $bankIconLarge, viewOtherBanksLabel: $viewOtherBanksLabel, searchBankLabel: $searchBankLabel, unavailableTxtMsg: $unavailableTxtMsg, serverSlowTxtMsg: $serverSlowTxtMsg)';
  }

  factory NetBankingOptionList.fromJson(Map<String, dynamic> json) {
    return NetBankingOptionList(
      netBankingCode: json['netBankingCode'] as String?,
      netBankingName: json['netBankingName'] as String?,
      isActive: json['isActive'] as bool?,
      bankIconSmall: json['bankIconSmall'] as String?,
      bankIconLarge: json['bankIconLarge'] as String?,
      viewOtherBanksLabel: json['viewOtherBanksLabel'] as String?,
      searchBankLabel: json['searchBankLabel'] as String?,
      unavailableTxtMsg: json['unavailableTxtMsg'] as String?,
      serverSlowTxtMsg: json['serverSlowTxtMsg'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'netBankingCode': netBankingCode,
        'netBankingName': netBankingName,
        'isActive': isActive,
        'bankIconSmall': bankIconSmall,
        'bankIconLarge': bankIconLarge,
        'viewOtherBanksLabel': viewOtherBanksLabel,
        'searchBankLabel': searchBankLabel,
        'unavailableTxtMsg': unavailableTxtMsg,
        'serverSlowTxtMsg': serverSlowTxtMsg,
      };

  NetBankingOptionList copyWith({
    String? netBankingCode,
    String? netBankingName,
    bool? isActive,
    String? bankIconSmall,
    String? bankIconLarge,
    String? viewOtherBanksLabel,
    String? searchBankLabel,
    String? unavailableTxtMsg,
    String? serverSlowTxtMsg,
  }) {
    return NetBankingOptionList(
      netBankingCode: netBankingCode ?? this.netBankingCode,
      netBankingName: netBankingName ?? this.netBankingName,
      isActive: isActive ?? this.isActive,
      bankIconSmall: bankIconSmall ?? this.bankIconSmall,
      bankIconLarge: bankIconLarge ?? this.bankIconLarge,
      viewOtherBanksLabel: viewOtherBanksLabel ?? this.viewOtherBanksLabel,
      searchBankLabel: searchBankLabel ?? this.searchBankLabel,
      unavailableTxtMsg: unavailableTxtMsg ?? this.unavailableTxtMsg,
      serverSlowTxtMsg: serverSlowTxtMsg ?? this.serverSlowTxtMsg,
    );
  }
}
