/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/city_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/country_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/state_prov_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'billing_gst_in_model.freezed.dart';
part 'billing_gst_in_model.g.dart';

///
///
///supporting model for creating request json for Create booking api.
///this models have following parameters
/// gstNumber data type String default value is 'Test123',
/// gstName data type String default value is 'Test GST Name',
/// mobileNumber data type String default value is '9999999999',
/// emailId data type String default value is 'test@test.com',
/// address data type String default value is 'Delhi, India',
/// pinCode data type String default value is '110001',
/// countryDetails data type CountryModel default value is CountryModel(),
/// cityDetails data type CityModel default value is CityModel(),
/// stateDetails data type StateProvModel default value is StateProvModel(),
///
///

@Freezed(makeCollectionsUnmodifiable: false)
class BillingGstInModel with _$BillingGstInModel {
  @JsonSerializable(explicitToJson: true)
  const factory BillingGstInModel({
    @Default('') @JsonKey(name: 'gstNumber') String gstNumber,
    @Default('') @JsonKey(name: 'name') String gstName,
    @Default('') @JsonKey(name: 'mobileNumber') String mobileNumber,
    @Default('') @JsonKey(name: 'email') String emailId,
    @Default('') @JsonKey(name: 'address') String address,
    @Default(0) @JsonKey(name: 'pinCode') int pinCode,
    @Default(CountryModel())
    @JsonKey(name: 'country')
        CountryModel countryDetails,
    @Default(CityModel()) @JsonKey(name: 'city') CityModel cityDetails,
    @Default(StateProvModel())
    @JsonKey(name: 'stateProv')
        StateProvModel stateDetails,
  }) = _BillingGstInModel;

  factory BillingGstInModel.fromJson(Map<String, dynamic> json) =>
      _$BillingGstInModelFromJson(json);
}
