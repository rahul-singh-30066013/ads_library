/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/site_core/model/airline/site_core_airline_fields.dart';
import 'package:flutter/cupertino.dart';

@immutable
class SiteCoreAirlineResponse {
  final String? uid;
  final String? componentName;
  final String? dataSource;
  final SiteCoreAirlineFields? fields;
  final SiteCoreAirlineParam? params;

  const SiteCoreAirlineResponse({
    this.uid,
    this.componentName,
    this.dataSource,
    this.fields,
    this.params,
  });

  @override
  String toString() {
    return 'Element( fields: $fields params:$params)';
  }

  factory SiteCoreAirlineResponse.fromJson(
    Map<String, dynamic> json,
    String? baseUrl,
  ) =>
      SiteCoreAirlineResponse(
        fields: json['fields'] == null
            ? null
            : SiteCoreAirlineFields.fromJson(
                json['fields'] as Map<String, dynamic>,
                baseUrl,
              ),
        params: json['params'] == null
            ? null
            : SiteCoreAirlineParam.fromJson(
                json['params'] as Map<String, dynamic>,
              ),
      );

  Map<String, dynamic> toJson() => {
        'fields': fields?.toJson(),
      };

  SiteCoreAirlineResponse copyWith({
    SiteCoreAirlineFields? fields,
  }) {
    return SiteCoreAirlineResponse(
      fields: fields ?? this.fields,
    );
  }
}

@immutable
class SiteCoreAirlineParam {
  const SiteCoreAirlineParam({
    this.rewardsText,
    this.appRewardText,
    this.appRewardValue,
    this.internationalRewardValue,
  });

  final String? rewardsText;
  final String? appRewardText;
  final String? appRewardValue;
  final String? internationalRewardValue;

  @override
  String toString() {
    return 'Params(rewardsText: $rewardsText, appRewardText: $appRewardText, appRewardValue: $appRewardValue, internationalRewardValue: $internationalRewardValue)';
  }

  factory SiteCoreAirlineParam.fromJson(Map<String, dynamic> json) =>
      SiteCoreAirlineParam(
        rewardsText: json['rewardsText'] as String?,
        appRewardText: json['appRewardText'] as String?,
        appRewardValue: json['appRewardValue'] as String?,
        internationalRewardValue: json['internationalRewardValue'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'rewardsText': rewardsText,
        'appRewardText': appRewardText,
        'appRewardValue': appRewardValue,
        'internationalRewardValue': internationalRewardValue,
      };

  SiteCoreAirlineParam copyWith({
    String? rewardsText,
    String? appRewardText,
    String? appRewardValue,
    String? internationalRewardValue,
  }) {
    return SiteCoreAirlineParam(
      rewardsText: rewardsText ?? this.rewardsText,
      appRewardText: appRewardText ?? this.appRewardText,
      appRewardValue: appRewardValue ?? this.appRewardValue,
      internationalRewardValue:
          internationalRewardValue ?? this.internationalRewardValue,
    );
  }
}
