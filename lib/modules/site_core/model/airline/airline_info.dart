/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:flutter/cupertino.dart';

@immutable
class AirLineInfo {
  final String? airlineCode;
  final String? name;
  final String? icon;
  final String? thumbnailImage;
  final String? mobileImage;
  final String? airlineId;
  final String? airlineCancellationPolicy;

  const AirLineInfo({
    this.airlineCode,
    this.name,
    this.icon,
    this.thumbnailImage,
    this.mobileImage,
    this.airlineId,
    this.airlineCancellationPolicy,
  });

  @override
  String toString() {
    return 'AirLineInfo(airlineCode: $airlineCode, airlineName: $name, airlineLogo: $icon, thumbnailImage: $thumbnailImage, mobileImage: $mobileImage, airlineId: $airlineId, airlineCancellationPolicy: $airlineCancellationPolicy)';
  }

  factory AirLineInfo.fromJson(Map<String, dynamic> json, String? baseUrl) {
    final String hostname =
        baseUrl ?? Environment.instance.configuration.cmsImageBaseUrl;
    final String? airlineLogo = json['airlineLogo'] as String?;

    return AirLineInfo(
      airlineCode: json['airlineCode'] as String?,
      name: json['airlineName'] as String?,
      icon: (airlineLogo ?? '').contains('http')
          ? airlineLogo ?? ''
          : hostname + (airlineLogo ?? ''),
      thumbnailImage: json['thumbnailImage'] as String?,
      mobileImage: json['mobileImage'] as String?,
      airlineId: json['airlineID'] as String?,
      airlineCancellationPolicy: json['airlineCancellationPolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'airlineCode': airlineCode,
        'airlineName': name,
        'airlineLogo': icon,
        'thumbnailImage': thumbnailImage,
        'mobileImage': mobileImage,
        'airlineID': airlineId,
        'airlineCancellationPolicy': airlineCancellationPolicy,
      };

  AirLineInfo copyWith({
    String? airlineCode,
    String? airlineName,
    String? airlineLogo,
    String? thumbnailImage,
    String? mobileImage,
    String? airlineId,
    String? airlineCancellationPolicy,
  }) {
    return AirLineInfo(
      airlineCode: airlineCode ?? this.airlineCode,
      name: airlineName ?? name,
      icon: airlineLogo ?? icon,
      thumbnailImage: thumbnailImage ?? this.thumbnailImage,
      mobileImage: mobileImage ?? this.mobileImage,
      airlineId: airlineId ?? this.airlineId,
      airlineCancellationPolicy:
          airlineCancellationPolicy ?? this.airlineCancellationPolicy,
    );
  }
}
