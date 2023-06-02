/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

//this class will used for document object in itinerary session
class Document {
  Document({
    this.docID,
    this.docType,
    this.docHolderName,
    this.docLimitations,
    this.additionalPersonNames,
    this.shareMarketInd,
    this.docIssueAuthority,
    this.docIssueLocation,
    this.gender,
    this.birthDate,
    this.effectiveDate,
    this.expireDate,
    this.expireDateExclusiveInd,
    this.docIssueStateProv,
    this.docIssueCountry,
    this.docIssueDate,
    this.birthCountry,
    this.birthPlace,
    this.docHolderNationality,
    this.contactName,
    this.holderType,
    this.remark,
    this.postalCode,
    this.address,
    this.docApplicableCountry,
  });
  final String? docID;
  final String? docType;
  final String? docHolderName;
  final String? docLimitations;
  final String? additionalPersonNames;
  final String? shareMarketInd;
  final String? docIssueAuthority;
  final String? docIssueLocation;
  final String? gender;
  final String? birthDate;
  final String? effectiveDate;
  final String? expireDate;
  final String? expireDateExclusiveInd;
  final String? docIssueStateProv;
  final String? docIssueCountry;
  final String? docIssueDate;
  final String? birthCountry;
  final String? birthPlace;
  final String? docHolderNationality;
  final String? contactName;
  final String? holderType;
  final String? remark;
  final String? postalCode;
  final String? address;
  final String? docApplicableCountry;

  Document copyWith({
    String? docID,
    String? docType,
    String? docHolderName,
    String? docLimitations,
    String? additionalPersonNames,
    String? shareMarketInd,
    String? docIssueAuthority,
    String? docIssueLocation,
    String? gender,
    String? birthDate,
    String? effectiveDate,
    String? expireDate,
    String? expireDateExclusiveInd,
    String? docIssueStateProv,
    String? docIssueCountry,
    String? docIssueDate,
    String? birthCountry,
    String? birthPlace,
    String? docHolderNationality,
    String? contactName,
    String? holderType,
    String? remark,
    String? postalCode,
    String? address,
    String? docApplicableCountry,
  }) =>
      Document(
        docID: docID ?? this.docID,
        docType: docType ?? this.docType,
        docHolderName: docHolderName ?? this.docHolderName,
        docLimitations: docLimitations ?? this.docLimitations,
        additionalPersonNames:
            additionalPersonNames ?? this.additionalPersonNames,
        shareMarketInd: shareMarketInd ?? this.shareMarketInd,
        docIssueAuthority: docIssueAuthority ?? this.docIssueAuthority,
        docIssueLocation: docIssueLocation ?? this.docIssueLocation,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
        effectiveDate: effectiveDate ?? this.effectiveDate,
        expireDate: expireDate ?? this.expireDate,
        expireDateExclusiveInd:
            expireDateExclusiveInd ?? this.expireDateExclusiveInd,
        docIssueStateProv: docIssueStateProv ?? this.docIssueStateProv,
        docIssueCountry: docIssueCountry ?? this.docIssueCountry,
        docIssueDate: docIssueDate ?? this.docIssueDate,
        birthCountry: birthCountry ?? this.birthCountry,
        birthPlace: birthPlace ?? this.birthPlace,
        docHolderNationality: docHolderNationality ?? this.docHolderNationality,
        contactName: contactName ?? this.contactName,
        holderType: holderType ?? this.holderType,
        remark: remark ?? this.remark,
        postalCode: postalCode ?? this.postalCode,
        address: address ?? this.address,
        docApplicableCountry: docApplicableCountry ?? this.docApplicableCountry,
      );
  factory Document.fromJson(Map<String, dynamic> json) => Document(
        docID: json['docID'],
        docType: json['docType'],
        docHolderName: json['docHolderName'],
        docLimitations: json['docLimitations'],
        additionalPersonNames: json['additionalPersonNames'],
        shareMarketInd: json['shareMarketInd'],
        docIssueAuthority: json['docIssueAuthority'],
        docIssueLocation: json['docIssueLocation'],
        gender: json['gender'],
        birthDate: json['birthDate'],
        effectiveDate: json['effectiveDate'],
        expireDate: json['expireDate'],
        expireDateExclusiveInd: json['expireDateExclusiveInd'],
        docIssueStateProv: json['docIssueStateProv'],
        docIssueCountry: json['docIssueCountry'],
        docIssueDate: json['docIssueDate'],
        birthCountry: json['birthCountry'],
        birthPlace: json['birthPlace'],
        docHolderNationality: json['docHolderNationality'],
        contactName: json['contactName'],
        holderType: json['holderType'],
        remark: json['remark'],
        postalCode: json['postalCode'],
        address: json['address'],
        docApplicableCountry: json['docApplicableCountry'],
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['docID'] = docID;
    map['docType'] = docType;
    map['docHolderName'] = docHolderName;
    map['docLimitations'] = docLimitations;
    map['additionalPersonNames'] = additionalPersonNames;
    map['shareMarketInd'] = shareMarketInd;
    map['docIssueAuthority'] = docIssueAuthority;
    map['docIssueLocation'] = docIssueLocation;
    map['gender'] = gender;
    map['birthDate'] = birthDate;
    map['effectiveDate'] = effectiveDate;
    map['expireDate'] = expireDate;
    map['expireDateExclusiveInd'] = expireDateExclusiveInd;
    map['docIssueStateProv'] = docIssueStateProv;
    map['docIssueCountry'] = docIssueCountry;
    map['docIssueDate'] = docIssueDate;
    map['birthCountry'] = birthCountry;
    map['birthPlace'] = birthPlace;
    map['docHolderNationality'] = docHolderNationality;
    map['contactName'] = contactName;
    map['holderType'] = holderType;
    map['remark'] = remark;
    map['postalCode'] = postalCode;
    map['address'] = address;
    map['docApplicableCountry'] = docApplicableCountry;
    return map;
  }
}
