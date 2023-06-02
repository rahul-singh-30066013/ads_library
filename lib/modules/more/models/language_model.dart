/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'language_model.g.dart';

///This is the model class for Language screen
///As per the language json this model is made
///JsonSerializable is used to provide the automatic conversion of json

@JsonSerializable()
class LanguageModel {
  List<LanguageOptions> languageOptions;

  LanguageModel(this.languageOptions);

  factory LanguageModel.fromJson(Map<String, dynamic> data) {
    return _$LanguageModelFromJson(data);
  }

  Map<String, dynamic> toJson() => _$LanguageModelToJson(this);
}

@JsonSerializable()
class LanguageOptions {
  String languageTextOriginal;
  String languageTextEnglish;
  String languageCode;

  LanguageOptions(
    this.languageTextOriginal,
    this.languageTextEnglish,
    this.languageCode,
  );

  factory LanguageOptions.fromJson(Map<String, dynamic> data) =>
      _$LanguageOptionsFromJson(data);

  Map<String, dynamic> toJson() => _$LanguageOptionsToJson(this);

  @override
  String toString() => json.encode(toJson());
}
