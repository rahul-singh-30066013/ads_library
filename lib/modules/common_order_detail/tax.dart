
class Tax {
    int? amount;
    String? currencyCode;
    String? taxCode;
    String? taxDesc;
    int? perPaxAmount;

    Tax({this.amount, this.currencyCode, this.taxCode, this.taxDesc, this.perPaxAmount});

    Tax.fromJson(Map<String, dynamic> json) {
        if(json['amount'] is num) {
            amount = (json['amount'] as num).toInt();
        }
        if(json['currencyCode'] is String) {
            currencyCode = json['currencyCode'];
        }
        if(json['taxCode'] is String) {
            taxCode = json['taxCode'];
        }
        if(json['taxDesc'] is String) {
            taxDesc = json['taxDesc'];
        }
        if(json['perPaxAmount'] is num) {
            perPaxAmount = (json['perPaxAmount'] as num).toInt();
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['amount'] = amount;
        _data['currencyCode'] = currencyCode;
        _data['taxCode'] = taxCode;
        _data['taxDesc'] = taxDesc;
        _data['perPaxAmount'] = perPaxAmount;
        return _data;
    }
}