/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:typed_data';

import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/screen_helper/process_dialog.dart';
import 'package:adani_airport_mobile/modules/wallet/repository/wallet_repository.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_plugin/adani_mobile_plugin.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

/// this class is used to manage add tickets to apple wallet
class WalletState extends BaseViewModel {
  final WalletRepository _walletRepository = WalletRepository();

  /// Initiate loading state for api hit
  ADResponseState walletResponseState = ADResponseState.loading();
  List<Uint8List> pkPassDataArray = [];

  ///It will fetch apple pass book
  Future<void> getApplePassbook(
    String endPointURL,
    BuildContext context,
  ) async {
    ProcessDialog.showLoadingDialog(context);
    walletResponseState = await _walletRepository.getApplePassbook(endPointURL);
    ProcessDialog.closeLoadingDialog(context);
    if (walletResponseState.viewStatus == Status.complete) {
      pkPassDataArray.add((walletResponseState.data as Response).data);
      await AdaniMobilePlugin.openWallet(
        pkPassDataArray,
      );
    } else {
      SnackBarUtil.showSnackBar(
        context,
        'some_thing_went_wrong'.localize(context),
      );
    }
  }

  ///It will fetch apple pass book
  Future<void> getApplePassbookForFlight(
    String endPointURL,
    BuildContext context,
    ItineraryTripType? tripType,
  ) async {
    pkPassDataArray = [];
    if (tripType == ItineraryTripType.R) {
      ProcessDialog.showLoadingDialog(context);
      final ADResponseState passDataO =
          await _walletRepository.getApplePassbook('$endPointURL${'/O'}');
      if (passDataO.viewStatus == Status.complete) {
        pkPassDataArray.add((passDataO.data as Response).data);
        final ADResponseState passDataI =
            await _walletRepository.getApplePassbook('$endPointURL${'/I'}');
        if (passDataI.viewStatus == Status.complete) {
          pkPassDataArray.add((passDataI.data as Response).data);
        }
      }
      ProcessDialog.closeLoadingDialog(context);
    } else {
      ProcessDialog.showLoadingDialog(context);
      final ADResponseState passDataO =
          await _walletRepository.getApplePassbook('$endPointURL${'/O'}');
      if (passDataO.viewStatus == Status.complete) {
        pkPassDataArray.add((passDataO.data as Response).data);
      }
      ProcessDialog.closeLoadingDialog(context);
    }

    if (pkPassDataArray.isNotEmpty) {
      await AdaniMobilePlugin.openWallet(pkPassDataArray);
    } else {
      SnackBarUtil.showSnackBar(
        context,
        'some_thing_went_wrong'.localize(context),
      );
    }
  }
}
