// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CouponListResponse _$$_CouponListResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CouponListResponse(
      elgibleOfferInfo: (json['elgibleOfferInfo'] as List<dynamic>?)
              ?.map((e) => CouponDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      promoList: (json['promoList'] as List<dynamic>?)
              ?.map((e) => CouponDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      promoDetails: (json['promoDetails'] as List<dynamic>?)
              ?.map((e) => CouponDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      promoCodes: (json['promoCodes'] as List<dynamic>?)
              ?.map((e) => CouponDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      earningPercentage: (json['earningPercentage'] as List<dynamic>?)
              ?.map((e) => CouponDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CouponListResponseToJson(
        _$_CouponListResponse instance) =>
    <String, dynamic>{
      'elgibleOfferInfo': instance.elgibleOfferInfo,
      'promoList': instance.promoList,
      'promoDetails': instance.promoDetails,
      'promoCodes': instance.promoCodes,
      'earningPercentage': instance.earningPercentage,
    };

_$_CouponDetails _$$_CouponDetailsFromJson(Map<String, dynamic> json) =>
    _$_CouponDetails(
      id: json['id'] as int? ?? 0,
      promoName: json['promoName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      promoStatus: json['promoStatus'] as String? ?? '',
      couponCode: json['couponCode'] as String? ?? '',
      discountPercentage: json['discountPercentage'] as num? ?? 0,
      maximumDiscountAmount: json['maximumDiscountAmount'] as num? ?? 0,
      minimumBillingAmount: json['minimumBillingAmount'] as num? ?? 0,
      caculationBasedOnAmount: json['caculationBasedOnAmount'] as num? ?? 0,
      promoTermsAndConditions: json['promoTermsAndConditions'] as String? ?? '',
      eligibilityAmount: json['eligibilityAmount'] as String? ?? '',
      eligible: json['eligible'] as bool? ?? false,
      isInstantDiscount: json['isInstantDiscount'] as bool? ?? false,
      promoImgUrl: json['promoImgUrl'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
      startDate: json['startDate'] as String? ?? '',
      isSelected: json['isSelected'] as bool? ?? false,
      promoType: json['promoType'] as String? ?? '',
      recommendations: json['recommendations'] == null
          ? const Recommendations()
          : Recommendations.fromJson(
              json['recommendations'] as Map<String, dynamic>),
      narration: json['narration'] as String? ?? '',
      promoCode: json['promoCode'] as String? ?? '',
      promoDescription: json['promoDescription'] as String? ?? '',
      promoCategory: json['promoCategory'] as String? ?? '',
      promoPriority: json['promoPriority'] as num? ?? 0,
      international: json['international'] as bool? ?? false,
      promoTermsAndCondition: json['promoTermsAndCondition'] as String? ?? '',
      earningPercentage: json['earningPercentage'] as num? ?? 0,
      earningPercentageLob: json['earningPercentageLob'] as String? ?? '',
    );

Map<String, dynamic> _$$_CouponDetailsToJson(_$_CouponDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'promoName': instance.promoName,
      'description': instance.description,
      'promoStatus': instance.promoStatus,
      'couponCode': instance.couponCode,
      'discountPercentage': instance.discountPercentage,
      'maximumDiscountAmount': instance.maximumDiscountAmount,
      'minimumBillingAmount': instance.minimumBillingAmount,
      'caculationBasedOnAmount': instance.caculationBasedOnAmount,
      'promoTermsAndConditions': instance.promoTermsAndConditions,
      'eligibilityAmount': instance.eligibilityAmount,
      'eligible': instance.eligible,
      'isInstantDiscount': instance.isInstantDiscount,
      'promoImgUrl': instance.promoImgUrl,
      'endDate': instance.endDate,
      'startDate': instance.startDate,
      'isSelected': instance.isSelected,
      'promoType': instance.promoType,
      'recommendations': instance.recommendations,
      'narration': instance.narration,
      'promoCode': instance.promoCode,
      'promoDescription': instance.promoDescription,
      'promoCategory': instance.promoCategory,
      'promoPriority': instance.promoPriority,
      'international': instance.international,
      'promoTermsAndCondition': instance.promoTermsAndCondition,
      'earningPercentage': instance.earningPercentage,
      'earningPercentageLob': instance.earningPercentageLob,
    };

_$_Recommendations _$$_RecommendationsFromJson(Map<String, dynamic> json) =>
    _$_Recommendations(
      amount: json['amount'] as String? ?? '',
    );

Map<String, dynamic> _$$_RecommendationsToJson(_$_Recommendations instance) =>
    <String, dynamic>{
      'amount': instance.amount,
    };
