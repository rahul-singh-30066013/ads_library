class WalletPayload{
  String? action;
  String? orderId;
  String? paymentMethod;
  List<String>? endUrls;
  String? clientAuthToken;
  String? directWalletToken;
  bool? showLoader;



  WalletPayload(
      {this.action,
        this.orderId,
        this.paymentMethod,
        this.endUrls,
        this.clientAuthToken,
        this.directWalletToken,
        this.showLoader,
       });

  // WalletPayload.fromJson(Map<String, dynamic> json) {
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
    data['directWalletToken'] = directWalletToken;
    data['showLoader'] = showLoader;
    data['paymentMethod'] = paymentMethod;
    data['endUrls'] = endUrls;
    data['clientAuthToken'] = clientAuthToken;
    return data;
  }
}