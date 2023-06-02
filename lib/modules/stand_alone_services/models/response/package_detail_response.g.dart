// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PackageDetailResponse _$$_PackageDetailResponseFromJson(
        Map<String, dynamic> json) =>
    _$_PackageDetailResponse(
      standAloneProducts: (json['standAloneProducts'] as List<dynamic>?)
              ?.map(
                  (e) => StandAloneProduct.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_PackageDetailResponseToJson(
        _$_PackageDetailResponse instance) =>
    <String, dynamic>{
      'standAloneProducts': instance.standAloneProducts,
    };

_$_StandAloneProduct _$$_StandAloneProductFromJson(Map<String, dynamic> json) =>
    _$_StandAloneProduct(
      id: json['id'] as int?,
      name: json['name'] as String?,
      travelSectorId: json['travelSectorId'] as int?,
      serviceTypeId: json['serviceTypeId'] as int?,
      airportMasterId: json['airportMasterId'] as int?,
      description: json['description'] as String?,
      pricingInfo: json['pricingInfo'] == null
          ? const PricingInfo()
          : PricingInfo.fromJson(json['pricingInfo'] as Map<String, dynamic>),
      count: json['count'] as int?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$_StandAloneProductToJson(
        _$_StandAloneProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'travelSectorId': instance.travelSectorId,
      'serviceTypeId': instance.serviceTypeId,
      'airportMasterId': instance.airportMasterId,
      'description': instance.description,
      'pricingInfo': instance.pricingInfo,
      'count': instance.count,
      'imageUrl': instance.imageUrl,
    };
