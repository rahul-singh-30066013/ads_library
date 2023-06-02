/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:equatable/equatable.dart';

class OfferText extends Equatable {
  final String? heading;
  final String? description;
  final String? imageSmall;
  final String? imageLarge;
  final String? note;
  final String? buttonText;
  final String? btnLink;

  const OfferText({
    this.heading,
    this.description,
    this.imageSmall,
    this.imageLarge,
    this.note,
    this.buttonText,
    this.btnLink,
  });

  factory OfferText.fromJson(Map<String, dynamic> json) => OfferText(
        heading: json['heading'] as String?,
        description: json['description'] as String?,
        imageSmall: json['imageSmall'] as String?,
        imageLarge: json['imageLarge'] as String?,
        note: json['note'] as String?,
        buttonText: json['buttonText'] as String?,
        btnLink: json['btnLink'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'heading': heading,
        'description': description,
        'imageSmall': imageSmall,
        'imageLarge': imageLarge,
        'note': note,
        'buttonText': buttonText,
        'btnLink': btnLink,
      };

  OfferText copyWith({
    String? heading,
    String? description,
    String? imageSmall,
    String? imageLarge,
    String? note,
    String? buttonText,
    String? btnLink,
  }) {
    return OfferText(
      heading: heading ?? this.heading,
      description: description ?? this.description,
      imageSmall: imageSmall ?? this.imageSmall,
      imageLarge: imageLarge ?? this.imageLarge,
      note: note ?? this.note,
      buttonText: buttonText ?? this.buttonText,
      btnLink: btnLink ?? this.btnLink,
    );
  }

  @override
  List<Object?> get props {
    return [
      heading,
      description,
      imageSmall,
      imageLarge,
      note,
      buttonText,
      btnLink,
    ];
  }
}
