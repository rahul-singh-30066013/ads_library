/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class Line {
  final String? line;
  final List<Links>? links;

  const Line({this.line, this.links});

  @override
  String toString() => 'Line(line: $line, links: $links)';

  factory Line.fromMap(Map<String, dynamic> data) => Line(
        line: data['line'] as String?,
        links: (data['links'] as List<dynamic>?)
            ?.map((e) => Links.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'line': line,
        'links': links,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Line].
  factory Line.fromJson(String data) {
    return Line.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Line] to a JSON string.
  String toJson() => json.encode(toMap());
}

@immutable
class Links {
  final String? link;
  final String? linkText;
  final String? linkURL;

  const Links({this.link, this.linkText, this.linkURL});

  @override
  String toString() =>
      'Links(link: $link, linkText: $linkText,linkURL: $linkURL)';

  factory Links.fromMap(Map<String, dynamic> data) => Links(
        link: data['link'] as String?,
        linkText: data['linkText'] as String?,
        linkURL: data['linkURL'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'link': link,
        'linkText': linkText,
        'linkURL': linkURL,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Line].
  factory Links.fromJson(String data) {
    return Links.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Line] to a JSON string.
  String toJson() => json.encode(toMap());
}
