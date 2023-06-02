// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_item_colors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubItemColors _$$_SubItemColorsFromJson(Map<String, dynamic> json) =>
    _$_SubItemColors(
      titleColor: json['titleColor'] as String? ?? '0xffffffff',
      subTitleColor: json['subTitleColor'] as String? ?? '0xffffffff',
      descriptionColor: json['descriptionColor'] as String? ?? '0xffffffff',
      ctaColor: json['ctaColor'] as String? ?? '0xffffffff',
      backGroundColor: json['backGroundColor'] as String? ?? '',
    );

Map<String, dynamic> _$$_SubItemColorsToJson(_$_SubItemColors instance) =>
    <String, dynamic>{
      'titleColor': instance.titleColor,
      'subTitleColor': instance.subTitleColor,
      'descriptionColor': instance.descriptionColor,
      'ctaColor': instance.ctaColor,
      'backGroundColor': instance.backGroundColor,
    };
