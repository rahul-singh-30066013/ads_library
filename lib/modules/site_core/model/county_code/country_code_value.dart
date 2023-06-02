/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';

@immutable
class CountryCodeValue {
  final String? src;
  final String? alt;
  final String? width;
  final String? height;

  const CountryCodeValue({this.src, this.alt, this.width, this.height});

  @override
  String toString() {
    return 'CountryCodeValue(src: $src, alt: $alt, width: $width, height: $height)';
  }

  factory CountryCodeValue.fromJson(Map<String, dynamic> json) =>
      CountryCodeValue(
        src: json['src'] as String?,
        alt: json['alt'] as String?,
        width: json['width'] as String?,
        height: json['height'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'src': src,
        'alt': alt,
        'width': width,
        'height': height,
      };

  CountryCodeValue copyWith({
    String? src,
    String? alt,
    String? width,
    String? height,
  }) {
    return CountryCodeValue(
      src: src ?? this.src,
      alt: alt ?? this.alt,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }
}
