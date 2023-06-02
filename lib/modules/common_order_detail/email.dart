
class Email {
    String? emailId;
    bool? isPrimary;
    dynamic emailType;

    Email({this.emailId, this.isPrimary, this.emailType});

    Email.fromJson(Map<String, dynamic> json) {
        if(json['emailId'] is String) {
            emailId = json['emailId'];
        }
        if(json['isPrimary'] is bool) {
            isPrimary = json['isPrimary'];
        }
        emailType = json['emailType'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['emailId'] = emailId;
        _data['isPrimary'] = isPrimary;
        _data['emailType'] = emailType;
        return _data;
    }
}