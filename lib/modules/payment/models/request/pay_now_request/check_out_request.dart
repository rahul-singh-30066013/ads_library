class CheckOutRequest {
  CheckOutRequest({
    this.paymentCallbackUrl,
    this.itineraryId,
    this.cardNumber,
    this.businessSubType,
    this.loyaltyAmount,
    this.paymentMethodType,
    this.channelid,
    this.orderReferenceId,
    this.upi,
    this.isRemoveCoupon,
    this.availableLoyaltyAmount,
    this.isPriceChanged,
  });
  final String? paymentCallbackUrl;
  final String? itineraryId;
  final int? cardNumber;
  final String? businessSubType;
  final int? loyaltyAmount;
  final String? paymentMethodType;
  final String? channelid;
  final String? orderReferenceId;
  final String? upi;
  final bool? isRemoveCoupon;
  final String? availableLoyaltyAmount;
  final bool? isPriceChanged;

  @override
  String toString() {
    return 'PayNowRequest(paymentCallbackUrl: $paymentCallbackUrl, itineraryId: $itineraryId, cardNumber: $cardNumber, businessSubType: $businessSubType, loyaltyAmount: $loyaltyAmount, paymentMethodType: $paymentMethodType,channelid: $channelid,upi: $upi,,orderReferenceId: $orderReferenceId,)';
  }

  // factory CheckOutRequest.fromJson(Map<String, dynamic> json) => CheckOutRequest(
  //   paymentCallbackUrl: json['paymentCallbackUrl'] as String?,
  //   itineraryId: json['itineraryId'] as String?,
  //   cardNumber: json['cardNumber'] as int?,
  //   businessSubType: json['businessSubType'] as String?,
  //   loyaltyAmount: json['loyaltyAmount'] as int?,
  //   paymentMethodType: json['paymentMethodType'] as String?,
  //   orderReferenceId: json['orderReferenceId'] as String?,
  //   channelid: json['channelid'] as String?,
  //   upi: json['upi'] as String?,
  // );

  Map<String, dynamic> toJson() => {
        'paymentCallbackUrl': paymentCallbackUrl,
        'itineraryId': itineraryId,
        'cardNumber': cardNumber,
        'businessSubType': businessSubType,
        'loyaltyAmount': loyaltyAmount,
        'paymentMethodType': paymentMethodType,
        'orderReferenceId': orderReferenceId,
        'channelid': channelid,
        'upi': upi,
        'isRemoveCoupon': isRemoveCoupon,
        'availableLoyaltyAmount': availableLoyaltyAmount,
        'isPriceChanged': isPriceChanged,
      };
}
