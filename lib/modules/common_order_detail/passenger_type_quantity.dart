
import 'package:adani_airport_mobile/modules/common_order_detail/base_fare.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/fees.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/taxes.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/total_fare.dart';

class PassengerTypeQuantity {
    BaseFare? baseFare;
    Taxes? taxes;
    TotalFare? totalFare;
    Fees? fees;
    dynamic markups;
    dynamic key;
    String? code;
    int? quantity;

    PassengerTypeQuantity({this.baseFare, this.taxes, this.totalFare, this.fees, this.markups, this.key, this.code, this.quantity});

    PassengerTypeQuantity.fromJson(Map<String, dynamic> json) {
        if(json['baseFare'] is Map) {
            baseFare = json['baseFare'] == null ? null : BaseFare.fromJson(json['baseFare']);
        }
        if(json['taxes'] is Map) {
            taxes = json['taxes'] == null ? null : Taxes.fromJson(json['taxes']);
        }
        if(json['totalFare'] is Map) {
            totalFare = json['totalFare'] == null ? null : TotalFare.fromJson(json['totalFare']);
        }
        if(json['fees'] is Map) {
            fees = json['fees'] == null ? null : Fees.fromJson(json['fees']);
        }
        markups = json['markups'];
        key = json['key'];
        if(json['code'] is String) {
            code = json['code'];
        }
        if(json['quantity'] is num) {
            quantity = (json['quantity'] as num).toInt();
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(baseFare != null) {
            _data['baseFare'] = baseFare?.toJson();
        }
        if(taxes != null) {
            _data['taxes'] = taxes?.toJson();
        }
        if(totalFare != null) {
            _data['totalFare'] = totalFare?.toJson();
        }
        if(fees != null) {
            _data['fees'] = fees?.toJson();
        }
        _data['markups'] = markups;
        _data['key'] = key;
        _data['code'] = code;
        _data['quantity'] = quantity;
        return _data;
    }
}