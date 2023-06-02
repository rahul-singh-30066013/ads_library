/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

class SessionApiUrls {
  // static const _baseNameIdentity = 'identity';
  static const _baseNameIdentity = 'api/identityproviderv2';
//  static const _baseNameIdentity = 'identity';

  static const getProfile =
      '$_baseNameIdentity/api/v2/AuthenticateApiv2/GetProfile';
  static const updateProfile =
      '$_baseNameIdentity/api/v2/AuthenticateApiv2/UpdateProfile';

  // static const sendOTP = '$_baseNameIdentity/api/v2/AuthenticateApiv2/SendOtp';
  static const sendOTP = '$_baseNameIdentity/api/v2/AuthenticateApiv2/SendOtp';
  static const validateOTP =
      '$_baseNameIdentity/api/v2/AuthenticateApiv2/ValidateOtp';
  static const signOut = '$_baseNameIdentity/api/v2/AuthenticateApiv2/SignOut';
  static const refreshToken =
      '$_baseNameIdentity/api/v2/AuthenticateApiv2/RefreshToken';
  static const profileImage =
      '$_baseNameIdentity/api/v2/AuthenticateApiv2/profileImage';
}
