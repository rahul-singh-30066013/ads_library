// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoyaltyHistoryModel _$$_LoyaltyHistoryModelFromJson(
        Map<String, dynamic> json) =>
    _$_LoyaltyHistoryModel(
      loyaltyHistoryData: (json['data'] as List<dynamic>?)
              ?.map(
                  (e) => LoyaltyHistoryData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_LoyaltyHistoryModelToJson(
        _$_LoyaltyHistoryModel instance) =>
    <String, dynamic>{
      'data': instance.loyaltyHistoryData,
    };

_$_LoyaltyHistoryData _$$_LoyaltyHistoryDataFromJson(
        Map<String, dynamic> json) =>
    _$_LoyaltyHistoryData(
      transactionReferenceId: json['transactionReferenceId'] as String? ?? '',
      orderReferenceId: json['orderReferenceId'] as String? ?? '',
      partnerTransactionReferenceId:
          json['partnerTransactionReferenceId'] as String? ?? '',
      merchantId: json['merchantId'] as String? ?? '',
      transactionDate: json['transactionDate'] as String? ?? '',
      transactionType: json['transactionType'] as String? ?? '',
      loyaltyPoints: json['loyaltyPoints'] as int? ?? 0,
      completionDate: json['completionDate'] as String? ?? '',
      business: json['business'] as String? ?? '',
      title: json['title'] as String? ?? '',
      businessSubType: json['businessSubType'] as String? ?? '',
      orderReferences: (json['orderReferences'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_LoyaltyHistoryDataToJson(
        _$_LoyaltyHistoryData instance) =>
    <String, dynamic>{
      'transactionReferenceId': instance.transactionReferenceId,
      'orderReferenceId': instance.orderReferenceId,
      'partnerTransactionReferenceId': instance.partnerTransactionReferenceId,
      'merchantId': instance.merchantId,
      'transactionDate': instance.transactionDate,
      'transactionType': instance.transactionType,
      'loyaltyPoints': instance.loyaltyPoints,
      'completionDate': instance.completionDate,
      'business': instance.business,
      'title': instance.title,
      'businessSubType': instance.businessSubType,
      'orderReferences': instance.orderReferences,
    };
