/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'loyalty_dialog_model.freezed.dart';
part 'loyalty_dialog_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class LoyaltyDialogModel with _$LoyaltyDialogModel {
  const factory LoyaltyDialogModel({
    @Default([]) List<Element> elements,
  }) = _LoyaltyDialogModel;

  factory LoyaltyDialogModel.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyDialogModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class Element with _$Element {
  const factory Element({
    @Default('') @Default('') String uid,
    @Default('') String componentName,
    @Default('') String dataSource,
    @Default(Params()) Params params,
    @Default(DilaogFields()) DilaogFields fields,
  }) = _Element;

  factory Element.fromJson(Map<String, dynamic> json) =>
      _$ElementFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class DilaogFields with _$DilaogFields {
  const factory DilaogFields({
    @Default(LoyaltyDialogItems()) LoyaltyDialogItems widget,
  }) = _DilaogFields;

  factory DilaogFields.fromJson(Map<String, dynamic> json) =>
      _$DilaogFieldsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class LoyaltyDialogItems with _$LoyaltyDialogItems {
  const factory LoyaltyDialogItems({
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
  }) = _LoyaltyDialogItems;

  factory LoyaltyDialogItems.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyDialogItemsFromJson(json);
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
    @Default('') String ctaText,
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
