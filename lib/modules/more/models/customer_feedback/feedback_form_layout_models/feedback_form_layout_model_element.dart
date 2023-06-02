/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class FeedbackFormLayoutModelElement {
  String? uid;
  String? componentName;
  String? dataSource;
  Fields? fields;

  FeedbackFormLayoutModelElement({
    this.uid,
    this.componentName,
    this.dataSource,
    this.fields,
  });

  FeedbackFormLayoutModelElement.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    componentName = json['componentName'];
    dataSource = json['dataSource'];
    fields = json['fields'] != null ? Fields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['componentName'] = componentName;
    data['dataSource'] = dataSource;
    if (fields != null) {
      data['fields'] = fields?.toJson();
    }
    return data;
  }
}

class Fields {
  String? formTitle;
  String? formSubtitle;
  String? bannerTitle;
  String? mobileBannerImage;
  String? reachOutText;
  String? sendQueryText;
  String? firstNameLabel;
  String? firstNameRequired;
  String? firstNameIncorrect;
  String? lastNameLabel;
  String? lastNameRequired;
  String? lastNameIncorrect;
  String? mobileNoLabel;
  String? mobileNoRequired;
  String? mobileNoIncorrect;
  String? emailIdLabel;
  String? emailIdRequired;
  String? emailIdIncorrect;
  String? selectAirportLabel;
  String? airportRequired;
  String? flightNumberLabel;
  String? flightDateLabel;
  String? issueTypeLabel;
  List<AirportDetails>? airportDetails;
  List<IssueTypeList>? issueTypeList;
  String? issueTypeRequired;
  String? helpTextLabel;
  String? helpTextRequired;
  String? helpTextMaxCharacter;
  String? helpTextMaxCharacterMsg;
  String? writePlacholderLabel;
  String? termsLabel;
  String? termsRequired;
  String? submitButtonLabel;

  Fields({
    this.formTitle,
    this.formSubtitle,
    this.bannerTitle,
    this.mobileBannerImage,
    this.reachOutText,
    this.sendQueryText,
    this.firstNameLabel,
    this.firstNameRequired,
    this.firstNameIncorrect,
    this.lastNameLabel,
    this.lastNameRequired,
    this.lastNameIncorrect,
    this.mobileNoLabel,
    this.mobileNoRequired,
    this.mobileNoIncorrect,
    this.emailIdLabel,
    this.emailIdRequired,
    this.emailIdIncorrect,
    this.selectAirportLabel,
    this.airportRequired,
    this.flightNumberLabel,
    this.flightDateLabel,
    this.issueTypeLabel,
    this.airportDetails,
    this.issueTypeList,
    this.issueTypeRequired,
    this.helpTextLabel,
    this.helpTextRequired,
    this.helpTextMaxCharacter,
    this.helpTextMaxCharacterMsg,
    this.writePlacholderLabel,
    this.termsLabel,
    this.termsRequired,
    this.submitButtonLabel,
  });

  Fields.fromJson(Map<String, dynamic> json) {
    formTitle = json['formTitle'];
    formSubtitle = json['formSubtitle'];
    bannerTitle = json['bannerTitle'];
    mobileBannerImage = json['mobileBannerImage'];
    reachOutText = json['reachOutText'];
    sendQueryText = json['sendQueryText'];
    firstNameLabel = json['firstNameLabel'];
    firstNameRequired = json['firstNameRequired'];
    firstNameIncorrect = json['firstNameIncorrect'];
    lastNameLabel = json['lastNameLabel'];
    lastNameRequired = json['lastNameRequired'];
    lastNameIncorrect = json['lastNameIncorrect'];
    mobileNoLabel = json['mobileNoLabel'];
    mobileNoRequired = json['mobileNoRequired'];
    mobileNoIncorrect = json['mobileNoIncorrect'];
    emailIdLabel = json['emailIdLabel'];
    emailIdRequired = json['emailIdRequired'];
    emailIdIncorrect = json['emailIdIncorrect'];
    selectAirportLabel = json['selectAirportLabel'];
    airportRequired = json['airportRequired'];
    flightNumberLabel = json['flightNumberLabel'];
    flightDateLabel = json['flightDateLabel'];
    issueTypeLabel = json['issueTypeLabel'];
    if (json['airportDetails'] != null) {
      airportDetails = <AirportDetails>[];
      for (final Map<String, dynamic> airportDetail in json['airportDetails']) {
        airportDetails?.add(AirportDetails.fromJson(airportDetail));
      }
    }
    if (json['issueTypeList'] != null) {
      issueTypeList = <IssueTypeList>[];
      for (final Map<String, dynamic> issueType in json['issueTypeList']) {
        issueTypeList?.add(IssueTypeList.fromJson(issueType));
      }
    }
    issueTypeRequired = json['issueTypeRequired'];
    helpTextLabel = json['helpTextLabel'];
    helpTextRequired = json['helpTextRequired'];
    helpTextMaxCharacter = json['helpTextMaxCharacter'];
    helpTextMaxCharacterMsg = json['helpTextMaxCharacterMsg'];
    writePlacholderLabel = json['writePlacholderLabel'];
    termsLabel = json['termsLabel'];
    termsRequired = json['termsRequired'];
    submitButtonLabel = json['submitButtonLabel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['formTitle'] = formTitle;
    data['formSubtitle'] = formSubtitle;
    data['bannerTitle'] = bannerTitle;
    data['mobileBannerImage'] = mobileBannerImage;
    data['reachOutText'] = reachOutText;
    data['sendQueryText'] = sendQueryText;
    data['firstNameLabel'] = firstNameLabel;
    data['firstNameRequired'] = firstNameRequired;
    data['firstNameIncorrect'] = firstNameIncorrect;
    data['lastNameLabel'] = lastNameLabel;
    data['lastNameRequired'] = lastNameRequired;
    data['lastNameIncorrect'] = lastNameIncorrect;
    data['mobileNoLabel'] = mobileNoLabel;
    data['mobileNoRequired'] = mobileNoRequired;
    data['mobileNoIncorrect'] = mobileNoIncorrect;
    data['emailIdLabel'] = emailIdLabel;
    data['emailIdRequired'] = emailIdRequired;
    data['emailIdIncorrect'] = emailIdIncorrect;
    data['selectAirportLabel'] = selectAirportLabel;
    data['airportRequired'] = airportRequired;
    data['flightNumberLabel'] = flightNumberLabel;
    data['flightDateLabel'] = flightDateLabel;
    data['issueTypeLabel'] = issueTypeLabel;
    if (airportDetails != null) {
      data['airportDetails'] = airportDetails?.map((v) => v.toJson()).toList();
    }
    if (issueTypeList != null) {
      data['issueTypeList'] = issueTypeList?.map((v) => v.toJson()).toList();
    }
    data['issueTypeRequired'] = issueTypeRequired;
    data['helpTextLabel'] = helpTextLabel;
    data['helpTextRequired'] = helpTextRequired;
    data['helpTextMaxCharacter'] = helpTextMaxCharacter;
    data['helpTextMaxCharacterMsg'] = helpTextMaxCharacterMsg;
    data['writePlacholderLabel'] = writePlacholderLabel;
    data['termsLabel'] = termsLabel;
    data['termsRequired'] = termsRequired;
    data['submitButtonLabel'] = submitButtonLabel;
    return data;
  }
}

class AirportDetails {
  String? airportCode;
  String? airportName;
  String? airportAddress;
  String? airportMobile;
  String? airportEmail;
  String? supportEmail;
  String? emailText;
  String? terminalContentTitle;
  String? terminalContentMain;
  List<ContactDetails>? authoritiesContacts;
  List<TerminalDetails>? terminalDetails;
  String? faqImage;
  String? faqTitle;
  String? faqContent;
  String? faqLink;
  String? faqLinkText;

  AirportDetails({
    this.airportCode,
    this.airportName,
    this.airportAddress,
    this.airportMobile,
    this.airportEmail,
    this.supportEmail,
    this.emailText,
    this.terminalContentTitle,
    this.terminalContentMain,
    this.authoritiesContacts,
    this.terminalDetails,
    this.faqImage,
    this.faqTitle,
    this.faqContent,
    this.faqLink,
    this.faqLinkText,
  });

  AirportDetails.fromJson(Map<String, dynamic> json) {
    airportCode = json['airportCode'];
    airportName = json['airportName'];
    airportAddress = json['airportAddress'];
    airportMobile = json['airportMobile'];
    airportEmail = json['airportEmail'];
    supportEmail = json['supportEmail'];
    emailText = json['emailText'];
    terminalContentTitle = json['terminalContentTitle'];
    terminalContentMain = json['terminalContentMain'];
    if (json['authoritiesContacts'] != null) {
      authoritiesContacts = <ContactDetails>[];
      for (final Map<String, dynamic> contactDetail
          in json['authoritiesContacts']) {
        authoritiesContacts?.add(ContactDetails.fromJson(contactDetail));
      }
    }
    if (json['terminalDetails'] != null) {
      terminalDetails = <TerminalDetails>[];
      for (final Map<String, dynamic> terminalDetail
          in json['terminalDetails']) {
        terminalDetails?.add(TerminalDetails.fromJson(terminalDetail));
      }
    }
    faqImage = json['faqImage'];
    faqTitle = json['faqTitle'];
    faqContent = json['faqContent'];
    faqLink = json['faqLink'];
    faqLinkText = json['faqLinkText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['airportCode'] = airportCode;
    data['airportName'] = airportName;
    data['airportAddress'] = airportAddress;
    data['airportMobile'] = airportMobile;
    data['airportEmail'] = airportEmail;
    data['supportEmail'] = supportEmail;
    data['emailText'] = emailText;
    data['terminalContentTitle'] = terminalContentTitle;
    data['terminalContentMain'] = terminalContentMain;
    if (authoritiesContacts != null) {
      data['authoritiesContacts'] =
          authoritiesContacts?.map((v) => v.toJson()).toList();
    }
    if (terminalDetails != null) {
      data['terminalDetails'] =
          terminalDetails?.map((v) => v.toJson()).toList();
    }
    data['faqImage'] = faqImage;
    data['faqTitle'] = faqTitle;
    data['faqContent'] = faqContent;
    data['faqLink'] = faqLink;
    data['faqLinkText'] = faqLinkText;
    return data;
  }
}

class TerminalDetails {
  String? terminalName;
  List<ContactList>? contactList;
  String? immigrationTitle;
  List<ContactList>? immigration;
  String? ministryCivilTitle;
  List<ContactList>? ministryCivil;

  TerminalDetails({
    this.terminalName,
    this.contactList,
    this.immigrationTitle,
    this.immigration,
    this.ministryCivilTitle,
    this.ministryCivil,
  });

  TerminalDetails.fromJson(Map<String, dynamic> json) {
    terminalName = json['terminalName'];
    if (json['contactList'] != null) {
      contactList = <ContactList>[];
      for (final Map<String, dynamic> contact in json['contactList']) {
        contactList?.add(ContactList.fromJson(contact));
      }
    }
    immigrationTitle = json['immigrationTitle'];
    if (json['immigration'] != null) {
      immigration = <ContactList>[];
      for (final Map<String, dynamic> contact in json['immigration']) {
        immigration?.add(ContactList.fromJson(contact));
      }
    }
    ministryCivilTitle = json['ministryCivilTitle'];
    if (json['ministryCivil'] != null) {
      ministryCivil = <ContactList>[];
      for (final Map<String, dynamic> contact in json['ministryCivil']) {
        ministryCivil?.add(ContactList.fromJson(contact));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['terminalName'] = terminalName;
    if (contactList != null) {
      data['contactList'] = contactList?.map((v) => v.toJson()).toList();
    }
    data['immigrationTitle'] = immigrationTitle;
    if (immigration != null) {
      data['immigration'] = immigration?.map((v) => v.toJson()).toList();
    }
    data['ministryCivilTitle'] = ministryCivilTitle;
    if (ministryCivil != null) {
      data['ministryCivil'] = ministryCivil?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContactList {
  String? terminalContactName;
  String? arrivalContactNo;
  String? departureContactNo;

  ContactList({
    this.terminalContactName,
    this.arrivalContactNo,
    this.departureContactNo,
  });

  ContactList.fromJson(Map<String, dynamic> json) {
    terminalContactName = json['terminalContactName'];
    arrivalContactNo = json['arrivalContactNo'];
    departureContactNo = json['departureContactNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['terminalContactName'] = terminalContactName;
    data['arrivalContactNo'] = arrivalContactNo;
    data['departureContactNo'] = departureContactNo;
    return data;
  }
}

class ContactDetails {
  String? title;
  String? name;
  String? mobile;
  String? email;

  ContactDetails({
    this.title,
    this.name,
    this.mobile,
    this.email,
  });

  ContactDetails.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['name'] = name;
    data['mobile'] = mobile;
    data['email'] = email;
    return data;
  }
}

class IssueTypeList {
  String? issueText;
  String? issueValue;
  String? emailSubmissionMsg;
  String? smsSubmissionMsg;
  String? emailFulfillmentMsg;
  String? smsFulfillmentMsg;
  String? popUpSuccessMsg;
  String? popUpReOpenMsg;
  String? popUpTitle;

  IssueTypeList({
    this.issueText,
    this.issueValue,
    this.emailSubmissionMsg,
    this.smsSubmissionMsg,
    this.emailFulfillmentMsg,
    this.smsFulfillmentMsg,
    this.popUpSuccessMsg,
    this.popUpReOpenMsg,
    this.popUpTitle,
  });

  IssueTypeList.fromJson(Map<String, dynamic> json) {
    issueText = json['issueText'];
    issueValue = json['issueValue'];
    emailSubmissionMsg = json['emailSubmissionMsg'];
    smsSubmissionMsg = json['smsSubmissionMsg'];
    emailFulfillmentMsg = json['emailFulfillmentMsg'];
    smsFulfillmentMsg = json['smsFulfillmentMsg'];
    popUpSuccessMsg = json['popUpSuccessMsg'];
    popUpReOpenMsg = json['popUpReOpenMsg'];
    popUpTitle = json['popUpTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['issueText'] = issueText;
    data['issueValue'] = issueValue;
    data['emailSubmissionMsg'] = emailSubmissionMsg;
    data['smsSubmissionMsg'] = smsSubmissionMsg;
    data['emailFulfillmentMsg'] = emailFulfillmentMsg;
    data['smsFulfillmentMsg'] = smsFulfillmentMsg;
    data['popUpSuccessMsg'] = popUpSuccessMsg;
    data['popUpReOpenMsg'] = popUpReOpenMsg;
    data['popUpTitle'] = popUpTitle;
    return data;
  }
}
