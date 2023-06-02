import 'package:freezed_annotation/freezed_annotation.dart';

part 'refund_breakup.freezed.dart';
part 'refund_breakup.g.dart';

@freezed
class RefundBreakup with _$RefundBreakup {
  const factory RefundBreakup({
    double? bank,
    double? loyalty,
    double? promo,
  }) = _RefundBreakup;

  factory RefundBreakup.fromJson(Map<String, dynamic> json) =>
      _$RefundBreakupFromJson(json);
}
