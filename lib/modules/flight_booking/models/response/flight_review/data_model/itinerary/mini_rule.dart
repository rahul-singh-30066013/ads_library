/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class will used to receive mini rule object from response

class MiniRule {
  MiniRule({
    bool? isRefundable,
    String? note,
    CleartripCharges? cleartripCharges,
    AirlineCharges? airlineCharges,
    DPlusX? dPlusX,
  }) {
    _isRefundable = isRefundable;
    _note = note;
    _cleartripCharges = cleartripCharges;
    _airlineCharges = airlineCharges;
    _dPlusX = dPlusX;
  }

  MiniRule.fromJson(Map<String, dynamic> json) {
    _isRefundable = json['isRefundable'];
    _note = json['note'];
    _cleartripCharges = json['cleartripCharges'] != null
        ? CleartripCharges.fromJson(json['cleartripCharges'])
        : null;
    _airlineCharges = json['airlineCharges'] != null
        ? AirlineCharges.fromJson(json['airlineCharges'])
        : null;
    _dPlusX = json['dPlusX'] != null ? DPlusX.fromJson(json['dPlusX']) : null;
  }
  bool? _isRefundable;
  String? _note;
  CleartripCharges? _cleartripCharges;
  AirlineCharges? _airlineCharges;
  DPlusX? _dPlusX;

  bool? get isRefundable => _isRefundable;
  String? get note => _note;
  CleartripCharges? get cleartripCharges => _cleartripCharges;
  AirlineCharges? get airlineCharges => _airlineCharges;
  DPlusX? get dPlusX => _dPlusX;

  /* Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isRefundable'] = _isRefundable;
    map['note'] = _note;
    if (_cleartripCharges != null) {
      map['cleartripCharges'] = _cleartripCharges?.toJson();
    }
    if (_airlineCharges != null) {
      map['airlineCharges'] = _airlineCharges?.toJson();
    }
    if (_dPlusX != null) {
      map['dPlusX'] = _dPlusX?.toJson();
    }
    return map;
  }*/
}

/// cancel : null
/// amend : null
/// dPlusXNote : null

class DPlusX {
  DPlusX({
    List<Cancel>? cancel,
    // String? amend,
    String? dPlusXNote,
  }) {
    _cancel = cancel;
    // _amend = amend;
    _dPlusXNote = dPlusXNote;
  }

  DPlusX.fromJson(Map<String, dynamic> json) {
    if (json['cancel'] != null) {
      _cancel = [];
      for (final object in json['cancel'] as List) {
        final Cancel cancelItem = Cancel.fromJson(object);
        _cancel?.add(cancelItem);
      }
    }
    // _amend = json['amend'];
    _dPlusXNote = json['dPlusXNote'];
  }
  List<Cancel>? _cancel;
  // String? _amend;
  String? _dPlusXNote;

  List<Cancel>? get cancel => _cancel;
  // String? get amend => _amend;
  String? get dPlusXNote => _dPlusXNote;
/*
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cancel'] = _cancel;
    map['amend'] = _amend;
    map['dPlusXNote'] = _dPlusXNote;
    return map;
  }*/
}

/// cancel : 9140
/// amend : 9140

class AirlineCharges {
  AirlineCharges({
    num? cancel,
    num? amend,
  }) {
    _cancel = cancel?.toDouble();
    _amend = amend?.toDouble();
  }

  AirlineCharges.fromJson(Map<String, dynamic> json) {
    _cancel = (json['cancel'] as num?)?.toDouble();
    _amend = (json['amend'] as num?)?.toDouble();
  }
  double? _cancel;
  double? _amend;

  double? get cancel => _cancel;
  double? get amend => _amend;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cancel'] = _cancel;
    map['amend'] = _amend;
    return map;
  }
}

/// cancel : 300
/// amend : 300

class CleartripCharges {
  CleartripCharges({
    num? cancel,
    num? amend,
  }) {
    _cancel = cancel?.toDouble();
    _amend = amend?.toDouble();
  }

  CleartripCharges.fromJson(Map<String, dynamic> json) {
    _cancel = (json['cancel'] as num?)?.toDouble();
    _amend = (json['amend'] as num?)?.toDouble();
  }
  double? _cancel;
  double? _amend;

  double? get cancel => _cancel;
  double? get amend => _amend;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cancel'] = _cancel;
    map['amend'] = _amend;
    return map;
  }
}

class Cancel {
  Cancel({
    num? amount,
    String? range,
  }) {
    _amount = amount?.toDouble();
    _range = range;
  }

  Cancel.fromJson(Map<String, dynamic> json) {
    _amount = (json['amount'] as num?)?.toDouble();
    _range = json['range'];
  }
  double? _amount;
  String? _range;

  double? get amount => _amount;
  String? get range => _range;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = _amount;
    map['range'] = _range;
    return map;
  }
}
