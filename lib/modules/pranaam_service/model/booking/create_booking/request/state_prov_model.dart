/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_prov_model.freezed.dart';
part 'state_prov_model.g.dart';

///
///
///supporting model for creating request json for Create booking api.
///this models have following parameters
/// stateCode data type Integer default value is 0,
/// stateName data type String default value is 'Delhi',
///
///

@Freezed(makeCollectionsUnmodifiable: false)
class StateProvModel with _$StateProvModel {
  @JsonSerializable(explicitToJson: true)
  const factory StateProvModel({
    @Default(0) @JsonKey(name: 'stateCode') int stateCode,
    @Default('') @JsonKey(name: 'stateName') String stateName,
  }) = _StateProvModel;

  factory StateProvModel.fromJson(Map<String, dynamic> json) =>
      _$StateProvModelFromJson(json);
}
