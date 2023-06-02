/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loyalty_dashboard_site_core_response.freezed.dart';
part 'loyalty_dashboard_site_core_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class LoyaltyDashboardSiteCoreResponse with _$LoyaltyDashboardSiteCoreResponse {
  const factory LoyaltyDashboardSiteCoreResponse({
    @Default('') String name,
    @Default('') String path,
    @Default([]) List<Elements> elements,
  }) = _LoyaltyDashboardSiteCoreResponse;

  factory LoyaltyDashboardSiteCoreResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$LoyaltyDashboardSiteCoreResponseFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Elements with _$Elements {
  const factory Elements({
    @Default('') String uid,
    @Default('') String componentName,
    @Default('') String dataSource,
    @Default(Params()) Params params,
    @Default(Fields()) Fields fields,
  }) = _Elements;

  factory Elements.fromJson(Map<String, dynamic> json) =>
      _$ElementsFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Fields with _$Fields {
  const factory Fields({
    @Default(DashboardItem()) DashboardItem widget,
    @Default([]) List<ContentList> contentList,
    @Default('') String title,
    @Default([]) List<ListElement> list,
    @Default('') String ctaText,
    @Default('') String ctaURL,
    @Default('') String faqHTML,
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
class ContentList with _$ContentList {
  const factory ContentList({
    @Default('') String title,
    @Default([]) List<Lines> lines,
  }) = _ContentList;

  factory ContentList.fromJson(Map<String, dynamic> json) =>
      _$ContentListFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Lines with _$Lines {
  const factory Lines({
    @Default('') String line,
    @Default([]) List<String> links,
  }) = _Lines;

  factory Lines.fromJson(Map<String, dynamic> json) => _$LinesFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class DashboardItem with _$DashboardItem {
  const factory DashboardItem({
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
    //@Default('') String carouselParam,
    //@Default('') String tagName,
    @Default([]) List<WidgetItem> widgetItems,
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
    @Default('') String apiUrl,
    @Default(false) bool popular,
    @Default(false) bool newArrival,
    @Default(false) bool showOnHomepage,
    @Default('') String webImage,
    @Default('') String thumbnailImage,
    @Default('') String title,
    @Default('') String airportName,
    @Default('') String imageSrc,
    @Default('') String imageAlt,
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
    @Default('') String mobileImage,
    @Default('') String mobileImageSrc,
    @Default('') String rewardType,
    @Default('') String posterImage,
    @Default([]) List<RewardList> rewardList,
    @Default([]) List<String> list,
    @Default('') String descriptionApp,
    @Default('') String appImageSrc,
    @Default('') String rewardUniqueId,
    @Default([]) List<DutyFreeProductDataModel> productDatas,
    @Default([]) List<TableData> tableData,
    @Default('') String buttonText,
  }) = _WidgetItem;

  factory WidgetItem.fromJson(Map<String, dynamic> json) =>
      _$WidgetItemFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class TableData with _$TableData {
  const factory TableData({
    @Default('') String rowTitle,
    @Default(ColumnData()) ColumnData column,
  }) = _TableData;

  factory TableData.fromJson(Map<String, dynamic> json) =>
      _$TableDataFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class ColumnData with _$ColumnData {
  const factory ColumnData({
    @Default([]) List<String> columnValue,
  }) = _ColumnData;

  factory ColumnData.fromJson(Map<String, dynamic> json) =>
      _$ColumnDataFromJson(json);
}

// @Freezed(makeCollectionsUnmodifiable: false)
// abstract class ProductData with _$ProductData {
//   const factory ProductData({
//     @Default('') String materialGroup,
//     @Default('') String brand,
//     @Default('') String category,
//     @Default('') String subCategory,
//     @Default('') String skuName,
//     @Default('') String skuCode,
//     @Default(0) double price,
//     @Default(0) int quantity,
//     @Default(null) dynamic pointsLabel,
//     @Default([]) List<Pramotion> pramotions,
//     @Default([]) List<String> productImages,
//     @Default('') String earn2XString,
//   }) = _ProductData;
//
//   factory ProductData.fromJson(Map<String, dynamic> json) =>
//       _$ProductDataFromJson(json);
// }
//
// @Freezed(makeCollectionsUnmodifiable: false)
// abstract class Pramotion with _$Pramotion {
//   const factory Pramotion({
//     @Default('') String code,
//     @Default(0) int quantity,
//     @Default(0) int type,
//     @Default('') String offer,
//     @Default('') String displayText,
//     @Default(0) double discountPrice,
//     @Default(0) double offerPrice,
//   }) = _Pramotion;
//
//   factory Pramotion.fromJson(Map<String, dynamic> json) =>
//       _$PramotionFromJson(json);
// }

@Freezed(makeCollectionsUnmodifiable: false)
abstract class RewardList with _$RewardList {
  const factory RewardList({
    @Default('') String title,
    @Default('') String description,
    @Default('') String descriptionApp,
    @Default('') String standerdImageUrl,
    @Default('') String standerdImageAlt,
    @Default('') String ctaLink,
    @Default('') String ctaText,
    @Default(true) bool active,
  }) = _RewardList;

  factory RewardList.fromJson(Map<String, dynamic> json) =>
      _$RewardListFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Params with _$Params {
  const factory Params({
    @Default('') String widget,
    @Default('') String widgetName,
  }) = _Params;

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
}
