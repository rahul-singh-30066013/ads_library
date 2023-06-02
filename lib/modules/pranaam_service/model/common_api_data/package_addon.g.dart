// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_addon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PackageAddOn _$$_PackageAddOnFromJson(Map<String, dynamic> json) =>
    _$_PackageAddOn(
      id: json['id'] as int? ?? 0,
      packageId: json['packageId'] as int? ?? 0,
      addOnServiceId: json['addOnServiceId'] as int? ?? 0,
      addOnServiceName: json['addOnServiceName'] as String? ?? '',
      addOnImage: json['addOnImage'] as String?,
      addOnServiceDescription: json['addOnServiceDescription'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      basePrice: (json['basePrice'] as num?)?.toDouble() ?? 0,
      qty: json['qty'] as int? ?? 0,
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_PackageAddOnToJson(_$_PackageAddOn instance) =>
    <String, dynamic>{
      'id': instance.id,
      'packageId': instance.packageId,
      'addOnServiceId': instance.addOnServiceId,
      'addOnServiceName': instance.addOnServiceName,
      'addOnImage': instance.addOnImage,
      'addOnServiceDescription': instance.addOnServiceDescription,
      'price': instance.price,
      'basePrice': instance.basePrice,
      'qty': instance.qty,
      'totalPrice': instance.totalPrice,
    };
