/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/modules/site_core/model/flightinformation/fields.dart';
import 'package:adani_airport_mobile/modules/site_core/model/flightinformation/params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class ImportantInfo {
  final String? uid;
  final String? componentName;
  final String? dataSource;
  final Params? params;
  final Fields? fields;

  const ImportantInfo({
    this.uid,
    this.componentName,
    this.dataSource,
    this.params,
    this.fields,
  });

  @override
  String toString() {
    return 'ImportantInfo(uid: $uid, componentName: $componentName, dataSource: $dataSource, params: $params, fields: $fields)';
  }

  factory ImportantInfo.fromMap(Map<String, dynamic> data) => ImportantInfo(
        uid: data['uid'] as String?,
        componentName: data['componentName'] as String?,
        dataSource: data['dataSource'] as String?,
        params: data['params'] == null
            ? null
            : Params.fromMap(data['params'] as Map<String, dynamic>),
        fields: data['fields'] == null
            ? null
            : Fields.fromMap(data['fields'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'componentName': componentName,
        'dataSource': dataSource,
        'params': params?.toMap(),
        'fields': fields?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ImportantInfo].
  factory ImportantInfo.fromJson(String data) {
    return ImportantInfo.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ImportantInfo] to a JSON string.
  String toJson() => json.encode(toMap());
}
