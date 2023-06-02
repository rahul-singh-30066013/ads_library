
class OperatingAirline {
    String? code;
    String? flightNumber;
    String? name;

    OperatingAirline({this.code, this.flightNumber, this.name});

    OperatingAirline.fromJson(Map<String, dynamic> json) {
        if(json['code'] is String) {
            code = json['code'];
        }
        if(json['flightNumber'] is String) {
            flightNumber = json['flightNumber'];
        }
        if(json['name'] is String) {
            name = json['name'];
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['code'] = code;
        _data['flightNumber'] = flightNumber;
        _data['name'] = name;
        return _data;
    }
}