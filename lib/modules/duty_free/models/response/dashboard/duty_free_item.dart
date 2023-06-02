/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_item.freezed.dart';
part 'duty_free_item.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeItem with _$DutyFreeItem {
  factory DutyFreeItem({
    @Default('') String uniqueId,
    TagName? tagName,
    ContactDetail? contactDetail,
    @Default('') String imageSrc,
    @Default('') String mobileImage,
    @Default('') String mobileImagesrc,
    @Default('') String videoSrc,
    @Default('') String title,
    @Default('') String description,
    List<RepublicRewardTAndC>? webDescription,
    @Default('') String ctaLink,
    @Default('') String ctaUrl,
    @Default('') String subTitle,
    @Default('') String filterName,
    @Default('') String filterLink,
    @Default('') String materialGroup,
    @Default('') String category,
    @Default('') String subCategory,
    @Default('') String brand,
    @Default(false) bool popular,
    @Default(false) bool newArrival,
    @Default(false) bool showOnHomepage,
    @Default('') String cdnPath,
    @Default('') String code,
    @Default('') String deepLink,
    @Default('') String apiUrl,
    @Default('') String storeType,
    @Default(false) bool restricted,
    @Default(0) int sortorder,
    @Default('') String widgetType,
    @Default('') String skuCode,
    @Default(false) bool isAirportSelectNeeded,
    @Default(false) bool disableForAirport,
    @Default(true) bool enableCircle,
    @Default('') String promoCode,
    @Default(false) bool exclusive,
  }) = _DutyFreeItem;

  factory DutyFreeItem.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeItemFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class TagName with _$TagName {
  const factory TagName(
    String? name,
    String? backgroundColor,
    String? textColor,
  ) = _TagName;

  factory TagName.fromJson(Map<String, dynamic> json) =>
      _$TagNameFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class RepublicRewardTAndC with _$RepublicRewardTAndC {
  const factory RepublicRewardTAndC(
    String? list,
  ) = _RepublicRewardTAndC;

  factory RepublicRewardTAndC.fromJson(Map<String, dynamic> json) =>
      _$RepublicRewardTAndCFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class ContactDetail with _$ContactDetail {
  const factory ContactDetail(
    ContactAttributes? phone,
    ContactAttributes? email,
  ) = _ContactDetail;

  factory ContactDetail.fromJson(Map<String, dynamic> json) =>
      _$ContactDetailFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class ContactAttributes with _$ContactAttributes {
  const factory ContactAttributes(
    String? name,
    String? title,
    String? richText,
  ) = _ContactAttributes;

  factory ContactAttributes.fromJson(Map<String, dynamic> json) =>
      _$ContactAttributesFromJson(json);
}
