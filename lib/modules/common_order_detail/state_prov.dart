
class StateProv {
    dynamic stateCode;
    dynamic stateName;

    StateProv({this.stateCode, this.stateName});

    StateProv.fromJson(Map<String, dynamic> json) {
        stateCode = json['stateCode'];
        stateName = json['stateName'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['stateCode'] = stateCode;
        _data['stateName'] = stateName;
        return _data;
    }
}