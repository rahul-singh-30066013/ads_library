import 'package:adani_airport_mobile/modules/session/models/request/send_email_otp_request.dart';
import 'package:adani_airport_mobile/modules/session/repository/session_repository.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

class ChangeEmailState extends BaseViewModel {
  final SessionRepository _sessionRepository = SessionRepository();
  ADResponseState changeResponseState = ADResponseState.init();

  String errorMessageEmailAlreadyExit = '';

  //to send otp on email
  Future<ADResponseState> sendEmailOtp({
    required SendEmailOtpRequest sendEmailOtpRequest,
  }) async {
    changeResponseState = ADResponseState.loading();
    notifyListeners();
    changeResponseState = await _sessionRepository.sendEmailOtp(
      sendEmailOtpRequest: sendEmailOtpRequest,
    );
    notifyListeners();
    return changeResponseState;
  }

  void emailIdAlReadyExit(String value) {
    errorMessageEmailAlreadyExit = value;
    notifyListeners();
  }
}
