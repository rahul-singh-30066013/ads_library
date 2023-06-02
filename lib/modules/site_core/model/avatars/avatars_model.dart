/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'avatars_model.freezed.dart';
part 'avatars_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class AvatarsModel with _$AvatarsModel {
  const factory AvatarsModel({
    @Default(0)  int count,
    @Default([]) List<Avatar> result,
  }) = _AvatarsModel;

  factory AvatarsModel.fromJson(Map<String, dynamic> json) =>
      _$AvatarsModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Avatar with _$Avatar {
  const factory Avatar({
    @Default('') String avatarID,
    @Default(false) bool avatarInclude,
    @Default('') String avatarImage,
}) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}
