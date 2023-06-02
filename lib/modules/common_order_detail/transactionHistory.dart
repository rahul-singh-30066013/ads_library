import 'package:adani_airport_mobile/modules/common_order_detail/paidBy.dart';

class TransactionHistory {
  String? transactionReferenceId;
  String? status;
  PaidBy? paidBy;
  String? transactionMode;

  TransactionHistory({this.transactionReferenceId, this.status, this.paidBy, this.transactionMode});

  TransactionHistory.fromJson(Map<String, dynamic> json) {
    if(json['transactionReferenceId'] is String) {
      transactionReferenceId = json['transactionReferenceId'];
    }
    if(json['status'] is String) {
      status = json['status'];
    }
    if(json['paidBy'] is Map) {
      paidBy = json['paidBy'] == null ? null : PaidBy.fromJson(json['paidBy']);
    }
    if(json['transactionMode'] is String) {
      transactionMode = json['transactionMode'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['transactionReferenceId'] = transactionReferenceId;
    _data['status'] = status;
    if(paidBy != null) {
      _data['paidBy'] = paidBy?.toJson();
    }
    _data['transactionMode'] = transactionMode;
    return _data;
  }
}