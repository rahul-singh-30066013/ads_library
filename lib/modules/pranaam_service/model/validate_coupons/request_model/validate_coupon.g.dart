// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ValidateCoupon _$$_ValidateCouponFromJson(Map<String, dynamic> json) =>
    _$_ValidateCoupon(
      userId: json['userId'] as String,
      packageId: json['packageId'] as int,
      couponId: json['couponId'] as int,
      couponCode: json['couponCode'] as String,
      adultCount: json['adultCount'] as int,
      childCount: json['childCount'] as int,
      infantCount: json['infantCount'] as int,
      inputLanguage: json['inputLanguage'] as String,
      isMerchantFunded: json['isMerchantFunded'] as bool? ?? false,
      pcmPercentage: json['pcmPercentage'] as num? ?? 0,
    );

Map<String, dynamic> _$$_ValidateCouponToJson(_$_ValidateCoupon instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'packageId': instance.packageId,
      'couponId': instance.couponId,
      'couponCode': instance.couponCode,
      'adultCount': instance.adultCount,
      'childCount': instance.childCount,
      'infantCount': instance.infantCount,
      'inputLanguage': instance.inputLanguage,
      'isMerchantFunded': instance.isMerchantFunded,
      'pcmPercentage': instance.pcmPercentage,
    };
