
class TotalBaseFare {
    int? amount;
    String? currencyCode;

    TotalBaseFare({this.amount, this.currencyCode});

    TotalBaseFare.fromJson(Map<String, dynamic> json) {
        if(json['amount'] is num) {
            amount = (json['amount'] as num).toInt();
        }
        if(json['currencyCode'] is String) {
            currencyCode = json['currencyCode'];
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['amount'] = amount;
        _data['currencyCode'] = currencyCode;
        return _data;
    }
}