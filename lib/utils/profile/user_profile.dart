/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/country_code_model.dart';

class UserProfile {
  String _userId = '';
  bool _isLoggedIn = false;
  String _accessToken = '';
  String _refreshToken = '';
  CountryCodeData? _countryCodeData;

  UserProfile({
    String userId = '',
    bool isLoggedIn = false,
    String accessToken = '',
    String refreshToken = '',
    CountryCodeData? countryCodeData,
  }) {
    _userId = userId;
    _isLoggedIn = isLoggedIn;
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _countryCodeData = countryCodeData;
  }

  String get userId => _userId;

  bool get isLoggedIn => _isLoggedIn;

  String get accessToken => _accessToken;

  String get refreshToken => _refreshToken;

  CountryCodeData get countryCodeData =>
      _countryCodeData ?? CountryCodeData.defaultValue();

  UserProfile.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _isLoggedIn = json['isLoggedIn'];
    _accessToken = json['accessToken'] ?? '';
    _refreshToken = json['refreshToken'] ?? '';
    _countryCodeData = json['countryCodeData'] != null
        ? CountryCodeData.fromJson(json['countryCodeData'])
        : CountryCodeData.defaultValue();
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'isLoggedIn': isLoggedIn,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'countryCodeData': countryCodeData.toJson(),
      };
}
