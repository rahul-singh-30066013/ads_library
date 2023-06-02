/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';

@immutable
class PromoCard {
  final String? heading;
  final String? description;
  final String? imageSmall;
  final String? imageLarge;

  const PromoCard({
    this.heading,
    this.description,
    this.imageSmall,
    this.imageLarge,
  });

  @override
  String toString() {
    return 'PromoCard(heading: $heading, description: $description, imageSmall: $imageSmall, imageLarge: $imageLarge)';
  }

  factory PromoCard.fromJson(Map<String, dynamic> json) => PromoCard(
        heading: json['heading'] as String?,
        description: json['description'] as String?,
        imageSmall: json['imageSmall'] as String?,
        imageLarge: json['imageLarge'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'heading': heading,
        'description': description,
        'imageSmall': imageSmall,
        'imageLarge': imageLarge,
      };

  PromoCard copyWith({
    String? heading,
    String? description,
    String? imageSmall,
    String? imageLarge,
  }) {
    return PromoCard(
      heading: heading ?? this.heading,
      description: description ?? this.description,
      imageSmall: imageSmall ?? this.imageSmall,
      imageLarge: imageLarge ?? this.imageLarge,
    );
  }
}
