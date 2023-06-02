
import 'package:adani_airport_mobile/modules/common_order_detail/city.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/country.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/state_prov.dart';

class Address {
    dynamic addressLine;
    dynamic street;
    City? city;
    dynamic postalCode;
    StateProv? stateProv;
    Country? country;
    dynamic formattedInd;
    dynamic type;
    bool? isPrimary;
    dynamic operation;

    Address({this.addressLine, this.street, this.city, this.postalCode, this.stateProv, this.country, this.formattedInd, this.type, this.isPrimary, this.operation});

    Address.fromJson(Map<String, dynamic> json) {
        addressLine = json['addressLine'];
        street = json['street'];
        if(json['city'] is Map) {
            city = json['city'] == null ? null : City.fromJson(json['city']);
        }
        postalCode = json['postalCode'];
        if(json['stateProv'] is Map) {
            stateProv = json['stateProv'] == null ? null : StateProv.fromJson(json['stateProv']);
        }
        if(json['country'] is Map) {
            country = json['country'] == null ? null : Country.fromJson(json['country']);
        }
        formattedInd = json['formattedInd'];
        type = json['type'];
        if(json['isPrimary'] is bool) {
            isPrimary = json['isPrimary'];
        }
        operation = json['operation'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data['addressLine'] = addressLine;
        _data['street'] = street;
        if(city != null) {
            _data['city'] = city?.toJson();
        }
        _data['postalCode'] = postalCode;
        if(stateProv != null) {
            _data['stateProv'] = stateProv?.toJson();
        }
        if(country != null) {
            _data['country'] = country?.toJson();
        }
        _data['formattedInd'] = formattedInd;
        _data['type'] = type;
        _data['isPrimary'] = isPrimary;
        _data['operation'] = operation;
        return _data;
    }
}