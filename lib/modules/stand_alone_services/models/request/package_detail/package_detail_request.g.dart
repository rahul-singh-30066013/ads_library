// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_detail_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PackageDetailRequest _$$_PackageDetailRequestFromJson(
        Map<String, dynamic> json) =>
    _$_PackageDetailRequest(
      travelSectorId: json['travelSectorId'] as int,
      serviceTypeId: json['serviceTypeId'] as int,
      serviceAirport: json['serviceAirport'] as String,
      standaloneProductType: json['standaloneProductType'] as int,
      itemCount: json['itemCount'] as int,
    );

Map<String, dynamic> _$$_PackageDetailRequestToJson(
        _$_PackageDetailRequest instance) =>
    <String, dynamic>{
      'travelSectorId': instance.travelSectorId,
      'serviceTypeId': instance.serviceTypeId,
      'serviceAirport': instance.serviceAirport,
      'standaloneProductType': instance.standaloneProductType,
      'itemCount': instance.itemCount,
    };
