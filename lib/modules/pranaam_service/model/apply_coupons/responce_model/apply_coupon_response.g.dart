// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_coupon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApplyCouponResponse _$$_ApplyCouponResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ApplyCouponResponse(
      coupons: (json['coupons'] as List<dynamic>?)
              ?.map((e) => Coupon.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ApplyCouponResponseToJson(
        _$_ApplyCouponResponse instance) =>
    <String, dynamic>{
      'coupons': instance.coupons,
    };

_$_Coupon _$$_CouponFromJson(Map<String, dynamic> json) => _$_Coupon(
      id: json['id'] as int? ?? 0,
      originAirportId: json['originAirportId'] as int? ?? 0,
      couponCode: json['couponCode'] as String? ?? '',
      couponTypeId: json['couponTypeId'] as int? ?? 0,
      promoTermsAndCondition: json['promoTermsAndCondition'] as String? ?? '',
      promoName: json['promoName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      bookingEndDate: json['bookingEndDate'] as String? ?? '',
      discountValue: json['discountValue'] as num? ?? 0,
      maxDiscountAmount: json['maxDiscountAmount'] as num? ?? 0,
      minimumBillingAmount: json['minimumBillingAmount'] as num? ?? 0,
      isActive: json['isActive'] as bool? ?? false,
      isSelected: json['isSelected'] as bool? ?? false,
      isMerchantFunded: json['isMerchantFunded'] as bool? ?? false,
      pcmPercentage: json['pcmPercentage'] as num? ?? 0,
      pcmPromoImgUrl: json['pcmPromoImgUrl'] as String? ?? '',
      recommendations: json['recommendations'] == null
          ? const Recommendations()
          : Recommendations.fromJson(
              json['recommendations'] as Map<String, dynamic>),
      eligible: json['eligible'] as bool? ?? false,
    );

Map<String, dynamic> _$$_CouponToJson(_$_Coupon instance) => <String, dynamic>{
      'id': instance.id,
      'originAirportId': instance.originAirportId,
      'couponCode': instance.couponCode,
      'couponTypeId': instance.couponTypeId,
      'promoTermsAndCondition': instance.promoTermsAndCondition,
      'promoName': instance.promoName,
      'description': instance.description,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'bookingEndDate': instance.bookingEndDate,
      'discountValue': instance.discountValue,
      'maxDiscountAmount': instance.maxDiscountAmount,
      'minimumBillingAmount': instance.minimumBillingAmount,
      'isActive': instance.isActive,
      'isSelected': instance.isSelected,
      'isMerchantFunded': instance.isMerchantFunded,
      'pcmPercentage': instance.pcmPercentage,
      'pcmPromoImgUrl': instance.pcmPromoImgUrl,
      'recommendations': instance.recommendations,
      'eligible': instance.eligible,
    };

_$_Recommendations _$$_RecommendationsFromJson(Map<String, dynamic> json) =>
    _$_Recommendations(
      amount: json['amount'] as String? ?? '',
    );

Map<String, dynamic> _$$_RecommendationsToJson(_$_Recommendations instance) =>
    <String, dynamic>{
      'amount': instance.amount,
    };
