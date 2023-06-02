// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoyaltyBalanceModel _$$_LoyaltyBalanceModelFromJson(
        Map<String, dynamic> json) =>
    _$_LoyaltyBalanceModel(
      availableBalancePoints: json['availableBalancePoints'] as int? ?? 0,
      totalPendingPoints: json['totalPendingPoints'] as int? ?? 0,
      lifetimeEarnedPoints: json['lifetimeEarnedPoints'] as int? ?? 0,
      lifetimeBurnedPoints: json['lifetimeBurnedPoints'] as int? ?? 0,
      lifetimeGtv: json['lifetimeGtv'] as num? ?? 0,
    );

Map<String, dynamic> _$$_LoyaltyBalanceModelToJson(
        _$_LoyaltyBalanceModel instance) =>
    <String, dynamic>{
      'availableBalancePoints': instance.availableBalancePoints,
      'totalPendingPoints': instance.totalPendingPoints,
      'lifetimeEarnedPoints': instance.lifetimeEarnedPoints,
      'lifetimeBurnedPoints': instance.lifetimeBurnedPoints,
      'lifetimeGtv': instance.lifetimeGtv,
    };
