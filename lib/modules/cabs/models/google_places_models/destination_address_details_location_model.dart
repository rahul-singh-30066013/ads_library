/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'destination_address_details_location_model.freezed.dart';

part 'destination_address_details_location_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DestinationAddressDetailsLocationModel
    with _$DestinationAddressDetailsLocationModel {
  const factory DestinationAddressDetailsLocationModel({
    AddressDetailModel? result,
    List<AddressDetailModel>? results,
    String? status,
  }) = _DestinationAddressDetailsLocationModel;

  factory DestinationAddressDetailsLocationModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DestinationAddressDetailsLocationModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class AddressDetailModel with _$AddressDetailModel {
  const factory AddressDetailModel({
    String? formattedAddress,
    Geometry? geometry,
    String? name,
    String? placeId,
    @JsonKey(name: 'address_components')
        List<AddressComponent>? addressComponents,
    @JsonKey(name: 'postcode_localities') List<String>? postcodeLocalities,
  }) = _AddressDetailModel;

  factory AddressDetailModel.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailModelFromJson(json);
}

@freezed
class AddressComponent with _$AddressComponent {
  const factory AddressComponent({
    @JsonKey(name: 'long_name') String? longName,
    @JsonKey(name: 'short_name') String? shortName,
    List<String?>? types,
  }) = _AddressComponent;

  factory AddressComponent.fromJson(Map<String, dynamic> json) =>
      _$AddressComponentFromJson(json);
}

class Geometry {
  Location? location;

  Geometry({
    this.location,
  });

  Geometry.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location?.toJson();
    }
    return data;
  }
}

class Location {
  double? lat;
  double? lng;

  Location({this.lat, this.lng});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}