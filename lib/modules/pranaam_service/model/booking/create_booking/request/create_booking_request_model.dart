/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/billing_info.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/placard_info.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/travellers_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_booking_request_model.freezed.dart';
part 'create_booking_request_model.g.dart';

///
///
///Model for creating request json for Create booking api.
///this models have following parameters
/// travelSectorId data type Integer default value is 0,
/// serviceTypeId data type Integer default value is 0,
/// bookedOn data type String default value is '',
/// createdBy data type Integer default value is 0,
/// numberOfAdult data type Integer default value is 0,
/// numberOfInfant data type Integer default value is 0,
/// numberOfChild data type Integer default value is 0,
/// superAppCustomerId data type Integer default value is 0,
/// bookingStatusId data type Integer default value is 0,
/// packageId data type Integer default value is 0,
/// totalPrice data type Integer default value is 0,
/// tripDetail data type TripDetails default value is TripDetails(),
/// travellers data type TravellersModel default value is TravellersModel(),
/// placardInfo data type PlacardInfo default value is PlacardInfo(),
/// billingInfo data type BillingInfo default value is BillingInfo(),
/// addOnsList data type AddOnsListModel default value is AddOnsListModel(),
///
///

@Freezed(makeCollectionsUnmodifiable: false)
class CreateBookingRequestModel with _$CreateBookingRequestModel {
  @JsonSerializable(explicitToJson: true)
  const factory CreateBookingRequestModel({
    @Default('0') @JsonKey(name: 'cartId') String cartId,
    @Default('0') @JsonKey(name: 'BookingStatus') String bookingStatusId,
    @Default('0') @JsonKey(name: 'bookedOn') String bookedOn,
    @Default(false) @JsonKey(name: 'IsGSTEnable') bool isGSTEnable,
    @Default([]) @JsonKey(name: 'travelers') List<TravellersModel> travellers,
    @JsonKey(name: 'placardInfo') PlacardInfo? placardInfo,
    @JsonKey(name: 'billingInfo') BillingInfo? billingInfo,
  }) = _CreateBookingRequestModel;

  factory CreateBookingRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateBookingRequestModelFromJson(json);
}
