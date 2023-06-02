import 'dart:convert';

import 'package:adani_airport_mobile/main/configuration/base_config.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/payment/juspay/available_app_parent.dart';
import 'package:adani_airport_mobile/modules/payment/juspay/card_payload.dart';
import 'package:adani_airport_mobile/modules/payment/juspay/get_available_app_payload.dart';
import 'package:adani_airport_mobile/modules/payment/juspay/initial_payload.dart';
import 'package:adani_airport_mobile/modules/payment/juspay/jus_pay_parent_request.dart';
import 'package:adani_airport_mobile/modules/payment/juspay/netbanking_payload.dart';
import 'package:adani_airport_mobile/modules/payment/juspay/payment_info/payload_information.dart';
import 'package:adani_airport_mobile/modules/payment/juspay/upi_payload.dart';
import 'package:adani_airport_mobile/modules/payment/juspay/wallet_payload.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:flutter/services.dart';
import 'package:hypersdkflutter/hypersdkflutter.dart';
import 'package:uuid/uuid.dart';

class PaymentSdkManager {
  HyperSDK jusPaySdk = HyperSDK();
  static final PaymentSdkManager instance = PaymentSdkManager._internal();

  factory PaymentSdkManager() {
    return instance;
  }

  PaymentSdkManager._internal();

  /// Initiate SDK
  Future<void> initiateHyperSDK({
    required void Function(MethodCall) hyperSDKCallbackHandler,
    required void Function() alreadyInitaited,
  }) async {
    if (!await jusPaySdk.isInitialised()) {
      final InitialPayload initialData = InitialPayload(
        action: 'initiate',
        merchantId: 'adanigroup',
        clientId: 'adanigroup',
        customerId: ProfileSingleton.profileSingleton.jwtUserID,
        environment: Environment.instance.configuration.appFlavor ==
                    AppFlavor.prod ||
                Environment.instance.configuration.appFlavor == AppFlavor.uat
            ? 'prod'
            : 'sandbox',
      );
      final JusPayParentRequest initialRequest = JusPayParentRequest(
        requestId: const Uuid().v4(),
        service: 'in.juspay.hyperapi',
        initialPayload: initialData,
      );

      final Map<String, dynamic> initiatePayload = initialRequest.toJson();
      final value =
          await jusPaySdk.initiate(initiatePayload, hyperSDKCallbackHandler);
      adLog(value);
    } else {
      alreadyInitaited.call();
    }
  }

  void initiateCallbackHandler({
    required MethodCall methodCall,
    required void Function(bool) successfullyInitiated,
  }) {
    if (methodCall.method == 'initiate_result') {
      successfullyInitiated(true);
    } else {
      successfullyInitiated(false);
    }
  }

  /// Get available app for UPI Intent
  Future<void> getAvailableApps({
    required void Function(MethodCall) availableAppHandler,
  }) async {
    final JusPayParentRequest parentRequest = JusPayParentRequest(
      requestId: const Uuid().v4(),
      service: 'in.juspay.hyperapi',
    );
    final GetAvailableAppPayload appPayload = GetAvailableAppPayload(
      action: 'upiTxn',
      getAvailableApps: true,
      showLoader: false,
    );
    parentRequest.availableAppPayload = appPayload;
    final Map<String, dynamic> paymentProcess = parentRequest.toJson();

    final value = await jusPaySdk.process(paymentProcess, availableAppHandler);
    adLog(value);
  }

  void availableAppHandler({
    required MethodCall methodCall,
    required void Function(AvailableAppParent?) availableApps,
  }) {
    AvailableAppParent? response;
    switch (methodCall.method) {
      case 'process_result':
        var args = {};
        try {
          args = json.decode(methodCall.arguments);
        } catch (e) {
          adLog(e.toString());
        }

        final bool error = args['error'] ?? false;
        if (!error) {
          final innerPayload = args['payload'] ?? {};
          // final innerPayload = tempJSON;
          response = AvailableAppParent.fromJson(innerPayload);
        }
        availableApps(response);
    }
  }

  //Process Payment
  Future<void> processPayment({
    required String action,
    required void Function(MethodCall) hyperSDKCallbackHandler,
    required PayloadInformation payloadInfo,
  }) async {
    final JusPayParentRequest parentRequest = JusPayParentRequest(
      requestId: const Uuid().v4(),
      service: 'in.juspay.hyperapi',
    );
    switch (action) {
      case 'nbTxn':
        final NetBankingPayload nbPayload = NetBankingPayload(
          action: payloadInfo.action,
          orderId: payloadInfo.orderId,
          paymentMethod: payloadInfo.paymentMethod,
          endUrls: payloadInfo.endUrls,
          clientAuthToken: payloadInfo.clientAuthToken,
        );
        parentRequest.netBankingPayload = nbPayload;
        break;
      case 'cardTxn':
        final CardPayload cardPayload = CardPayload(
          action: payloadInfo.action,
          orderId: payloadInfo.orderId,
          paymentMethod: payloadInfo.paymentMethod,
          // paymentMethod: 'VISA',
          endUrls: payloadInfo.endUrls,
          cardNumber: payloadInfo.cardNumber,
          cardExpMonth: payloadInfo.cardExpMonth,
          cardExpYear: payloadInfo.cardExpYear,
          cardSecurityCode: payloadInfo.cardSecurityCode,
          saveToLocker: payloadInfo.saveToLocker,
          tokenize: payloadInfo.tokenize,
          clientAuthToken: payloadInfo.clientAuthToken,
        );
        parentRequest.cardPayload = cardPayload;
        break;
      case 'walletTxn':
        final WalletPayload walletPayload = WalletPayload(
          action: payloadInfo.action,
          orderId: payloadInfo.orderId,
          paymentMethod: payloadInfo.paymentMethod,
          // paymentMethod: 'DUMMY',
          //TODO need to change
          endUrls: payloadInfo.endUrls,
          // directWalletToken: payloadInfo.directWalletToken,
          clientAuthToken: payloadInfo.clientAuthToken,
        );
        parentRequest.walletPayload = walletPayload;
        break;
      case 'upiTxn':
        final UpiPayload upiPayload = UpiPayload(
          action: payloadInfo.action,
          orderId: payloadInfo.orderId,
          endUrls: payloadInfo.endUrls,
          custVpa: payloadInfo.custVpa == '' ? null : payloadInfo.custVpa,
          upiSdkPresent: payloadInfo.upiSdkPresent,
          clientAuthToken: payloadInfo.clientAuthToken,
          payWithApp: payloadInfo.packageName,
          displayNote: 'UPI Intent',
        );
        parentRequest.upiPayload = upiPayload;
        break;
      case 'UPI_Intent':
        final UpiPayload upiPayload = UpiPayload(
          action: 'upiTxn',
          orderId: payloadInfo.orderId,
          endUrls: payloadInfo.endUrls,
          upiSdkPresent: payloadInfo.upiSdkPresent,
          clientAuthToken: payloadInfo.clientAuthToken,
          payWithApp: payloadInfo.packageName,
          displayNote: 'UPI Intent',
        );
        parentRequest.upiPayload = upiPayload;
        break;
    }

    final Map<String, dynamic> paymentProcess = parentRequest.toJson();

    final value =
        await jusPaySdk.process(paymentProcess, hyperSDKCallbackHandler);
    adLog(value);
    // block:end:process-sdk
  }

  void processCallHandler({
    required MethodCall methodCall,
    required void Function(bool) processCallback,
  }) {
    switch (methodCall.method) {
      case 'process_result':
        var args = {};
        try {
          args = json.decode(methodCall.arguments);
        } catch (e) {
          adLog(e.toString());
        }

        final bool error = args['error'] ?? false;

        final Map<String, dynamic> innerPayload = args['payload'] ?? {};

        if (innerPayload.containsKey('status')) {
          final String status = innerPayload['status'];
          if (!error) {
            switch (status) {
              case 'CHARGED':
                {
                  processCallback(true);
                }
                break;
            }
          } else {
            switch (status) {
              case 'BACKPRESSED':
              case 'PENDING_VBV':
              case 'AUTHORIZING':
              case 'AUTHORIZATION_FAILED':
              case 'AUTHENTICATION_FAILED':
              case 'API_FAILURE':
                processCallback(false);
            }
          }
        } else {
          processCallback(false);
        }
        break;
    }
  }

  Future<void> terminateSdk() async {
    final terminateString = await jusPaySdk.terminate();
    adLog(terminateString);
  }
}
