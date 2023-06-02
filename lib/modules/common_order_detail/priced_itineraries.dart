
import 'package:adani_airport_mobile/modules/common_order_detail/air_itinerary.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/air_itinerary_pricing_info.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/mini_rule.dart';

class PricedItineraries {
    AirItinerary? airItinerary;
    AirItineraryPricingInfo? airItineraryPricingInfo;
    String? sequenceNumber;
    String? directionInd;
    String? sectorInd;
    dynamic securityKey;
    MiniRule? miniRule;

    PricedItineraries({this.airItinerary, this.airItineraryPricingInfo, this.sequenceNumber, this.directionInd, this.sectorInd, this.securityKey, this.miniRule});

    PricedItineraries.fromJson(Map<String, dynamic> json) {
        if(json['airItinerary'] is Map) {
            airItinerary = json['airItinerary'] == null ? null : AirItinerary.fromJson(json['airItinerary']);
        }
        if(json['airItineraryPricingInfo'] is Map) {
            airItineraryPricingInfo = json['airItineraryPricingInfo'] == null ? null : AirItineraryPricingInfo.fromJson(json['airItineraryPricingInfo']);
        }
        if(json['sequenceNumber'] is String) {
            sequenceNumber = json['sequenceNumber'];
        }
        if(json['directionInd'] is String) {
            directionInd = json['directionInd'];
        }
        if(json['sectorInd'] is String) {
            sectorInd = json['sectorInd'];
        }
        securityKey = json['securityKey'];
        if(json['miniRule'] is Map) {
            miniRule = json['miniRule'] == null ? null : MiniRule.fromJson(json['miniRule']);
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(airItinerary != null) {
            _data['airItinerary'] = airItinerary?.toJson();
        }
        if(airItineraryPricingInfo != null) {
            _data['airItineraryPricingInfo'] = airItineraryPricingInfo?.toJson();
        }
        _data['sequenceNumber'] = sequenceNumber;
        _data['directionInd'] = directionInd;
        _data['sectorInd'] = sectorInd;
        _data['securityKey'] = securityKey;
        if(miniRule != null) {
            _data['miniRule'] = miniRule?.toJson();
        }
        return _data;
    }
}