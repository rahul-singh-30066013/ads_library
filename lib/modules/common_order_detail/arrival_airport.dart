class ArrivalAirport {
  String? locationCode;
  String? terminal;
  String? name;
  String? city;
  String? countryCode;
  String? country;

  ArrivalAirport({
    this.locationCode,
    this.terminal,
    this.name,
    this.city,
    this.countryCode,
    this.country,
  });

  ArrivalAirport.fromJson(Map<String, dynamic> json) {
    if (json['locationCode'] is String) {
      locationCode = json['locationCode'];
    }
    if (json['terminal'] is String) {
      terminal = json['terminal'];
    }
    if (json['name'] is String) {
      name = json['name'];
    }
    if (json['city'] is String) {
      city = json['city'];
    }
    if (json['countryCode'] is String) {
      countryCode = json['countryCode'];
    }
    if (json['country'] is String) {
      country = json['country'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['locationCode'] = locationCode;
    _data['terminal'] = terminal;
    _data['name'] = name;
    _data['city'] = city;
    _data['countryCode'] = countryCode;
    _data['country'] = country;
    return _data;
  }
}
