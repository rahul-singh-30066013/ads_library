// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartResponse _$$_CartResponseFromJson(Map<String, dynamic> json) =>
    _$_CartResponse(
      userId: json['userId'] as String? ?? '',
      oldBookingReferenceId: json['oldBookingReferenceId'] as String? ?? '',
      packageDetail: json['packageDetail'] == null
          ? const PackageDetail()
          : PackageDetail.fromJson(
              json['packageDetail'] as Map<String, dynamic>),
      travelers: (json['travelers'] as List<dynamic>?)
              ?.map((e) => TravellersModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tripDetail:
          TripDetail.fromJson(json['tripDetail'] as Map<String, dynamic>),
      packageAddOn: (json['packageAddOn'] as List<dynamic>?)
              ?.map((e) => PackageAddOn.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pricingInfo: json['pricingInfo'] == null
          ? const PricingInfo()
          : PricingInfo.fromJson(json['pricingInfo'] as Map<String, dynamic>),
      upgradePricingInfo: json['upgradePricingInfo'] == null
          ? const PricingInfo()
          : PricingInfo.fromJson(
              json['upgradePricingInfo'] as Map<String, dynamic>),
      oldPricingInfo: json['oldpricingInfo'] == null
          ? const OldPricingInfo()
          : OldPricingInfo.fromJson(
              json['oldpricingInfo'] as Map<String, dynamic>),
      availiableAddOn: (json['availiableAddOn'] as List<dynamic>?)
              ?.map((e) => PackageAddOn.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalFare: json['totalFare'] == null
          ? const TotalFare()
          : TotalFare.fromJson(json['totalFare'] as Map<String, dynamic>),
      potentialLoyaltyEarning: json['potentialLoyaltyEarning'] as int? ?? 0,
      pranaamBookingType: json['pranaamBookingType'] as String? ?? '',
      bookingId: json['bookingId'] as int? ?? 0,
      totalTax: json['totalTax'] == null
          ? const TotalFare()
          : TotalFare.fromJson(json['totalTax'] as Map<String, dynamic>),
      standaloneProductDetails: json['standaloneProductDetails'] == null
          ? const PackageDetail()
          : PackageDetail.fromJson(
              json['standaloneProductDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CartResponseToJson(_$_CartResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'oldBookingReferenceId': instance.oldBookingReferenceId,
      'packageDetail': instance.packageDetail,
      'travelers': instance.travelers,
      'tripDetail': instance.tripDetail,
      'packageAddOn': instance.packageAddOn,
      'pricingInfo': instance.pricingInfo,
      'upgradePricingInfo': instance.upgradePricingInfo,
      'oldpricingInfo': instance.oldPricingInfo,
      'availiableAddOn': instance.availiableAddOn,
      'totalFare': instance.totalFare,
      'potentialLoyaltyEarning': instance.potentialLoyaltyEarning,
      'pranaamBookingType': instance.pranaamBookingType,
      'bookingId': instance.bookingId,
      'totalTax': instance.totalTax,
      'standaloneProductDetails': instance.standaloneProductDetails,
    };

_$_OldPricingInfo _$$_OldPricingInfoFromJson(Map<String, dynamic> json) =>
    _$_OldPricingInfo(
      totalFare: json['totalFare'] == null
          ? const TotalFare()
          : TotalFare.fromJson(json['totalFare'] as Map<String, dynamic>),
      totalBaseFare: json['totalBaseFare'] == null
          ? const TotalFare()
          : TotalFare.fromJson(json['totalBaseFare'] as Map<String, dynamic>),
      totalTax: json['totalTax'] == null
          ? const TotalTax()
          : TotalTax.fromJson(json['totalTax'] as Map<String, dynamic>),
      passengerTypeQuantity: json['passengerTypeQuantity'] == null
          ? const PassengerTypeQuantity()
          : PassengerTypeQuantity.fromJson(
              json['passengerTypeQuantity'] as Map<String, dynamic>),
      totalExpressFare: json['totalExpressFare'] == null
          ? const TotalExpressFare()
          : TotalExpressFare.fromJson(
              json['totalExpressFare'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OldPricingInfoToJson(_$_OldPricingInfo instance) =>
    <String, dynamic>{
      'totalFare': instance.totalFare,
      'totalBaseFare': instance.totalBaseFare,
      'totalTax': instance.totalTax,
      'passengerTypeQuantity': instance.passengerTypeQuantity,
      'totalExpressFare': instance.totalExpressFare,
    };

_$_TotalFare _$$_TotalFareFromJson(Map<String, dynamic> json) => _$_TotalFare(
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      cgst: (json['cgst'] as num?)?.toDouble() ?? 0,
      sgst: (json['sgst'] as num?)?.toDouble() ?? 0,
      currencyCode: json['currencyCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_TotalFareToJson(_$_TotalFare instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'cgst': instance.cgst,
      'sgst': instance.sgst,
      'currencyCode': instance.currencyCode,
    };

_$_TotalTax _$$_TotalTaxFromJson(Map<String, dynamic> json) => _$_TotalTax(
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      currencyCode: json['currencyCode'] as String? ?? '',
      sgst: json['sgst'] == null
          ? const Gst()
          : Gst.fromJson(json['sgst'] as Map<String, dynamic>),
      cgst: json['cgst'] == null
          ? const Gst()
          : Gst.fromJson(json['cgst'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TotalTaxToJson(_$_TotalTax instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currencyCode': instance.currencyCode,
      'sgst': instance.sgst,
      'cgst': instance.cgst,
    };

_$_Gst _$$_GstFromJson(Map<String, dynamic> json) => _$_Gst(
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      percentage: (json['percentage'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_GstToJson(_$_Gst instance) => <String, dynamic>{
      'amount': instance.amount,
      'percentage': instance.percentage,
    };
