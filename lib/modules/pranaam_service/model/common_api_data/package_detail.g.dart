// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PackageDetail _$$_PackageDetailFromJson(Map<String, dynamic> json) =>
    _$_PackageDetail(
      pricingInfo: json['pricingInfo'] == null
          ? const PricingInfo()
          : PricingInfo.fromJson(json['pricingInfo'] as Map<String, dynamic>),
      rescheduledPricingInfo: json['rescheduledPricingInfo'] == null
          ? null
          : PricingInfo.fromJson(
              json['rescheduledPricingInfo'] as Map<String, dynamic>),
      originalPricingInfo: json['originalPricingInfo'] == null
          ? null
          : PricingInfo.fromJson(
              json['originalPricingInfo'] as Map<String, dynamic>),
      oldPricingInfo: json['oldPricingInfo'] == null
          ? null
          : PricingInfo.fromJson(
              json['oldPricingInfo'] as Map<String, dynamic>),
      packageAddOn: (json['packageAddOn'] as List<dynamic>?)
              ?.map((e) => PackageAddOn.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      cancellationPolicy: json['cancellationPolicy'] == null
          ? const CancellationPolicy()
          : CancellationPolicy.fromJson(
              json['cancellationPolicy'] as Map<String, dynamic>),
      securityKey: json['securityKey'] == null
          ? const SecurityKey()
          : SecurityKey.fromJson(json['securityKey'] as Map<String, dynamic>),
      availableService: (json['availableService'] as List<dynamic>?)
              ?.map((e) => AvailableService.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      sequenceNumber: json['sequenceNumber'] as String? ?? '',
      name: json['name'] as String? ?? '',
      shortDesc: json['shortDesc'] as String? ?? '',
      packageNumber: json['packageNumber'] as String? ?? '',
      packageImage: json['packageImage'] as String? ?? '',
      packageImageURL: json['packageImageURL'] as String? ?? '',
      packageId: json['packageId'] as int? ?? 0,
      businessUnitId: json['businessUnitId'] as int? ?? 0,
      travelSectorId: json['travelSectorId'] as int? ?? 0,
      airportMasterId: json['airportMasterId'] as int? ?? 0,
      serviceTypeId: json['serviceTypeId'] as int? ?? 0,
      freeAllowedPorter: json['freeAllowedPorter'] as int? ?? 0,
      maxAllowedBaggagePerPorter:
          json['maxAllowedBaggagePerPorter'] as int? ?? 0,
      isCurrent: json['isCurrent'] as bool? ?? false,
      itemCount: json['itemCount'] as int? ?? 0,
      count: json['count'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      isGroupPackage: json['isGroupPackage'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PackageDetailToJson(_$_PackageDetail instance) =>
    <String, dynamic>{
      'pricingInfo': instance.pricingInfo,
      'rescheduledPricingInfo': instance.rescheduledPricingInfo,
      'originalPricingInfo': instance.originalPricingInfo,
      'oldPricingInfo': instance.oldPricingInfo,
      'packageAddOn': instance.packageAddOn,
      'cancellationPolicy': instance.cancellationPolicy,
      'securityKey': instance.securityKey,
      'availableService': instance.availableService,
      'sequenceNumber': instance.sequenceNumber,
      'name': instance.name,
      'shortDesc': instance.shortDesc,
      'packageNumber': instance.packageNumber,
      'packageImage': instance.packageImage,
      'packageImageURL': instance.packageImageURL,
      'packageId': instance.packageId,
      'businessUnitId': instance.businessUnitId,
      'travelSectorId': instance.travelSectorId,
      'airportMasterId': instance.airportMasterId,
      'serviceTypeId': instance.serviceTypeId,
      'freeAllowedPorter': instance.freeAllowedPorter,
      'maxAllowedBaggagePerPorter': instance.maxAllowedBaggagePerPorter,
      'isCurrent': instance.isCurrent,
      'itemCount': instance.itemCount,
      'count': instance.count,
      'id': instance.id,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'isGroupPackage': instance.isGroupPackage,
    };

_$_CancellationPolicy _$$_CancellationPolicyFromJson(
        Map<String, dynamic> json) =>
    _$_CancellationPolicy(
      id: json['id'] as int? ?? 0,
      packageId: json['packageId'] as int? ?? 0,
      hoursBefore: json['hoursBefore'] as int? ?? 0,
      refundableAmountPercentage:
          json['refundableAmountPercentage'] as int? ?? 0,
    );

Map<String, dynamic> _$$_CancellationPolicyToJson(
        _$_CancellationPolicy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'packageId': instance.packageId,
      'hoursBefore': instance.hoursBefore,
      'refundableAmountPercentage': instance.refundableAmountPercentage,
    };

_$_AvailableService _$$_AvailableServiceFromJson(Map<String, dynamic> json) =>
    _$_AvailableService(
      addOnServiceId: json['addOnServiceId'] as int? ?? 0,
      addOnServiceName: json['addOnServiceName'] as String? ?? '',
      addOnServiceDescription: json['addOnServiceDescription'] as String? ?? '',
      isAvailiable: json['isAvailiable'] as bool? ?? false,
    );

Map<String, dynamic> _$$_AvailableServiceToJson(_$_AvailableService instance) =>
    <String, dynamic>{
      'addOnServiceId': instance.addOnServiceId,
      'addOnServiceName': instance.addOnServiceName,
      'addOnServiceDescription': instance.addOnServiceDescription,
      'isAvailiable': instance.isAvailiable,
    };

_$_PricingInfo _$$_PricingInfoFromJson(Map<String, dynamic> json) =>
    _$_PricingInfo(
      totalFare: json['totalFare'] == null
          ? const TotalFare()
          : TotalFare.fromJson(json['totalFare'] as Map<String, dynamic>),
      currentLoyaltyPoints: json['currentLoyaltyPoints'] as String? ?? '',
      totalBaseFare: json['totalBaseFare'] == null
          ? const TotalBaseFare()
          : TotalBaseFare.fromJson(
              json['totalBaseFare'] as Map<String, dynamic>),
      totalTax: json['totalTax'] == null
          ? const TotalTax()
          : TotalTax.fromJson(json['totalTax'] as Map<String, dynamic>),
      totalExpressFare: json['totalExpressFare'] == null
          ? null
          : TotalExpressFare.fromJson(
              json['totalExpressFare'] as Map<String, dynamic>),
      discountCouponDetail: json['discountCouponDetail'] == null
          ? const DiscountCouponDetail()
          : DiscountCouponDetail.fromJson(
              json['discountCouponDetail'] as Map<String, dynamic>),
      passengerTypeQuantity: (json['passengerTypeQuantity'] as List<dynamic>?)
              ?.map((e) =>
                  PassengerTypeQuantity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_PricingInfoToJson(_$_PricingInfo instance) =>
    <String, dynamic>{
      'totalFare': instance.totalFare,
      'currentLoyaltyPoints': instance.currentLoyaltyPoints,
      'totalBaseFare': instance.totalBaseFare,
      'totalTax': instance.totalTax,
      'totalExpressFare': instance.totalExpressFare,
      'discountCouponDetail': instance.discountCouponDetail,
      'passengerTypeQuantity': instance.passengerTypeQuantity,
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

_$_SecurityKey _$$_SecurityKeyFromJson(Map<String, dynamic> json) =>
    _$_SecurityKey(
      securityGuid: json['securityGuid'] as String? ?? '',
      key: json['key'] as String? ?? '',
    );

Map<String, dynamic> _$$_SecurityKeyToJson(_$_SecurityKey instance) =>
    <String, dynamic>{
      'securityGuid': instance.securityGuid,
      'key': instance.key,
    };

_$_TotalBaseFare _$$_TotalBaseFareFromJson(Map<String, dynamic> json) =>
    _$_TotalBaseFare(
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      currencyCode: json['currencyCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_TotalBaseFareToJson(_$_TotalBaseFare instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currencyCode': instance.currencyCode,
    };

_$_TotalExpressFare _$$_TotalExpressFareFromJson(Map<String, dynamic> json) =>
    _$_TotalExpressFare(
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      baseFare: (json['baseFare'] as num?)?.toDouble() ?? 0,
      currencyCode: json['currencyCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_TotalExpressFareToJson(_$_TotalExpressFare instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'baseFare': instance.baseFare,
      'currencyCode': instance.currencyCode,
    };

_$_PassengerTypeQuantity _$$_PassengerTypeQuantityFromJson(
        Map<String, dynamic> json) =>
    _$_PassengerTypeQuantity(
      baseFare: json['baseFare'] == null
          ? const BaseFare()
          : BaseFare.fromJson(json['baseFare'] as Map<String, dynamic>),
      taxes: json['taxes'] == null
          ? const BaseFare()
          : BaseFare.fromJson(json['taxes'] as Map<String, dynamic>),
      totalFare: json['totalFare'] == null
          ? const BaseFare()
          : BaseFare.fromJson(json['totalFare'] as Map<String, dynamic>),
      expressFare: json['expressFare'] == null
          ? const ExpressFare()
          : ExpressFare.fromJson(json['expressFare'] as Map<String, dynamic>),
      code: json['code'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 0,
    );

Map<String, dynamic> _$$_PassengerTypeQuantityToJson(
        _$_PassengerTypeQuantity instance) =>
    <String, dynamic>{
      'baseFare': instance.baseFare,
      'taxes': instance.taxes,
      'totalFare': instance.totalFare,
      'expressFare': instance.expressFare,
      'code': instance.code,
      'quantity': instance.quantity,
    };

_$_BaseFare _$$_BaseFareFromJson(Map<String, dynamic> json) => _$_BaseFare(
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      currencyCode: json['currencyCode'] as String? ?? '',
      perPaxAmount: (json['perPaxAmount'] as num?)?.toDouble() ?? 0,
      tax: (json['tax'] as List<dynamic>?)
              ?.map((e) => Tax.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_BaseFareToJson(_$_BaseFare instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currencyCode': instance.currencyCode,
      'perPaxAmount': instance.perPaxAmount,
      'tax': instance.tax,
    };

_$_ExpressFare _$$_ExpressFareFromJson(Map<String, dynamic> json) =>
    _$_ExpressFare(
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      currencyCode: json['currencyCode'] as String? ?? '',
      perPaxAmount: (json['perPaxAmount'] as num?)?.toDouble() ?? 0,
      totalExpressFare: (json['totalExpressFare'] as num?)?.toDouble() ?? 0,
      taxesExpressFare: json['taxesExpressFare'] == null
          ? const BaseFare()
          : BaseFare.fromJson(json['taxesExpressFare'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ExpressFareToJson(_$_ExpressFare instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currencyCode': instance.currencyCode,
      'perPaxAmount': instance.perPaxAmount,
      'totalExpressFare': instance.totalExpressFare,
      'taxesExpressFare': instance.taxesExpressFare,
    };

_$_Tax _$$_TaxFromJson(Map<String, dynamic> json) => _$_Tax(
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      currencyCode: json['currencyCode'] as String? ?? '',
      taxCode: json['taxCode'] as String? ?? '',
      taxDesc: json['taxDesc'] as String? ?? '',
      perPaxAmount: (json['perPaxAmount'] as num?)?.toDouble() ?? 0,
      taxPercent: (json['taxPercent'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_TaxToJson(_$_Tax instance) => <String, dynamic>{
      'amount': instance.amount,
      'currencyCode': instance.currencyCode,
      'taxCode': instance.taxCode,
      'taxDesc': instance.taxDesc,
      'perPaxAmount': instance.perPaxAmount,
      'taxPercent': instance.taxPercent,
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

_$_DiscountCouponDetail _$$_DiscountCouponDetailFromJson(
        Map<String, dynamic> json) =>
    _$_DiscountCouponDetail(
      couponId: json['couponId'] as int? ?? 0,
      couponCode: json['couponCode'] as String? ?? '',
      couponDiscountAmount:
          (json['couponDiscountAmount'] as num?)?.toDouble() ?? 0,
      currencyCode: json['currencyCode'] as String? ?? '',
      promoType: json['promoType'] as String? ?? '0',
    );

Map<String, dynamic> _$$_DiscountCouponDetailToJson(
        _$_DiscountCouponDetail instance) =>
    <String, dynamic>{
      'couponId': instance.couponId,
      'couponCode': instance.couponCode,
      'couponDiscountAmount': instance.couponDiscountAmount,
      'currencyCode': instance.currencyCode,
      'promoType': instance.promoType,
    };
