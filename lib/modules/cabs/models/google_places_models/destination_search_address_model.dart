/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class DestinationSearchAddressModel {
  List<SearchAddressModel>? predictions;
  String? status;

  DestinationSearchAddressModel({this.predictions, this.status});

  DestinationSearchAddressModel.fromJson(Map<String, dynamic> json) {
    if (json['predictions'] != null) {
      if (json['predictions'] != null) {
        predictions = <SearchAddressModel>[];
        for (final Map<String, dynamic> result in json['predictions']) {
          predictions?.add(SearchAddressModel.fromJson(result));
        }
      }
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['predictions'] = predictions?.map((v) => v.toJson()).toList();
    data['status'] = status;
    return data;
  }
}

class SearchAddressModel {
  String? description;
  String? placeId;
  StructuredAddress? structuredFormatting;

  SearchAddressModel({
    this.description,
    this.placeId,
    this.structuredFormatting,
  });

  SearchAddressModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    placeId = json['place_id'];
    structuredFormatting = json['structured_formatting'] != null
        ? StructuredAddress.fromJson(json['structured_formatting'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['place_id'] = placeId;
    if (structuredFormatting != null) {
      data['structured_formatting'] = structuredFormatting?.toJson();
    }
    return data;
  }
}

class StructuredAddress {
  String? mainText;
  String? secondaryText;

  StructuredAddress({
    this.mainText,
    this.secondaryText,
  });

  StructuredAddress.fromJson(Map<String, dynamic> json) {
    mainText = json['main_text'];
    secondaryText = json['secondary_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['main_text'] = mainText;
    data['secondary_text'] = secondaryText;
    return data;
  }
}
