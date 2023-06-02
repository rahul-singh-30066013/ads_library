// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_dashboard_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeDashboardItem _$$_DutyFreeDashboardItemFromJson(
        Map<String, dynamic> json) =>
    _$_DutyFreeDashboardItem(
      json['widgetId'] as int?,
      json['widgetType'] as String?,
      json['variable'] as String?,
      (json['aspectRatio'] as num?)?.toDouble(),
      json['itemMargin'] == null
          ? null
          : ItemMargin.fromJson(json['itemMargin'] as Map<String, dynamic>),
      json['subItemMargin'] == null
          ? null
          : ItemMargin.fromJson(json['subItemMargin'] as Map<String, dynamic>),
      (json['subItemWidth'] as num?)?.toDouble(),
      (json['subItemRadius'] as num?)?.toDouble(),
      json['title'] as String?,
      json['subTitle'] as String?,
      json['actionTitle'] == null
          ? null
          : ActionTitle.fromJson(json['actionTitle'] as Map<String, dynamic>),
      json['gridColumn'] as int?,
      json['deepLink'] as String?,
      (json['widgetItems'] as List<dynamic>?)
          ?.map((e) => DutyFreeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['customItems'] as List<dynamic>?,
      json['carouselParam'] == null
          ? null
          : CarouselParam.fromJson(
              json['carouselParam'] as Map<String, dynamic>),
      gridConfiguration: json['gridConfiguration'] == null
          ? null
          : GridConfiguration.fromJson(
              json['gridConfiguration'] as Map<String, dynamic>),
      tabConfiguration: json['tabConfiguration'] == null
          ? null
          : TabConfiguration.fromJson(
              json['tabConfiguration'] as Map<String, dynamic>),
      enableCircle: json['enableCircle'] as bool? ?? true,
      backgroundColor: json['backgroundColor'] as String? ?? '',
      gradientConfiguration: json['gradientConfiguration'] == null
          ? null
          : GradientConfiguration.fromJson(
              json['gradientConfiguration'] as Map<String, dynamic>),
      subItemColors: json['subItemColors'] == null
          ? const SubItemColors()
          : SubItemColors.fromJson(
              json['subItemColors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DutyFreeDashboardItemToJson(
        _$_DutyFreeDashboardItem instance) =>
    <String, dynamic>{
      'widgetId': instance.widgetId,
      'widgetType': instance.widgetType,
      'variable': instance.variable,
      'aspectRatio': instance.aspectRatio,
      'itemMargin': instance.itemMargin,
      'subItemMargin': instance.subItemMargin,
      'subItemWidth': instance.subItemWidth,
      'subItemRadius': instance.subItemRadius,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'actionTitle': instance.actionTitle,
      'gridColumn': instance.gridColumn,
      'deepLink': instance.deepLink,
      'widgetItems': instance.widgetItems,
      'customItems': instance.customItems,
      'carouselParam': instance.carouselParam,
      'gridConfiguration': instance.gridConfiguration,
      'tabConfiguration': instance.tabConfiguration,
      'enableCircle': instance.enableCircle,
      'backgroundColor': instance.backgroundColor,
      'gradientConfiguration': instance.gradientConfiguration,
      'subItemColors': instance.subItemColors,
    };
