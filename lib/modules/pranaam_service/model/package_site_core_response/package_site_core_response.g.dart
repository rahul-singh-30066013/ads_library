// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_site_core_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PackageSiteCoreResponse _$$_PackageSiteCoreResponseFromJson(
        Map<String, dynamic> json) =>
    _$_PackageSiteCoreResponse(
      name: json['name'] as String? ?? '',
      path: json['path'] as String? ?? '',
      elements: (json['elements'] as List<dynamic>?)
              ?.map((e) => Element.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_PackageSiteCoreResponseToJson(
        _$_PackageSiteCoreResponse instance) =>
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
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => PackageData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_FieldsToJson(_$_Fields instance) => <String, dynamic>{
      'data': instance.data,
    };

_$_PackageData _$$_PackageDataFromJson(Map<String, dynamic> json) =>
    _$_PackageData(
      packageId: json['packageId'] as String? ?? '',
      packageName: json['packageName'] as String? ?? '',
      isRecommended: json['isRecommended'] as bool? ?? false,
      servicesList: (json['servicesList'] as List<dynamic>?)
              ?.map((e) => ServicesList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_PackageDataToJson(_$_PackageData instance) =>
    <String, dynamic>{
      'packageId': instance.packageId,
      'packageName': instance.packageName,
      'isRecommended': instance.isRecommended,
      'servicesList': instance.servicesList,
    };

_$_ServicesList _$$_ServicesListFromJson(Map<String, dynamic> json) =>
    _$_ServicesList(
      name: json['name'] as String? ?? '',
      value: json['value'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ServicesListToJson(_$_ServicesList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

_$_Params _$$_ParamsFromJson(Map<String, dynamic> json) => _$_Params(
      rewardsText: json['rewardsText'] as String? ?? '',
    );

Map<String, dynamic> _$$_ParamsToJson(_$_Params instance) => <String, dynamic>{
      'rewardsText': instance.rewardsText,
    };
