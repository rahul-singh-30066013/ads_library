/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/modules/site_core/model/flightinformation/line.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class ContentList {
  final String? title;
  final List<Line>? lines;

  const ContentList({this.title, this.lines});

  @override
  String toString() => 'ContentList(title: $title, lines: $lines)';

  factory ContentList.fromMap(Map<String, dynamic> data) => ContentList(
        title: data['title'] as String?,
        lines: (data['lines'] as List<dynamic>?)
            ?.map((e) => Line.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'lines': lines?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ContentList].
  factory ContentList.fromJson(String data) {
    return ContentList.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ContentList] to a JSON string.
  String toJson() => json.encode(toMap());
}
