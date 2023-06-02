/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_name_model.freezed.dart';
part 'person_name_model.g.dart';

///
///
///supporting model for creating request json for Create booking api.
///this models have following parameters
/// personName data type PersonNameModel default value is PersonNameModel(),
/// countryDialCode data type String default value is '91',
/// mobileNumber data type String default value is '9999999999',
/// birthDate data type String default value is '1981-01-27',
/// emailId data type String default value is 'test@test.com',
///
///

@Freezed(makeCollectionsUnmodifiable: false)
class PersonNameModel with _$PersonNameModel {
  @JsonSerializable(explicitToJson: true)
  const factory PersonNameModel({
    @Default(0) @JsonKey(name: 'salutationId') int salutationId,
    @Default('') @JsonKey(name: 'salutationText') String salutationText,
    @Default('') @JsonKey(name: 'firstName') String firstName,
    @Default('') @JsonKey(name: 'lastName') String lastName,
  }) = _PersonNameModel;

  factory PersonNameModel.fromJson(Map<String, dynamic> json) =>
      _$PersonNameModelFromJson(json);
}
