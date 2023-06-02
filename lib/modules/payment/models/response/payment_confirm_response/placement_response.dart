

class PlacementResponse{
  final String? orderStatus;
  final String? transactionReferenceId;
  final String? orderReferenceId;
  final String? transactionStatus;

  const PlacementResponse({
    this.orderStatus,
    this.transactionReferenceId,
    this.orderReferenceId,
    this.transactionStatus,
  });

  @override
  String toString() {
    return 'orderStatus: $orderStatus, transactionReferenceId: $transactionReferenceId, orderReferenceId: $orderReferenceId, transactionStatus: $transactionStatus';
  }

  factory PlacementResponse.fromJson(Map<String, dynamic> json) {
    return PlacementResponse(
      orderStatus: json['orderStatus'] as String?,
      transactionReferenceId: json['transactionReferenceId'] as String?,
      orderReferenceId: json['orderReferenceId'] as String?,
      transactionStatus: json['transactionStatus'] as String?,

    );
  }

  Map<String, dynamic> toJson() => {
    'orderStatus': orderStatus,
    'transactionReferenceId': transactionReferenceId,
    'orderReferenceId': orderReferenceId,
    'transactionStatus': transactionStatus,
  };
}