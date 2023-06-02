
import 'package:adani_airport_mobile/modules/common_order_detail/document.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/person_name.dart';

class PaxInfoList {
    List<dynamic>? insuranceInfo;
    int? travelerRefNumber;
    PersonName? personName;
    String? dateOfBirth;
    String? nationality;
    List<Document>? document;
    String? passengerTypeCode;
    List<dynamic>? ticketInfo;

    PaxInfoList({this.insuranceInfo, this.travelerRefNumber, this.personName, this.dateOfBirth, this.nationality, this.document, this.passengerTypeCode, this.ticketInfo});

    PaxInfoList.fromJson(Map<String, dynamic> json) {
        if(json['insuranceInfo'] is List) {
            insuranceInfo = json['insuranceInfo'] ?? [];
        }
        if(json['travelerRefNumber'] is num) {
            travelerRefNumber = (json['travelerRefNumber'] as num).toInt();
        }
        if(json['personName'] is Map) {
            personName = json['personName'] == null ? null : PersonName.fromJson(json['personName']);
        }
        if(json['dateOfBirth'] is String) {
            dateOfBirth = json['dateOfBirth'];
        }
        if(json['nationality'] is String) {
            nationality = json['nationality'];
        }
        if(json['document'] is List) {
            document = json['document'] == null ? null : (json['document'] as List).map((e) => Document.fromJson(e)).toList();
        }
        if(json['passengerTypeCode'] is String) {
            passengerTypeCode = json['passengerTypeCode'];
        }
        if(json['ticketInfo'] is List) {
            ticketInfo = json['ticketInfo'] ?? [];
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(insuranceInfo != null) {
            _data['insuranceInfo'] = insuranceInfo;
        }
        _data['travelerRefNumber'] = travelerRefNumber;
        if(personName != null) {
            _data['personName'] = personName?.toJson();
        }
        _data['dateOfBirth'] = dateOfBirth;
        _data['nationality'] = nationality;
        if(document != null) {
            _data['document'] = document?.map((e) => e.toJson()).toList();
        }
        _data['passengerTypeCode'] = passengerTypeCode;
        if(ticketInfo != null) {
            _data['ticketInfo'] = ticketInfo;
        }
        return _data;
    }
}