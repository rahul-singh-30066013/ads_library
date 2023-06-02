// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'important_information_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImportantInformationModel _$$_ImportantInformationModelFromJson(
        Map<String, dynamic> json) =>
    _$_ImportantInformationModel(
      name: json['name'] ?? '',
      path: json['path'] as String? ?? '',
      elements: (json['elements'] as List<dynamic>?)
              ?.map((e) => Element.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ImportantInformationModelToJson(
        _$_ImportantInformationModel instance) =>
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
      contentList: (json['contentList'] as List<dynamic>?)
              ?.map((e) => ContentList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_FieldsToJson(_$_Fields instance) => <String, dynamic>{
      'contentList': instance.contentList,
    };

_$_ContentList _$$_ContentListFromJson(Map<String, dynamic> json) =>
    _$_ContentList(
      title: json['title'] as String? ?? '',
      lines: (json['lines'] as List<dynamic>?)
              ?.map((e) => Lines.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ContentListToJson(_$_ContentList instance) =>
    <String, dynamic>{
      'title': instance.title,
      'lines': instance.lines,
    };

_$_Lines _$$_LinesFromJson(Map<String, dynamic> json) => _$_Lines(
      line: json['line'] as String? ?? '',
      links: (json['links'] as List<dynamic>?)
              ?.map((e) => Links.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_LinesToJson(_$_Lines instance) => <String, dynamic>{
      'line': instance.line,
      'links': instance.links,
    };

_$_Links _$$_LinksFromJson(Map<String, dynamic> json) => _$_Links(
      link: json['link'] as String? ?? '',
      linkText: json['linkText'] as String? ?? '',
      linkURL: json['linkURL'] as String? ?? '',
    );

Map<String, dynamic> _$$_LinksToJson(_$_Links instance) => <String, dynamic>{
      'link': instance.link,
      'linkText': instance.linkText,
      'linkURL': instance.linkURL,
    };

_$_Params _$$_ParamsFromJson(Map<String, dynamic> json) => _$_Params();

Map<String, dynamic> _$$_ParamsToJson(_$_Params instance) =>
    <String, dynamic>{};
