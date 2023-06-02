import 'package:adani_airport_mobile/modules/payment/juspay/available_apps.dart';

class AvailableAppParent {
  List<AvailableApps>? availableApps;

  AvailableAppParent({this.availableApps});

  AvailableAppParent.fromJson(Map<String, dynamic> json) {
    if(json['availableApps'] is List) {
      availableApps = json['availableApps'] == null ? null : (json['availableApps'] as List).map((e) => AvailableApps.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(availableApps != null) {
      _data['availableApps'] = availableApps?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}