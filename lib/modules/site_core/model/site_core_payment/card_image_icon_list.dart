/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';

@immutable
class CardImageIconList {
  final String? cardIconSmall;
  final String? cardIconBig;

  const CardImageIconList({this.cardIconSmall, this.cardIconBig});

  @override
  String toString() {
    return 'CardImageIconList(cardIconSmall: $cardIconSmall, cardIconBig: $cardIconBig)';
  }

  factory CardImageIconList.fromJson(Map<String, dynamic> json) {
    return CardImageIconList(
      cardIconSmall: json['cardIconSmall'] as String?,
      cardIconBig: json['cardIconBig'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'cardIconSmall': cardIconSmall,
        'cardIconBig': cardIconBig,
      };

  CardImageIconList copyWith({
    String? cardIconSmall,
    String? cardIconBig,
  }) {
    return CardImageIconList(
      cardIconSmall: cardIconSmall ?? this.cardIconSmall,
      cardIconBig: cardIconBig ?? this.cardIconBig,
    );
  }
}
