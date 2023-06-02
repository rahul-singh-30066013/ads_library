/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/payment/utils/enums/cell_type.dart';
import 'package:adani_airport_mobile/modules/payment/utils/enums/payment_mode.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/sample/option.dart';
import 'package:flutter/cupertino.dart';

@immutable
class PaymentTypeList {
  final String? type;
  final String? iconSmall;
  final String? iconBig;
  final String? name;
  final String? description;
  final List<Option>? options;
  final CellType? typeOfCell;
  final ActiveRule? activeRule;

  const PaymentTypeList({
    this.type,
    this.iconSmall,
    this.iconBig,
    this.name,
    this.description,
    this.options,
    this.typeOfCell,
    this.activeRule,
  });

  @override
  String toString() {
    return 'PaymentTypeList(type: $type, iconSmall: $iconSmall, iconBig: $iconBig, name: $name, description: $description, activeRule: $activeRule)';
  }

  factory PaymentTypeList.fromJson(
    Map<String, dynamic> json,
  ) {
    final String type = json['type'];
    CellType customTypeOfCell = CellType.brick;
    PaymentMode mode = PaymentMode.netbanking;
    if (type == 'NETBANKING') {
      customTypeOfCell = CellType.brick;
      mode = PaymentMode.netbanking;
    } else if (type == 'WALLET') {
      customTypeOfCell = CellType.tile;
      mode = PaymentMode.wallet;
    } else if (type == 'UPI'|| type == 'Android UPI' || type == 'IOS UPI') {
      customTypeOfCell = CellType.tile;
      mode = PaymentMode.upi;
    } else if (type == 'CARD') {
      customTypeOfCell = CellType.card;
      mode = PaymentMode.creditordebitcard;
    }
    final String smallIcon = json['iconSmall'];
    return PaymentTypeList(
      typeOfCell: customTypeOfCell,
      type: json['type'] as String?,
      iconSmall: smallIcon,
      iconBig: json['iconBig'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map(
            (e) => Option.fromJson(
              e as Map<String, dynamic>,
              mode,
            ),
          )
          .toList(),
      activeRule: json['activeRule'] != null
          ? ActiveRule.fromJson(json['activeRule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'iconSmall': iconSmall,
        'iconBig': iconBig,
        'name': name,
        'description': description,
        'options': options?.map((e) => e.toJson()).toList(),
        'activeRule': activeRule.toString(),
      };

  PaymentTypeList copyWith({
    String? type,
    String? iconSmall,
    String? iconBig,
    String? name,
    String? description,
    ActiveRule? activeRule,
  }) {
    return PaymentTypeList(
      type: type ?? this.type,
      iconSmall: iconSmall ?? this.iconSmall,
      iconBig: iconBig ?? this.iconBig,
      name: name ?? this.name,
      description: description ?? this.description,
      activeRule: activeRule ?? this.activeRule,
    );
  }
}
