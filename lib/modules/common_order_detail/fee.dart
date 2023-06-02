
class Fee {
    String? feeCode;
    String? currencyCode;
    int? amount;
    int? perPaxAmount;
    String? feeDesc;
    int? discountedAmount;
    int? perPaxDisCountedAmount;

    Fee({this.feeCode, this.currencyCode, this.amount, this.perPaxAmount, this.feeDesc, this.discountedAmount, this.perPaxDisCountedAmount});

    Fee.fromJson(Map<String, dynamic> json) {
        if(json['feeCode'] is String) {
            feeCode = json['feeCode'];
        }
        if(json['currencyCode'] is String) {
            currencyCode = json['currencyCode'];
        }
        if(json['amount'] is num) {
            amount = (json['amount'] as num).toInt();
        }
        if(json['perPaxAmount'] is num) {
            perPaxAmount = (json['perPaxAmount'] as num).toInt();
        }
        if(json['feeDesc'] is String) {
            feeDesc = json['feeDesc'];
        }
        if(json['discountedAmount'] is num) {
            discountedAmount = (json['discountedAmount'] as num).toInt();
        }
        if(json['perPaxDisCountedAmount'] is num) {
            perPaxDisCountedAmount = (json['perPaxDisCountedAmount'] as num).toInt();
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['feeCode'] = feeCode;
        _data['currencyCode'] = currencyCode;
        _data['amount'] = amount;
        _data['perPaxAmount'] = perPaxAmount;
        _data['feeDesc'] = feeDesc;
        _data['discountedAmount'] = discountedAmount;
        _data['perPaxDisCountedAmount'] = perPaxDisCountedAmount;
        return _data;
    }
}