/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';

@immutable
class SecurityCardDetail {
  final String? securityCardHeading;
  final String? securityCardDesc;
  final String? securityImageSmall;
  final String? securityImageBig;
  final String? securityPoint1;
  final String? securityPoint2;
  final String? securePayLink;
  final String? askLaterLink;

  const SecurityCardDetail({
    this.securityCardHeading,
    this.securityCardDesc,
    this.securityImageSmall,
    this.securityImageBig,
    this.securityPoint1,
    this.securityPoint2,
    this.securePayLink,
    this.askLaterLink,
  });

  @override
  String toString() {
    return 'SecurityCardDetail(securityCardHeading: $securityCardHeading, securityCardDesc: $securityCardDesc, securityImageSmall: $securityImageSmall, securityImageBig: $securityImageBig, securityPoint1: $securityPoint1, securityPoint2: $securityPoint2, securePayLink: $securePayLink, askLaterLink: $askLaterLink)';
  }

  factory SecurityCardDetail.fromJson(Map<String, dynamic> json) {
    return SecurityCardDetail(
      securityCardHeading: json['securityCardHeading'] as String?,
      securityCardDesc: json['securityCardDesc'] as String?,
      securityImageSmall: json['securityImageSmall'] as String?,
      securityImageBig: json['securityImageBig'] as String?,
      securityPoint1: json['securityPoint1'] as String?,
      securityPoint2: json['securityPoint2'] as String?,
      securePayLink: json['securePayLink'] as String?,
      askLaterLink: json['askLaterLink'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'securityCardHeading': securityCardHeading,
        'securityCardDesc': securityCardDesc,
        'securityImageSmall': securityImageSmall,
        'securityImageBig': securityImageBig,
        'securityPoint1': securityPoint1,
        'securityPoint2': securityPoint2,
        'securePayLink': securePayLink,
        'askLaterLink': askLaterLink,
      };

  SecurityCardDetail copyWith({
    String? securityCardHeading,
    String? securityCardDesc,
    String? securityImageSmall,
    String? securityImageBig,
    String? securityPoint1,
    String? securityPoint2,
    String? securePayLink,
    String? askLaterLink,
  }) {
    return SecurityCardDetail(
      securityCardHeading: securityCardHeading ?? this.securityCardHeading,
      securityCardDesc: securityCardDesc ?? this.securityCardDesc,
      securityImageSmall: securityImageSmall ?? this.securityImageSmall,
      securityImageBig: securityImageBig ?? this.securityImageBig,
      securityPoint1: securityPoint1 ?? this.securityPoint1,
      securityPoint2: securityPoint2 ?? this.securityPoint2,
      securePayLink: securePayLink ?? this.securePayLink,
      askLaterLink: askLaterLink ?? this.askLaterLink,
    );
  }
}
