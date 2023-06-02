/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pranaam_master_data.freezed.dart';
part 'pranaam_master_data.g.dart';

// PranaamMasterData pranaamMasterDataFromJson(String str) =>
//     PranaamMasterData.fromJson(json.decode(str));

// String pranaamMasterDataToJson(PranaamMasterData data) =>
//     json.encode(data.toJson());

@Freezed(makeCollectionsUnmodifiable: false)
class PranaamMasterData with _$PranaamMasterData {
  const factory PranaamMasterData({
    @Default('') @JsonKey(name: 'uid') String uid,
    @Default('') @JsonKey(name: 'componentName') String componentName,
    @Default('') @JsonKey(name: 'dataSource') String dataSource,
    @Default(Params()) @JsonKey(name: 'params') Params params,
    @Default(Fields()) @JsonKey(name: 'fields') Fields fields,
  }) = _PranaamMasterData;

  factory PranaamMasterData.fromJson(Map<String, dynamic> json) =>
      _$PranaamMasterDataFromJson(json);
}

class PranaamBaseResponse {
  List<PranaamMasterData> pranaamBaseResponseItems;
  PranaamBaseResponse({
    required this.pranaamBaseResponseItems,
  });
  factory PranaamBaseResponse.parseJson(List<dynamic> json) {
    final List<PranaamMasterData> _parnamBaseResponseItem = [];
    for (int index = 0; index < json.length; index++) {
      _parnamBaseResponseItem.add(PranaamMasterData.fromJson(json[index]));
    }
    return PranaamBaseResponse(
      pranaamBaseResponseItems: _parnamBaseResponseItem,
    );
  }
}

// @Freezed(makeCollectionsUnmodifiable: false)
// class PranaamMasterDataaaa with _$PranaamMasterDataaaa {
//   const factory PranaamMasterDataaaa({
//     @Default('0') @JsonKey(name: 'name') String name,
//     @Default('0') @JsonKey(name: 'path') String path,
//     @Default([]) @JsonKey(name: 'elements') List<PranaamMasterData> elements,
//   }) = _PranaamMasterDataaaa;
//
//   factory PranaamMasterDataaaa.fromJson(Map<String, dynamic> json) =>
//       _$PranaamMasterDataaaaFromJson(json);
// }

@Freezed(makeCollectionsUnmodifiable: false)
class Fields with _$Fields {
  const factory Fields({
    @Default([]) @JsonKey(name: 'country') List<Country> country,
    @Default([]) @JsonKey(name: 'nationality') List<Nationality> nationality,
    @Default([])
    @JsonKey(name: 'bookingStatus')
        List<BookingStatus> bookingStatus,
    @Default([]) @JsonKey(name: 'flyingClass') List<BookingStatus> flyingClass,
    @Default([])
    @JsonKey(name: 'passengerType')
        List<BookingStatus> passengerType,
    @Default([]) @JsonKey(name: 'serviceType') List<BookingStatus> serviceType,
    @Default([]) @JsonKey(name: 'salutation') List<Salutation> salutation,
    @Default([]) @JsonKey(name: 'state') List<State> state,
    @Default([])
    @JsonKey(name: 'travelSector')
        List<BookingStatus> travelSector,
  }) = _Fields;

  factory Fields.fromJson(Map<String, dynamic> json) => _$FieldsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class BookingStatus with _$BookingStatus {
  const factory BookingStatus({
    @Default('') @JsonKey(name: 'label') String label,
    @Default('') @JsonKey(name: 'order') String order,
    @Default('') @JsonKey(name: 'id') String id,
    @Default('') @JsonKey(name: 'isTransit') String isTransit,
  }) = _BookingStatus;

  factory BookingStatus.fromJson(Map<String, dynamic> json) =>
      _$BookingStatusFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Country with _$Country {
  const factory Country({
    @Default('') @JsonKey(name: 'countryName') String countryName,
    @Default('') @JsonKey(name: 'dialCode') String dialCode,
    @Default('') @JsonKey(name: 'isO3') String isO3,
    @Default('') @JsonKey(name: 'isO2') String isO2,
    @Default('') @JsonKey(name: 'currencyName') String currencyName,
    @Default('') @JsonKey(name: 'currencyCode') String currencyCode,
    @Default('') @JsonKey(name: 'untermEnglish') String untermEnglish,
    @Default('') @JsonKey(name: 'regionName') String regionName,
    @Default('') @JsonKey(name: 'capital') String capital,
    @Default('') @JsonKey(name: 'continent') String continent,
    @Default('') @JsonKey(name: 'tld') String tld,
    @Default('') @JsonKey(name: 'languages') String languages,
    @Default(false) @JsonKey(name: 'isDeleted') bool isDeleted,
    @Default('') @JsonKey(name: 'id') String id,
    @Default('') @JsonKey(name: 'countryFlagImage') String countryFlagImage,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Nationality with _$Nationality {
  const factory Nationality({
    @Default('') @JsonKey(name: 'countryName') String countryName,
    @Default('') @JsonKey(name: 'nationality') String nationality,
    @Default('') @JsonKey(name: 'countryFlagImage') String countryFlagImage,
  }) = _Nationality;

  factory Nationality.fromJson(Map<String, dynamic> json) =>
      _$NationalityFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Salutation with _$Salutation {
  const factory Salutation({
    @Default('') @JsonKey(name: 'label') String label,
    @Default('') @JsonKey(name: 'order') String order,
    @Default('') @JsonKey(name: 'id') String id,
    @Default('') @JsonKey(name: 'isAdult') String isAdult,
    @Default('') @JsonKey(name: 'isChild') String isChild,
    @Default('') @JsonKey(name: 'isInfant') String isInfant,
  }) = _Salutation;

  factory Salutation.fromJson(Map<String, dynamic> json) =>
      _$SalutationFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class State with _$State {
  const factory State({
    @Default('') @JsonKey(name: 'id') String id,
    @Default('') @JsonKey(name: 'stateImport') String stateImport,
    @Default('') @JsonKey(name: 'name') String name,
    @Default('') @JsonKey(name: 'countryMaster') String countryMaster,
    @Default('') @JsonKey(name: 'countryCode') String countryCode,
    @Default('') @JsonKey(name: 'stateCode') String stateCode,
    @Default('') @JsonKey(name: 'latitude') String latitude,
    @Default('') @JsonKey(name: 'longitude') String longitude,
  }) = _State;

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Params with _$Params {
  const factory Params() = _Params;

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
}
