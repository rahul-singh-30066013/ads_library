import 'package:flutter/cupertino.dart';

@immutable
class ZeroCancellationSummary {
  final bool? isActive;
  final num? baseAmt;
  final num? discountAmt;
  final num? perPaxAmt;
  final num? perPaxDisAmt;
  final num? netAmt;
  final num? netTax;
  final String? directionInd;
  final num? total;

  const ZeroCancellationSummary({
    this.isActive,
    this.baseAmt,
    this.discountAmt,
    this.perPaxAmt,
    this.perPaxDisAmt,
    this.netAmt,
    this.netTax,
    this.directionInd,
    this.total,
  });

  @override
  String toString() {
    return 'ZeroCancellationSummary(isActive: $isActive, baseAmt: $baseAmt, discountAmt: $discountAmt, perPaxAmt: $perPaxAmt, perPaxDisAmt: $perPaxDisAmt, netAmt: $netAmt, netTax: $netTax, directionInd: $directionInd,total: $total)';
  }

  factory ZeroCancellationSummary.fromJson(Map<String, dynamic> json) {
    return ZeroCancellationSummary(
      isActive: json['isActive'] as bool?,
      baseAmt: json['baseAmt'] as num?,
      discountAmt: json['discountAmt'] as num?,
      perPaxAmt: json['perPaxAmt'] as num?,
      perPaxDisAmt: json['perPaxDisAmt'] as num?,
      netAmt: json['netAmt'] as num?,
      netTax: json['netTax'] as num?,
      directionInd: json['directionInd'] as String?,
      total: json['total'] as num?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (isActive != null) {
      map['isActive'] = isActive;
    }
    if (baseAmt != null) {
      map['baseAmt'] = baseAmt;
    }
    if (discountAmt != null) {
      map['discountAmt'] = discountAmt;
    }
    if (perPaxAmt != null) {
      map['perPaxAmt'] = perPaxAmt;
    }
    if (perPaxDisAmt != null) {
      map['perPaxDisAmt'] = perPaxDisAmt;
    }
    if (netAmt != null) {
      map['netAmt'] = netAmt;
    }
    if (netTax != null) {
      map['netTax'] = netTax;
    }
    if (directionInd != null) {
      map['directionInd'] = directionInd;
    }
    if (total != null) {
      map['total'] = total;
    }
    return map;
  }

  ZeroCancellationSummary copyWith({
    bool? isActive,
    num? baseAmt,
    num? discountAmt,
    num? perPaxAmt,
    num? perPaxDisAmt,
    num? netAmt,
    num? netTax,
    String? directionInd,
    num? total,
  }) {
    return ZeroCancellationSummary(
      isActive: isActive ?? this.isActive,
      baseAmt: baseAmt ?? this.baseAmt,
      discountAmt: discountAmt ?? this.discountAmt,
      perPaxAmt: perPaxAmt ?? this.perPaxAmt,
      perPaxDisAmt: perPaxDisAmt ?? this.perPaxDisAmt,
      netAmt: netAmt ?? this.netAmt,
      netTax: netTax ?? this.netTax,
      directionInd: directionInd ?? this.directionInd,
      total: total ?? this.total,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) {
      return true;
    }
    return other is ZeroCancellationSummary &&
        other.isActive == isActive &&
        other.baseAmt == baseAmt &&
        other.discountAmt == discountAmt &&
        other.perPaxAmt == perPaxAmt &&
        other.perPaxDisAmt == perPaxDisAmt &&
        other.netAmt == netAmt &&
        other.netTax == netTax &&
        other.directionInd == directionInd &&
        other.total == total;
  }

  @override
  int get hashCode =>
      isActive.hashCode ^
      baseAmt.hashCode ^
      discountAmt.hashCode ^
      perPaxAmt.hashCode ^
      perPaxDisAmt.hashCode ^
      netAmt.hashCode ^
      netTax.hashCode ^
      directionInd.hashCode ^
      total.hashCode;
}
