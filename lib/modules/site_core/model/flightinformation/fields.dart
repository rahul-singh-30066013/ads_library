/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/modules/site_core/model/flightinformation/content_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class Fields {
  final List<ContentList>? contentList;

  const Fields({this.contentList});

  @override
  String toString() => 'Fields(contentList: $contentList)';

  factory Fields.fromMap(Map<String, dynamic> data) => Fields(
        contentList: (data['contentList'] as List<dynamic>?)
            ?.map((e) => ContentList.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'contentList': contentList?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Fields].
  factory Fields.fromJson(String data) {
    return Fields.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Fields] to a JSON string.
  String toJson() => json.encode(toMap());
}
