/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_offer_list_response.freezed.dart';
part 'sign_in_offer_list_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class SignInOfferListResponse with _$SignInOfferListResponse {
  const factory SignInOfferListResponse({
    @Default([]) List<SignInOffer> data,
  }) = _SignInOfferListResponse;

  factory SignInOfferListResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInOfferListResponseFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class SignInOffer with _$SignInOffer {
  const factory SignInOffer({
    @Default('') String promoCode,
    @Default('') String promoName,
    @Default('') String promoDescription,
    @Default(0) num promoPercentage,
    @Default(0) num promoCappingValue,
    @Default('') String promoCategory,
    @Default(0) num promoPriority,
    @Default(false) bool? isInternational,
  }) = _SignInOffer;

  factory SignInOffer.fromJson(Map<String, dynamic> json) =>
      _$SignInOfferFromJson(json);
}
