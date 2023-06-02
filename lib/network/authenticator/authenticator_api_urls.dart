class AuthenticatorApiUrls {
  static const _baseNameAuthenticator = 'api/authenticatorv2';
  static const _baseNameIdentityprovider = 'api/identityproviderv2';

  static const sendEmailOTP =
      '$_baseNameIdentityprovider/api/v2/AuthenticateApiv2/SendOTPEmail';
  static const validateEmailOTP =
      '$_baseNameIdentityprovider/api/v2/AuthenticateApiv2/VerifyEmail';
  static const getActiveCart =
      '$_baseNameAuthenticator/api/MyBooking/GetActiveCart/v2';
  static const myBookings = 'api/orderv2/order/list';
  static const upcomingBookings = '$_baseNameAuthenticator/api/mybooking';

  static const getSavedFlight =
      '$_baseNameAuthenticator/api/User/getSavedFlight';
  static const deleteSavedFlight =
      '$_baseNameAuthenticator/api/User/deleteSavedFlight/';
}
