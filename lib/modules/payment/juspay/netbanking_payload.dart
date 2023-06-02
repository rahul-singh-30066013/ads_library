class NetBankingPayload{
  String? action;
  String? orderId;
  String? paymentMethod;
  List<String>? endUrls;
  String? clientAuthToken;

  NetBankingPayload(
      {this.action,
        this.orderId,
        this.paymentMethod,
        this.endUrls,
        this.clientAuthToken,
        });

  NetBankingPayload.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    orderId = json['orderId'];
    paymentMethod = json['paymentMethod'];
    endUrls = json['endUrls'].cast<String>();
    clientAuthToken = json['clientAuthToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['action'] = action;
    data['orderId'] = orderId;
    data['paymentMethod'] = paymentMethod;
    data['endUrls'] = endUrls;
    data['clientAuthToken'] = clientAuthToken;
    return data;
  }
}