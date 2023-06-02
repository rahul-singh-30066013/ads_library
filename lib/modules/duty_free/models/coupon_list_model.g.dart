// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponListModel _$CouponListModelFromJson(Map<String, dynamic> json) =>
    CouponListModel(
      couponListData: (json['couponListData'] as List<dynamic>)
          .map((e) => CouponListData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CouponListModelToJson(CouponListModel instance) =>
    <String, dynamic>{
      'couponListData': instance.couponListData,
    };

CouponListData _$CouponListDataFromJson(Map<String, dynamic> json) =>
    CouponListData(
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      couponCode: json['couponCode'] as String?,
      couponDescription: json['couponDescription'] as String?,
      couponName: json['couponName'] as String?,
      couponTitle: json['couponTitle'] as String?,
    );

Map<String, dynamic> _$CouponListDataToJson(CouponListData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'couponCode': instance.couponCode,
      'couponDescription': instance.couponDescription,
      'couponName': instance.couponName,
      'couponTitle': instance.couponTitle,
    };
