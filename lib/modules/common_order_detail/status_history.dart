
class StatusHistory {
    String? status;
    String? date;

    StatusHistory({this.status, this.date});

    StatusHistory.fromJson(Map<String, dynamic> json) {
        if(json['status'] is String) {
            status = json['status'];
        }
        if(json['date'] is String) {
            date = json['date'];
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['status'] = status;
        _data['date'] = date;
        return _data;
    }
}