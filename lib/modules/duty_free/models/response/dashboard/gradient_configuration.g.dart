// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gradient_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GradientConfiguration _$$_GradientConfigurationFromJson(
        Map<String, dynamic> json) =>
    _$_GradientConfiguration(
      gradientColors: (json['gradientColors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      gradientBegin: json['gradientBegin'] as String? ?? '',
      gradientEnd: json['gradientEnd'] as String? ?? '',
    );

Map<String, dynamic> _$$_GradientConfigurationToJson(
        _$_GradientConfiguration instance) =>
    <String, dynamic>{
      'gradientColors': instance.gradientColors,
      'gradientBegin': instance.gradientBegin,
      'gradientEnd': instance.gradientEnd,
    };
