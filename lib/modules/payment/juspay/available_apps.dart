class AvailableApps {
  String? packageName;
  String? appName;

  AvailableApps({this.packageName, this.appName});

  AvailableApps.fromJson(Map<String, dynamic> json) {
    if(json['packageName'] is String) {
      packageName = json['packageName'];
    }
    if(json['appName'] is String) {
      appName = json['appName'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['packageName'] = packageName;
    _data['appName'] = appName;
    return _data;
  }
}