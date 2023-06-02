/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'salute_count_response_model.freezed.dart';
part 'salute_count_response_model.g.dart';

SaluteCountResponseModel saluteCountResponseModelFromJson(String str) => SaluteCountResponseModel.fromJson(json.decode(str));

String saluteCountResponseModelToJson(SaluteCountResponseModel data) => json.encode(data.toJson());

@Freezed(makeCollectionsUnmodifiable: false)
class SaluteCountResponseModel with _$SaluteCountResponseModel {
  const factory SaluteCountResponseModel({
    int? counter,
    String? campaignId,
  }) = _SaluteCountResponseModel;

  factory SaluteCountResponseModel.fromJson(Map<String, dynamic> json) => _$SaluteCountResponseModelFromJson(json);
}
