// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeCartResponse _$$_DutyFreeCartResponseFromJson(
        Map<String, dynamic> json) =>
    _$_DutyFreeCartResponse(
      id: json['id'] as String? ?? '0',
      customerId: json['customerId'] as String? ?? '',
      airportCode: json['airportCode'] as String? ?? '',
      itemDetails: (json['itemDetails'] as List<dynamic>?)
              ?.map(
                  (e) => ItemDetailResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      passengerDetail: (json['passengerDetail'] as List<dynamic>?)
              ?.map((e) =>
                  PassengerDetailsResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalAmount: json['totalAmount'] == null
          ? null
          : PriceDetailResponse.fromJson(
              json['totalAmount'] as Map<String, dynamic>),
      finalAmount: json['finalAmount'] == null
          ? null
          : PriceDetailResponse.fromJson(
              json['finalAmount'] as Map<String, dynamic>),
      preOrderDiscount: json['preOrderDiscount'] == null
          ? null
          : PriceDetailResponse.fromJson(
              json['preOrderDiscount'] as Map<String, dynamic>),
      unitPriceResponse: json['unitPriceResponse'] == null
          ? null
          : PriceDetailResponse.fromJson(
              json['unitPriceResponse'] as Map<String, dynamic>),
      discountPrice: json['discountPrice'] == null
          ? null
          : PriceDetailResponse.fromJson(
              json['discountPrice'] as Map<String, dynamic>),
      promoCoupon: json['promoCoupon'] == null
          ? null
          : PromoCodeResponse.fromJson(
              json['promoCoupon'] as Map<String, dynamic>),
      loyaltyPotentialPoint: json['loyaltyPotentialPoint'] as num? ?? 0,
      collectionPoint: json['collectionPoint'] as String? ?? '',
      store: json['store'] as String? ?? '',
      totalDiscountedPrice: json['totalDiscountedPrice'] as num? ?? 0,
      totalUnitPrice: json['totalUnitPrice'] as num? ?? 0,
      preOrderDiscountBreakup: (json['preOrderDiscountBreakup']
                  as List<dynamic>?)
              ?.map((e) =>
                  PreOrderDiscountBreakup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_DutyFreeCartResponseToJson(
        _$_DutyFreeCartResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'airportCode': instance.airportCode,
      'itemDetails': instance.itemDetails,
      'passengerDetail': instance.passengerDetail,
      'totalAmount': instance.totalAmount,
      'finalAmount': instance.finalAmount,
      'preOrderDiscount': instance.preOrderDiscount,
      'unitPriceResponse': instance.unitPriceResponse,
      'discountPrice': instance.discountPrice,
      'promoCoupon': instance.promoCoupon,
      'loyaltyPotentialPoint': instance.loyaltyPotentialPoint,
      'collectionPoint': instance.collectionPoint,
      'store': instance.store,
      'totalDiscountedPrice': instance.totalDiscountedPrice,
      'totalUnitPrice': instance.totalUnitPrice,
      'preOrderDiscountBreakup': instance.preOrderDiscountBreakup,
    };
