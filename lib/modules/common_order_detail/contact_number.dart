class ContactNumber {
  String? phoneNumber;
  String? mobile;
  dynamic phoneLocationType;
  String? countryAccessCode;
  dynamic areaCityCode;
  dynamic extension;
  bool? isPrimary;

  ContactNumber({
    this.phoneNumber,
    this.mobile,
    this.phoneLocationType,
    this.countryAccessCode,
    this.areaCityCode,
    this.extension,
    this.isPrimary,
  });

  ContactNumber.fromJson(Map<String, dynamic> json) {
    if (json['phoneNumber'] is String) {
      phoneNumber = json['phoneNumber'];
    }
    if (json['mobile'] is String) {
      mobile = json['mobile'];
    }
    phoneLocationType = json['phoneLocationType'];
    if (json['countryAccessCode'] is String) {
      countryAccessCode = json['countryAccessCode'];
    }
    areaCityCode = json['areaCityCode'];
    extension = json['extension'];
    if (json['isPrimary'] is bool) {
      isPrimary = json['isPrimary'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['phoneNumber'] = phoneNumber;
    _data['mobile'] = mobile;
    _data['phoneLocationType'] = phoneLocationType;
    _data['countryAccessCode'] = countryAccessCode;
    _data['areaCityCode'] = areaCityCode;
    _data['extension'] = extension;
    _data['isPrimary'] = isPrimary;
    return _data;
  }
}
