/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class DestinationAddressDetailsModel {
  AddressDetailModel? result;
  String? status;

  DestinationAddressDetailsModel({this.result, this.status});

  DestinationAddressDetailsModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null
        ? AddressDetailModel.fromJson(json['result'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class AddressDetailModel {
  String? formattedAddress;
  Geometry? geometry;
  String? name;
  String? placeId;

  AddressDetailModel({
    this.formattedAddress,
    this.geometry,
    this.name,
    this.placeId,
  });

  AddressDetailModel.fromJson(Map<String, dynamic> json) {
    formattedAddress = json['formatted_address'];
    geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    name = json['name'];
    placeId = json['place_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['formatted_address'] = formattedAddress;
    if (geometry != null) {
      data['geometry'] = geometry?.toJson();
    }
    data['name'] = name;
    data['place_id'] = placeId;
    return data;
  }
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
