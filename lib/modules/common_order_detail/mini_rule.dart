
import 'package:adani_airport_mobile/modules/common_order_detail/airline_charges.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/cleartrip_charges.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/dplusx.dart';

class MiniRule {
    bool? isRefundable;
    String? note;
    CleartripCharges? cleartripCharges;
    AirlineCharges? airlineCharges;
    DPlusX? dPlusX;

    MiniRule({this.isRefundable, this.note, this.cleartripCharges, this.airlineCharges, this.dPlusX});

    MiniRule.fromJson(Map<String, dynamic> json) {
        if(json['isRefundable'] is bool) {
            isRefundable = json['isRefundable'];
        }
        if(json['note'] is String) {
            note = json['note'];
        }
        if(json['cleartripCharges'] is Map) {
            cleartripCharges = json['cleartripCharges'] == null ? null : CleartripCharges.fromJson(json['cleartripCharges']);
        }
        if(json['airlineCharges'] is Map) {
            airlineCharges = json['airlineCharges'] == null ? null : AirlineCharges.fromJson(json['airlineCharges']);
        }
        if(json['dPlusX'] is Map) {
            dPlusX = json['dPlusX'] == null ? null : DPlusX.fromJson(json['dPlusX']);
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['isRefundable'] = isRefundable;
        _data['note'] = note;
        if(cleartripCharges != null) {
            _data['cleartripCharges'] = cleartripCharges?.toJson();
        }
        if(airlineCharges != null) {
            _data['airlineCharges'] = airlineCharges?.toJson();
        }
        if(dPlusX != null) {
            _data['dPlusX'] = dPlusX?.toJson();
        }
        return _data;
    }
}