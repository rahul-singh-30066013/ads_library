
class Country {
    dynamic code;
    dynamic countryName;

    Country({this.code, this.countryName});

    Country.fromJson(Map<String, dynamic> json) {
        code = json['code'];
        countryName = json['countryName'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['code'] = code;
        _data['countryName'] = countryName;
        return _data;
    }
}