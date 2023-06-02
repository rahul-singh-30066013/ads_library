

class CheckOutResponse{

  const CheckOutResponse({
    this.transactionReferenceId,
    this.status,
    this.paymentMethodType,
  });


  final String? transactionReferenceId;
  final String? status;
  final String? paymentMethodType;

  @override
  String toString() {
    return 'transactionReferenceId: $transactionReferenceId, status: $status, paymentMethodType: $paymentMethodType,)';
  }

  factory CheckOutResponse.fromJson(Map<String, dynamic> json) => CheckOutResponse(
    transactionReferenceId: json['transactionReferenceId'] as String?,
    status: json['status'] as String?,
    paymentMethodType: json['paymentMethodType'] as String?,

  );

  Map<String, dynamic> toJson() => {
    'transactionReferenceId': transactionReferenceId,
    'status': status,
    'paymentMethodType': paymentMethodType,
  };
}