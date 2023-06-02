/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/city_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/country_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/state_prov_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

///
///
///supporting model for creating request json for Create booking api.
///this models have following parameters
/// addressLine_1 data type String default value is '',
/// addressLine_2 data type String default value is '',
/// pinCode data type String default value is '',
/// countryDetails data type CountryModel default value is CountryModel(),
/// cityDetails data type CityModel default value is CityModel(),
/// stateDetails data type StateProvModel default value is StateProvModel(),
///
///

@Freezed(makeCollectionsUnmodifiable: false)
class AddressModel with _$AddressModel {
  @JsonSerializable(explicitToJson: true)
  const factory AddressModel({
    @Default('') @JsonKey(name: 'addressLine1') String addressLine_1,
    @Default('') @JsonKey(name: 'addressLine2') String addressLine_2,
    @Default('') @JsonKey(name: 'postalCode') String pinCode,
    @Default(CountryModel())
    @JsonKey(name: 'country')
        CountryModel countryDetails,
    @Default(CityModel()) @JsonKey(name: 'city') CityModel cityDetails,
    @Default(StateProvModel())
    @JsonKey(name: 'stateProv')
        StateProvModel stateDetails,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
