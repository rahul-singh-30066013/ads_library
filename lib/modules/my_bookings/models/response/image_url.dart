/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_url.g.dart';

@JsonSerializable()
class ImageUrl {
  String? packageId;
  String? imagePath;
  dynamic addOnServices;

  ImageUrl();

  factory ImageUrl.fromJson(Map<String, dynamic> json) =>
      _$ImageUrlFromJson(json);

  Map<String, dynamic> toJson() => _$ImageUrlToJson(this);
}
