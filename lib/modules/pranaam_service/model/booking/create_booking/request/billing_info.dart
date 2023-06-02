/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/address_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/billing_gst_in_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/person_name_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'billing_info.freezed.dart';
part 'billing_info.g.dart';

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
class BillingInfo with _$BillingInfo {
  @JsonSerializable(explicitToJson: true)
  const factory BillingInfo({
    @Default(PersonNameModel())
    @JsonKey(name: 'personName')
        PersonNameModel personName,
    @Default('') @JsonKey(name: 'countryDialCode') String countryDialCode,
    @Default('') @JsonKey(name: 'mobile') String mobileNumber,
    @Default('') @JsonKey(name: 'birthDate') String birthDate,
    @Default(' ') @JsonKey(name: 'email') String emailId,
    @Default(AddressModel())
    @JsonKey(name: 'address')
        AddressModel addressModel,
    @Default(BillingGstInModel())
    @JsonKey(name: 'billingGSTIN')
        BillingGstInModel billingGstInModel,
  }) = _BillingInfo;

  factory BillingInfo.fromJson(Map<String, dynamic> json) =>
      _$BillingInfoFromJson(json);
}
