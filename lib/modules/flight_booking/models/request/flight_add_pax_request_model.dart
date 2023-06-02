/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/document.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/gst_details.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/itinerary_contact_detail.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pax_info_list.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/traveller_detail/display_model/text_form_builder.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_constants.dart';
import 'package:adani_airport_mobile/modules/more/screens/my_profile/utils/my_profile_utils.dart';
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core;

class FlightAddPaxRequestModel {
  TravellerPassengerDetailRequestModel createUpdatePaxRequestBody(
    TextFormBuilder? formBuilder,
    List<site_core.Country> country, {
    required bool checkForGst,
  }) {
    final List<PaxInfoList> paxInfo =
        _getPassengerList(formBuilder?.formData ?? [], country);
    final ItineraryContactDetail itineraryContactDetail = _getContactDetail(
      formBuilder?.formData ?? [],
      formBuilder?.contactDetails ?? ContactDetails.defaultValue(),
      formBuilder?.billingDetail ?? BillingDetails.defaultValue(),
      checkForGst,
    );
    final GstDetails? gstDetails =
        _getGstDetails(formBuilder?.gstDetails, checkForGst);
    return TravellerPassengerDetailRequestModel(
      paxInfoList: paxInfo,
      contactDetail: itineraryContactDetail,
      gstDetails: gstDetails,
    );
  }

  List<PaxInfoList> _getPassengerList(
    List<OneTravellerDetails> list,
    List<site_core.Country> country,
  ) {
    final List<PaxInfoList> data = [];
    int count = 0;
    for (int index = 0; index < list.length; index++) {
      final String firstName = list[index].firstName.controller.text;
      final String lastName = list[index].lastName.controller.text;
      final String dateOfBirthPassenger =
          MyProfileUtils.convertToRequestDateFormat(
        (list[index].dateOfBirth?.controller.text ?? '').trim(),
      );
      final String passportNumberOfPassenger =
          list[index].passport?.controller.text ?? '';
      final String nationalityOfPassenger =
          list[index].nationality?.controller.text ?? '';
      final String issuedCountryName =
          list[index].issuedCountryName?.controller.text ?? '';
      final String expiryDate = list[index].expiryDate?.controller.text ?? '';
      final String issueDate = list[index].issueDate?.controller.text ?? '';

      // final String gender = list[index].title.controller.text;
      final String gender = list[index].title.controller.text;
      String passengerType = '';
      String namePrefix = '';
      if ((list[index].type ?? '') == kAdult) {
        passengerType = kAdultCode;
        namePrefix = getNamePrefixAsPerTitleSelected(gender);
      } else if ((list[index].type ?? '') == kChild) {
        passengerType = kChildCode;
        namePrefix = gender.startsWith(kMstrDot) ? kMstr : kMiss;
      } else if ((list[index].type ?? '') == kInfant) {
        passengerType = kInfantCode;
        namePrefix = gender.startsWith(kMstrDot) ? kMstr : kMiss;
      }
      final List<Document> doc = [];
      final Document documents = Document(
        docID: passportNumberOfPassenger,
        docHolderNationality: nationalityOfPassenger,
        docIssueCountry: getCountryCode(issuedCountryName, country),
        expireDate: expiryDate,
        docType: 'Passport',
        docIssueDate: issueDate,
      );
      doc.add(documents);
      final PaxInfoList pxInfoList = PaxInfoList(
        dateOfBirth: dateOfBirthPassenger,
        nationality: nationalityOfPassenger.isNotEmpty
            ? getCountryCode(nationalityOfPassenger, country)
            : 'IN',
        travelerRefNumber: count++,
        passengerTypeCode: passengerType,
        document: passportNumberOfPassenger.isNotEmpty ? doc : [],
      );

      final PersonName personData = PersonName(
        firstName: firstName,
        lastName: lastName,
        namePrefix: namePrefix,
        middleName: '',
      );
      pxInfoList.personName = personData;
      data.add(pxInfoList);
    }
    return data;
  }

  String getCountryCode(String countryName, List<site_core.Country> country) {
    if (countryName.isNotEmpty) {
      final requiredCountry =
          country.firstWhere((country) => country.countryName == countryName);
      return requiredCountry.isO2;
    } else {
      return '';
    }
  }

  ItineraryContactDetail _getContactDetail(
    List<OneTravellerDetails> list,
    ContactDetails contactDetails,
    BillingDetails billingDetails,
    bool checkForGst,
  ) {
    final String firstName = list.first.firstName.controller.text;
    final String lastName = list.first.lastName.controller.text;
    // final String gender = list.first.title.controller.text;
    final String gender =
        getNamePrefixAsPerTitleSelected(list.first.title.controller.text);

    final PersonName personName = PersonName(
      firstName: firstName.trim(),
      lastName: lastName.trim(),
      namePrefix: gender,
      middleName: '',
    );
    final List<Email> emailList = [];

    final Email emailData = Email(
      emailId: contactDetails.emailAddress.controller.text.trim(),
      isPrimary: true,
      emailType: 'personal',
    );
    emailList.add(emailData);

    final List<ContactNumber> contactNumberList = [];
    final ContactNumber contactNumber = ContactNumber(
      phoneNumber: contactDetails.contactNumber.controller.text.trim(),
      countryAccessCode: contactDetails.countryCode.controller.text,
      isPrimary: true,
      mobile: contactDetails.contactNumber.controller.text.trim(),
    );
    contactNumberList.add(contactNumber);

    final List<Address> address = [];

    final City cityData = City(
      cityName: billingDetails.city.controller.text,
    );
    final StateProv stateProv = StateProv(
      stateName: billingDetails.state.controller.text,
    );
    final Country country = Country(
      countryName: billingDetails.country.controller.text,
    );

    final Address addressData = Address(
      addressLine: billingDetails.address.controller.text,
      city: cityData,
      postalCode: billingDetails.pinCode.controller.text,
      stateProv: stateProv,
      country: country,
      type: 'Billing',
      isPrimary: true,
    );
    address.add(addressData);

    final ItineraryContactDetail details = ItineraryContactDetail(
      personName: personName,
      email: emailList,
      contactNumber: contactNumberList,
      address: !checkForGst ? address : [],
    );
    return details;
  }

  GstDetails? _getGstDetails(GstDetail? gstDetail, bool checkForGst) {
    if (gstDetail != null && gstDetail.gstNumber.controller.text.isNotEmpty) {
      if (checkForGst) {
        return GstDetails(
          gstNumber: gstDetail.gstNumber.controller.text.trim(),
          gstHolderAddress: gstDetail.gstAddress.controller.text.trim(),
          gstHolderName: gstDetail.gstCompanyName.controller.text.trim(),
          gstHolderCountryName: gstDetail.country.controller.text.trim(),
          gstHolderPinCode: gstDetail.pinCode.controller.text.trim(),
          gstHolderStateName: gstDetail.state.controller.text.trim(),
          gstHolderCityName: gstDetail.city.controller.text.trim(),
        );
      }
    }
    return null;
  }

//this method will return key for prefix to show on UI
  String getNamePrefixAsPerTitleSelected(String gender) {
    if (gender == kMrDot) {
      return kMr;
    } else if (gender == kMsDot) {
      return kMs;
    } else if (gender == kMrsDot) {
      return kMrs;
    } else {
      return kMr;
    }
  }
}

class TravellerPassengerDetailRequestModel {
  TravellerPassengerDetailRequestModel({
    List<PaxInfoList>? paxInfoList,
    ItineraryContactDetail? contactDetail,
    GstDetails? gstDetails,
  }) {
    _paxInfoList = paxInfoList;
    _contactDetail = contactDetail;
    _gstDetails = gstDetails;
  }

  TravellerPassengerDetailRequestModel.fromJson(Map<String, dynamic> json) {
    if (json['paxInfoList'] != null) {
      _paxInfoList = [];
      for (final object in json['paxInfoList'] as List) {
        final PaxInfoList paxInfoList = PaxInfoList.fromJson(
          object,
          null,
        );
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
