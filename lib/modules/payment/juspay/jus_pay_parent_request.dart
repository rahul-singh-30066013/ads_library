import 'package:adani_airport_mobile/modules/payment/juspay/card_payload.dart';
import 'package:adani_airport_mobile/modules/payment/juspay/get_available_app_payload.dart';
import 'package:adani_airport_mobile/modules/payment/juspay/initial_payload.dart';
import 'package:adani_airport_mobile/modules/payment/juspay/netbanking_payload.dart';
import 'package:adani_airport_mobile/modules/payment/juspay/upi_payload.dart';
import 'package:adani_airport_mobile/modules/payment/juspay/wallet_payload.dart';

class JusPayParentRequest {
  String? requestId;
  String? service;
  InitialPayload? initialPayload;
  NetBankingPayload? netBankingPayload;
  CardPayload? cardPayload;
  WalletPayload? walletPayload;
  UpiPayload? upiPayload;
  GetAvailableAppPayload? availableAppPayload;

  JusPayParentRequest({this.requestId, this.service, this.initialPayload,this.netBankingPayload,this.cardPayload,this.walletPayload,this.upiPayload});

  // JusPayParentRequest.fromJson(Map<String, dynamic> json) {
  //   requestId = json['requestId'];
  //   service = json['service'];
  //   payload =
  //       json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['requestId'] = requestId;
    data['service'] = service;
    if (initialPayload != null) {
      data['payload'] = initialPayload?.toJson();
    } else if (netBankingPayload != null) {
      data['payload'] = netBankingPayload?.toJson();
    }
    else if (cardPayload != null) {
      data['payload'] = cardPayload?.toJson();
    }
    else if (walletPayload != null) {
      data['payload'] = walletPayload?.toJson();
    }
    else if (upiPayload != null) {
      data['payload'] = upiPayload?.toJson();
    }
    else if (availableAppPayload != null) {
      data['payload'] = availableAppPayload?.toJson();
    }
    return data;
  }
}

