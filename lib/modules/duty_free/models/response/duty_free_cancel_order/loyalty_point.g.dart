// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoyaltyPoint _$$_LoyaltyPointFromJson(Map<String, dynamic> json) =>
    _$_LoyaltyPoint(
      pendingRewardPoints: json['pendingRewardPoints'] as num? ?? 0,
      earnedRewardPoints: json['earnedRewardPoints'] as num? ?? 0,
      burnedRewardPoints: json['burnedRewardPoints'] as num? ?? 0,
    );

Map<String, dynamic> _$$_LoyaltyPointToJson(_$_LoyaltyPoint instance) =>
    <String, dynamic>{
      'pendingRewardPoints': instance.pendingRewardPoints,
      'earnedRewardPoints': instance.earnedRewardPoints,
      'burnedRewardPoints': instance.burnedRewardPoints,
    };
