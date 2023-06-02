// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_coupon_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApplyCouponRequest _$$_ApplyCouponRequestFromJson(
        Map<String, dynamic> json) =>
    _$_ApplyCouponRequest(
      json['itineraryId'] as String,
      json['promoCode'] as String,
      isCCFRequired: json['isCCFRequired'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ApplyCouponRequestToJson(
        _$_ApplyCouponRequest instance) =>
    <String, dynamic>{
      'itineraryId': instance.itineraryId,
      'promoCode': instance.promoCode,
      'isCCFRequired': instance.isCCFRequired,
    };
