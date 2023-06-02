/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/site_core/model/airline/airline_info.dart';
import 'package:flutter/cupertino.dart';

@immutable
class SiteCoreAirlineFields {
  final List<AirLineInfo>? results;
  final dynamic nameCodeResults;
  final dynamic cancellationPloicy;

  const SiteCoreAirlineFields({
    this.results,
    this.nameCodeResults,
    this.cancellationPloicy,
  });

  @override
  String toString() {
    return 'SiteCoreAirlineFields(results: $results, nameCodeResults: $nameCodeResults, cancellationPloicy: $cancellationPloicy)';
  }

  factory SiteCoreAirlineFields.fromJson(
    Map<String, dynamic> json,
    String? baseUrl,
  ) =>
      SiteCoreAirlineFields(
        results: (json['results'] as List<dynamic>?)
            ?.map(
              (e) => AirLineInfo.fromJson(
                e as Map<String, dynamic>,
                baseUrl,
              ),
            )
            .toList(),
        nameCodeResults: json['nameCodeResults'] as dynamic,
        cancellationPloicy: json['cancellationPloicy'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'results': results?.map((e) => e.toJson()).toList(),
        'nameCodeResults': nameCodeResults,
        'cancellationPloicy': cancellationPloicy,
      };

  SiteCoreAirlineFields copyWith({
    List<AirLineInfo>? results,
    dynamic nameCodeResults,
    dynamic cancellationPloicy,
  }) {
    return SiteCoreAirlineFields(
      results: results ?? this.results,
      nameCodeResults: nameCodeResults ?? this.nameCodeResults,
      cancellationPloicy: cancellationPloicy ?? this.cancellationPloicy,
    );
  }
}
