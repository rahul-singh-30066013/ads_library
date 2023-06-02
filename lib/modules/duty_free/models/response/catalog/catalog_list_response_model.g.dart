// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CatalogListResponseModel _$$_CatalogListResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_CatalogListResponseModel(
      result: (json['result'] as List<dynamic>?)
              ?.map((e) =>
                  DutyFreeProductDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      count: json['count'] as int? ?? 0,
      similar: (json['similar'] as List<dynamic>?)
              ?.map((e) =>
                  DutyFreeProductDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      soldTogether: (json['soldTogether'] as List<dynamic>?)
              ?.map((e) =>
                  DutyFreeProductDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      exclusive: (json['exclusive'] as List<dynamic>?)
              ?.map((e) =>
                  DutyFreeProductDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      policy: json['policy'] == null
          ? null
          : DutyFreePolicyResponse.fromJson(
              json['policy'] as Map<String, dynamic>),
      store: json['store'] as String? ?? '',
      collectionPoint: json['collectionPoint'] as String? ?? '',
    );

Map<String, dynamic> _$$_CatalogListResponseModelToJson(
        _$_CatalogListResponseModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'count': instance.count,
      'similar': instance.similar,
      'soldTogether': instance.soldTogether,
      'exclusive': instance.exclusive,
      'policy': instance.policy,
      'store': instance.store,
      'collectionPoint': instance.collectionPoint,
    };
