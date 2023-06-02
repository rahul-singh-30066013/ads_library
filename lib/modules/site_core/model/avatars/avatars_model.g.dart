// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatars_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AvatarsModel _$$_AvatarsModelFromJson(Map<String, dynamic> json) =>
    _$_AvatarsModel(
      count: json['count'] as int? ?? 0,
      result: (json['result'] as List<dynamic>?)
              ?.map((e) => Avatar.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_AvatarsModelToJson(_$_AvatarsModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'result': instance.result,
    };

_$_Avatar _$$_AvatarFromJson(Map<String, dynamic> json) => _$_Avatar(
      avatarID: json['avatarID'] as String? ?? '',
      avatarInclude: json['avatarInclude'] as bool? ?? false,
      avatarImage: json['avatarImage'] as String? ?? '',
    );

Map<String, dynamic> _$$_AvatarToJson(_$_Avatar instance) => <String, dynamic>{
      'avatarID': instance.avatarID,
      'avatarInclude': instance.avatarInclude,
      'avatarImage': instance.avatarImage,
    };
