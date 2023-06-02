
class DPlusX {
    List<dynamic>? cancel;
    List<dynamic>? amend;
    dynamic dPlusXNote;

    DPlusX({this.cancel, this.amend, this.dPlusXNote});

    DPlusX.fromJson(Map<String, dynamic> json) {
        if(json['cancel'] is List) {
            cancel = json['cancel'] ?? [];
        }
        if(json['amend'] is List) {
            amend = json['amend'] ?? [];
        }
        dPlusXNote = json['dPlusXNote'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(cancel != null) {
            _data['cancel'] = cancel;
        }
        if(amend != null) {
            _data['amend'] = amend;
        }
        _data['dPlusXNote'] = dPlusXNote;
        return _data;
    }
}