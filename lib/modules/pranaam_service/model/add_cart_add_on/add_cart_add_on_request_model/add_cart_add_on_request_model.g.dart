// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cart_add_on_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddCartAddOnRequestModel _$$_AddCartAddOnRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_AddCartAddOnRequestModel(
      packageId: json['packageId'] as int?,
      serviceName: json['serviceName'] as String,
      serviceDescription: json['serviceDescription'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      addOnServiceId: json['addOnServiceId'] as int,
    );

Map<String, dynamic> _$$_AddCartAddOnRequestModelToJson(
        _$_AddCartAddOnRequestModel instance) =>
    <String, dynamic>{
      'packageId': instance.packageId,
      'serviceName': instance.serviceName,
      'serviceDescription': instance.serviceDescription,
      'price': instance.price,
      'quantity': instance.quantity,
      'addOnServiceId': instance.addOnServiceId,
    };
