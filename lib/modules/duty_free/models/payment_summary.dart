/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'payment_summary.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class PaymentSummary {
  @JsonKey(name: 'adaniBalance')
  String? adaniBalance;

  @JsonKey(name: 'totalAmount')
  String? totalAmount;

  @JsonKey(name: 'rewardPoints')
  String? rewardPoints;

  @JsonKey(name: 'payment_options')
  List<PaymentOptions>? paymentOptions;

  @JsonKey(name: 'price_list')
  List<PriceDetails>? priceList;
  List<PaymentSummaryBankOffers>? bankoffers;

  PaymentSummary({this.priceList});

  /// A necessary factory constructor for creating a new PaymentSummary instance
  /// from a map. Pass the map to the generated `_$PaymentSummaryToJson()` constructor.
  /// The constructor is named after the source class, in this case, PaymentSummary.
  factory PaymentSummary.fromJson(Map<String, dynamic> json) =>
      _$PaymentSummaryFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$PaymentSummaryToJson`.
  Map<String, dynamic> toJson() => _$PaymentSummaryToJson(this);
}

@JsonSerializable()
class PriceDetails {
  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'price')
  String? price;

  String? priceTypeColor;

  PriceDetails({this.title, this.price, this.priceTypeColor});

  /// A necessary factory constructor for creating a new PriceDetails instance
  /// from a map. Pass the map to the generated `_$PriceDetailsFromJson()` constructor.
  /// The constructor is named after the source class, in this case, PriceDetails.
  factory PriceDetails.fromJson(Map<String, dynamic> json) =>
      _$PriceDetailsFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$PriceDetailsToJson`.
  Map<String, dynamic> toJson() => _$PriceDetailsToJson(this);
}

@JsonSerializable()
class PaymentSummaryBankOffers {
  @JsonKey(name: 'offerType')
  String? offerType;

  @JsonKey(name: 'description')
  String? description;

  PaymentSummaryBankOffers({this.offerType, this.description});

  /// A necessary factory constructor for creating a new BankOffers instance
  /// from a map. Pass the map to the generated `_$BankOffersFromJson()` constructor.
  /// The constructor is named after the source class, in this case, BankOffers.
  factory PaymentSummaryBankOffers.fromJson(Map<String, dynamic> json) =>
      _$PaymentSummaryBankOffersFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$BankOffersToJson`.
  Map<String, dynamic> toJson() => _$PaymentSummaryBankOffersToJson(this);
}

@JsonSerializable()
class PaymentOptions {
  @JsonKey(name: 'text')
  String? text;

  String? images;

  PaymentOptions({this.text, this.images});

  /// A necessary factory constructor for creating a new PaymentOptions instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, PaymentOptions.
  factory PaymentOptions.fromJson(Map<String, dynamic> json) =>
      _$PaymentOptionsFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$PaymentOptionsToJson(this);
}
