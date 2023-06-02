/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class SosRequestModel {
  String? orderReferenceId;
  String? latitude;
  String? longitude;

  SosRequestModel({
    this.orderReferenceId,
    this.latitude,
    this.longitude,
  });

  SosRequestModel.fromJson(Map<String, dynamic> json) {
    orderReferenceId = json['orderReferenceId'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderReferenceId'] = orderReferenceId;
    data['latitude'] = latitude;
    data['longitude'] = longitude;

    return data;
  }
}

class Location {
  String? latitude;
  String? longitude;

  Location({
    this.latitude,
    this.longitude,
  });

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;

    return data;
  }
}
