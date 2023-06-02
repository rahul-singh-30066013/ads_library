
class PlacementRequest{
  const PlacementRequest({
    this.transactionReferenceId,
  });

  final String? transactionReferenceId;


  factory PlacementRequest.fromJson(Map<String, dynamic> json) =>
      PlacementRequest(
        transactionReferenceId: json['transactionReferenceId'] as String?,

      );

  Map<String, dynamic> toJson() => {
    'transactionReferenceId': transactionReferenceId,

  };

  @override
  String toString() {
    return 'transactionReferenceId: $transactionReferenceId,';
  }
}