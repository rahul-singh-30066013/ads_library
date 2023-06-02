
class PersonName {
    String? namePrefix;
    String? firstName;
    String? lastName;
    dynamic middleName;

    PersonName({this.namePrefix, this.firstName, this.lastName, this.middleName});

    PersonName.fromJson(Map<String, dynamic> json) {
        if(json['namePrefix'] is String) {
            namePrefix = json['namePrefix'];
        }
        if(json['firstName'] is String) {
            firstName = json['firstName'];
        }
        if(json['lastName'] is String) {
            lastName = json['lastName'];
        }
        middleName = json['middleName'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['namePrefix'] = namePrefix;
        _data['firstName'] = firstName;
        _data['lastName'] = lastName;
        _data['middleName'] = middleName;
        return _data;
    }
}