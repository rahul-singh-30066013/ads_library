// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'param_package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParamPackageModel _$ParamPackageModelFromJson(Map<String, dynamic> json) =>
    ParamPackageModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ParamPackageModelToJson(ParamPackageModel instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      icon: json['icon'] as String?,
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      price: json['price'] as int?,
      guestType: json['guestType'] as String?,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'icon': instance.icon,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'price': instance.price,
      'guestType': instance.guestType,
    };
