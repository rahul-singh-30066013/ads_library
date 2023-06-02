
import 'package:adani_airport_mobile/modules/common_order_detail/tax.dart';

class Taxes {
    List<Tax>? tax;
    int? amount;
    String? currencyCode;
    int? perPaxAmount;

    Taxes({this.tax, this.amount, this.currencyCode, this.perPaxAmount});

    Taxes.fromJson(Map<String, dynamic> json) {
        if(json['tax'] is List) {
            tax = json['tax'] == null ? null : (json['tax'] as List).map((e) => Tax.fromJson(e)).toList();
        }
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
        if(tax != null) {
            _data['tax'] = tax?.map((e) => e.toJson()).toList();
        }
        _data['amount'] = amount;
        _data['currencyCode'] = currencyCode;
        _data['perPaxAmount'] = perPaxAmount;
        return _data;
    }
}