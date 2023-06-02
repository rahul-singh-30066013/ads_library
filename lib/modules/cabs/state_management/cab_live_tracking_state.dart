/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/request_models/sos_request_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cabs_booking_repository.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_cancellation_screen/view/open_setting_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

class CabLiveTrackingState extends BaseViewModel {
  String? orderReferenceId;
  Location? location;

  final CabsBookingRepository _cabBookingRepository = CabsBookingRepository();

  /// Initiate loading state for api hit
  final ValueNotifier<Status?> sosResponseState = ValueNotifier(
    Status.complete,
  );

  Future<void> cabBookingSosAlertApiCall(
    BuildContext context,
    ADTapCallback? adTapCallback,
  ) async {
    _updateState(Status.loading);
    final response = await _cabBookingRepository.cabBookingSosAlertApiCall(
      request: SosRequestModel(
        orderReferenceId: orderReferenceId,
        latitude: location?.latitude,
        longitude: location?.longitude,
      ),
    );
    if (response.viewStatus == Status.complete) {
      _updateState(response.viewStatus);
      showToast(
        context,
        'alert_received_we_are_calling_you_back_immediately'.localize(context),
      );
    } else {
      _updateState(response.viewStatus);
      showToast(context, response.message ?? 'ADLEX01'.localize(context));
    }
    adTapCallback?.call();
  }

  void _updateState(Status? status) {
    sosResponseState.value = status;
    notifyListeners();
  }

  ///It will use to get location
  Future<void> checkLocationPermission(
    BuildContext context,
    ADTapCallback? adTapCallback,
  ) async {
    final LocationPermission permission = await Geolocator.checkPermission();
    await checkPermissionStatus(
      permission: permission,
      context: context,
      adTapCallback: adTapCallback,
    );
  }

  Future<void> requestLocationPermission(
    BuildContext context,
    ADTapCallback? adTapCallback,
  ) async {
    final LocationPermission requestPermission =
        await Geolocator.requestPermission();
    await checkPermissionStatus(
      isFromRequest: true,
      permission: requestPermission,
      context: context,
      adTapCallback: adTapCallback,
    );
  }

  Future<void> checkPermissionStatus({
    required LocationPermission permission,
    required BuildContext context,
    ADTapCallback? adTapCallback,
    bool isFromRequest = false,
  }) async {
    switch (permission) {
      case LocationPermission.denied:
        if (!isFromRequest) {
          await requestLocationPermission(context, adTapCallback);
        }
        break;
      case LocationPermission.deniedForever:
        // adTapCallback?.call();
        await adShowBottomSheet(
          context: context,
          childWidget: OpenSettingView(
            title: 'please_allow_this_application_to_access_device_location'
                .localize(context),
            onTap: () => {Geolocator.openLocationSettings()},
          ),
          headerTitle: 'location'.localize(context),
        );
        break;
      case LocationPermission.whileInUse:
        await getCurrentLocation(context, adTapCallback);
        break;
      case LocationPermission.always:
        await getCurrentLocation(context, adTapCallback);
        break;
      case LocationPermission.unableToDetermine:
        //adTapCallback?.call();
        await adShowBottomSheet(
          context: context,
          childWidget: OpenSettingView(
            title:
                'to_continue_please_turn_on_device_location'.localize(context),
            onTap: () => {Geolocator.openLocationSettings()},
          ),
          headerTitle: 'location'.localize(context),
        );
        break;
    }
  }

  Future<void> getCurrentLocation(
    BuildContext context,
    ADTapCallback? adTapCallback,
  ) async {
    try {
      _updateState(Status.loading);
      final Position currentPosition = await Geolocator.getCurrentPosition();
      location = Location(
        latitude: currentPosition.latitude.toString(),
        longitude: currentPosition.longitude.toString(),
      );
      await cabBookingSosAlertApiCall(context, adTapCallback);
    } catch (e) {
      adLog(e.toString());
      showToast(context, 'ADLEX01'.localize(context));
      adTapCallback?.call();
    }
  }

  void showToast(BuildContext context, String message) {
    const int duration = 3000;
    SnackBarUtil.showSnackBar(
      context,
      message,
      duration,
      EdgeInsets.symmetric(
        horizontal: context.k_16,
        vertical: context.k_64 + context.k_30,
      ),
    );
  }
}
