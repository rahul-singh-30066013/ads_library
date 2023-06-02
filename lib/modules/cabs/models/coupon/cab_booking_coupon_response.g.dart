// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cab_booking_coupon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CabBookingCouponResponse _$$_CabBookingCouponResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CabBookingCouponResponse(
      (json['promoDetails'] as List<dynamic>)
          .map((e) => CabBookingCoupon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CabBookingCouponResponseToJson(
        _$_CabBookingCouponResponse instance) =>
    <String, dynamic>{
      'promoDetails': instance.promoDetails,
    };

_$_CabBookingCoupon _$$_CabBookingCouponFromJson(Map<String, dynamic> json) =>
    _$_CabBookingCoupon(
      promoId: json['promoId'] as int? ?? 0,
      promoName: json['promoName'] as String? ?? '',
      promoDescription: json['promoDescription'] as String? ?? '',
      promoStatus: json['promoStatus'] as String? ?? '',
      promoStaticPromoCode: json['promoStaticPromoCode'] as String? ?? '',
      pcmPercentage: json['pcmPercentage'] as num? ?? 0,
      promoTermsAndCondition: json['promoTermsAndCondition'] as String? ?? '',
      eligible: json['eligible'] as bool? ?? false,
      pcmPromoImgUrl: json['pcmPromoImgUrl'] as String? ?? '',
      promoExpiryDate: json['promoExpiryDate'] as String? ?? '',
      isSelected: json['isSelected'] as bool? ?? false,
      recommendations: json['recommendations'] == null
          ? const Recommendations()
          : Recommendations.fromJson(
              json['recommendations'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CabBookingCouponToJson(_$_CabBookingCoupon instance) =>
    <String, dynamic>{
      'promoId': instance.promoId,
      'promoName': instance.promoName,
      'promoDescription': instance.promoDescription,
      'promoStatus': instance.promoStatus,
      'promoStaticPromoCode': instance.promoStaticPromoCode,
      'pcmPercentage': instance.pcmPercentage,
      'promoTermsAndCondition': instance.promoTermsAndCondition,
      'eligible': instance.eligible,
      'pcmPromoImgUrl': instance.pcmPromoImgUrl,
      'promoExpiryDate': instance.promoExpiryDate,
      'isSelected': instance.isSelected,
      'recommendations': instance.recommendations,
    };

_$_Recommendations _$$_RecommendationsFromJson(Map<String, dynamic> json) =>
    _$_Recommendations(
      amount: json['amount'] as String? ?? '',
    );

Map<String, dynamic> _$$_RecommendationsToJson(_$_Recommendations instance) =>
    <String, dynamic>{
      'amount': instance.amount,
    };
