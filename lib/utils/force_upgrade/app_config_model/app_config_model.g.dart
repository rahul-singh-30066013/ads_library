// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfigModel _$AppConfigModelFromJson(Map<String, dynamic> json) =>
    AppConfigModel(
      json['isForceUpgrade'] as bool,
      json['appVersion'] as String,
      json['iosLink'] as String,
      json['androidLink'] as String,
      json['title'] as String,
      json['message'] as String,
      json['actionTitle'] as String,
      json['cancelTitle'] as String,
      json['isMaintenance'] as bool,
    );

Map<String, dynamic> _$AppConfigModelToJson(AppConfigModel instance) =>
    <String, dynamic>{
      'appVersion': instance.appVersion,
      'isForceUpgrade': instance.isForceUpgrade,
      'isMaintenance': instance.isMaintenance,
      'iosLink': instance.iosLink,
      'androidLink': instance.androidLink,
      'title': instance.title,
      'message': instance.message,
      'actionTitle': instance.actionTitle,
      'cancelTitle': instance.cancelTitle,
    };
