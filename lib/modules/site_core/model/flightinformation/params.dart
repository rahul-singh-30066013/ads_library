/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

class Params {
  final String? name;

  const Params({this.name});

  @override
  String toString() => 'ContentList(title: $name)';

  factory Params.fromMap(Map<String, dynamic> data) => Params(
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
      };

  /// `dart:convert`
  ///
  factory Params.fromJson(String data) {
    return Params.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  String toJson() => json.encode(toMap());
}
