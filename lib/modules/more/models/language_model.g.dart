// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageModel _$LanguageModelFromJson(Map<String, dynamic> json) =>
    LanguageModel(
      (json['languageOptions'] as List<dynamic>)
          .map((e) => LanguageOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LanguageModelToJson(LanguageModel instance) =>
    <String, dynamic>{
      'languageOptions': instance.languageOptions,
    };

LanguageOptions _$LanguageOptionsFromJson(Map<String, dynamic> json) =>
    LanguageOptions(
      json['languageTextOriginal'] as String,
      json['languageTextEnglish'] as String,
      json['languageCode'] as String,
    );

Map<String, dynamic> _$LanguageOptionsToJson(LanguageOptions instance) =>
    <String, dynamic>{
      'languageTextOriginal': instance.languageTextOriginal,
      'languageTextEnglish': instance.languageTextEnglish,
      'languageCode': instance.languageCode,
    };
