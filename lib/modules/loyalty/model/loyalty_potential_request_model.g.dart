// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_potential_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoyaltyPotentialRequestModel _$$_LoyaltyPotentialRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_LoyaltyPotentialRequestModel(
      businessSubType: json['businessSubType'] as String?,
      promoCode: json['promoCode'] as String?,
      nonLoyaltyPaymentAmount: json['nonLoyaltyPaymentAmount'] as num?,
      taxableAmount: json['taxableAmount'] as num?,
      grossAmount: json['grossAmount'] as num?,
      saleItems: (json['saleItems'] as List<dynamic>?)
          ?.map((e) => SaleItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      additionalFilters: json['additionalFilters'] == null
          ? null
          : AdditionalFilters.fromJson(
              json['additionalFilters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LoyaltyPotentialRequestModelToJson(
        _$_LoyaltyPotentialRequestModel instance) =>
    <String, dynamic>{
      'businessSubType': instance.businessSubType,
      'promoCode': instance.promoCode,
      'nonLoyaltyPaymentAmount': instance.nonLoyaltyPaymentAmount,
      'taxableAmount': instance.taxableAmount,
      'grossAmount': instance.grossAmount,
      'saleItems': instance.saleItems,
      'additionalFilters': instance.additionalFilters,
    };

_$_SaleItem _$$_SaleItemFromJson(Map<String, dynamic> json) => _$_SaleItem(
      productCode: json['productCode'] as String?,
      quantity: json['quantity'] as int?,
      unitPrice: json['unitPrice'] as num?,
    );

Map<String, dynamic> _$$_SaleItemToJson(_$_SaleItem instance) =>
    <String, dynamic>{
      'productCode': instance.productCode,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
    };

_$_AdditionalFilters _$$_AdditionalFiltersFromJson(Map<String, dynamic> json) =>
    _$_AdditionalFilters(
      isInternational: json['isInternational'] as bool?,
    );

Map<String, dynamic> _$$_AdditionalFiltersToJson(
        _$_AdditionalFilters instance) =>
    <String, dynamic>{
      'isInternational': instance.isInternational,
    };
