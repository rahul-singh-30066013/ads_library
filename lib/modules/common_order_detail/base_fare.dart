
class BaseFare {
    int? amount;
    String? currencyCode;
    int? perPaxAmount;

    BaseFare({this.amount, this.currencyCode, this.perPaxAmount});

    BaseFare.fromJson(Map<String, dynamic> json) {
        if(json['amount'] is num) {
            amount = (json['amount'] as num).toInt();
        }
        if(json['currencyCode'] is String) {
            currencyCode = json['currencyCode'];
        }
        if(json['perPaxAmount'] is num) {
            perPaxAmount = (json['perPaxAmount'] as num).toInt();
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['amount'] = amount;
        _data['currencyCode'] = currencyCode;
        _data['perPaxAmount'] = perPaxAmount;
        return _data;
    }
}