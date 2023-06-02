// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CityListModel _$$_CityListModelFromJson(Map<String, dynamic> json) =>
    _$_CityListModel(
      name: json['name'] ?? '',
      path: json['path'] as String? ?? '',
      elements: (json['elements'] as List<dynamic>?)
              ?.map((e) => Element.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CityListModelToJson(_$_CityListModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'elements': instance.elements,
    };

_$_Element _$$_ElementFromJson(Map<String, dynamic> json) => _$_Element(
      uid: json['uid'] as String? ?? '',
      componentName: json['componentName'] as String? ?? '',
      dataSource: json['dataSource'] as String? ?? '',
      params: json['params'] == null
          ? const Params()
          : Params.fromJson(json['params'] as Map<String, dynamic>),
      fields: json['fields'] == null
          ? const Fields()
          : Fields.fromJson(json['fields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ElementToJson(_$_Element instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'componentName': instance.componentName,
      'dataSource': instance.dataSource,
      'params': instance.params,
      'fields': instance.fields,
    };

_$_Fields _$$_FieldsFromJson(Map<String, dynamic> json) => _$_Fields(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_FieldsToJson(_$_Fields instance) => <String, dynamic>{
      'results': instance.results,
    };

_$_Result _$$_ResultFromJson(Map<String, dynamic> json) => _$_Result(
      stateMasterId: json['stateMasterId'] as String? ?? '',
      stateImportId: json['stateImportId'] as String? ?? '',
      id: json['id'] as String? ?? '',
      resultImport: json['resultImport'] as String? ?? '',
      name: json['name'] as String? ?? '',
      countryMaster: json['countryMaster'] as String? ?? '',
      countryCode: json['countryCode'] as String? ?? '',
      stateCode: json['stateCode'] as String? ?? '',
      latitude: json['latitude'] as String? ?? '',
      longitude: json['longitude'] as String? ?? '',
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'stateMasterId': instance.stateMasterId,
      'stateImportId': instance.stateImportId,
      'id': instance.id,
      'resultImport': instance.resultImport,
      'name': instance.name,
      'countryMaster': instance.countryMaster,
      'countryCode': instance.countryCode,
      'stateCode': instance.stateCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$_Params _$$_ParamsFromJson(Map<String, dynamic> json) => _$_Params();

Map<String, dynamic> _$$_ParamsToJson(_$_Params instance) =>
    <String, dynamic>{};
