/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/flight_view_itinerary_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/gst_details.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/itinerary_contact_detail.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pax_info_list.dart';

/// paxInfoList : [{"travelerRefNumber":1,"personName":{"namePrefix":"Mr","firstName":"Pramod","lastName":"Singh","middleName":null},"dateOfBirth":"13-12-1988","nationality":"IN","document":[{"docID":"P10001","docType":null,"expireDate":"25-01-2028","docIssueCountry":"IN","docIssueDate":"25-01-2018","docHolderNationality":null}],"passengerTypeCode":"ADT"}]
/// contactDetail : {"personName":{"namePrefix":"Mr","firstName":"Pramod","lastName":"Singh","middleName":null},"contactNumber":[{"phoneNumber":"124221086","mobile":"8860678553","phoneLocationType":null,"countryAccessCode":null,"areaCityCode":null,"extension":null,"isPrimary":false}],"email":[{"emailId":"pramodkumar.singh@adani.com","isPrimary":false,"emailType":null}],"address":[{"addressLine":"Ashok Vihar","street":null,"city":{"locationCode":null,"codeContext":null,"cityName":"Gurgaon"},"postalCode":"122001","stateProv":{"stateCode":null,"stateName":"Haryana"},"country":{"code":null,"countryName":"India"},"formattedInd":null,"type":null,"isPrimary":false,"operation":null}]}
/// gstDetails : {"gstHolderAddress":"Test , test apartment, test road, test phase, test nagar, Bangalore 560078","gstHolderName":"Test Holder Name.","gstHolderStateCode":"22","gstHolderStateName":"Chhattisgarh","gstNumber":"22BHURJ3851M1Z5"}

class TravellerPassengerResponseModel {
  TravellerPassengerResponseModel({
    List<PaxInfoList>? paxInfoList,
    ItineraryContactDetail? contactDetail,
    GstDetails? gstDetails,
  }) {
    _paxInfoList = paxInfoList;
    _contactDetail = contactDetail;
    _gstDetails = gstDetails;
  }

  TravellerPassengerResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['paxInfoList'] != null) {
      _paxInfoList = [];

      for (final object in json['paxInfoList'] as List) {
        final PaxInfoList paxInfoList = PaxInfoList.fromJson(object,null,);
        _paxInfoList?.add(paxInfoList);
      }
    }
    _contactDetail = json['contactDetail'] != null
        ? ItineraryContactDetail.fromJson(json['contactDetail'])
        : null;
    _gstDetails = json['gstDetails'] != null
        ? GstDetails.fromJson(json['gstDetails'])
        : null;
  }
  List<PaxInfoList>? _paxInfoList;
  ItineraryContactDetail? _contactDetail;
  GstDetails? _gstDetails;

  List<PaxInfoList>? get paxInfoList => _paxInfoList;
  ItineraryContactDetail? get contactDetail => _contactDetail;
  GstDetails? get gstDetails => _gstDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_paxInfoList != null) {
      map['paxInfoList'] = _paxInfoList?.map((v) => v.toJson()).toList();
    }
    if (_contactDetail != null) {
      map['contactDetail'] = _contactDetail?.toJson();
    }
    if (_gstDetails != null) {
      map['gstDetails'] = _gstDetails?.toJson();
    }
    return map;
  }
}

class SelectedTravelPassengerDetail {
  final FlightViewItineraryResponseModel? flightViewItineraryResponseModel;
  final TravellerPassengerResponseModel? travellerPassengerResponseModel;
  SelectedTravelPassengerDetail({
    this.travellerPassengerResponseModel,
    this.flightViewItineraryResponseModel,
  });
}
