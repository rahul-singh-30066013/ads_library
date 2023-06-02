// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_packages_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetPackagesResponseModel _$$_GetPackagesResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_GetPackagesResponseModel(
      data: json['data'] == null
          ? const Data()
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool? ?? false,
      warning: json['warning'] == null
          ? const Error()
          : Error.fromJson(json['warning'] as Map<String, dynamic>),
      error: json['error'] == null
          ? const Error()
          : Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GetPackagesResponseModelToJson(
        _$_GetPackagesResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'warning': instance.warning,
      'error': instance.error,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      packageDetails: (json['packageDetails'] as List<dynamic>?)
              ?.map((e) => PackageDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      loyaltyPercentage: json['loyaltyPercentage'] as String? ?? '',
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'packageDetails': instance.packageDetails,
      'loyaltyPercentage': instance.loyaltyPercentage,
    };

_$_Error _$$_ErrorFromJson(Map<String, dynamic> json) => _$_Error(
      statusCode: json['statusCode'] as int? ?? 0,
      code: json['code'] as String? ?? '',
      description: json['description'] as String? ?? '',
      source: json['source'] as String? ?? '',
    );

Map<String, dynamic> _$$_ErrorToJson(_$_Error instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'code': instance.code,
      'description': instance.description,
      'source': instance.source,
    };
