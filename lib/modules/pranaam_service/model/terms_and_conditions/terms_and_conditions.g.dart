// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_and_conditions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TermsAndConditions _$$_TermsAndConditionsFromJson(
        Map<String, dynamic> json) =>
    _$_TermsAndConditions(
      name: json['name'] ?? '',
      path: json['path'] as String? ?? '',
      elements: (json['elements'] as List<dynamic>?)
              ?.map((e) => Element.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TermsAndConditionsToJson(
        _$_TermsAndConditions instance) =>
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
      contentItems: (json['contentItems'] as List<dynamic>?)
              ?.map((e) => ContentItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_FieldsToJson(_$_Fields instance) => <String, dynamic>{
      'contentItems': instance.contentItems,
    };

_$_ContentItem _$$_ContentItemFromJson(Map<String, dynamic> json) =>
    _$_ContentItem(
      name: json['name'] as String? ?? '',
      title: json['title'] as String? ?? '',
      richText: json['richText'] as String? ?? '',
    );

Map<String, dynamic> _$$_ContentItemToJson(_$_ContentItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'richText': instance.richText,
    };

_$_Params _$$_ParamsFromJson(Map<String, dynamic> json) => _$_Params();

Map<String, dynamic> _$$_ParamsToJson(_$_Params instance) =>
    <String, dynamic>{};
