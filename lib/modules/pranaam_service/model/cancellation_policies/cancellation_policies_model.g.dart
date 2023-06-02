// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancellation_policies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CancellationPoliciesModel _$$_CancellationPoliciesModelFromJson(
        Map<String, dynamic> json) =>
    _$_CancellationPoliciesModel(
      name: json['name'] ?? '',
      path: json['path'] as String? ?? '',
      elements: (json['elements'] as List<dynamic>?)
              ?.map((e) => Element.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CancellationPoliciesModelToJson(
        _$_CancellationPoliciesModel instance) =>
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
      header: (json['header'] as List<dynamic>?)
              ?.map((e) => Header.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      rows: (json['rows'] as List<dynamic>?)
              ?.map((e) => Row.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_FieldsToJson(_$_Fields instance) => <String, dynamic>{
      'header': instance.header,
      'rows': instance.rows,
    };

_$_Header _$$_HeaderFromJson(Map<String, dynamic> json) => _$_Header(
      title: json['title'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$$_HeaderToJson(_$_Header instance) => <String, dynamic>{
      'title': instance.title,
      'value': instance.value,
    };

_$_Row _$$_RowFromJson(Map<String, dynamic> json) => _$_Row(
      srNo: json['srNo'] as String? ?? '',
      services: json['services'] as String? ?? '',
      charges: json['charges'] as String? ?? '',
    );

Map<String, dynamic> _$$_RowToJson(_$_Row instance) => <String, dynamic>{
      'srNo': instance.srNo,
      'services': instance.services,
      'charges': instance.charges,
    };

_$_Params _$$_ParamsFromJson(Map<String, dynamic> json) => _$_Params();

Map<String, dynamic> _$$_ParamsToJson(_$_Params instance) =>
    <String, dynamic>{};
