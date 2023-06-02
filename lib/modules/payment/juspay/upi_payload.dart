class UpiPayload{
  String? action;
  String? orderId;
  List<String>? endUrls;
  String? clientAuthToken;

  String? custVpa;
  String? payWithApp;
  bool? upiSdkPresent;
  bool? showLoader;
  String? displayNote;



  UpiPayload(
      {this.action,
        this.orderId,
        this.custVpa,
        this.endUrls,
        this.clientAuthToken,
        this.upiSdkPresent,
        this.displayNote,
        this.showLoader,
        this.payWithApp,
      });

  // UpiPayload.fromJson(Map<String, dynamic> json) {
  //   action = json['action'];
  //   orderId = json['orderId'];
  //   environment = json['environment'];
  //   customerId = json['customerId'];
  //   clientId = json['clientId'];
  //   merchantId = json['merchantId'];
  //   paymentMethod = json['paymentMethod'];
  //   endUrls = json['endUrls'].cast<String>();
  //   clientAuthToken = json['clientAuthToken'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['action'] = action;
    data['orderId'] = orderId;
    data['custVpa'] = custVpa;
    data['payWithApp'] = payWithApp;
    data['upiSdkPresent'] = upiSdkPresent;
    data['showLoader'] = showLoader;
    data['displayNote'] = displayNote;
    data['endUrls'] = endUrls;
    data['clientAuthToken'] = clientAuthToken;
    return data;
  }
}