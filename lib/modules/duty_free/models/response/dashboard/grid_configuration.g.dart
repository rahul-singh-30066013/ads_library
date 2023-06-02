// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GridConfiguration _$$_GridConfigurationFromJson(Map<String, dynamic> json) =>
    _$_GridConfiguration(
      crossAxisSpacing: (json['crossAxisSpacing'] as num?)?.toDouble() ?? 0,
      mainAxisSpacing: (json['mainAxisSpacing'] as num?)?.toDouble() ?? 0,
      itemVisibility: (json['itemVisibility'] as num?)?.toDouble() ?? 1,
      horizontalGrid: json['horizontalGrid'] as bool? ?? false,
    );

Map<String, dynamic> _$$_GridConfigurationToJson(
        _$_GridConfiguration instance) =>
    <String, dynamic>{
      'crossAxisSpacing': instance.crossAxisSpacing,
      'mainAxisSpacing': instance.mainAxisSpacing,
      'itemVisibility': instance.itemVisibility,
      'horizontalGrid': instance.horizontalGrid,
    };
