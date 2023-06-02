
class City {
    dynamic locationCode;
    dynamic codeContext;
    dynamic cityName;

    City({this.locationCode, this.codeContext, this.cityName});

    City.fromJson(Map<String, dynamic> json) {
        locationCode = json['locationCode'];
        codeContext = json['codeContext'];
        cityName = json['cityName'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['locationCode'] = locationCode;
        _data['codeContext'] = codeContext;
        _data['cityName'] = cityName;
        return _data;
    }
}