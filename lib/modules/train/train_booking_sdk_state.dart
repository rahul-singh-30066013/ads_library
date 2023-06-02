import 'dart:async';

import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/train/repository/train_booking_repository.dart';
import 'package:adani_airport_mobile/utils/jwt_token_decoder.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:trainman_booking_sdk/trainman_booking_sdk.dart';

class TrainBookingSdkState extends ADBaseViewModel{

  bool isFetchAccessToken=false;
  String? authToken;
  String? bookingID;
  String? userID;
  final TrainBookingRepository _trainBookingRepository =
  TrainBookingRepository();
  final Map<String, dynamic> sdkParamsBody = {};

  Future<void> fetchAccessTokenForTrainMan(fromLoginPage) async {
    await SharedPrefsUtils()
        .getValueFromPrefs(SharedPrefUtilsKeys.accessToken)
        .then((value) {
      authToken = value ;
      fetchUserID();
      sdkParamsBody['access_token']=authToken;
      if(bookingID!=null) {
        sdkParamsBody['tmBookingId']=bookingID;
      }
          if(fromLoginPage){
            InitiateTmBookingSdk.updateAccessToken(authToken, 'refreshToken');
          }
          else{
            isFetchAccessToken=true;
            notifyListeners();
          }


    });
  }

  void fetchUserID(){
    if(authToken!=null){
      final Map<String, dynamic>? decodedTokenData =
      JwtTokenDecoder.decode(authToken??'');
      userID = decodedTokenData?['sub'];
    }

  }

  Future<void> downloadTrainInvoice(
      String bookingId,
      BuildContext context,
      ) async {
    unawaited(
      _trainBookingRepository.downloadTrainInvoice(
        bookingId,
        context,
        userID,
      ),
    );
  }

}