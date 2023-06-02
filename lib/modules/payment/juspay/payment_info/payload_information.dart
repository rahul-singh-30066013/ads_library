class PayloadInformation{
  String? action;
  String? paymentMethod;
  String? cardNumber;
  String? cardExpMonth;
  String? cardExpYear;
  String? cardSecurityCode;
  bool? saveToLocker;
  String? clientAuthToken;
  bool? tokenize;
  String? cardNickName;
  String? orderId;
  String? directWalletToken;
  String? custVpa;
  bool? upiSdkPresent;
  List<String>? endUrls;
  num? loyality;
  num? amount;
  String? packageName;


  PayloadInformation({
    this.action,
    this.paymentMethod,
    this.cardNumber,
    this.cardExpMonth,
    this.cardExpYear,
    this.cardSecurityCode,
    this.saveToLocker,
    this.clientAuthToken,
    this.tokenize,
    this.cardNickName,
    this.orderId,
    this.directWalletToken,
    this.custVpa,
    this.upiSdkPresent,
    this.endUrls,
    this.loyality,
    this.amount,
    this.packageName,
  });
}