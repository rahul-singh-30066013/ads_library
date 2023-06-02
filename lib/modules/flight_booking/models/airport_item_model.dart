/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class AirportItemModel {
  bool? isNonAdaniAirport;
  String? airportName;
  String? airportCode;
  String? airportID;
  String? city;
  String? airportPrefixName;
  String? details;
  String? airportImage;
  String? airportThumbnailImage;
  String? airportAddress;
  String? terminalList;
  List<Terminal>? terminalsList;
  String? colorCode;
  String? airportIcon;
  ContactDetails? contactDetails;
  String? widgetType;
  bool? isTheme;
  bool? isCabEnabled;
  bool? porterServiceAvailable;
  String? postFix;
  String? appBarBackgroundColor;
  String? appBarSubtitleColor;
  String? appBarTitleColor;
  String? stickyWidgetBackgroundColor;
  String? stickyWidgetTextColor;
  String? stickyWidgetIconColor;
  int? dutyFreeAgeLimit;
  bool? lightStatusBar;
  String? latitude;
  String? longitude;
  String? placeID;
  List<String>? keywords;

  AirportItemModel({
    this.isNonAdaniAirport,
    this.airportName,
    this.airportCode,
    this.airportID,
    this.city,
    this.airportPrefixName,
    this.details,
    this.airportImage,
    this.airportThumbnailImage,
    this.airportAddress,
    this.terminalList,
    this.terminalsList,
    this.colorCode,
    this.airportIcon,
    this.contactDetails,
    this.widgetType,
    this.isTheme,
    this.isCabEnabled,
    this.porterServiceAvailable,
    this.appBarBackgroundColor,
    this.appBarSubtitleColor,
    this.appBarTitleColor,
    this.dutyFreeAgeLimit,
    this.stickyWidgetBackgroundColor,
    this.stickyWidgetTextColor,
    this.stickyWidgetIconColor,
    this.lightStatusBar,
    this.latitude,
    this.longitude,
    this.placeID,
    this.keywords,
  });

  AirportItemModel.fromJson(Map<String, dynamic> json) {
    isNonAdaniAirport = json['isNonAdaniAirport'];
    airportName = json['airportName'];
    airportCode = json['airportCode'];
    airportID = json['airportID'];
    city = json['city'];
    airportPrefixName = json['airportPrefixName'];
    details = json['details'];
    airportImage = json['airportImage'];
    airportThumbnailImage = json['airportThumbnailImage'];
    airportAddress = json['airportAddress'];
    terminalList = json['terminalList'];
    if (json['terminalsList'] != null) {
      terminalsList = <Terminal>[];
      for (final Map<String, dynamic> terminal in json['terminalsList']) {
        terminalsList?.add(Terminal.fromJson(terminal));
      }
    }
    colorCode = json['colorCode'];
    airportIcon = json['airportIcon'];
    contactDetails = json['contactDetails'] != null
        ? ContactDetails.fromJson(json['contactDetails'])
        : null;
    widgetType = json['widgetType'];
    isTheme = json['isTheme'];
    isCabEnabled = json['isCabEnabled'];
    porterServiceAvailable = json['porterServiceAvailable'];
    postFix = json['postFix'];
    appBarBackgroundColor = json['appBarBackgroundColor'];
    appBarSubtitleColor = json['appBarSubtitleColor'];
    appBarTitleColor = json['appBarTitleColor'];
    dutyFreeAgeLimit = json['dutyFreeAgeLimit'];
    stickyWidgetBackgroundColor = json['stickyWidgetBackgroundColor'];
    stickyWidgetTextColor = json['stickyWidgetTextColor'];
    stickyWidgetIconColor = json['stickyWidgetIconColor'];
    lightStatusBar = json['lightStatusBar'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    placeID = json['placeID'];
    keywords = json['keywords'] != null
        ? (json['keywords'] as List).map((v) => v.toString()).toList()
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isNonAdaniAirport'] = isNonAdaniAirport;
    data['airportName'] = airportName;
    data['airportCode'] = airportCode;
    data['airportID'] = airportID;
    data['city'] = city;
    data['airportPrefixName'] = airportPrefixName;
    data['details'] = details;
    data['airportImage'] = airportImage;
    data['airportThumbnailImage'] = airportThumbnailImage;
    data['airportAddress'] = airportAddress;
    data['terminalList'] = terminalList;
    data['terminalsList'] = terminalsList?.map((v) => v.toJson()).toList();
    data['colorCode'] = colorCode;
    data['isTheme'] = isTheme;
    data['isCabEnabled'] = isCabEnabled;
    data['porterServiceAvailable'] = porterServiceAvailable;
    data['postFix'] = postFix;
    data['appBarBackgroundColor'] = appBarBackgroundColor;
    data['appBarSubtitleColor'] = appBarSubtitleColor;
    data['appBarTitleColor'] = appBarTitleColor;
    data['airportIcon'] = airportIcon;
    if (contactDetails != null) {
      data['contactDetails'] = contactDetails?.toJson();
    }
    data['widgetType'] = widgetType;
    data['dutyFreeAgeLimit'] = dutyFreeAgeLimit;
    data['stickyWidgetBackgroundColor'] = stickyWidgetBackgroundColor;
    data['stickyWidgetTextColor'] = stickyWidgetTextColor;
    data['stickyWidgetIconColor'] = stickyWidgetIconColor;
    data['lightStatusBar'] = lightStatusBar;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['placeID'] = placeID;
    data['keywords'] = keywords;
    return data;
  }
}

class ContactDetails {
  ContactAttributes? phone;
  ContactAttributes? email;

  ContactDetails({this.phone, this.email});

  ContactDetails.fromJson(Map<String, dynamic> json) {
    phone = json['phone'] != null
        ? ContactAttributes.fromJson(json['phone'])
        : null;
    email = json['email'] != null
        ? ContactAttributes.fromJson(json['email'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (phone != null) {
      data['phone'] = phone?.toJson();
    }
    if (email != null) {
      data['email'] = email?.toJson();
    }
    return data;
  }
}

class ContactAttributes {
  String? name;
  String? title;
  String? richText;

  ContactAttributes({
    this.name,
    this.title,
    this.richText,
  });

  ContactAttributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    richText = json['richText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['title'] = title;
    data['richText'] = richText;
    return data;
  }
}

class Terminal {
  String? terminalName;
  String? terminalAddress;
  bool? pranaamServiceAvailable;
  String? terminalCode;
  String? latitude;
  String? longitude;
  String? placeID;
  bool? isCabEnabled;
  bool? dutyFreeAvailable;
  List<Gate>? gates;

  Terminal({
    this.terminalName,
    this.terminalAddress,
    this.pranaamServiceAvailable,
    this.terminalCode,
    this.latitude,
    this.longitude,
    this.placeID,
    this.isCabEnabled,
    this.dutyFreeAvailable,
    this.gates,
  });

  Terminal.fromJson(Map<String, dynamic> json) {
    terminalName = json['terminalName'];
    terminalAddress = json['terminalAddress'];
    pranaamServiceAvailable = json['pranaamServiceAvailable'];
    terminalCode = json['terminalCode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    placeID = json['placeID'];
    isCabEnabled = json['isCabEnabled'];
    dutyFreeAvailable = json['dutyFreeAvailable'];
    if (json['gates'] != null) {
      gates = <Gate>[];
      for (final Map<String, dynamic> element in json['gates']) {
        gates?.add(Gate.fromJson(element));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['terminalName'] = terminalName;
    data['terminalAddress'] = terminalAddress;
    data['pranaamServiceAvailable'] = pranaamServiceAvailable;
    data['terminalCode'] = terminalCode;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['placeID'] = placeID;
    data['isCabEnabled'] = isCabEnabled;
    data['dutyFreeAvailable'] = dutyFreeAvailable;
    if (gates != null) {
      data['gates'] = gates?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Gate {
  String? gateType;
  String? gate;
  String? latitude;
  String? longitude;
  String? placeID;
  bool? isCabEnabled;
  String? pickupAddress;
  bool? dutyFreeAvailable;

  Gate({
    this.gateType,
    this.gate,
    this.latitude,
    this.longitude,
    this.placeID,
    this.isCabEnabled,
    this.pickupAddress,
    this.dutyFreeAvailable,
  });

  Gate.fromJson(Map<String, dynamic> json) {
    gateType = json['gateType'];
    gate = json['gate'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    placeID = json['placeID'];
    isCabEnabled = json['isCabEnabled'];
    pickupAddress = json['pickupAddress'];
    dutyFreeAvailable = json['dutyFreeAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gateType'] = gateType;
    data['gate'] = gate;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['placeID'] = placeID;
    data['isCabEnabled'] = isCabEnabled;
    data['pickupAddress'] = pickupAddress;
    data['dutyFreeAvailable'] = dutyFreeAvailable;
    return data;
  }
}

class AdaniAirportsResponse {
  String? path;
  List<AdaniAirportsElements>? elements;

  AdaniAirportsResponse({this.path, this.elements});

  AdaniAirportsResponse.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    if (json['elements'] != null) {
      elements = <AdaniAirportsElements>[];
      for (final Map<String, dynamic> element in json['elements']) {
        elements?.add(AdaniAirportsElements.fromJson(element));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    if (elements != null) {
      data['elements'] = elements?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdaniAirportsElement {
  String? uid;
  String? componentName;
  String? dataSource;
  Fields? fields;

  AdaniAirportsElement({
    this.uid,
    this.componentName,
    this.dataSource,
    this.fields,
  });

  AdaniAirportsElement.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    componentName = json['componentName'];
    dataSource = json['dataSource'];
    fields = json['fields'] != null ? Fields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['componentName'] = componentName;
    data['dataSource'] = dataSource;

    if (fields != null) {
      data['fields'] = fields?.toJson();
    }
    return data;
  }
}

class AdaniAirportsElements {
  String? uid;
  String? componentName;
  String? dataSource;
  Fields? fields;

  AdaniAirportsElements({
    this.uid,
    this.componentName,
    this.dataSource,
    this.fields,
  });

  AdaniAirportsElements.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    componentName = json['componentName'];
    dataSource = json['dataSource'];
    fields = json['fields'] != null ? Fields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['componentName'] = componentName;
    data['dataSource'] = dataSource;
    if (fields != null) {
      data['fields'] = fields?.toJson();
    }
    return data;
  }
}

class Fields {
  List<AirportItemModel>? listOfAirports;

  Fields({this.listOfAirports});

  Fields.fromJson(Map<String, dynamic> json) {
    if (json['listOfAirports'] != null) {
      listOfAirports = <AirportItemModel>[];

      for (final Map<String, dynamic> airport in json['listOfAirports']) {
        listOfAirports?.add(AirportItemModel.fromJson(airport));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listOfAirports != null) {
      data['listOfAirports'] = listOfAirports?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
