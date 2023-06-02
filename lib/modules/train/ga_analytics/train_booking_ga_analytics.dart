
import 'package:adani_airport_mobile/analytics/click_events.dart';


class TrainBookingGaAnalytics{
  void signInAnalyticsData({bool? signInFromPopup}){
    final isSignInFromPopup = signInFromPopup ?? false;

      final signInObject = <String, Object?>{
        Parameters.category.name:isSignInFromPopup ? 'home_screen_popup':'Train_Booking',
        Parameters.sub_category.name: 'sign_in',
      };
      ClickEvents.login_submit.logEvent(parameters: signInObject);
    }
  void loginSuccessfulAnalyticsData(
      String userId, {
        bool isRegistered = false,
        required String type,
        required String label, bool? signInFromPopup,
      }) {
    final isSignInFromPopup = signInFromPopup ?? false;
    final signInObject = <String, Object?>{
      Parameters.category.name: isSignInFromPopup ? 'home_screen_popup' : 'Train_Booking',
      Parameters.sub_category.name: 'sign_in',
      Parameters.user_id.name: userId,
      Parameters.is_registered.name: isRegistered,
      Parameters.type.name: type,
      Parameters.label.name: label,
    };
    ClickEvents.login.logEvent(parameters: signInObject);
  }
  void signUpSuccessfulAnalyticsData(
      String userId, {
        bool isRegistered = false,
        required String type,
        required String label,
      }) {
    final signInObject = <String, Object?>{
      Parameters.category.name: 'flight_book',
      Parameters.sub_category.name: 'sign_in',
      Parameters.user_id.name: userId,
      Parameters.is_registered.name: isRegistered,
      Parameters.type.name: type,
      Parameters.label.name: label,
    };
    ClickEvents.sign_up.logEvent(parameters: signInObject);
  }
  void otpVerifiedSuccessAnalyticsData(
      String type,
      String label, {
        bool isRegistered = false,
        bool? signInFromPopup,
      }) {
    final isSignInFromPopup = signInFromPopup ?? false;
    final signInObject = <String, Object?>{
      Parameters.category.name: isSignInFromPopup ? 'home_screen_popup' : 'Train_Booking',
      Parameters.sub_category.name: 'sign_in',
      Parameters.is_registered.name: isRegistered,
      Parameters.label.name: label,
      Parameters.type.name: type,
    };
    ClickEvents.otp_verification_success.logEvent(parameters: signInObject);
  }

  void otpSuccessAnalyticsData({required String type, required String label,bool? signInFromPopup}) {
    final isSignInFromPopup=signInFromPopup?? false;
    final signInObject = <String, Object?>{
      Parameters.category.name: isSignInFromPopup ? 'home_screen_popup' : 'Train_Booking',
      Parameters.sub_category.name: 'sign_in',
      Parameters.type.name: type,
      Parameters.label.name: label,
    };
    ClickEvents.otp_verification.logEvent(parameters: signInObject);
  }
  void downloadTrainInvoiceAnalyticsData() {
    final downloadInvoiceGAObject = <String, Object?>{
      Parameters.category.name: 'train_booking',
      Parameters.sub_category.name: 'orders_and_bookings',
      Parameters.label.name: 'invoice',
    };
    ClickEvents.file_download.logEvent(
      parameters: downloadInvoiceGAObject,
    );
  }
  void signInVerificationFailAnalyticsData(
      String? message,
      String? errorCode, {
        bool isRegistered = false,
        required String type,
        required String label,
        bool? signInFromPopup,
      }) {
    final isSignInFromPopup = signInFromPopup ?? false;
    final signInObject = <String, Object?>{
      Parameters.category.name: isSignInFromPopup ? 'home_screen_popup' : 'Train_Booking',
      Parameters.sub_category.name: 'sign_in',
      Parameters.error_code.name: errorCode,
      Parameters.error_text.name: message,
      Parameters.is_registered.name: isRegistered,
      Parameters.type.name: type,
      Parameters.label.name: label,
    };
    ClickEvents.otp_verification_fail.logEvent(parameters: signInObject);
  }
  void signInFailAnalyticsData({
    bool isRegistered = false,
    required String type,
    required String label,
    bool? signInFromPopup,
  }) {
    final isSignInFromPopup = signInFromPopup ?? false;
    final signInObject = <String, Object?>{
      Parameters.category.name: isSignInFromPopup ? 'home_screen_popup' : 'Train_Booking',
      Parameters.sub_category.name: 'sign_in',
      Parameters.is_registered.name: isRegistered,
      Parameters.type.name: type,
      Parameters.label.name: label,
    };
    ClickEvents.login_fail.logEvent(parameters: signInObject);
  }

  }
