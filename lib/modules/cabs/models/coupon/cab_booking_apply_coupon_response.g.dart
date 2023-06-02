// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cab_booking_apply_coupon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CabBookingApplyCouponResponse _$$_CabBookingApplyCouponResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CabBookingApplyCouponResponse(
      cartDetail: json['cartDetail'] == null
          ? null
          : CartDetail.fromJson(json['cartDetail'] as Map<String, dynamic>),
      cartID: json['cartID'] as String?,
      currencyCode: json['currencyCode'] as String?,
    );

Map<String, dynamic> _$$_CabBookingApplyCouponResponseToJson(
        _$_CabBookingApplyCouponResponse instance) =>
    <String, dynamic>{
      'cartDetail': instance.cartDetail,
      'cartID': instance.cartID,
      'currencyCode': instance.currencyCode,
    };
