/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this model class is used for CancelReason, that will reference from flight booking cancel
class CancelReason {
  CancelReason({
    String? name,
    String? code,
  }) {
    _name = name;
    _code = code;
  }

  CancelReason.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _code = json['code'];
  }
  String? _name;
  String? _code;

  String? get name => _name;
  String? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['code'] = _code;
    return map;
  }
}
