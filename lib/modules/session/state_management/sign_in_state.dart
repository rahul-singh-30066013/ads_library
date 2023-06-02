/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/repositories/flight_booking_repository.dart';
import 'package:adani_airport_mobile/modules/session/models/request/send_otp_request.dart';
import 'package:adani_airport_mobile/modules/session/repository/session_repository.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

/// This class is used to manage state of sign in screen.
class SignInState extends ADBaseViewModel {
  final SessionRepository _sessionRepository = SessionRepository();
  bool absorbing = false;

  final FlightBookingRepository _flightBookingRepository =
      FlightBookingRepository();
  ADResponseState offerState = ADResponseState.loading();

  Future<ADResponseState> sendOtp({
    required SendOtpRequest sendOtpRequest,
  }) async {
    notify(absorbingValue: true);
    return _sessionRepository.sendOtp(
      sendOtpRequest: sendOtpRequest,
    );
  }

  void notify({required bool absorbingValue}) {
    absorbing = absorbingValue;
    notifyListeners();
  }

  // Api call for signin offer
  Future<void> getSignInOffer() async {
    final value = await _flightBookingRepository.getSignInOfferList();
    offerState = value;
    notifyListeners();
  }
}
