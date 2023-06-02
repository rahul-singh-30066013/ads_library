// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_feedback_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerFeedbackRequestModel _$$_CustomerFeedbackRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerFeedbackRequestModel(
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      airport: json['airport'] as String? ?? '',
      type: json['type'] as String? ?? '',
      description: json['description'] as String? ?? '',
      mobileNumber: json['mobileNumber'] as String? ?? '',
      countryCode: json['countryCode'] as String? ?? '',
      flightDetails: json['flightDetails'] == null
          ? null
          : FlightDetails.fromJson(
              json['flightDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CustomerFeedbackRequestModelToJson(
        _$_CustomerFeedbackRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'airport': instance.airport,
      'type': instance.type,
      'description': instance.description,
      'mobileNumber': instance.mobileNumber,
      'countryCode': instance.countryCode,
      'flightDetails': instance.flightDetails,
    };

_$_FlightDetails _$$_FlightDetailsFromJson(Map<String, dynamic> json) =>
    _$_FlightDetails(
      flightNumber: json['flightNumber'] as String? ?? '',
      flightDate: json['flightDate'] as String? ?? '',
    );

Map<String, dynamic> _$$_FlightDetailsToJson(_$_FlightDetails instance) =>
    <String, dynamic>{
      'flightNumber': instance.flightNumber,
      'flightDate': instance.flightDate,
    };
