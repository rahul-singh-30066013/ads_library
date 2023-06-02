// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentSummary _$PaymentSummaryFromJson(Map<String, dynamic> json) =>
    PaymentSummary(
      priceList: (json['price_list'] as List<dynamic>?)
          ?.map((e) => PriceDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..adaniBalance = json['adaniBalance'] as String?
      ..totalAmount = json['totalAmount'] as String?
      ..rewardPoints = json['rewardPoints'] as String?
      ..paymentOptions = (json['payment_options'] as List<dynamic>?)
          ?.map((e) => PaymentOptions.fromJson(e as Map<String, dynamic>))
          .toList()
      ..bankoffers = (json['bankoffers'] as List<dynamic>?)
          ?.map((e) =>
              PaymentSummaryBankOffers.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PaymentSummaryToJson(PaymentSummary instance) =>
    <String, dynamic>{
      'adaniBalance': instance.adaniBalance,
      'totalAmount': instance.totalAmount,
      'rewardPoints': instance.rewardPoints,
      'payment_options': instance.paymentOptions,
      'price_list': instance.priceList,
      'bankoffers': instance.bankoffers,
    };

PriceDetails _$PriceDetailsFromJson(Map<String, dynamic> json) => PriceDetails(
      title: json['title'] as String?,
      price: json['price'] as String?,
      priceTypeColor: json['priceTypeColor'] as String?,
    );

Map<String, dynamic> _$PriceDetailsToJson(PriceDetails instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'priceTypeColor': instance.priceTypeColor,
    };

PaymentSummaryBankOffers _$PaymentSummaryBankOffersFromJson(
        Map<String, dynamic> json) =>
    PaymentSummaryBankOffers(
      offerType: json['offerType'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PaymentSummaryBankOffersToJson(
        PaymentSummaryBankOffers instance) =>
    <String, dynamic>{
      'offerType': instance.offerType,
      'description': instance.description,
    };

PaymentOptions _$PaymentOptionsFromJson(Map<String, dynamic> json) =>
    PaymentOptions(
      text: json['text'] as String?,
      images: json['images'] as String?,
    );

Map<String, dynamic> _$PaymentOptionsToJson(PaymentOptions instance) =>
    <String, dynamic>{
      'text': instance.text,
      'images': instance.images,
    };
