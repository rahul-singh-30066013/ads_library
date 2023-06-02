/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';

class FilteredVendorDataResponseModel {
  Result? result;

  FilteredVendorDataResponseModel({this.result});

  FilteredVendorDataResponseModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.toJson();
    }
    return data;
  }
}

class Result {
  String? vendorName;
  String? airportName;
  String? cityName;
  String? terminalName;
  String? gate;
  String? cabLocation;
  String? cancellationCTA;
  String? cancellationCTAText;
  String? shareMessage;
  String? policeHelpline;
  String? trackingPrecautionMessage;
  String? tripType;
  String? cabSchedule;
  String? cabBookingType;
  ContactDetail? contactDetail;
  InfoDetails? infoDetails;
  List<String>? rideNowText;
  List<String>? rideLaterText;
  List<String>? stepsToBoard;

  Result({
    this.vendorName,
    this.airportName,
    this.cityName,
    this.terminalName,
    this.gate,
    this.cabLocation,
    this.cancellationCTA,
    this.cancellationCTAText,
    this.shareMessage,
    this.policeHelpline,
    this.trackingPrecautionMessage,
    this.tripType,
    this.cabSchedule,
    this.cabBookingType,
    this.contactDetail,
    this.infoDetails,
    this.rideNowText,
    this.rideLaterText,
    this.stepsToBoard,
  });

  Result.fromJson(Map<String, dynamic> json) {
    vendorName = json['vendorName'];
    airportName = json['airportName'];
    cityName = json['cityName'];
    terminalName = json['terminalName'];
    gate = json['gate'];
    cabLocation = json['cabLocation'];
    cancellationCTA = json['cancellationCTA'];
    cancellationCTAText = json['cancellationCTAText'];
    shareMessage = json['shareMessage'];
    policeHelpline = json['policeHelpline'];
    trackingPrecautionMessage = json['trackingPrecautionMessage'];
    tripType = json['tripType'];
    cabSchedule = json['cabSchedule'];
    cabBookingType = json['cabBookingType'];
    contactDetail = json['contactDetail'] != null
        ? ContactDetail.fromJson(json['contactDetail'])
        : null;
    infoDetails = json['infoDetails'] != null
        ? InfoDetails.fromJson(json['infoDetails'])
        : null;
    if (json['rideNowText'] != null) {
      rideNowText = <String>[];
      rideNowText =
          (json['rideNowText'] as List).map((v) => v.toString()).toList();
    }
    if (json['rideLaterText'] != null) {
      rideLaterText = <String>[];
      rideLaterText =
          (json['rideLaterText'] as List).map((v) => v.toString()).toList();
    }
    if (json['stepsToBoard'] != null) {
      stepsToBoard = <String>[];
      stepsToBoard =
          (json['stepsToBoard'] as List).map((v) => v.toString()).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vendorName'] = vendorName;
    data['airportName'] = airportName;
    data['cityName'] = cityName;
    data['terminalName'] = terminalName;
    data['gate'] = gate;
    data['cabLocation'] = cabLocation;
    data['cancellationCTA'] = cancellationCTA;
    data['cancellationCTAText'] = cancellationCTAText;
    data['shareMessage'] = shareMessage;
    data['policeHelpline'] = policeHelpline;
    data['trackingPrecautionMessage'] = trackingPrecautionMessage;
    data['tripType'] = tripType;
    data['cabSchedule'] = cabSchedule;
    data['cabBookingType'] = cabBookingType;
    data['contactDetail'] = contactDetail;
    data['infoDetails'] = infoDetails;
    data['rideNowText'] = rideNowText;
    data['rideLaterText'] = rideLaterText;
    data['stepsToBoard'] = stepsToBoard;
    return data;
  }
}

class InfoDetails {
  CabImpInfo? cabImpInfo;
  CabImpInfo? cabDetailedImpInfo;
  CabImpInfo? cabCancellationPolicy;

  InfoDetails({
    this.cabImpInfo,
    this.cabDetailedImpInfo,
    this.cabCancellationPolicy,
  });

  InfoDetails.fromJson(Map<String, dynamic> json) {
    cabImpInfo = json['cabImpInfo'] != null
        ? CabImpInfo.fromJson(json['cabImpInfo'])
        : null;
    cabDetailedImpInfo = json['cabDetailedImpInfo'] != null
        ? CabImpInfo.fromJson(json['cabDetailedImpInfo'])
        : null;
    cabCancellationPolicy = json['cabCancellationPolicy'] != null
        ? CabImpInfo.fromJson(json['cabCancellationPolicy'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cabImpInfo != null) {
      data['cabImpInfo'] = cabImpInfo?.toJson();
    }
    if (cabDetailedImpInfo != null) {
      data['cabDetailedImpInfo'] = cabDetailedImpInfo?.toJson();
    }
    if (cabCancellationPolicy != null) {
      data['cabCancellationPolicy'] = cabCancellationPolicy?.toJson();
    }
    return data;
  }
}

class CabImpInfo {
  String? title;
  List<Lines>? lines;

  CabImpInfo({this.title, this.lines});

  CabImpInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['lines'] != null) {
      lines = <Lines>[];
      for (final Map<String, dynamic> line in json['lines']) {
        lines?.add(Lines.fromJson(line));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (lines != null) {
      data['lines'] = lines?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lines {
  String? title;
  String? description;
  String? autoId;
  String? image;

  Lines({this.title, this.description, this.autoId, this.image});

  Lines.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    autoId = json['autoId'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['autoId'] = autoId;
    data['image'] = image;
    return data;
  }
}

class ImportantInformation {
  String? title;
  List<String>? info;

  ImportantInformation({this.title, this.info});

  ImportantInformation.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['info'] != null) {
      info = <String>[];
      info = (json['info'] as List).map((v) => v.toString()).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['info'] = info;
    return data;
  }
}
