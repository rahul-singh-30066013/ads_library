/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';
import 'dart:typed_data';

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/earning.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/potential_earning_response_model.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart'
    as pranaam_detail;
import 'package:adani_airport_mobile/modules/flight_booking/repositories/flight_booking_repository.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/cancel_booking/api_request_model/cancel_booking_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/cancel_booking/api_response_model/cancel_booking_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/repository/booking_payment_cancellation/booking_payment_cancellation_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/screen_helper/process_dialog.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/network/pranaam_api/pranaam_api_urls.dart';
import 'package:adani_airport_mobile/network/site_core_api/site_core_api_urls.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';

class BookingAndCancellationState extends ADBaseViewModel {
  final BookingPaymentCancellationRepository
      _bookingPaymentCancellationRepository =
      BookingPaymentCancellationRepository();
  CommonOrderDetailBaseResponse? bookingDetailsResponse;

  /// Initiate loading state for api hit
  bool isButtonClicked = false;
  ValueNotifier<bool> bookingCancelledStatus = ValueNotifier(false);
  bool isUpgrading = false;
  ADResponseState getBookingDetailsState = ADResponseState.loading();
  FlightBookingRepository flightBookingRepo = FlightBookingRepository();
  List<pranaam_detail.Traveler> guestsSelected = [];
  int nonCancellingAdult = 0;
  int nonCancellingChild = 0;
  int nonCancellingInfant = 0;
  String bookingId = '';
  bool isEarnPointsLoading = false;

  Future<ADResponseState> getBookingDetails({
    bool fromInit = false,
    required String orderId,
  }) async {
    adLog('cancel Booking called');
    final ADResponseState response = await flightBookingRepo.getOrder(
      orderId,
    );

    getBookingDetailsState = response;
    bookingDetailsResponse = getBookingDetailsState.data;

    if (fromInit) {
      adLog('Listeners Notified');
      notifyListeners();
    } else {
      adLog('Listeners Notified not');
    }

    return response;
  }

  String getImportantInfoItem() {
    switch (bookingDetailsResponse
        ?.orderDetail?.pranaamDetail?.pranaamBookingType
        ?.toLowerCase()) {
      case 'standaloneporterbooking':
        return SiteCoreApiUrls.siteCorePorterImportantInfo;
      case 'standalonewheelchairbooking':
        return SiteCoreApiUrls.siteCoreWheelChairImportantInfo;
      default:
        return SiteCoreApiUrls.siteCoreImportantInfo;
    }
  }

  Future<ADResponseState> getImportantInformation({
    required String infoType,
  }) async {
    final ADResponseState responseState =
        await SiteCoreStateManagement().fetchImportantInformationFromSiteCore(
      infoType: infoType,
      item: getImportantInfoItem(),
    );
    impInfoState = responseState;
    updateInfoAvailable();
    return responseState;
  }

  ///This method is used to download the invoice
  Future<ADResponseState> downloadInvoice(
    BuildContext context,
    String? bookingID,
    String? tripId,
  ) async {
    // final APIService dioService = APIService(
    //   baseUrl: ApiPathGas.baseURl,
    //   flavor: AppFlavor.dev,
    // );
    adLog(
      'downloadInvoice called ${Environment.instance.configuration.apiBaseUrl}${PranaamApiUrls.downloadInvoice}?orderId=$bookingID&subType=Pranaam&tripId=$tripId',
    );
    ProcessDialog.showLoadingDialog(context);
    final dio = Dio();
    // dio.interceptors.add(AdLogger());
    final token = await getToken();
    final Map<String, String> map = {
      'channelId': Platform.isAndroid ? 'ANDROID' : 'IOS',
      'agentId': ProfileSingleton.profileSingleton.userID,
      'traceId': ProfileSingleton.profileSingleton.apiTraceId,
      'language': 'en',
      'User-Agent': userAgent,
      'Authorization': 'Bearer $token',
    };

    adLog('Headers${map.toString()}');
    final Response result = await dio
        .get(
          '${Environment.instance.configuration.apiBaseUrl}${PranaamApiUrls.downloadInvoice}?orderId=$bookingID&subType=Pranaam&tripId=$tripId',
          options: Options(
            headers: map,
            contentType: 'application/pdf',
            responseType: ResponseType.bytes,
          ),
        )
        .whenComplete(() => ProcessDialog.closeLoadingDialog(context));
    //Once download is completed we will write data to the file
    final file = await writeDataToFile(
      bookingDetailsResponse?.orderId.toString() ?? '',
      result,
    );
    final fileData = await OpenFile.open(file.path);
    adLog('code Executed$fileData');

    return ADResponseState.completed('Success');
  }

  Future<String> getToken() async {
    /* final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString(
      SecureStorageKeys.accessToken,
    );*/
    final accessToken = await SharedPrefsUtils()
        .getValueFromPrefs(SharedPrefUtilsKeys.accessToken);
    return accessToken ?? '';
  }

  ///The method will create a file with defined name
  Future<File> _localFile(String id) async {
    final path = await _localPath;
    return File('$path${Platform.pathSeparator}Invoice_$id.pdf');
  }

  ///This method will return a cache path to save the file
  Future<String> get _localPath async {
    final directory = await getTemporaryDirectory();
// openFile(directory);
    return directory.path;
  }

  Future<File> writeDataToFile(String invoiceID, Response response) async {
    final file = await _localFile(invoiceID);
    final Uint8List data = response.data;
    final ByteBuffer buffer = data.buffer;
    final Uint8List audioUint8List = buffer.asUint8List(
      data.offsetInBytes,
      data.lengthInBytes,
    );
    final List<int> audioListInt = audioUint8List.cast<int>();
    return file.writeAsBytes(audioListInt);
  }

  CancelBookingResponseModel? cancelBookingResponseModel;

  /// Initiate loading state for api hit
  ADResponseState cancelBookingState = ADResponseState.loading();
  ADResponseState impInfoState = ADResponseState.loading();

  Future<ADResponseState> cancelBookingDetails(
    CancelBookingRequestModel cancelBookingRequestModel,
  ) async {
    final ADResponseState response =
        await _bookingPaymentCancellationRepository.cancelBooking(
      cancelBookingRequestModel.toJson(),
    );
    cancelBookingResponseModel = response.data;
    return response;
  }

  void updateButtonState({required bool value}) {
    isButtonClicked = value;
    notifyListeners();
  }

  void updateInfoAvailable() {
    notifyListeners();
  }

  void cancelBookingStatus({required bool value}) {
    adLog('cancelBookingStatus called');
    bookingCancelledStatus.value = value;
//    notifyListeners();
  }

  void toggleGuestSelection(
    pranaam_detail.Traveler traveller,
    BuildContext context,
  ) {
    ///This function is responsible to check and uncheck the guest list checkbox
    if (guestsSelected.contains(traveller)) {
      /// here we are removing traveller model if it satisfy the partial cancellation rules
      final bool result = verifyPartialCancellationRules(context, traveller);
      adLog('$result');
      if (result) {
        final bool result = guestsSelected.remove(traveller);
        adLog('$result');
      }
    } else {
      /// here we are adding traveller model if it satisfy the partial cancellation rules
      final bool result = verifyPartialCancellationRules(
        context,
        traveller,
        isTravellerAdded: true,
      );
      if (result) {
        guestsSelected.add(traveller);
      }
    }
    notifyListeners();
  }

  bool verifyPartialCancellationRules(
    BuildContext context,
    pranaam_detail.Traveler traveller, {
    bool isTravellerAdded = false,
  }) {
    ///this function is responsible for verifying partial cancellation rules
    ///if rules are satisfied then it will return true else it will return false
    ///isTravellerAdded is used to check if user is trying to select/deselect particular guest
    ///here if isTravellerAdded==true then we are adding -1 to non cancelling particular guest type
    ///here if isTravellerAdded==false then we are adding +1 to non cancelling particular guest type
    if (ServiceBookingDetails.getInstance()
            .getPassengerType[traveller.passengerTypeId] ==
        'Adult') {
      nonCancellingAdult += isTravellerAdded ? -1 : 1;
      final bool result = checkPartialCancellationRules(context);

      ///here we are checking the cancellation rules, if its return false
      ///we are reverting the operation done on nonCancellingAdult
      if (!result) {
        nonCancellingAdult += isTravellerAdded ? 1 : -1;
      }
      return result;
    } else if (ServiceBookingDetails.getInstance()
            .getPassengerType[traveller.passengerTypeId] ==
        'Child') {
      nonCancellingChild += isTravellerAdded ? -1 : 1;
      final bool result = checkPartialCancellationRules(context);
      if (!result) {
        nonCancellingChild += isTravellerAdded ? 1 : -1;
      }
      return result;
    } else {
      nonCancellingInfant += isTravellerAdded ? -1 : 1;
      final bool result = checkPartialCancellationRules(context);
      if (!result) {
        nonCancellingInfant += isTravellerAdded ? 1 : -1;
      }
      return result;
    }
  }

  void resetNonCancellationCount() {
    nonCancellingInfant = 0;
    nonCancellingAdult = 0;
    nonCancellingChild = 0;
  }

  bool checkPartialCancellationRules(BuildContext context) {
    if (nonCancellingInfant > 0 && (nonCancellingAdult < nonCancellingInfant)) {
      SnackBarUtil.showSnackBar(
        context,
        'One Infant can travel with one Adult',
      );
      return false;
    } else if (nonCancellingChild > 0 && nonCancellingAdult < 1) {
      SnackBarUtil.showSnackBar(
        context,
        'Child can not travel alone',
      );
      return false;
    }
    return true;
  }

  Future<void> getPotentialEarning() async {
    isEarnPointsLoading = true;

    final potentialEarningResponse =
        await flightBookingRepo.getPotentialEarning(
      bookingDetailsResponse?.orderReferenceId ?? '',
      isLatest: isReschedule(
            bookingDetailsResponse
                    ?.orderDetail?.pranaamDetail?.pranaamBookingType ??
                '',
          ) ||
          isUpgradeBooking(
            bookingDetailsResponse
                    ?.orderDetail?.pranaamDetail?.pranaamBookingType ??
                '',
          ),
    );
    if (potentialEarningResponse.viewStatus == Status.complete) {
      final PotentialEarningResponseModel potentialEarningResponseModel =
          potentialEarningResponse.data as PotentialEarningResponseModel;
      bookingDetailsResponse?.earning = Earning(
        total: potentialEarningResponseModel.totalPotentialEarning,
        reward: potentialEarningResponseModel.rewardPotentialEarning,
        order: potentialEarningResponseModel.orderPotentialEarning,
      );
      isEarnPointsLoading = false;
    }

    isEarnPointsLoading = false;
    notifyListeners();
  }
}
