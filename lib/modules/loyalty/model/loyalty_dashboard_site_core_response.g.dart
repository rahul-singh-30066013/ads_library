// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_dashboard_site_core_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoyaltyDashboardSiteCoreResponse
    _$$_LoyaltyDashboardSiteCoreResponseFromJson(Map<String, dynamic> json) =>
        _$_LoyaltyDashboardSiteCoreResponse(
          name: json['name'] as String? ?? '',
          path: json['path'] as String? ?? '',
          elements: (json['elements'] as List<dynamic>?)
                  ?.map((e) => Elements.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
        );

Map<String, dynamic> _$$_LoyaltyDashboardSiteCoreResponseToJson(
        _$_LoyaltyDashboardSiteCoreResponse instance) =>
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
      contentList: (json['contentList'] as List<dynamic>?)
              ?.map((e) => ContentList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
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
      'contentList': instance.contentList,
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

_$_ContentList _$$_ContentListFromJson(Map<String, dynamic> json) =>
    _$_ContentList(
      title: json['title'] as String? ?? '',
      lines: (json['lines'] as List<dynamic>?)
              ?.map((e) => Lines.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ContentListToJson(_$_ContentList instance) =>
    <String, dynamic>{
      'title': instance.title,
      'lines': instance.lines,
    };

_$_Lines _$$_LinesFromJson(Map<String, dynamic> json) => _$_Lines(
      line: json['line'] as String? ?? '',
      links:
          (json['links'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$_LinesToJson(_$_Lines instance) => <String, dynamic>{
      'line': instance.line,
      'links': instance.links,
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
      apiUrl: json['apiUrl'] as String? ?? '',
      popular: json['popular'] as bool? ?? false,
      newArrival: json['newArrival'] as bool? ?? false,
      showOnHomepage: json['showOnHomepage'] as bool? ?? false,
      webImage: json['webImage'] as String? ?? '',
      thumbnailImage: json['thumbnailImage'] as String? ?? '',
      title: json['title'] as String? ?? '',
      airportName: json['airportName'] as String? ?? '',
      imageSrc: json['imageSrc'] as String? ?? '',
      imageAlt: json['imageAlt'] as String? ?? '',
      description: json['description'] as String? ?? '',
      ctaLink: json['ctaLink'] as String? ?? '',
      ctaText: json['ctaText'] as String? ?? '',
      deepLink: json['deepLink'] as String? ?? '',
      subTitle: json['subTitle'] as String? ?? '',
      materialGroup: json['materialGroup'] as String? ?? '',
      category: json['category'] as String? ?? '',
      subCategory: json['subCategory'] as String? ?? '',
      brand: json['brand'] as String? ?? '',
      storeType: json['storeType'] as String? ?? '',
      restricted: json['restricted'] as bool? ?? false,
      mobileImage: json['mobileImage'] as String? ?? '',
      mobileImageSrc: json['mobileImageSrc'] as String? ?? '',
      rewardType: json['rewardType'] as String? ?? '',
      posterImage: json['posterImage'] as String? ?? '',
      rewardList: (json['rewardList'] as List<dynamic>?)
              ?.map((e) => RewardList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      list:
          (json['list'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      descriptionApp: json['descriptionApp'] as String? ?? '',
      appImageSrc: json['appImageSrc'] as String? ?? '',
      rewardUniqueId: json['rewardUniqueId'] as String? ?? '',
      productDatas: (json['productDatas'] as List<dynamic>?)
              ?.map((e) =>
                  DutyFreeProductDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tableData: (json['tableData'] as List<dynamic>?)
              ?.map((e) => TableData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      buttonText: json['buttonText'] as String? ?? '',
    );

Map<String, dynamic> _$$_WidgetItemToJson(_$_WidgetItem instance) =>
    <String, dynamic>{
      'apiUrl': instance.apiUrl,
      'popular': instance.popular,
      'newArrival': instance.newArrival,
      'showOnHomepage': instance.showOnHomepage,
      'webImage': instance.webImage,
      'thumbnailImage': instance.thumbnailImage,
      'title': instance.title,
      'airportName': instance.airportName,
      'imageSrc': instance.imageSrc,
      'imageAlt': instance.imageAlt,
      'description': instance.description,
      'ctaLink': instance.ctaLink,
      'ctaText': instance.ctaText,
      'deepLink': instance.deepLink,
      'subTitle': instance.subTitle,
      'materialGroup': instance.materialGroup,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'brand': instance.brand,
      'storeType': instance.storeType,
      'restricted': instance.restricted,
      'mobileImage': instance.mobileImage,
      'mobileImageSrc': instance.mobileImageSrc,
      'rewardType': instance.rewardType,
      'posterImage': instance.posterImage,
      'rewardList': instance.rewardList,
      'list': instance.list,
      'descriptionApp': instance.descriptionApp,
      'appImageSrc': instance.appImageSrc,
      'rewardUniqueId': instance.rewardUniqueId,
      'productDatas': instance.productDatas,
      'tableData': instance.tableData,
      'buttonText': instance.buttonText,
    };

_$_TableData _$$_TableDataFromJson(Map<String, dynamic> json) => _$_TableData(
      rowTitle: json['rowTitle'] as String? ?? '',
      column: json['column'] == null
          ? const ColumnData()
          : ColumnData.fromJson(json['column'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TableDataToJson(_$_TableData instance) =>
    <String, dynamic>{
      'rowTitle': instance.rowTitle,
      'column': instance.column,
    };

_$_ColumnData _$$_ColumnDataFromJson(Map<String, dynamic> json) =>
    _$_ColumnData(
      columnValue: (json['columnValue'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ColumnDataToJson(_$_ColumnData instance) =>
    <String, dynamic>{
      'columnValue': instance.columnValue,
    };

_$_RewardList _$$_RewardListFromJson(Map<String, dynamic> json) =>
    _$_RewardList(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      descriptionApp: json['descriptionApp'] as String? ?? '',
      standerdImageUrl: json['standerdImageUrl'] as String? ?? '',
      standerdImageAlt: json['standerdImageAlt'] as String? ?? '',
      ctaLink: json['ctaLink'] as String? ?? '',
      ctaText: json['ctaText'] as String? ?? '',
      active: json['active'] as bool? ?? true,
    );

Map<String, dynamic> _$$_RewardListToJson(_$_RewardList instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'descriptionApp': instance.descriptionApp,
      'standerdImageUrl': instance.standerdImageUrl,
      'standerdImageAlt': instance.standerdImageAlt,
      'ctaLink': instance.ctaLink,
      'ctaText': instance.ctaText,
      'active': instance.active,
    };

_$_Params _$$_ParamsFromJson(Map<String, dynamic> json) => _$_Params(
      widget: json['widget'] as String? ?? '',
      widgetName: json['widgetName'] as String? ?? '',
    );

Map<String, dynamic> _$$_ParamsToJson(_$_Params instance) => <String, dynamic>{
      'widget': instance.widget,
      'widgetName': instance.widgetName,
    };
