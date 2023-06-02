
class AirlineCharges {
    int? cancel;
    int? amend;

    AirlineCharges({this.cancel, this.amend});

    AirlineCharges.fromJson(Map<String, dynamic> json) {
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