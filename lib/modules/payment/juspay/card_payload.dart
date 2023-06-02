class CardPayload {
  String? action;
  String? orderId;
  List<String>? endUrls;
  String? paymentMethod;

  String? cardNumber;
  String? cardExpMonth;
  String? cardExpYear;
  String? cardSecurityCode;
  bool? saveToLocker;
  bool? tokenize;
  String? cardNickName;

  String? clientAuthToken;

  CardPayload({
    this.action,
    this.orderId,
    this.paymentMethod,
    this.endUrls,
    this.clientAuthToken,
    this.cardNumber,
    this.cardExpMonth,
    this.cardExpYear,
    this.cardSecurityCode,
    this.saveToLocker,
    this.tokenize,
    this.cardNickName,
  });

  // CardPayload.fromJson(Map<String, dynamic> json) {
  //   action = json['action'];
  //   orderId = json['orderId'];
  //   cardNumber = json['cardNumber'];
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
    data['cardNumber'] = cardNumber;
    data['cardExpMonth'] = cardExpMonth;
    data['cardExpYear'] = cardExpYear;
    data['cardSecurityCode'] = cardSecurityCode;
    data['saveToLocker'] = saveToLocker;
    data['tokenize'] = tokenize;
    data['paymentMethod'] = paymentMethod;
    data['endUrls'] = endUrls;
    data['clientAuthToken'] = clientAuthToken;
    return data;
  }
}
