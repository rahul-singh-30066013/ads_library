/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
class SearchCabRequestModel {
  LocationDetails? pickupDetails;
  LocationDetails? dropDetails;
  String? tripType;
  int? tripDistance;
  List<String>? preferredVendor;
  bool isRideNow;
  bool isCityToAirport;

  SearchCabRequestModel({
    this.pickupDetails,
    this.dropDetails,
    this.tripType,
    this.tripDistance,
    this.preferredVendor,
    required this.isRideNow,
    required this.isCityToAirport,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pickupDetails != null) {
      data['pickupDetails'] = pickupDetails?.toJson();
    }
    if (dropDetails != null) {
      data['dropDetails'] = dropDetails?.toJson();
    }
    data['tripType'] = tripType;
    data['tripDistance'] = tripDistance;
    data['preferredVendor'] = preferredVendor;
    data['isRideNow'] = isRideNow;
    data['isCityToAirport'] = isCityToAirport;
    return data;
  }
}

class LocationDetails {
  int? tripDateTime;
  String? locationCode;
  String? cityCode;
  String? cityName;
  String? latitude;
  String? longitude;
  String? placeId;
  String? driverLatitude;
  String? driverLongitude;
  int? driverReachedDateTime;
  bool? isDriverReached;

  LocationDetails({
    this.tripDateTime,
    this.locationCode,
    this.cityCode,
    this.cityName,
    this.latitude,
    this.longitude,
    this.placeId,
    this.driverLatitude,
    this.driverLongitude,
    this.driverReachedDateTime,
    this.isDriverReached,
  });

  LocationDetails.fromJson(Map<String, dynamic> json) {
    tripDateTime = json['tripDateTime'];
    locationCode = json['locationCode'];
    cityCode = json['cityCode'];
    cityName = json['cityName'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    placeId = json['placeId'];
    driverLatitude = json['driverLatitude'];
    driverLongitude = json['driverLongitude'];
    driverReachedDateTime = json['driverReachedDateTime'];
    isDriverReached = json['isDriverReached'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tripDateTime'] = tripDateTime;
    data['locationCode'] = locationCode;
    data['cityCode'] = cityCode;
    data['cityName'] = cityName;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['placeId'] = placeId;
    data['driverLatitude'] = driverLatitude;
    data['driverLongitude'] = driverLongitude;
    if (driverReachedDateTime != null) {
      data['driverReachedDateTime'] = driverReachedDateTime;
    }
    if (isDriverReached != null) {
      data['isDriverReached'] = isDriverReached;
    }
    return data;
  }
}
