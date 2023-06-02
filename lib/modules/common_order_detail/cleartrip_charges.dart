
class CleartripCharges {
    int? cancel;
    int? amend;

    CleartripCharges({this.cancel, this.amend});

    CleartripCharges.fromJson(Map<String, dynamic> json) {
        if(json['cancel'] is num) {
            cancel = (json['cancel'] as num).toInt();
        }
        if(json['amend'] is num) {
            amend = (json['amend'] as num).toInt();
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['cancel'] = cancel;
        _data['amend'] = amend;
        return _data;
    }
}