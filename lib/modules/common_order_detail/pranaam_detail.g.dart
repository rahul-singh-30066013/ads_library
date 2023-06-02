// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pranaam_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PranaamDetail _$$_PranaamDetailFromJson(Map<String, dynamic> json) =>
    _$_PranaamDetail(
      bookingId: json['bookingId'] as int?,
      totalLoyalty: json['totalLoyalty'] as int?,
      totalPromo: json['totalPromo'] as int?,
      pranaamBookingType: json['pranaamBookingType'] as String?,
      refBookingId: json['refBookingId'] as String?,
      invoiceNo: json['invoiceNo'] as String?,
      finalTotalAmount: (json['finalTotalAmount'] as num?)?.toDouble(),
      upgradeBankAmount: (json['upgradeBankAmount'] as num?)?.toDouble(),
      bookingInvoiceNumber: json['bookingInvoiceNumber'],
      upgradeBookingInvoiceNumber: json['upgradeBookingInvoiceNumber'],
      rescheduleBookingInvoiceNumber: json['rescheduleBookingInvoiceNumber'],
      packageDetail: json['packageDetail'] == null
          ? null
          : PackageDetail.fromJson(
              json['packageDetail'] as Map<String, dynamic>),
      oldPackageDetail: json['oldPackageDetail'] == null
          ? null
          : PackageDetail.fromJson(
              json['oldPackageDetail'] as Map<String, dynamic>),
      tripDetails: json['tripDetails'] == null
          ? null
          : TripDetails.fromJson(json['tripDetails'] as Map<String, dynamic>),
      oldTripDetails: json['oldTripDetails'] == null
          ? null
          : TripDetails.fromJson(
              json['oldTripDetails'] as Map<String, dynamic>),
      roundTripDetail: json['roundTripDetail'] == null
          ? null
          : TripDetails.fromJson(
              json['roundTripDetail'] as Map<String, dynamic>),
      oldRoundTripDetail: json['oldRoundTripDetail'] == null
          ? null
          : TripDetails.fromJson(
              json['oldRoundTripDetail'] as Map<String, dynamic>),
      addOnServices: (json['addOnServices'] as List<dynamic>?)
          ?.map((e) => AddOnService.fromJson(e as Map<String, dynamic>))
          .toList(),
      travelers: (json['travelers'] as List<dynamic>?)
          ?.map((e) => Traveler.fromJson(e as Map<String, dynamic>))
          .toList(),
      billingInfo: json['billingInfo'] == null
          ? null
          : BillingInfo.fromJson(json['billingInfo'] as Map<String, dynamic>),
      placardInfo: json['placardInfo'] == null
          ? null
          : PlacardInfo.fromJson(json['placardInfo'] as Map<String, dynamic>),
      refundHistory: json['refundHistory'] as List<dynamic>?,
      orderRefund: json['orderRefund'] as List<dynamic>?,
      dqr: json['dqr'] as String?,
      newDqr: json['newDqr'],
      standaloneProductDetails: json['standaloneProductDetails'] == null
          ? null
          : PackageDetail.fromJson(
              json['standaloneProductDetails'] as Map<String, dynamic>),
      totalFare: json['totalFare'] == null
          ? null
          : TotalFare.fromJson(json['totalFare'] as Map<String, dynamic>),
      totalTax: json['totalTax'] == null
          ? null
          : PranaamDetailTotalTax.fromJson(
              json['totalTax'] as Map<String, dynamic>),
      finalPranaamTax: json['finalPranaamTax'] == null
          ? null
          : FinalPranaamTax.fromJson(
              json['finalPranaamTax'] as Map<String, dynamic>),
      isUpgradable: json['isUpgradable'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PranaamDetailToJson(_$_PranaamDetail instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'totalLoyalty': instance.totalLoyalty,
      'totalPromo': instance.totalPromo,
      'pranaamBookingType': instance.pranaamBookingType,
      'refBookingId': instance.refBookingId,
      'invoiceNo': instance.invoiceNo,
      'finalTotalAmount': instance.finalTotalAmount,
      'upgradeBankAmount': instance.upgradeBankAmount,
      'bookingInvoiceNumber': instance.bookingInvoiceNumber,
      'upgradeBookingInvoiceNumber': instance.upgradeBookingInvoiceNumber,
      'rescheduleBookingInvoiceNumber': instance.rescheduleBookingInvoiceNumber,
      'packageDetail': instance.packageDetail,
      'oldPackageDetail': instance.oldPackageDetail,
      'tripDetails': instance.tripDetails,
      'oldTripDetails': instance.oldTripDetails,
      'roundTripDetail': instance.roundTripDetail,
      'oldRoundTripDetail': instance.oldRoundTripDetail,
      'addOnServices': instance.addOnServices,
      'travelers': instance.travelers,
      'billingInfo': instance.billingInfo,
      'placardInfo': instance.placardInfo,
      'refundHistory': instance.refundHistory,
      'orderRefund': instance.orderRefund,
      'dqr': instance.dqr,
      'newDqr': instance.newDqr,
      'standaloneProductDetails': instance.standaloneProductDetails,
      'totalFare': instance.totalFare,
      'totalTax': instance.totalTax,
      'finalPranaamTax': instance.finalPranaamTax,
      'isUpgradable': instance.isUpgradable,
    };

_$_PranaamDetailTotalTax _$$_PranaamDetailTotalTaxFromJson(
        Map<String, dynamic> json) =>
    _$_PranaamDetailTotalTax(
      amount: (json['amount'] as num?)?.toDouble(),
      cgst: (json['cgst'] as num?)?.toDouble(),
      sgst: (json['sgst'] as num?)?.toDouble(),
      currencyCode: json['currencyCode'] as String?,
      cgstPercent: (json['cgstPercent'] as num?)?.toDouble(),
      sgstPercent: (json['sgstPercent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_PranaamDetailTotalTaxToJson(
        _$_PranaamDetailTotalTax instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'cgst': instance.cgst,
      'sgst': instance.sgst,
      'currencyCode': instance.currencyCode,
      'cgstPercent': instance.cgstPercent,
      'sgstPercent': instance.sgstPercent,
    };

_$_FinalPranaamTax _$$_FinalPranaamTaxFromJson(Map<String, dynamic> json) =>
    _$_FinalPranaamTax(
      cgstAmount: (json['cgstAmount'] as num?)?.toDouble(),
      sgstAmount: (json['sgstAmount'] as num?)?.toDouble(),
      cgstPercentage: (json['cgstPercentage'] as num?)?.toDouble(),
      sgstPercentage: (json['sgstPercentage'] as num?)?.toDouble(),
      totalTax: (json['totalTax'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_FinalPranaamTaxToJson(_$_FinalPranaamTax instance) =>
    <String, dynamic>{
      'cgstAmount': instance.cgstAmount,
      'sgstAmount': instance.sgstAmount,
      'cgstPercentage': instance.cgstPercentage,
      'sgstPercentage': instance.sgstPercentage,
      'totalTax': instance.totalTax,
    };

_$_AddOnService _$$_AddOnServiceFromJson(Map<String, dynamic> json) =>
    _$_AddOnService(
      serviceName: json['serviceName'] as String? ?? '',
      serviceDescription: json['serviceDescription'] as String?,
      unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0,
      quantity: json['quantity'] as int? ?? 0,
      userId: json['userId'] as String?,
      packageId: json['packageId'] as int?,
      addOnServiceId: json['addOnServiceId'] as int?,
      addOnImage: json['addOnImage'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      cgst: (json['cgst'] as num?)?.toDouble(),
      sgst: (json['sgst'] as num?)?.toDouble(),
      totalAddOnTax: (json['totalAddOnTax'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_AddOnServiceToJson(_$_AddOnService instance) =>
    <String, dynamic>{
      'serviceName': instance.serviceName,
      'serviceDescription': instance.serviceDescription,
      'unitPrice': instance.unitPrice,
      'quantity': instance.quantity,
      'userId': instance.userId,
      'packageId': instance.packageId,
      'addOnServiceId': instance.addOnServiceId,
      'addOnImage': instance.addOnImage,
      'totalPrice': instance.totalPrice,
      'cgst': instance.cgst,
      'sgst': instance.sgst,
      'totalAddOnTax': instance.totalAddOnTax,
    };

_$_BillingInfo _$$_BillingInfoFromJson(Map<String, dynamic> json) =>
    _$_BillingInfo(
      salutationId: json['salutationId'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      countryDialCode: json['countryDialCode'] as String?,
      mobile: json['mobile'] as String?,
      birthDate: json['birthDate'] as String?,
      email: json['email'] as String?,
      addressLine1: json['addressLine1'] as String?,
      addressLine2: json['addressLine2'] as String?,
      countryName: json['countryName'] as String?,
      cityName: json['cityName'] as String?,
      stateName: json['stateName'] as String?,
      countryId: json['countryId'] as int?,
      pincode: json['pincode'] as String?,
      cityId: json['cityId'] as int?,
      stateId: json['stateId'] as int?,
      billingGstin: json['billingGstin'] == null
          ? null
          : BillingGstin.fromJson(json['billingGstin'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BillingInfoToJson(_$_BillingInfo instance) =>
    <String, dynamic>{
      'salutationId': instance.salutationId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'countryDialCode': instance.countryDialCode,
      'mobile': instance.mobile,
      'birthDate': instance.birthDate,
      'email': instance.email,
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'countryName': instance.countryName,
      'cityName': instance.cityName,
      'stateName': instance.stateName,
      'countryId': instance.countryId,
      'pincode': instance.pincode,
      'cityId': instance.cityId,
      'stateId': instance.stateId,
      'billingGstin': instance.billingGstin,
    };

_$_BillingGstin _$$_BillingGstinFromJson(Map<String, dynamic> json) =>
    _$_BillingGstin(
      gstNumber: json['gstNumber'],
      name: json['name'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      countryId: json['countryId'] as int?,
      pinCode: json['pinCode'] as int?,
      cityId: json['cityId'] as int?,
      stateId: json['stateId'] as int?,
      billingGstinGstNumber: json['billingGstinGstNumber'],
    );

Map<String, dynamic> _$$_BillingGstinToJson(_$_BillingGstin instance) =>
    <String, dynamic>{
      'gstNumber': instance.gstNumber,
      'name': instance.name,
      'mobileNumber': instance.mobileNumber,
      'email': instance.email,
      'address': instance.address,
      'countryId': instance.countryId,
      'pinCode': instance.pinCode,
      'cityId': instance.cityId,
      'stateId': instance.stateId,
      'billingGstinGstNumber': instance.billingGstinGstNumber,
    };

_$_PackageDetail _$$_PackageDetailFromJson(Map<String, dynamic> json) =>
    _$_PackageDetail(
      packageId: json['packageId'] as int?,
      name: json['name'] as String?,
      shortDesc: json['shortDesc'] as String?,
      packageImageUrl: json['packageImageUrl'] as String?,
      packageNumber: json['packageNumber'] as String?,
      adultCount: json['adultCount'] as int?,
      childCount: json['childCount'] as int?,
      infantCount: json['infantCount'] as int?,
      adultPrice: (json['adultPrice'] as num?)?.toDouble(),
      childPrice: (json['childPrice'] as num?)?.toDouble(),
      infantPrice: (json['infantPrice'] as num?)?.toDouble(),
      itemCount: json['itemCount'] as int?,
      count: json['count'] as int?,
      isGroupPackage: json['isGroupPackage'] as bool?,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      createdOn: json['createdOn'] == null
          ? null
          : DateTime.parse(json['createdOn'] as String),
      updateOn: json['updateOn'] == null
          ? null
          : DateTime.parse(json['updateOn'] as String),
      userId: json['userId'] as String? ?? '',
      currency: json['currency'],
      pricingInfo: json['pricingInfo'] == null
          ? null
          : PricingInfo.fromJson(json['pricingInfo'] as Map<String, dynamic>),
      originalPricingInfo: json['originalPricingInfo'] == null
          ? null
          : PricingInfo.fromJson(
              json['originalPricingInfo'] as Map<String, dynamic>),
      oldPricingInfo: json['oldPricingInfo'] == null
          ? null
          : PricingInfo.fromJson(
              json['oldPricingInfo'] as Map<String, dynamic>),
      upgradedPricingInfo: json['upgradedPricingInfo'] == null
          ? null
          : PricingInfo.fromJson(
              json['upgradedPricingInfo'] as Map<String, dynamic>),
      rescheduledPricingInfo: json['rescheduledPricingInfo'] == null
          ? null
          : PricingInfo.fromJson(
              json['rescheduledPricingInfo'] as Map<String, dynamic>),
      freeAllowedPorter: json['freeAllowedPorter'] as int?,
      maxAllowedBaggagePerPorter: json['maxAllowedBaggagePerPorter'] as int?,
      promoType: json['promoType'],
      rescheduleCharges: json['rescheduleCharges'] == null
          ? const RescheduleCharges()
          : RescheduleCharges.fromJson(
              json['rescheduleCharges'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PackageDetailToJson(_$_PackageDetail instance) =>
    <String, dynamic>{
      'packageId': instance.packageId,
      'name': instance.name,
      'shortDesc': instance.shortDesc,
      'packageImageUrl': instance.packageImageUrl,
      'packageNumber': instance.packageNumber,
      'adultCount': instance.adultCount,
      'childCount': instance.childCount,
      'infantCount': instance.infantCount,
      'adultPrice': instance.adultPrice,
      'childPrice': instance.childPrice,
      'infantPrice': instance.infantPrice,
      'itemCount': instance.itemCount,
      'count': instance.count,
      'isGroupPackage': instance.isGroupPackage,
      'totalPrice': instance.totalPrice,
      'createdOn': instance.createdOn?.toIso8601String(),
      'updateOn': instance.updateOn?.toIso8601String(),
      'userId': instance.userId,
      'currency': instance.currency,
      'pricingInfo': instance.pricingInfo,
      'originalPricingInfo': instance.originalPricingInfo,
      'oldPricingInfo': instance.oldPricingInfo,
      'upgradedPricingInfo': instance.upgradedPricingInfo,
      'rescheduledPricingInfo': instance.rescheduledPricingInfo,
      'freeAllowedPorter': instance.freeAllowedPorter,
      'maxAllowedBaggagePerPorter': instance.maxAllowedBaggagePerPorter,
      'promoType': instance.promoType,
      'rescheduleCharges': instance.rescheduleCharges,
    };

_$_PricingInfo _$$_PricingInfoFromJson(Map<String, dynamic> json) =>
    _$_PricingInfo(
      totalFare: json['totalFare'] == null
          ? null
          : TotalFare.fromJson(json['totalFare'] as Map<String, dynamic>),
      totalBaseFare: json['totalBaseFare'] == null
          ? null
          : TotalFare.fromJson(json['totalBaseFare'] as Map<String, dynamic>),
      totalTax: json['totalTax'] == null
          ? null
          : TotalTax.fromJson(json['totalTax'] as Map<String, dynamic>),
      totalExpressFare: json['totalExpressFare'] == null
          ? null
          : TotalFare.fromJson(
              json['totalExpressFare'] as Map<String, dynamic>),
      discountCouponDetails: json['discountCouponDetails'] == null
          ? null
          : DiscountCouponDetails.fromJson(
              json['discountCouponDetails'] as Map<String, dynamic>),
      currentLoyaltyPoints: json['currentLoyaltyPoints'],
      passengerTypeQuantity: (json['passengerTypeQuantity'] as List<dynamic>?)
          ?.map(
              (e) => PassengerTypeQuantity.fromJson(e as Map<String, dynamic>))
          .toList(),
      discountCouponDetailsFromPromoApi:
          json['discountCouponDetailsFromPromoApi'],
    );

Map<String, dynamic> _$$_PricingInfoToJson(_$_PricingInfo instance) =>
    <String, dynamic>{
      'totalFare': instance.totalFare,
      'totalBaseFare': instance.totalBaseFare,
      'totalTax': instance.totalTax,
      'totalExpressFare': instance.totalExpressFare,
      'discountCouponDetails': instance.discountCouponDetails,
      'currentLoyaltyPoints': instance.currentLoyaltyPoints,
      'passengerTypeQuantity': instance.passengerTypeQuantity,
      'discountCouponDetailsFromPromoApi':
          instance.discountCouponDetailsFromPromoApi,
    };

_$_DiscountCouponDetails _$$_DiscountCouponDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_DiscountCouponDetails(
      couponId: json['couponId'] as int?,
      couponCode: json['couponCode'],
      couponDiscountAmount: (json['couponDiscountAmount'] as num?)?.toDouble(),
      currencyCode: json['currencyCode'],
      isMerchantFunded: json['isMerchantFunded'] as bool?,
      pcmPercentage: (json['pcmPercentage'] as num?)?.toDouble(),
      promoType: json['promoType'],
      rewardAndCashBackAmount:
          (json['rewardAndCashBackAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_DiscountCouponDetailsToJson(
        _$_DiscountCouponDetails instance) =>
    <String, dynamic>{
      'couponId': instance.couponId,
      'couponCode': instance.couponCode,
      'couponDiscountAmount': instance.couponDiscountAmount,
      'currencyCode': instance.currencyCode,
      'isMerchantFunded': instance.isMerchantFunded,
      'pcmPercentage': instance.pcmPercentage,
      'promoType': instance.promoType,
      'rewardAndCashBackAmount': instance.rewardAndCashBackAmount,
    };

_$_PassengerTypeQuantity _$$_PassengerTypeQuantityFromJson(
        Map<String, dynamic> json) =>
    _$_PassengerTypeQuantity(
      baseFare: json['baseFare'] == null
          ? null
          : BaseFare.fromJson(json['baseFare'] as Map<String, dynamic>),
      taxes: json['taxes'] == null
          ? null
          : BaseFare.fromJson(json['taxes'] as Map<String, dynamic>),
      totalFare: json['totalFare'] == null
          ? null
          : BaseFare.fromJson(json['totalFare'] as Map<String, dynamic>),
      expressFare: json['expressFare'] == null
          ? null
          : BaseFare.fromJson(json['expressFare'] as Map<String, dynamic>),
      code: json['code'] as String?,
      quantity: json['quantity'] as int?,
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
      amount: (json['amount'] as num?)?.toDouble(),
      currencyCode: json['currencyCode'] as String?,
      perPaxAmount: (json['perPaxAmount'] as num?)?.toDouble(),
      tax: (json['tax'] as List<dynamic>?)
          ?.map((e) => Tax.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BaseFareToJson(_$_BaseFare instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currencyCode': instance.currencyCode,
      'perPaxAmount': instance.perPaxAmount,
      'tax': instance.tax,
    };

_$_Tax _$$_TaxFromJson(Map<String, dynamic> json) => _$_Tax(
      amount: (json['amount'] as num?)?.toDouble(),
      currencyCode: json['currencyCode'] as String?,
      taxCode: json['taxCode'] as String?,
      taxDesc: json['taxDesc'] as String?,
      perPaxAmount: (json['perPaxAmount'] as num?)?.toDouble(),
      taxPercent: (json['taxPercent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_TaxToJson(_$_Tax instance) => <String, dynamic>{
      'amount': instance.amount,
      'currencyCode': instance.currencyCode,
      'taxCode': instance.taxCode,
      'taxDesc': instance.taxDesc,
      'perPaxAmount': instance.perPaxAmount,
      'taxPercent': instance.taxPercent,
    };

_$_TotalFare _$$_TotalFareFromJson(Map<String, dynamic> json) => _$_TotalFare(
      amount: (json['amount'] as num?)?.toDouble(),
      baseFare: (json['baseFare'] as num?)?.toDouble(),
      currencyCode: json['currencyCode'] as String?,
    );

Map<String, dynamic> _$$_TotalFareToJson(_$_TotalFare instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'baseFare': instance.baseFare,
      'currencyCode': instance.currencyCode,
    };

_$_TotalTax _$$_TotalTaxFromJson(Map<String, dynamic> json) => _$_TotalTax(
      amount: (json['amount'] as num?)?.toDouble(),
      currencyCode: json['currencyCode'] as String?,
      sgst: json['sgst'] == null
          ? null
          : Gst.fromJson(json['sgst'] as Map<String, dynamic>),
      cgst: json['cgst'] == null
          ? null
          : Gst.fromJson(json['cgst'] as Map<String, dynamic>),
      cgstPercent: (json['cgstPercent'] as num?)?.toDouble(),
      sgstPercent: (json['sgstPercent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_TotalTaxToJson(_$_TotalTax instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currencyCode': instance.currencyCode,
      'sgst': instance.sgst,
      'cgst': instance.cgst,
      'cgstPercent': instance.cgstPercent,
      'sgstPercent': instance.sgstPercent,
    };

_$_Gst _$$_GstFromJson(Map<String, dynamic> json) => _$_Gst(
      amount: (json['amount'] as num?)?.toDouble(),
      percentage: (json['percentage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_GstToJson(_$_Gst instance) => <String, dynamic>{
      'amount': instance.amount,
      'percentage': instance.percentage,
    };

_$_RescheduleCharges _$$_RescheduleChargesFromJson(Map<String, dynamic> json) =>
    _$_RescheduleCharges(
      originalBookingId: json['originalBookingId'] as int?,
      isReschedule: json['isReschedule'] as bool? ?? false,
      rescheduleAdultCharges:
          (json['rescheduleAdultCharges'] as num?)?.toDouble() ?? 0,
      rescheduleChildCharges:
          (json['rescheduleChildCharges'] as num?)?.toDouble() ?? 0,
      rescheduleInfantCharges:
          (json['rescheduleInfantCharges'] as num?)?.toDouble() ?? 0,
      rescheduleAdultChargesCGST:
          (json['rescheduleAdultChargesCGST'] as num?)?.toDouble() ?? 0,
      rescheduleChildChargesCGST:
          (json['rescheduleChildChargesCGST'] as num?)?.toDouble() ?? 0,
      rescheduleInfantChargesCGST:
          (json['rescheduleInfantChargesCGST'] as num?)?.toDouble() ?? 0,
      rescheduleAdultChargesSGST:
          (json['rescheduleAdultChargesSGST'] as num?)?.toDouble() ?? 0,
      rescheduleChildChargesSGST:
          (json['rescheduleChildChargesSGST'] as num?)?.toDouble() ?? 0,
      rescheduleInfantChargesSGST:
          (json['rescheduleInfantChargesSGST'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_RescheduleChargesToJson(
        _$_RescheduleCharges instance) =>
    <String, dynamic>{
      'originalBookingId': instance.originalBookingId,
      'isReschedule': instance.isReschedule,
      'rescheduleAdultCharges': instance.rescheduleAdultCharges,
      'rescheduleChildCharges': instance.rescheduleChildCharges,
      'rescheduleInfantCharges': instance.rescheduleInfantCharges,
      'rescheduleAdultChargesCGST': instance.rescheduleAdultChargesCGST,
      'rescheduleChildChargesCGST': instance.rescheduleChildChargesCGST,
      'rescheduleInfantChargesCGST': instance.rescheduleInfantChargesCGST,
      'rescheduleAdultChargesSGST': instance.rescheduleAdultChargesSGST,
      'rescheduleChildChargesSGST': instance.rescheduleChildChargesSGST,
      'rescheduleInfantChargesSGST': instance.rescheduleInfantChargesSGST,
    };

_$_PlacardInfo _$$_PlacardInfoFromJson(Map<String, dynamic> json) =>
    _$_PlacardInfo(
      salutationId: json['salutationId'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      countryDialCode: json['countryDialCode'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      specialInstruction: json['specialInstruction'] as String?,
      porterName: json['porterName'] as String?,
      baggageCount: json['baggageCount'] as int?,
    );

Map<String, dynamic> _$$_PlacardInfoToJson(_$_PlacardInfo instance) =>
    <String, dynamic>{
      'salutationId': instance.salutationId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'countryDialCode': instance.countryDialCode,
      'mobileNumber': instance.mobileNumber,
      'specialInstruction': instance.specialInstruction,
      'porterName': instance.porterName,
      'baggageCount': instance.baggageCount,
    };

_$_Traveler _$$_TravelerFromJson(Map<String, dynamic> json) => _$_Traveler(
      salutationId: json['salutationId'] as int?,
      salutationText: json['salutationText'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      age: json['age'] as int?,
      passengerTypeId: json['passengerTypeId'] as int?,
      passengerTypeCode: json['passengerTypeCode'],
      passengerTypeName: json['passengerTypeName'] as String?,
      spocPhone: json['spocPhone'] as String?,
      nationalityCountryId: json['nationalityCountryId'] as int?,
      nationalityCountryName: json['nationalityCountryName'] as String?,
      flyingClassId: json['flyingClassId'] as int?,
      flyingClassName: json['flyingClassName'] as String?,
      passengerId: json['passengerId'] as int?,
      passportNumber: json['passportNumber'] as String?,
      passengerStatus: json['passengerStatus'] as String?,
      passengerStatusId: json['passengerStatusId'] as int?,
      itemStatus: json['itemStatus'] == null
          ? null
          : Status.fromJson(json['itemStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TravelerToJson(_$_Traveler instance) =>
    <String, dynamic>{
      'salutationId': instance.salutationId,
      'salutationText': instance.salutationText,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'age': instance.age,
      'passengerTypeId': instance.passengerTypeId,
      'passengerTypeCode': instance.passengerTypeCode,
      'passengerTypeName': instance.passengerTypeName,
      'spocPhone': instance.spocPhone,
      'nationalityCountryId': instance.nationalityCountryId,
      'nationalityCountryName': instance.nationalityCountryName,
      'flyingClassId': instance.flyingClassId,
      'flyingClassName': instance.flyingClassName,
      'passengerId': instance.passengerId,
      'passportNumber': instance.passportNumber,
      'passengerStatus': instance.passengerStatus,
      'passengerStatusId': instance.passengerStatusId,
      'itemStatus': instance.itemStatus,
    };

_$_Status _$$_StatusFromJson(Map<String, dynamic> json) => _$_Status(
      statusHistory: (json['statusHistory'] as List<dynamic>?)
          ?.map((e) => StatusHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StatusToJson(_$_Status instance) => <String, dynamic>{
      'statusHistory': instance.statusHistory,
    };

_$_StatusHistory _$$_StatusHistoryFromJson(Map<String, dynamic> json) =>
    _$_StatusHistory(
      status: json['status'] as String?,
      modifiedOn: json['modifiedOn'] as String?,
      orderStatus: json['orderStatus'] as String?,
    );

Map<String, dynamic> _$$_StatusHistoryToJson(_$_StatusHistory instance) =>
    <String, dynamic>{
      'status': instance.status,
      'modifiedOn': instance.modifiedOn,
      'orderStatus': instance.orderStatus,
    };

_$_TripDetails _$$_TripDetailsFromJson(Map<String, dynamic> json) =>
    _$_TripDetails(
      tripBookingNumber: json['tripBookingNumber'] as String?,
      tripType: json['tripType'] as String?,
      travelSectorId: json['travelSectorId'] as int?,
      travelSector: json['travelSector'] as String?,
      serviceTypeId: json['serviceTypeId'] as int?,
      serviceType: json['serviceType'] as String?,
      originAirportId: json['originAirportId'] as int?,
      originAirport: json['originAirport'] as String?,
      destinationAirportId: json['destinationAirportId'] as int?,
      destinationAirport: json['destinationAirport'] as String?,
      serviceAirportId: json['serviceAirportId'] as int?,
      serviceAirport: json['serviceAirport'] as String?,
      serviceAirportName: json['serviceAirportName'] as String?,
      businessUnitId: json['businessUnitId'] as int?,
      serviceDateTime: json['serviceDateTime'] == null
          ? null
          : DateTime.parse(json['serviceDateTime'] as String),
      flightName: json['flightName'] as String?,
      flightNumber: json['flightNumber'] as String?,
      flightTerminal: json['flightTerminal'] as String?,
      flightDate: json['flightDate'] == null
          ? null
          : DateTime.parse(json['flightDate'] as String),
      flightTime: json['flightTime'] as String?,
      transitDestRoundTripSecOrigin:
          json['transitDestRoundTripSecOrigin'] as int?,
      transitRoundTripSecFlightName:
          json['transitRoundTripSecFlightName'] as String?,
      transitRoundTripSecFlightNumber:
          json['transitRoundTripSecFlightNumber'] as int?,
      transitRoundTripSecFlightTerminal:
          json['transitRoundTripSecFlightTerminal'] as String?,
      transitRoundTripSecFlightDate:
          json['transitRoundTripSecFlightDate'] as String?,
      transitRoundTripSecFlightTime:
          json['transitRoundTripSecFlightTime'] as String?,
      roundTripSecServiceDateTime:
          json['roundTripSecServiceDateTime'] as String?,
      userId: json['userId'] as String? ?? '',
      tripEndBy: json['tripEndBy'],
      tripStatus: json['tripStatus'] == null
          ? null
          : Status.fromJson(json['tripStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TripDetailsToJson(_$_TripDetails instance) =>
    <String, dynamic>{
      'tripBookingNumber': instance.tripBookingNumber,
      'tripType': instance.tripType,
      'travelSectorId': instance.travelSectorId,
      'travelSector': instance.travelSector,
      'serviceTypeId': instance.serviceTypeId,
      'serviceType': instance.serviceType,
      'originAirportId': instance.originAirportId,
      'originAirport': instance.originAirport,
      'destinationAirportId': instance.destinationAirportId,
      'destinationAirport': instance.destinationAirport,
      'serviceAirportId': instance.serviceAirportId,
      'serviceAirport': instance.serviceAirport,
      'serviceAirportName': instance.serviceAirportName,
      'businessUnitId': instance.businessUnitId,
      'serviceDateTime': instance.serviceDateTime?.toIso8601String(),
      'flightName': instance.flightName,
      'flightNumber': instance.flightNumber,
      'flightTerminal': instance.flightTerminal,
      'flightDate': instance.flightDate?.toIso8601String(),
      'flightTime': instance.flightTime,
      'transitDestRoundTripSecOrigin': instance.transitDestRoundTripSecOrigin,
      'transitRoundTripSecFlightName': instance.transitRoundTripSecFlightName,
      'transitRoundTripSecFlightNumber':
          instance.transitRoundTripSecFlightNumber,
      'transitRoundTripSecFlightTerminal':
          instance.transitRoundTripSecFlightTerminal,
      'transitRoundTripSecFlightDate': instance.transitRoundTripSecFlightDate,
      'transitRoundTripSecFlightTime': instance.transitRoundTripSecFlightTime,
      'roundTripSecServiceDateTime': instance.roundTripSecServiceDateTime,
      'userId': instance.userId,
      'tripEndBy': instance.tripEndBy,
      'tripStatus': instance.tripStatus,
    };
