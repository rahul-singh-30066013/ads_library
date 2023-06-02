/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pranaam_dashboard_site_core_response.freezed.dart';
part 'pranaam_dashboard_site_core_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PranaamDashboardSiteCoreResponse with _$PranaamDashboardSiteCoreResponse {
  const factory PranaamDashboardSiteCoreResponse({
    @Default('') String name,
    @Default('') String path,
    @Default([]) List<Element> elements,
  }) = _PranaamDashboardSiteCoreResponse;

  factory PranaamDashboardSiteCoreResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PranaamDashboardSiteCoreResponseFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Element with _$Element {
  const factory Element({
    @Default('') String uid,
    @Default('') String componentName,
    @Default('') String dataSource,
    @Default(Params()) Params params,
    @Default(Fields()) Fields fields,
  }) = _Element;

  factory Element.fromJson(Map<String, dynamic> json) =>
      _$ElementFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Fields with _$Fields {
  const factory Fields({
    @Default(DashboardItem()) DashboardItem widget,
    @Default('') String title,
    @Default([]) List<ListElement> list,
  }) = _Fields;

  factory Fields.fromJson(Map<String, dynamic> json) => _$FieldsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class ListElement with _$ListElement {
  const factory ListElement({
    @Default('') String title,
    @Default('') String body,
  }) = _ListElement;

  factory ListElement.fromJson(Map<String, dynamic> json) =>
      _$ListElementFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class DashboardItem with _$DashboardItem {
  const factory DashboardItem({
    @Default(0) int widgetId,
    @Default('') String widgetType,
    @Default('') String title,
    @Default('') String btnText,
    @Default('') String subTitle,
    @Default(0) double subItemRadius,
    @Default(0) double subItemWidth,
    @Default(0) int gridColumn,
    @Default(0) double aspectRatio,
    @Default(0) double borderRadius,
    @Default(ItemMargin()) ItemMargin itemMargin,
    @Default(ItemMargin()) ItemMargin subItemMargin,
    @Default(ActionTitle()) ActionTitle actionTitle,
    @Default(CarouselParam()) CarouselParam carouselParam,
    @Default([]) List<WidgetItem> widgetItems,
    @Default(WidgetItem()) WidgetItem widgetItem,
  }) = _DashboardItem;

  factory DashboardItem.fromJson(Map<String, dynamic> json) =>
      _$DashboardItemFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class ActionTitle with _$ActionTitle {
  const factory ActionTitle({
    @Default(0) int actionId,
    @Default('') String deeplink,
    @Default('') String name,
  }) = _ActionTitle;

  factory ActionTitle.fromJson(Map<String, dynamic> json) =>
      _$ActionTitleFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class ItemMargin with _$ItemMargin {
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
class WidgetItem with _$WidgetItem {
  const factory WidgetItem({
    @Default('') String title,
    @Default('') String uniqueId,
    @Default('') String btnText,
    @Default('') String appbtnText,
    @Default('') String appbtnUrl,
    @Default('') String imageSrc,
    @Default('') String description,
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
    @Default('') String imgSrc,
    @Default('') String alt,
    @Default('') String value,
    @Default('') String text,
    @Default('') String src,
    @Default('') String btn,
    @Default('') String btnUrl,
    @Default('') String carousalItems,
    @Default([]) List<Item> items,
    @Default([]) List<String> appDesc,
    @Default('') String btnTitle,
    @Default('') String price,
    @Default([]) List<Option> options,
    @Default('') String urlMp4,
    @Default('') String urlOgg,
    @Default('') String mobileImage,
    @Default('') String posterImage,
    ContactDetail? contactDetail,
    @Default(PranaamPackage()) PranaamPackage pranaamPackage,
    @Default([]) List<TabContentItem> tabContent,
  }) = _WidgetItem;

  factory WidgetItem.fromJson(Map<String, dynamic> json) =>
      _$WidgetItemFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Item with _$Item {
  const factory Item({
    @Default('') String id,
    @Default('') String src,
    @Default('') String alt,
    @Default('') String title,
    @Default('') String description,
    @Default('') String initialPrice,
    @Default('0') String finalPrice,
    @Default('') String btnText,
    @Default('') String btnUrl,
    @Default('') String btnVariant,
    @Default('') String desktopImage,
    @Default('') String desktopImageAlt,
    @Default('') String mobileImage,
    @Default('') String mobileImageAlt,
    @Default('') String thumbnailImage,
    @Default('') String thumbnailImageAlt,
    @Default('') String imageSrc,
    @Default('') String ctaLink,
    @Default('') String deepLink,
    @Default('') String subTitle,
    @Default('') String materialGroup,
    @Default('') String category,
    @Default('') String subCategory,
    @Default('') String brand,
    @Default('') String storeType,
    @Default('') String appCtaLink,
    @Default('') String cardDesc,
    @Default(false) bool restricted,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Option with _$Option {
  const factory Option({
    @Default('') String title,
    @Default('') String imgSrc,
    @Default('') String alt,
    @Default('') String description,
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Params with _$Params {
  const factory Params({
    @Default('') String widget,
  }) = _Params;

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class CarouselParam with _$CarouselParam {
  const factory CarouselParam({
    @Default('') String enableInfiniteScroll,
    @Default('') String enlargeCenterPage,
    @Default('') String autoPlay,
    @Default('') String viewportFraction,
  }) = _CarouselParam;

  factory CarouselParam.fromJson(Map<String, dynamic> json) =>
      _$CarouselParamFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class PranaamPackage with _$PranaamPackage {
  const factory PranaamPackage({
    @Default('') String title,
    @Default(Cards()) Cards cards,
  }) = _PranaamPackage;

  factory PranaamPackage.fromJson(Map<String, dynamic> json) =>
      _$PranaamPackageFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class TabContent with _$TabContent {
  const factory TabContent({
    @Default([]) List<TabContentItem> tabContentItems,
  }) = _TabContent;

  factory TabContent.fromJson(Map<String, dynamic> json) =>
      _$TabContentFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class TabContentItem with _$TabContentItem {
  const factory TabContentItem({
    @Default('') String title,
    @Default([]) List<CardsItem> cards,
  }) = _TabContentItem;

  factory TabContentItem.fromJson(Map<String, dynamic> json) =>
      _$TabContentItemFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class Cards with _$Cards {
  const factory Cards({
    @Default([]) List<CardsItem> items,
  }) = _Cards;

  factory Cards.fromJson(Map<String, dynamic> json) => _$CardsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class CardsItem with _$CardsItem {
  const factory CardsItem({
    @Default('') String id,
    @Default('') String src,
    @Default('') String alt,
    @Default('') String title,
    @Default('') String desc,
    @Default('') String value,
    @Default('') String cardDesc,
    @Default('') String finalPrice,
    @Default('') String btnText,
    @Default('') String btnUrl,
    @Default('') String btnVariant,
    @Default('') String mobileImage,
    @Default('') String mobileImageAlt,
    @Default('') String webImage,
    @Default('') String webImageAlt,
    @Default('') String thumbnailImage,
    @Default('') String thumbnailImageAlt,
    @Default(false) bool isRecommended,
  }) = _CardsItem;

  factory CardsItem.fromJson(Map<String, dynamic> json) =>
      _$CardsItemFromJson(json);
}
