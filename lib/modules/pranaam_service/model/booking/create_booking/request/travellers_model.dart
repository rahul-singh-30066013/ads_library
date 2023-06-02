/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/country_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/person_name_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travellers_model.freezed.dart';
part 'travellers_model.g.dart';

///
///
///supporting model for creating request json for Create booking api.
///this models have following parameters
/// personName data type PersonNameModel default value is PersonNameModel(),
/// countryDetails data type CountryModel default value is CountryModel(),
/// travellersAge data type Integer default value is 0,
/// passengerTypeId data type Integer default value is 0,
/// passengerTypeCode data type String default value is 'ADT',
/// spocPhone data type String default value is '9999999999',
/// flyingClassId data type Integer default value is 0,
/// flyingClass data type String default value is 'First',
///
///

@Freezed(makeCollectionsUnmodifiable: false)
class TravellersModel with _$TravellersModel {
  @JsonSerializable(explicitToJson: true)
  const factory TravellersModel({
    @Default(PersonNameModel())
    @JsonKey(name: 'personName')
        PersonNameModel personName,
    @Default(CountryModel())
    @JsonKey(name: 'country')
        CountryModel countryDetails,
    @Default(0) @JsonKey(name: 'age') int? travellersAge,
    @Default(0) @JsonKey(name: 'passengerTypeID') int? passengerTypeId,
    @JsonKey(name: 'passportNumber') String? passportNumber,
    @JsonKey(name: 'passengerStatus') String? passengerStatus,
    @JsonKey(name: 'passengerTypeName') String? passengerTypeName,
    @JsonKey(name: 'passengerTypeCode') String? passengerTypeCode,
    @Default('') @JsonKey(name: 'spocPhone') String spocPhone,
    @JsonKey(name: 'flyingClassId') int? flyingClassId,
    @JsonKey(name: 'flyingClass') String? flyingClass,
    @JsonKey(name: 'flyingClassName') String? flyingClassName,
    @Default(0) @JsonKey(name: 'passengerId') int? passengerId,
    @Default('') @JsonKey(name: 'email') String? email,
  }) = _TravellersModel;

  factory TravellersModel.fromJson(Map<String, dynamic> json) =>
      _$TravellersModelFromJson(json);
}
