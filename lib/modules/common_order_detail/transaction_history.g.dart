// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionHistory _$$_TransactionHistoryFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionHistory(
      transactionReferenceId: json['transactionReferenceId'] as String?,
      status: json['status'] as String?,
      paidBy: json['paidBy'] == null
          ? null
          : PaidBy.fromJson(json['paidBy'] as Map<String, dynamic>),
      transactionMode: json['transactionMode'] as String?,
    );

Map<String, dynamic> _$$_TransactionHistoryToJson(
        _$_TransactionHistory instance) =>
    <String, dynamic>{
      'transactionReferenceId': instance.transactionReferenceId,
      'status': instance.status,
      'paidBy': instance.paidBy,
      'transactionMode': instance.transactionMode,
    };

_$_PaidBy _$$_PaidByFromJson(Map<String, dynamic> json) => _$_PaidBy(
      bank: json['bank'] == null
          ? null
          : Bank.fromJson(json['bank'] as Map<String, dynamic>),
      loyalty: json['loyalty'] == null
          ? null
          : Bank.fromJson(json['loyalty'] as Map<String, dynamic>),
      promo: json['promo'] == null
          ? null
          : Bank.fromJson(json['promo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PaidByToJson(_$_PaidBy instance) => <String, dynamic>{
      'bank': instance.bank,
      'loyalty': instance.loyalty,
      'promo': instance.promo,
    };

_$_Bank _$$_BankFromJson(Map<String, dynamic> json) => _$_Bank(
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_BankToJson(_$_Bank instance) => <String, dynamic>{
      'amount': instance.amount,
    };
