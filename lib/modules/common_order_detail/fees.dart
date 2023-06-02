
import 'package:adani_airport_mobile/modules/common_order_detail/fee.dart';

class Fees {
    int? amount;
    int? perPaxAmount;
    String? currencyCode;
    int? discountedAmount;
    int? disCountedPerPaxAmount;
    List<Fee>? fee;

    Fees({this.amount, this.perPaxAmount, this.currencyCode, this.discountedAmount, this.disCountedPerPaxAmount, this.fee});

    Fees.fromJson(Map<String, dynamic> json) {
        if(json['amount'] is num) {
            amount = (json['amount'] as num).toInt();
        }
        if(json['perPaxAmount'] is num) {
            perPaxAmount = (json['perPaxAmount'] as num).toInt();
        }
        if(json['currencyCode'] is String) {
            currencyCode = json['currencyCode'];
        }
        if(json['discountedAmount'] is num) {
            discountedAmount = (json['discountedAmount'] as num).toInt();
        }
        if(json['disCountedPerPaxAmount'] is num) {
            disCountedPerPaxAmount = (json['disCountedPerPaxAmount'] as num).toInt();
        }
        if(json['fee'] is List) {
            fee = json['fee'] == null ? null : (json['fee'] as List).map((e) => Fee.fromJson(e)).toList();
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['amount'] = amount;
        _data['perPaxAmount'] = perPaxAmount;
        _data['currencyCode'] = currencyCode;
        _data['discountedAmount'] = discountedAmount;
        _data['disCountedPerPaxAmount'] = disCountedPerPaxAmount;
        if(fee != null) {
            _data['fee'] = fee?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}