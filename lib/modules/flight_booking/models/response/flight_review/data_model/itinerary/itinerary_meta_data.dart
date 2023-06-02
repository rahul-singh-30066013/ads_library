/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

/// this class is used to receive ItineraryMetaData model for view itinerary
class ItineraryMetaData {
  ItineraryMetaData({
    int? minLastNameLength,
    int? maxPaxNameLength,
    bool? isPassportRequired,
    bool? isDateOfBirthRequired,
    bool? isNationalityRequired,
    bool? isInsuranceRequired,
    bool? isPassportExpiryRequired,
    bool? isPassportIssueRequired,
    bool? isPassportIssueCountryRequired,
    bool? isZeroCancellationRequired,
  }) {
    _minLastNameLength = minLastNameLength;
    _maxPaxNameLength = maxPaxNameLength;
    _isPassportRequired = isPassportRequired;
    _isDateOfBirthRequired = isDateOfBirthRequired;
    _isNationalityRequired = isNationalityRequired;
    _isInsuranceRequired = isInsuranceRequired;
    _isPassportExpiryRequired = isPassportExpiryRequired;
    _isPassportIssueRequired = isPassportIssueRequired;
    _isPassportIssueCountryRequired = isPassportIssueCountryRequired;
    _isZeroCancellationRequired = isZeroCancellationRequired;
  }

  ItineraryMetaData.fromJson(Map<String, dynamic> json) {
    _minLastNameLength = json['minLastNameLength'];
    _maxPaxNameLength = json['maxPaxNameLength'];
    _isPassportRequired = json['isPassportRequired'];
    _isDateOfBirthRequired = json['isDateOfBirthRequired'];
    _isNationalityRequired = json['isNationalityRequired'];
    _isInsuranceRequired = json['isInsuranceRequired'];
    _isPassportExpiryRequired = json['isPassportExpiryRequired'];
    _isPassportIssueRequired = json['isPassportIssueRequired'];
    _isPassportIssueCountryRequired = json['isPassportIssueCountryRequired'];
    _isZeroCancellationRequired = json['isZeroCancellationRequired'];
  }
  int? _minLastNameLength;
  int? _maxPaxNameLength;
  bool? _isPassportRequired;
  bool? _isDateOfBirthRequired;
  bool? _isNationalityRequired;
  bool? _isInsuranceRequired;
  bool? _isPassportExpiryRequired;
  bool? _isPassportIssueRequired;
  bool? _isPassportIssueCountryRequired;
  bool? _isZeroCancellationRequired;

  int? get minLastNameLength => _minLastNameLength;
  int? get maxPaxNameLength => _maxPaxNameLength;
  bool? get isPassportRequired => _isPassportRequired;
  bool? get isDateOfBirthRequired => _isDateOfBirthRequired;
  bool? get isNationalityRequired => _isNationalityRequired;
  bool? get isInsuranceRequired => _isInsuranceRequired;
  bool? get isPassportExpiryRequired => _isPassportExpiryRequired;
  bool? get isPassportIssueRequired => _isPassportIssueRequired;
  bool? get isPassportIssueCountryRequired => _isPassportIssueCountryRequired;
  bool? get isZeroCancellationRequired => _isZeroCancellationRequired;
}
