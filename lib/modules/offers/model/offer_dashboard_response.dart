/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_dashboard_response.freezed.dart';
part 'offer_dashboard_response.g.dart';

/// this is the model class for customer feedback request

@Freezed(makeCollectionsUnmodifiable: false)
class OfferDashboardResponse with _$OfferDashboardResponse {
  const factory OfferDashboardResponse({
    @Default('') String name,
    @Default('') String path,
    @Default([]) List<Elements> elements,
  }) = _OfferDashboardResponse;

  factory OfferDashboardResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$OfferDashboardResponseFromJson(json);
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
    @Default([]) List<WidgetItem> widgetItems,
  }) = _DashboardItem;

  factory DashboardItem.fromJson(Map<String, dynamic> json) =>
      _$DashboardItemFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class OfferItems with _$OfferItems {
  const factory OfferItems({
    @Default(0) int count,
    @Default([]) List<WidgetItem> result,
  }) = _OfferItems;

  factory OfferItems.fromJson(Map<String, dynamic> json) =>
      _$OfferItemsFromJson(json);
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
    @Default('') String promotionType,
    @Default('') String promotionDescription,
    @Default('') String promotionCode,
    @Default('') String title,
    @Default('') String skuCode,
    @Default('') String offerType,
    @Default('') String displayText,
    @Default('') String effectiveFrom,
    @Default('') String effectiveTo,
    @Default('') String mobileImageSrc,
    @Default('') String thumbnailImageSrc,
    @Default('') String expiryOption,
    @Default('') String savings,
    @Default('') String apptype,
    @Default('') String extraImageSrc,
    @Default('') String linkURL,
    @Default('') String linkText,
    @Default('') String tcLinkAlt,
    @Default('') String validationType,
    @Default('') String currency,
    @Default('') String tcLinkUrl,
    @Default('') String bannerImageMobSrc,
    @Default('') String categoryFilter,
    @Default('') String promotionTypeLabel,
    @Default('') String tabTitle,
    @Default('') String offerTitle,
    @Default('') String bankOfferText,
    @Default('') String unlockOfferTitle,
    @Default(false) bool tcEnable,
    @Default('') String deepLinkAlt,
    @Default('') String offerUniqueID,

    // @Default('') String terminalLocationType,
    @Default([]) List<String> termCondition,
    @Default(false) bool isInstoreOffer,

    // @Default('') String terminalLocationType,
    @Default([]) List<String> similarOffers,
    @Default('') String tncViewAllLink,
    @Default('') String displayRank,
    @Default([]) List<String> howToUse,
    @Default('') String bookingConfirmedOfferText,
    @Default('') String bookingConfirmedOfferDescription,
    @Default('') String offerLogoDesktop,
    @Default('') String offerLogoMobile,
    @Default('') String unlockOfferCTAText,
    @Default('') String UnlockOfferCTALink,
    @Default('') String unlockOfferCTAVisitWesiteText,
    @Default('') String unlockOfferCTAVisitWesiteLink,
    @Default('') String offerServicesRedirectionLink,
    @Default(false) bool isExpired,
  }) = _WidgetItem;

  factory WidgetItem.fromJson(Map<String, dynamic> json) =>
      _$WidgetItemFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Params with _$Params {
  const factory Params({
    @Default('') String widget,
    @Default('') String widgetName,
  }) = _Params;

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);
}
