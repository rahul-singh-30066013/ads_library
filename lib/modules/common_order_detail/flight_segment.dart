
import 'package:adani_airport_mobile/modules/common_order_detail/arrival_airport.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/cabin.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/departure_airport.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/marketing_airline.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/operating_airline.dart';

class FlightSegment {
    Cabin? cabin;
    String? status;
    dynamic departureDay;
    String? duration;
    bool? dayChange;
    dynamic seat;
    DepartureAirport? departureAirport;
    ArrivalAirport? arrivalAirport;
    MarketingAirline? marketingAirline;
    OperatingAirline? operatingAirline;
    List<dynamic>? equipment;
    dynamic remarks;
    String? flightNumber;
    dynamic key;
    String? departureDate;
    String? departureTime;
    String? departureTimeZone;
    String? departureTimeEpoch;
    String? arrivalDate;
    String? arrivalTime;
    String? arrivalTimeZone;
    String? arrivalTimeEpoch;
    dynamic resBookDesigCode;
    String? rph;
    dynamic flightId;
    dynamic supplier;
    dynamic fareBasisCode;
    dynamic validatingCarrier;
    String? departureTimeZoneRegion;
    String? arrivalTimeZoneRegion;
    String? cabinBaggage;
    String? chekinBaggage;
    String? baggageInfoNote;
    bool? isTerminalChange;
    bool? isAirportChange;
    dynamic transitVisaMessage;

    FlightSegment({this.cabin, this.status, this.departureDay, this.duration, this.dayChange, this.seat, this.departureAirport, this.arrivalAirport, this.marketingAirline, this.operatingAirline, this.equipment, this.remarks, this.flightNumber, this.key, this.departureDate, this.departureTime, this.departureTimeZone, this.departureTimeEpoch, this.arrivalDate, this.arrivalTime, this.arrivalTimeZone, this.arrivalTimeEpoch, this.resBookDesigCode, this.rph, this.flightId, this.supplier, this.fareBasisCode, this.validatingCarrier, this.departureTimeZoneRegion, this.arrivalTimeZoneRegion, this.cabinBaggage, this.chekinBaggage, this.baggageInfoNote, this.isTerminalChange, this.isAirportChange, this.transitVisaMessage});

    FlightSegment.fromJson(Map<String, dynamic> json) {
        if(json['cabin'] is Map) {
            cabin = json['cabin'] == null ? null : Cabin.fromJson(json['cabin']);
        }
        if(json['status'] is String) {
            status = json['status'];
        }
        departureDay = json['departureDay'];
        if(json['duration'] is String) {
            duration = json['duration'];
        }
        if(json['dayChange'] is bool) {
            dayChange = json['dayChange'];
        }
        seat = json['seat'];
        if(json['departureAirport'] is Map) {
            departureAirport = json['departureAirport'] == null ? null : DepartureAirport.fromJson(json['departureAirport']);
        }
        if(json['arrivalAirport'] is Map) {
            arrivalAirport = json['arrivalAirport'] == null ? null : ArrivalAirport.fromJson(json['arrivalAirport']);
        }
        if(json['marketingAirline'] is Map) {
            marketingAirline = json['marketingAirline'] == null ? null : MarketingAirline.fromJson(json['marketingAirline']);
        }
        if(json['operatingAirline'] is Map) {
            operatingAirline = json['operatingAirline'] == null ? null : OperatingAirline.fromJson(json['operatingAirline']);
        }
        if(json['equipment'] is List) {
            equipment = json['equipment'] ?? [];
        }
        remarks = json['remarks'];
        if(json['flightNumber'] is String) {
            flightNumber = json['flightNumber'];
        }
        key = json['key'];
        if(json['departureDate'] is String) {
            departureDate = json['departureDate'];
        }
        if(json['departureTime'] is String) {
            departureTime = json['departureTime'];
        }
        if(json['departureTimeZone'] is String) {
            departureTimeZone = json['departureTimeZone'];
        }
        if(json['departureTimeEpoch'] is String) {
            departureTimeEpoch = json['departureTimeEpoch'];
        }
        if(json['arrivalDate'] is String) {
            arrivalDate = json['arrivalDate'];
        }
        if(json['arrivalTime'] is String) {
            arrivalTime = json['arrivalTime'];
        }
        if(json['arrivalTimeZone'] is String) {
            arrivalTimeZone = json['arrivalTimeZone'];
        }
        if(json['arrivalTimeEpoch'] is String) {
            arrivalTimeEpoch = json['arrivalTimeEpoch'];
        }
        resBookDesigCode = json['resBookDesigCode'];
        if(json['rph'] is String) {
            rph = json['rph'];
        }
        flightId = json['flightID'];
        supplier = json['supplier'];
        fareBasisCode = json['fareBasisCode'];
        validatingCarrier = json['validatingCarrier'];
        if(json['departureTimeZoneRegion'] is String) {
            departureTimeZoneRegion = json['departureTimeZoneRegion'];
        }
        if(json['arrivalTimeZoneRegion'] is String) {
            arrivalTimeZoneRegion = json['arrivalTimeZoneRegion'];
        }
        if(json['cabinBaggage'] is String) {
            cabinBaggage = json['cabinBaggage'];
        }
        if(json['chekinBaggage'] is String) {
            chekinBaggage = json['chekinBaggage'];
        }
        if(json['baggageInfoNote'] is String) {
            baggageInfoNote = json['baggageInfoNote'];
        }
        if(json['isTerminalChange'] is bool) {
            isTerminalChange = json['isTerminalChange'];
        }
        if(json['isAirportChange'] is bool) {
            isAirportChange = json['isAirportChange'];
        }
        transitVisaMessage = json['transitVisaMessage'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(cabin != null) {
            _data['cabin'] = cabin?.toJson();
        }
        _data['status'] = status;
        _data['departureDay'] = departureDay;
        _data['duration'] = duration;
        _data['dayChange'] = dayChange;
        _data['seat'] = seat;
        if(departureAirport != null) {
            _data['departureAirport'] = departureAirport?.toJson();
        }
        if(arrivalAirport != null) {
            _data['arrivalAirport'] = arrivalAirport?.toJson();
        }
        if(marketingAirline != null) {
            _data['marketingAirline'] = marketingAirline?.toJson();
        }
        if(operatingAirline != null) {
            _data['operatingAirline'] = operatingAirline?.toJson();
        }
        if(equipment != null) {
            _data['equipment'] = equipment;
        }
        _data['remarks'] = remarks;
        _data['flightNumber'] = flightNumber;
        _data['key'] = key;
        _data['departureDate'] = departureDate;
        _data['departureTime'] = departureTime;
        _data['departureTimeZone'] = departureTimeZone;
        _data['departureTimeEpoch'] = departureTimeEpoch;
        _data['arrivalDate'] = arrivalDate;
        _data['arrivalTime'] = arrivalTime;
        _data['arrivalTimeZone'] = arrivalTimeZone;
        _data['arrivalTimeEpoch'] = arrivalTimeEpoch;
        _data['resBookDesigCode'] = resBookDesigCode;
        _data['rph'] = rph;
        _data['flightID'] = flightId;
        _data['supplier'] = supplier;
        _data['fareBasisCode'] = fareBasisCode;
        _data['validatingCarrier'] = validatingCarrier;
        _data['departureTimeZoneRegion'] = departureTimeZoneRegion;
        _data['arrivalTimeZoneRegion'] = arrivalTimeZoneRegion;
        _data['cabinBaggage'] = cabinBaggage;
        _data['chekinBaggage'] = chekinBaggage;
        _data['baggageInfoNote'] = baggageInfoNote;
        _data['isTerminalChange'] = isTerminalChange;
        _data['isAirportChange'] = isAirportChange;
        _data['transitVisaMessage'] = transitVisaMessage;
        return _data;
    }
}