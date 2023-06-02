import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_history.freezed.dart';
part 'transaction_history.g.dart';

@freezed
class TransactionHistory with _$TransactionHistory {
  const factory TransactionHistory({
    String? transactionReferenceId,
    String? status,
    PaidBy? paidBy,
    String? transactionMode,
  }) = _TransactionHistory;

  factory TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryFromJson(json);
}

@freezed
class PaidBy with _$PaidBy {
  const factory PaidBy({
    Bank? bank,
    Bank? loyalty,
    Bank? promo,
  }) = _PaidBy;

  factory PaidBy.fromJson(Map<String, dynamic> json) => _$PaidByFromJson(json);
}

@freezed
class Bank with _$Bank {
  const factory Bank({
    double? amount,
  }) = _Bank;

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);
}
