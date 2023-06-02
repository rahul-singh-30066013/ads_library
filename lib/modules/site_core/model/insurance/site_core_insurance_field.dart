import 'package:adani_airport_mobile/modules/site_core/model/insurance/travel_insurance_field.dart';
import 'package:adani_airport_mobile/modules/site_core/model/insurance/zero_cancellation_field.dart';
import 'package:flutter/cupertino.dart';

@immutable
class SiteCoreInsuranceField {
  final TravelInsuranceField? travelInsuranceDetails;
  final ZeroCancellationField? zeroCancellationDetails;

  const SiteCoreInsuranceField({
    this.travelInsuranceDetails,
    this.zeroCancellationDetails,
  });

  factory SiteCoreInsuranceField.fromJson(Map<String, dynamic> json) =>
      SiteCoreInsuranceField(
        travelInsuranceDetails: json['travelInsuranceDetails'] == null
            ? null
            : TravelInsuranceField.fromJson(
                json['travelInsuranceDetails'] as Map<String, dynamic>,
              ),
        zeroCancellationDetails: json['zeroCancellationDetails'] == null
            ? null
            : ZeroCancellationField.fromJson(
                json['zeroCancellationDetails'] as Map<String, dynamic>,
              ),
      );

  Map<String, dynamic> toJson() => {
        'travelInsuranceDetails': travelInsuranceDetails?.toJson(),
        'zeroCancellationDetails': zeroCancellationDetails?.toJson(),
      };

  SiteCoreInsuranceField copyWith({
    final TravelInsuranceField? travelInsuranceDetails,
    final ZeroCancellationField? zeroCancellationDetails,
  }) {
    return SiteCoreInsuranceField(
      travelInsuranceDetails:
          travelInsuranceDetails ?? this.travelInsuranceDetails,
      zeroCancellationDetails:
          zeroCancellationDetails ?? this.zeroCancellationDetails,
    );
  }
}
