
import 'package:adani_airport_mobile/modules/common_order_detail/flight_segment.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/technical_stops.dart';

class OriginDestinationOption {
    List<FlightSegment>? flightSegment;
    String? directionInd;
    String? group;
    String? rph;
    TechnicalStops? technicalStops;
    dynamic fareKey;
    bool? fareRefundable;
    bool? journeyCancelable;

    OriginDestinationOption({this.flightSegment, this.directionInd, this.group, this.rph, this.technicalStops, this.fareKey, this.fareRefundable, this.journeyCancelable});

    OriginDestinationOption.fromJson(Map<String, dynamic> json) {
        if(json['flightSegment'] is List) {
            flightSegment = json['flightSegment'] == null ? null : (json['flightSegment'] as List).map((e) => FlightSegment.fromJson(e)).toList();
        }
        if(json['directionInd'] is String) {
            directionInd = json['directionInd'];
        }
        if(json['group'] is String) {
            group = json['group'];
        }
        if(json['rph'] is String) {
            rph = json['rph'];
        }
        if(json['technicalStops'] is Map) {
            technicalStops = json['technicalStops'] == null ? null : TechnicalStops.fromJson(json['technicalStops']);
        }
        fareKey = json['fareKey'];
        if(json['fareRefundable'] is bool) {
            fareRefundable = json['fareRefundable'];
        }
        if(json['journeyCancelable'] is bool) {
            journeyCancelable = json['journeyCancelable'];
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(flightSegment != null) {
            _data['flightSegment'] = flightSegment?.map((e) => e.toJson()).toList();
        }
        _data['directionInd'] = directionInd;
        _data['group'] = group;
        _data['rph'] = rph;
        if(technicalStops != null) {
            _data['technicalStops'] = technicalStops?.toJson();
        }
        _data['fareKey'] = fareKey;
        _data['fareRefundable'] = fareRefundable;
        _data['journeyCancelable'] = journeyCancelable;
        return _data;
    }
}