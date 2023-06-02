// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_dashboard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OfferDashboardResponse _$$_OfferDashboardResponseFromJson(
        Map<String, dynamic> json) =>
    _$_OfferDashboardResponse(
      name: json['name'] as String? ?? '',
      path: json['path'] as String? ?? '',
      elements: (json['elements'] as List<dynamic>?)
              ?.map((e) => Elements.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_OfferDashboardResponseToJson(
        _$_OfferDashboardResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'elements': instance.elements,
    };

_$_Elements _$$_ElementsFromJson(Map<String, dynamic> json) => _$_Elements(
      uid: json['uid'] as String? ?? '',
      componentName: json['componentName'] as String? ?? '',
      dataSource: json['dataSource'] as String? ?? '',
      params: json['params'] == null
          ? const Params()
          : Params.fromJson(json['params'] as Map<String, dynamic>),
      fields: json['fields'] == null
          ? const Fields()
          : Fields.fromJson(json['fields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ElementsToJson(_$_Elements instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'componentName': instance.componentName,
      'dataSource': instance.dataSource,
      'params': instance.params,
      'fields': instance.fields,
    };

_$_Fields _$$_FieldsFromJson(Map<String, dynamic> json) => _$_Fields(
      widget: json['widget'] == null
          ? const DashboardItem()
          : DashboardItem.fromJson(json['widget'] as Map<String, dynamic>),
      title: json['title'] as String? ?? '',
      list: (json['list'] as List<dynamic>?)
              ?.map((e) => ListElement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      ctaText: json['ctaText'] as String? ?? '',
      ctaURL: json['ctaURL'] as String? ?? '',
      faqHTML: json['faqHTML'] as String? ?? '',
    );

Map<String, dynamic> _$$_FieldsToJson(_$_Fields instance) => <String, dynamic>{
      'widget': instance.widget,
      'title': instance.title,
      'list': instance.list,
      'ctaText': instance.ctaText,
      'ctaURL': instance.ctaURL,
      'faqHTML': instance.faqHTML,
    };

_$_ListElement _$$_ListElementFromJson(Map<String, dynamic> json) =>
    _$_ListElement(
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
    );

Map<String, dynamic> _$$_ListElementToJson(_$_ListElement instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
    };

_$_DashboardItem _$$_DashboardItemFromJson(Map<String, dynamic> json) =>
    _$_DashboardItem(
      widgetId: json['widgetId'] as int? ?? 0,
      widgetType: json['widgetType'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subTitle: json['subTitle'] as String? ?? '',
      subItemRadius: (json['subItemRadius'] as num?)?.toDouble() ?? 0,
      subItemWidth: (json['subItemWidth'] as num?)?.toDouble() ?? 0,
      gridColumn: json['gridColumn'] as int? ?? 0,
      aspectRatio: (json['aspectRatio'] as num?)?.toDouble() ?? 0,
      borderRadius: (json['borderRadius'] as num?)?.toDouble() ?? 0,
      itemMargin: json['itemMargin'] == null
          ? const ItemMargin()
          : ItemMargin.fromJson(json['itemMargin'] as Map<String, dynamic>),
      subItemMargin: json['subItemMargin'] == null
          ? const ItemMargin()
          : ItemMargin.fromJson(json['subItemMargin'] as Map<String, dynamic>),
      actionTitle: json['actionTitle'] == null
          ? const ActionTitle()
          : ActionTitle.fromJson(json['actionTitle'] as Map<String, dynamic>),
      widgetItems: (json['widgetItems'] as List<dynamic>?)
              ?.map((e) => WidgetItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_DashboardItemToJson(_$_DashboardItem instance) =>
    <String, dynamic>{
      'widgetId': instance.widgetId,
      'widgetType': instance.widgetType,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'subItemRadius': instance.subItemRadius,
      'subItemWidth': instance.subItemWidth,
      'gridColumn': instance.gridColumn,
      'aspectRatio': instance.aspectRatio,
      'borderRadius': instance.borderRadius,
      'itemMargin': instance.itemMargin,
      'subItemMargin': instance.subItemMargin,
      'actionTitle': instance.actionTitle,
      'widgetItems': instance.widgetItems,
    };

_$_OfferItems _$$_OfferItemsFromJson(Map<String, dynamic> json) =>
    _$_OfferItems(
      count: json['count'] as int? ?? 0,
      result: (json['result'] as List<dynamic>?)
              ?.map((e) => WidgetItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_OfferItemsToJson(_$_OfferItems instance) =>
    <String, dynamic>{
      'count': instance.count,
      'result': instance.result,
    };

_$_ActionTitle _$$_ActionTitleFromJson(Map<String, dynamic> json) =>
    _$_ActionTitle(
      actionId: json['actionId'] as int? ?? 0,
      deeplink: json['deeplink'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$$_ActionTitleToJson(_$_ActionTitle instance) =>
    <String, dynamic>{
      'actionId': instance.actionId,
      'deeplink': instance.deeplink,
      'name': instance.name,
    };

_$_ItemMargin _$$_ItemMarginFromJson(Map<String, dynamic> json) =>
    _$_ItemMargin(
      left: (json['left'] as num?)?.toDouble() ?? 0,
      right: (json['right'] as num?)?.toDouble() ?? 0,
      bottom: (json['bottom'] as num?)?.toDouble() ?? 0,
      top: (json['top'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_ItemMarginToJson(_$_ItemMargin instance) =>
    <String, dynamic>{
      'left': instance.left,
      'right': instance.right,
      'bottom': instance.bottom,
      'top': instance.top,
    };

_$_WidgetItem _$$_WidgetItemFromJson(Map<String, dynamic> json) =>
    _$_WidgetItem(
      promotionType: json['promotionType'] as String? ?? '',
      promotionDescription: json['promotionDescription'] as String? ?? '',
      promotionCode: json['promotionCode'] as String? ?? '',
      title: json['title'] as String? ?? '',
      skuCode: json['skuCode'] as String? ?? '',
      offerType: json['offerType'] as String? ?? '',
      displayText: json['displayText'] as String? ?? '',
      effectiveFrom: json['effectiveFrom'] as String? ?? '',
      effectiveTo: json['effectiveTo'] as String? ?? '',
      mobileImageSrc: json['mobileImageSrc'] as String? ?? '',
      thumbnailImageSrc: json['thumbnailImageSrc'] as String? ?? '',
      expiryOption: json['expiryOption'] as String? ?? '',
      savings: json['savings'] as String? ?? '',
      apptype: json['apptype'] as String? ?? '',
      extraImageSrc: json['extraImageSrc'] as String? ?? '',
      linkURL: json['linkURL'] as String? ?? '',
      linkText: json['linkText'] as String? ?? '',
      tcLinkAlt: json['tcLinkAlt'] as String? ?? '',
      validationType: json['validationType'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      tcLinkUrl: json['tcLinkUrl'] as String? ?? '',
      bannerImageMobSrc: json['bannerImageMobSrc'] as String? ?? '',
      categoryFilter: json['categoryFilter'] as String? ?? '',
      promotionTypeLabel: json['promotionTypeLabel'] as String? ?? '',
      tabTitle: json['tabTitle'] as String? ?? '',
      offerTitle: json['offerTitle'] as String? ?? '',
      bankOfferText: json['bankOfferText'] as String? ?? '',
      unlockOfferTitle: json['unlockOfferTitle'] as String? ?? '',
      tcEnable: json['tcEnable'] as bool? ?? false,
      deepLinkAlt: json['deepLinkAlt'] as String? ?? '',
      offerUniqueID: json['offerUniqueID'] as String? ?? '',
      termCondition: (json['termCondition'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isInstoreOffer: json['isInstoreOffer'] as bool? ?? false,
      similarOffers: (json['similarOffers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tncViewAllLink: json['tncViewAllLink'] as String? ?? '',
      displayRank: json['displayRank'] as String? ?? '',
      howToUse: (json['howToUse'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      bookingConfirmedOfferText:
          json['bookingConfirmedOfferText'] as String? ?? '',
      bookingConfirmedOfferDescription:
          json['bookingConfirmedOfferDescription'] as String? ?? '',
      offerLogoDesktop: json['offerLogoDesktop'] as String? ?? '',
      offerLogoMobile: json['offerLogoMobile'] as String? ?? '',
      unlockOfferCTAText: json['unlockOfferCTAText'] as String? ?? '',
      UnlockOfferCTALink: json['UnlockOfferCTALink'] as String? ?? '',
      unlockOfferCTAVisitWesiteText:
          json['unlockOfferCTAVisitWesiteText'] as String? ?? '',
      unlockOfferCTAVisitWesiteLink:
          json['unlockOfferCTAVisitWesiteLink'] as String? ?? '',
      offerServicesRedirectionLink:
          json['offerServicesRedirectionLink'] as String? ?? '',
      isExpired: json['isExpired'] as bool? ?? false,
    );

Map<String, dynamic> _$$_WidgetItemToJson(_$_WidgetItem instance) =>
    <String, dynamic>{
      'promotionType': instance.promotionType,
      'promotionDescription': instance.promotionDescription,
      'promotionCode': instance.promotionCode,
      'title': instance.title,
      'skuCode': instance.skuCode,
      'offerType': instance.offerType,
      'displayText': instance.displayText,
      'effectiveFrom': instance.effectiveFrom,
      'effectiveTo': instance.effectiveTo,
      'mobileImageSrc': instance.mobileImageSrc,
      'thumbnailImageSrc': instance.thumbnailImageSrc,
      'expiryOption': instance.expiryOption,
      'savings': instance.savings,
      'apptype': instance.apptype,
      'extraImageSrc': instance.extraImageSrc,
      'linkURL': instance.linkURL,
      'linkText': instance.linkText,
      'tcLinkAlt': instance.tcLinkAlt,
      'validationType': instance.validationType,
      'currency': instance.currency,
      'tcLinkUrl': instance.tcLinkUrl,
      'bannerImageMobSrc': instance.bannerImageMobSrc,
      'categoryFilter': instance.categoryFilter,
      'promotionTypeLabel': instance.promotionTypeLabel,
      'tabTitle': instance.tabTitle,
      'offerTitle': instance.offerTitle,
      'bankOfferText': instance.bankOfferText,
      'unlockOfferTitle': instance.unlockOfferTitle,
      'tcEnable': instance.tcEnable,
      'deepLinkAlt': instance.deepLinkAlt,
      'offerUniqueID': instance.offerUniqueID,
      'termCondition': instance.termCondition,
      'isInstoreOffer': instance.isInstoreOffer,
      'similarOffers': instance.similarOffers,
      'tncViewAllLink': instance.tncViewAllLink,
      'displayRank': instance.displayRank,
      'howToUse': instance.howToUse,
      'bookingConfirmedOfferText': instance.bookingConfirmedOfferText,
      'bookingConfirmedOfferDescription':
          instance.bookingConfirmedOfferDescription,
      'offerLogoDesktop': instance.offerLogoDesktop,
      'offerLogoMobile': instance.offerLogoMobile,
      'unlockOfferCTAText': instance.unlockOfferCTAText,
      'UnlockOfferCTALink': instance.UnlockOfferCTALink,
      'unlockOfferCTAVisitWesiteText': instance.unlockOfferCTAVisitWesiteText,
      'unlockOfferCTAVisitWesiteLink': instance.unlockOfferCTAVisitWesiteLink,
      'offerServicesRedirectionLink': instance.offerServicesRedirectionLink,
      'isExpired': instance.isExpired,
    };

_$_Params _$$_ParamsFromJson(Map<String, dynamic> json) => _$_Params(
      widget: json['widget'] as String? ?? '',
      widgetName: json['widgetName'] as String? ?? '',
    );

Map<String, dynamic> _$$_ParamsToJson(_$_Params instance) => <String, dynamic>{
      'widget': instance.widget,
      'widgetName': instance.widgetName,
    };
