// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashBoardModel _$DashBoardModelFromJson(Map<String, dynamic> json) =>
    DashBoardModel(
      dashBoard: (json['dashBoard'] as List<dynamic>)
          .map((e) => DashBoardItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DashBoardModelToJson(DashBoardModel instance) =>
    <String, dynamic>{
      'dashBoard': instance.dashBoard,
    };

DashBoardItem _$DashBoardItemFromJson(Map<String, dynamic> json) =>
    DashBoardItem(
      widgetId: json['widgetId'] as int?,
      widgetType: json['widgetType'] as String?,
      variable: json['variable'] as String?,
      aspectRatio: (json['aspectRatio'] as num?)?.toDouble(),
      itemMargin: json['itemMargin'] == null
          ? null
          : ItemMargin.fromJson(json['itemMargin'] as Map<String, dynamic>),
      subItemMargin: (json['subItemMargin'] as num?)?.toDouble(),
      subItemWidth: (json['subItemWidth'] as num?)?.toDouble(),
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      actionTitle: json['actionTitle'] == null
          ? null
          : ActionTitle.fromJson(json['actionTitle'] as Map<String, dynamic>),
      gridColumn: json['gridColumn'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      customItems: json['customItems'] as List<dynamic>?,
      carouselParam: json['carouselParam'] == null
          ? null
          : CarouselParam.fromJson(
              json['carouselParam'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashBoardItemToJson(DashBoardItem instance) =>
    <String, dynamic>{
      'widgetId': instance.widgetId,
      'widgetType': instance.widgetType,
      'variable': instance.variable,
      'aspectRatio': instance.aspectRatio,
      'itemMargin': instance.itemMargin,
      'subItemMargin': instance.subItemMargin,
      'subItemWidth': instance.subItemWidth,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'actionTitle': instance.actionTitle,
      'gridColumn': instance.gridColumn,
      'items': instance.items,
      'customItems': instance.customItems,
      'carouselParam': instance.carouselParam,
    };

ActionTitle _$ActionTitleFromJson(Map<String, dynamic> json) => ActionTitle(
      actionId: json['actionId'] as int?,
      deeplink: json['deeplink'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ActionTitleToJson(ActionTitle instance) =>
    <String, dynamic>{
      'actionId': instance.actionId,
      'deeplink': instance.deeplink,
      'name': instance.name,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      actionId: json['actionId'] as int?,
      icon: json['icon'] as String?,
      deeplink: json['deeplink'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'actionId': instance.actionId,
      'icon': instance.icon,
      'deeplink': instance.deeplink,
      'title': instance.title,
    };

ItemMargin _$ItemMarginFromJson(Map<String, dynamic> json) => ItemMargin(
      left: (json['left'] as num?)?.toDouble() ?? 0,
      right: (json['right'] as num?)?.toDouble() ?? 0,
      bottom: (json['bottom'] as num?)?.toDouble() ?? 0,
      top: (json['top'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$ItemMarginToJson(ItemMargin instance) =>
    <String, dynamic>{
      'left': instance.left,
      'right': instance.right,
      'bottom': instance.bottom,
      'top': instance.top,
    };

CarouselParam _$CarouselParamFromJson(Map<String, dynamic> json) =>
    CarouselParam(
      enableInfiniteScroll: json['enableInfiniteScroll'] as bool? ?? true,
      enlargeCenterPage: json['enlargeCenterPage'] as bool? ?? false,
      autoPlay: json['autoPlay'] as bool? ?? false,
      viewportFraction:
          (json['viewportFraction'] as num?)?.toDouble() ?? viewFraction,
    );

Map<String, dynamic> _$CarouselParamToJson(CarouselParam instance) =>
    <String, dynamic>{
      'enableInfiniteScroll': instance.enableInfiniteScroll,
      'enlargeCenterPage': instance.enlargeCenterPage,
      'autoPlay': instance.autoPlay,
      'viewportFraction': instance.viewportFraction,
    };
