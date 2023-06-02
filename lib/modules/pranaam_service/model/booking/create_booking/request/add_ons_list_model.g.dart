// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_ons_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddOnsListModel _$$_AddOnsListModelFromJson(Map<String, dynamic> json) =>
    _$_AddOnsListModel(
      addOnServiceId: json['addOnServiceId'] as int? ?? 0,
      unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0,
      quantity: json['quantity'] as int? ?? 0,
      serviceName: json['serviceName'] as String? ?? '',
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0,
      baseTotalPrice: (json['baseTotalPrice'] as num?)?.toDouble() ?? 0,
      cgst: (json['cgst'] as num?)?.toDouble() ?? 0,
      sgst: (json['sgst'] as num?)?.toDouble() ?? 0,
      totalAddOnTax: (json['totalAddOnTax'] as num?)?.toDouble() ?? 0,
      addOnImage: json['addOnImage'] as String? ?? '',
    );

Map<String, dynamic> _$$_AddOnsListModelToJson(_$_AddOnsListModel instance) =>
    <String, dynamic>{
      'addOnServiceId': instance.addOnServiceId,
      'unitPrice': instance.unitPrice,
      'quantity': instance.quantity,
      'serviceName': instance.serviceName,
      'totalPrice': instance.totalPrice,
      'baseTotalPrice': instance.baseTotalPrice,
      'cgst': instance.cgst,
      'sgst': instance.sgst,
      'totalAddOnTax': instance.totalAddOnTax,
      'addOnImage': instance.addOnImage,
    };
