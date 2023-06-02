/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pranaam_banner_model.freezed.dart';
part 'pranaam_banner_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PranaamBannerModel with _$PranaamBannerModel {
  const factory PranaamBannerModel({
    List<UpSellLink>? upSellLink,
    List<UpSellLink>? offerLink,
  }) = _PranaamBannerModel;

  factory PranaamBannerModel.fromJson(Map<String, dynamic> json) =>
      _$PranaamBannerModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class UpSellLink with _$UpSellLink {
  const factory UpSellLink({
    @Default('') String appBannerURL,
    @Default('') String lob,
    @Default('') String serviceAirport,
    @Default('') String serviceType,
    @Default('') String offerUniqueID,
    @Default('') String redirectUrl,
  }) = _UpSellLink;

  factory UpSellLink.fromJson(Map<String, dynamic> json) =>
      _$UpSellLinkFromJson(json);
}
