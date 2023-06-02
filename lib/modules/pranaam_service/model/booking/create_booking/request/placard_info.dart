/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/person_name_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'placard_info.freezed.dart';
part 'placard_info.g.dart';

///
///
///supporting model for creating request json for Create booking api.
///this models have following parameters
/// personName data type PersonNameModel default value is PersonNameModel(),
/// countryDialCode data type String default value is '91',
/// mobileNumber data type String default value is '9999999999',
/// specialInstruction data type String default value is 'Test Special Instruction',
/// porterName data type String default value is 'Porter Name',
/// baggageCount data type Integer default value is 0,
///
///

@Freezed(makeCollectionsUnmodifiable: false)
class PlacardInfo with _$PlacardInfo {
  @JsonSerializable(explicitToJson: true)
  const factory PlacardInfo({
    @Default(PersonNameModel())
    @JsonKey(name: 'personName')
        PersonNameModel personName,
    @Default('') @JsonKey(name: 'countryDialCode') String countryDialCode,
    @Default('') @JsonKey(name: 'mobileNumber') String mobileNumber,
    @Default('') @JsonKey(name: 'specialInstruction') String specialInstruction,
    @Default('') @JsonKey(name: 'porterName') String porterName,
    @Default(0) @JsonKey(name: 'baggageCount') int baggageCount,
  }) = _PlacardInfo;

  factory PlacardInfo.fromJson(Map<String, dynamic> json) =>
      _$PlacardInfoFromJson(json);
}
