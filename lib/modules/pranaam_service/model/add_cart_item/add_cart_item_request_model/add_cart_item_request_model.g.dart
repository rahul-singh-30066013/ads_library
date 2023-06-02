// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cart_item_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddCartItemRequestModel _$$_AddCartItemRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_AddCartItemRequestModel(
      travelSectorId: json['travelSectorId'] as int,
      serviceTypeId: json['serviceTypeId'] as int,
      serviceType: json['serviceType'] as String,
      travelSector: json['travelSector'] as String,
      pranaamBookingType: json['PranaamBookingType'] as String,
      oldBookingId: json['OldBookingId'] as int? ?? 0,
      oldBookingReferenceId: json['OldBookingReferenceId'] as String? ?? '',
      cartNumber: json['cartNumber'] as String? ?? '',
      adultCount: json['adultCount'] as int? ?? 0,
      childCount: json['childCount'] as int? ?? 0,
      infantCount: json['infantCount'] as int? ?? 0,
      createdBy: json['createdBy'] as String? ?? '',
      packageDetail: json['packageDetail'] == null
          ? null
          : PackageDetail.fromJson(
              json['packageDetail'] as Map<String, dynamic>),
      tripDetail:
          TripDetail.fromJson(json['tripDetail'] as Map<String, dynamic>),
      standaloneProductDetails: json['standaloneProductDetails'] == null
          ? null
          : StandaloneProductDetails.fromJson(
              json['standaloneProductDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AddCartItemRequestModelToJson(
        _$_AddCartItemRequestModel instance) =>
    <String, dynamic>{
      'travelSectorId': instance.travelSectorId,
      'serviceTypeId': instance.serviceTypeId,
      'serviceType': instance.serviceType,
      'travelSector': instance.travelSector,
      'PranaamBookingType': instance.pranaamBookingType,
      'OldBookingId': instance.oldBookingId,
      'OldBookingReferenceId': instance.oldBookingReferenceId,
      'cartNumber': instance.cartNumber,
      'adultCount': instance.adultCount,
      'childCount': instance.childCount,
      'infantCount': instance.infantCount,
      'createdBy': instance.createdBy,
      'packageDetail': instance.packageDetail,
      'tripDetail': instance.tripDetail,
      'standaloneProductDetails': instance.standaloneProductDetails,
    };

_$_StandaloneProductDetails _$$_StandaloneProductDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_StandaloneProductDetails(
      pricingInfo: json['pricingInfo'] == null
          ? const PricingInfo()
          : PricingInfo.fromJson(json['pricingInfo'] as Map<String, dynamic>),
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      itemCount: json['itemCount'] as int? ?? 0,
    );

Map<String, dynamic> _$$_StandaloneProductDetailsToJson(
        _$_StandaloneProductDetails instance) =>
    <String, dynamic>{
      'pricingInfo': instance.pricingInfo,
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'itemCount': instance.itemCount,
    };
