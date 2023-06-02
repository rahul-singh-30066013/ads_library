// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_breakup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RefundBreakup _$$_RefundBreakupFromJson(Map<String, dynamic> json) =>
    _$_RefundBreakup(
      bank: (json['bank'] as num?)?.toDouble(),
      loyalty: (json['loyalty'] as num?)?.toDouble(),
      promo: (json['promo'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_RefundBreakupToJson(_$_RefundBreakup instance) =>
    <String, dynamic>{
      'bank': instance.bank,
      'loyalty': instance.loyalty,
      'promo': instance.promo,
    };
