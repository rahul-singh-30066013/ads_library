
import 'package:adani_airport_mobile/modules/common_order_detail/passenger_type_quantity.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/total_base_fare.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/total_fare.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/total_fee.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/total_markup.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/total_tax.dart';

class AirItineraryPricingInfo {
    TotalFare? totalFare;
    TotalBaseFare? totalBaseFare;
    TotalTax? totalTax;
    TotalFee? totalFee;
    TotalMarkup? totalMarkup;
    dynamic discounts;
    dynamic remark;
    dynamic travelInsuranceCharges;
    List<PassengerTypeQuantity>? passengerTypeQuantity;

    AirItineraryPricingInfo({this.totalFare, this.totalBaseFare, this.totalTax, this.totalFee, this.totalMarkup, this.discounts, this.remark, this.travelInsuranceCharges, this.passengerTypeQuantity});

    AirItineraryPricingInfo.fromJson(Map<String, dynamic> json) {
        if(json['totalFare'] is Map) {
            totalFare = json['totalFare'] == null ? null : TotalFare.fromJson(json['totalFare']);
        }
        if(json['totalBaseFare'] is Map) {
            totalBaseFare = json['totalBaseFare'] == null ? null : TotalBaseFare.fromJson(json['totalBaseFare']);
        }
        if(json['totalTax'] is Map) {
            totalTax = json['totalTax'] == null ? null : TotalTax.fromJson(json['totalTax']);
        }
        if(json['totalFee'] is Map) {
            totalFee = json['totalFee'] == null ? null : TotalFee.fromJson(json['totalFee']);
        }
        if(json['totalMarkup'] is Map) {
            totalMarkup = json['totalMarkup'] == null ? null : TotalMarkup.fromJson(json['totalMarkup']);
        }
        discounts = json['discounts'];
        remark = json['remark'];
        travelInsuranceCharges = json['travelInsuranceCharges'];
        if(json['passengerTypeQuantity'] is List) {
            passengerTypeQuantity = json['passengerTypeQuantity'] == null ? null : (json['passengerTypeQuantity'] as List).map((e) => PassengerTypeQuantity.fromJson(e)).toList();
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(totalFare != null) {
            _data['totalFare'] = totalFare?.toJson();
        }
        if(totalBaseFare != null) {
            _data['totalBaseFare'] = totalBaseFare?.toJson();
        }
        if(totalTax != null) {
            _data['totalTax'] = totalTax?.toJson();
        }
        if(totalFee != null) {
            _data['totalFee'] = totalFee?.toJson();
        }
        if(totalMarkup != null) {
            _data['totalMarkup'] = totalMarkup?.toJson();
        }
        _data['discounts'] = discounts;
        _data['remark'] = remark;
        _data['travelInsuranceCharges'] = travelInsuranceCharges;
        if(passengerTypeQuantity != null) {
            _data['passengerTypeQuantity'] = passengerTypeQuantity?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}