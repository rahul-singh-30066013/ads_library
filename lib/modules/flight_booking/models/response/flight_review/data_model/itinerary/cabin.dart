/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class is used to receive cabin object

class Cabin {
  Cabin({
    this.name,
    this.code,
  });

  final String? name;
  final String? code;
  Cabin copyWith({
    String? name,
    String? code,
  }) =>
      Cabin(
        name: name ?? this.name,
        code: code ?? this.code,
      );
  factory Cabin.fromJson(Map<String, dynamic> json) => Cabin(
        name: json['name'],
        code: json['code'],
      );
}
