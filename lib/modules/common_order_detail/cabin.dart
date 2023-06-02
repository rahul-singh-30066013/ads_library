
class Cabin {
    String? name;
    String? code;

    Cabin({this.name, this.code});

    Cabin.fromJson(Map<String, dynamic> json) {
        if(json['name'] is String) {
            name = json['name'];
        }
        if(json['code'] is String) {
            code = json['code'];
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['name'] = name;
        _data['code'] = code;
        return _data;
    }
}