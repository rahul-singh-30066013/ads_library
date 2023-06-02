/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'loyalty_refer_and_earn_model.freezed.dart';
part 'loyalty_refer_and_earn_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class LoyaltyReferAndEarnModel with _$LoyaltyReferAndEarnModel {
  const factory LoyaltyReferAndEarnModel({
    @Default([]) List<Element> elements,
  }) = _LoyaltyReferAndEarnModel;

  factory LoyaltyReferAndEarnModel.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyReferAndEarnModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class Element with _$Element {
  const factory Element({
    @Default('') String uid,
    @Default('') String componentName,
    @Default('') String dataSource,
    @Default(Params()) Params params,
    @Default(ReferAndEarnFields()) ReferAndEarnFields fields,
  }) = _Element;

  factory Element.fromJson(Map<String, dynamic> json) =>
      _$ElementFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class ReferAndEarnFields with _$ReferAndEarnFields {
  const factory ReferAndEarnFields({
    @Default(ReferAndEarnItem()) ReferAndEarnItem widget,
  }) = _ReferAndEarnFields;

  factory ReferAndEarnFields.fromJson(Map<String, dynamic> json) =>
      _$ReferAndEarnFieldsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class ReferAndEarnItem with _$ReferAndEarnItem {
  const factory ReferAndEarnItem({
    @Default(0) int widgetId,
    @Default('') String widgetType,
    @Default('') String title,
    @Default('') String subTitle,
    @Default(0) double subItemRadius,
    @Default(0) double subItemWidth,
    @Default(0) int gridColumn,
    @Default(0) double aspectRatio,
    @Default(0) double borderRadius,
    @Default(ItemMargin()) ItemMargin itemMargin,
    @Default(ItemMargin()) ItemMargin subItemMargin,
    @Default(ActionTitle()) ActionTitle actionTitle,
    @Default(null) dynamic carouselParam,
    @Default([]) List<WidgetItem> widgetItems,
  }) = _ReferAndEarnItem;

  factory ReferAndEarnItem.fromJson(Map<String, dynamic> json) =>
      _$ReferAndEarnItemFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class ActionTitle with _$ActionTitle {
  const factory ActionTitle({
    @Default(0) int actionId,
    @Default('') String deeplink,
    @Default('') String name,
  }) = _ActionTitle;

  factory ActionTitle.fromJson(Map<String, dynamic> json) =>
      _$ActionTitleFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class ItemMargin with _$ItemMargin {
  const factory ItemMargin({
    @Default(0) double left,
    @Default(0) double right,
    @Default(0) double bottom,
    @Default(0) double top,
  }) = _ItemMargin;

  factory ItemMargin.fromJson(Map<String, dynamic> json) =>
      _$ItemMarginFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class WidgetItem with _$WidgetItem {
  const factory WidgetItem({
    @Default('') String title,
    @Default('') String imageSrc,
    @Default('') String description,
    @Default('') String descriptionApp,
    @Default('') String ctaLink,
    @Default('') String ctaText,
    @Default('') String deepLink,
    @Default('') String subTitle,
    @Default('') String materialGroup,
    @Default('') String category,
    @Default('') String subCategory,
    @Default('') String brand,
    @Default('') String storeType,
    @Default(false) bool restricted,
    @Default('') String mobileImage,
    @Default(null) dynamic webImage,
    @Default(null) dynamic thumbnailImage,
    @Default([]) List<RewardStepList> rewardStepList,
    @Default([]) List<Media> media,
  }) = _WidgetItem;

  factory WidgetItem.fromJson(Map<String, dynamic> json) =>
      _$WidgetItemFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class Params with _$Params {
  const factory Params({
    @Default('') String widget,
    @Default('') String widgetName,
  }) = _Params;

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class RewardStepList with _$RewardStepList {
  const factory RewardStepList({
    @Default('') String rewardsSteps,
  }) = _RewardStepList;

  factory RewardStepList.fromJson(Map<String, dynamic> json) =>
      _$RewardStepListFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class Media with _$Media {
  const factory Media({
    @Default('') String title,
    @Default('') String mediaText,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}
