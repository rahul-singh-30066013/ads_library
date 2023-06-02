// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_get_coupon_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeGetCouponRequest _$$_DutyFreeGetCouponRequestFromJson(
        Map<String, dynamic> json) =>
    _$_DutyFreeGetCouponRequest(
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      skuItemList: (json['skuItemList'] as List<dynamic>?)
              ?.map((e) => SKUItemRequest.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_DutyFreeGetCouponRequestToJson(
        _$_DutyFreeGetCouponRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'skuItemList': instance.skuItemList,
    };

_$_SKUItemRequest _$$_SKUItemRequestFromJson(Map<String, dynamic> json) =>
    _$_SKUItemRequest(
      json['promoSkuCode'] as String?,
      json['promoSkuCategoryCode'] as String?,
      json['promoSkuBrandCode'] as String?,
      json['promoSkuQty'] as int?,
      json['promoSkuPrice'] as String?,
    );

Map<String, dynamic> _$$_SKUItemRequestToJson(_$_SKUItemRequest instance) =>
    <String, dynamic>{
      'promoSkuCode': instance.promoSkuCode,
      'promoSkuCategoryCode': instance.promoSkuCategoryCode,
      'promoSkuBrandCode': instance.promoSkuBrandCode,
      'promoSkuQty': instance.promoSkuQty,
      'promoSkuPrice': instance.promoSkuPrice,
    };
