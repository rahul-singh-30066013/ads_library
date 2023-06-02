
class TechnicalStops {
    List<dynamic>? stopDetail;
    int? noOfStops;

    TechnicalStops({this.stopDetail, this.noOfStops});

    TechnicalStops.fromJson(Map<String, dynamic> json) {
        if(json['stopDetail'] is List) {
            stopDetail = json['stopDetail'] ?? [];
        }
        if(json['noOfStops'] is num) {
            noOfStops = (json['noOfStops'] as num).toInt();
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(stopDetail != null) {
            _data['stopDetail'] = stopDetail;
        }
        _data['noOfStops'] = noOfStops;
        return _data;
    }
}