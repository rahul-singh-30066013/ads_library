// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_refer_and_earn_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoyaltyReferAndEarnModel _$$_LoyaltyReferAndEarnModelFromJson(
        Map<String, dynamic> json) =>
    _$_LoyaltyReferAndEarnModel(
      elements: (json['elements'] as List<dynamic>?)
              ?.map((e) => Element.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_LoyaltyReferAndEarnModelToJson(
        _$_LoyaltyReferAndEarnModel instance) =>
    <String, dynamic>{
      'elements': instance.elements,
    };

_$_Element _$$_ElementFromJson(Map<String, dynamic> json) => _$_Element(
      uid: json['uid'] as String? ?? '',
      componentName: json['componentName'] as String? ?? '',
      dataSource: json['dataSource'] as String? ?? '',
      params: json['params'] == null
          ? const Params()
          : Params.fromJson(json['params'] as Map<String, dynamic>),
      fields: json['fields'] == null
          ? const ReferAndEarnFields()
          : ReferAndEarnFields.fromJson(json['fields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ElementToJson(_$_Element instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'componentName': instance.componentName,
      'dataSource': instance.dataSource,
      'params': instance.params,
      'fields': instance.fields,
    };

_$_ReferAndEarnFields _$$_ReferAndEarnFieldsFromJson(
        Map<String, dynamic> json) =>
    _$_ReferAndEarnFields(
      widget: json['widget'] == null
          ? const ReferAndEarnItem()
          : ReferAndEarnItem.fromJson(json['widget'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ReferAndEarnFieldsToJson(
        _$_ReferAndEarnFields instance) =>
    <String, dynamic>{
      'widget': instance.widget,
    };

_$_ReferAndEarnItem _$$_ReferAndEarnItemFromJson(Map<String, dynamic> json) =>
    _$_ReferAndEarnItem(
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
      carouselParam: json['carouselParam'] ?? null,
      widgetItems: (json['widgetItems'] as List<dynamic>?)
              ?.map((e) => WidgetItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ReferAndEarnItemToJson(_$_ReferAndEarnItem instance) =>
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
      'carouselParam': instance.carouselParam,
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
      title: json['title'] as String? ?? '',
      imageSrc: json['imageSrc'] as String? ?? '',
      description: json['description'] as String? ?? '',
      descriptionApp: json['descriptionApp'] as String? ?? '',
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
      webImage: json['webImage'] ?? null,
      thumbnailImage: json['thumbnailImage'] ?? null,
      rewardStepList: (json['rewardStepList'] as List<dynamic>?)
              ?.map((e) => RewardStepList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      media: (json['media'] as List<dynamic>?)
              ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_WidgetItemToJson(_$_WidgetItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imageSrc': instance.imageSrc,
      'description': instance.description,
      'descriptionApp': instance.descriptionApp,
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
      'webImage': instance.webImage,
      'thumbnailImage': instance.thumbnailImage,
      'rewardStepList': instance.rewardStepList,
      'media': instance.media,
    };

_$_Params _$$_ParamsFromJson(Map<String, dynamic> json) => _$_Params(
      widget: json['widget'] as String? ?? '',
      widgetName: json['widgetName'] as String? ?? '',
    );

Map<String, dynamic> _$$_ParamsToJson(_$_Params instance) => <String, dynamic>{
      'widget': instance.widget,
      'widgetName': instance.widgetName,
    };

_$_RewardStepList _$$_RewardStepListFromJson(Map<String, dynamic> json) =>
    _$_RewardStepList(
      rewardsSteps: json['rewardsSteps'] as String? ?? '',
    );

Map<String, dynamic> _$$_RewardStepListToJson(_$_RewardStepList instance) =>
    <String, dynamic>{
      'rewardsSteps': instance.rewardsSteps,
    };

_$_Media _$$_MediaFromJson(Map<String, dynamic> json) => _$_Media(
      title: json['title'] as String? ?? '',
      mediaText: json['mediaText'] as String? ?? '',
    );

Map<String, dynamic> _$$_MediaToJson(_$_Media instance) => <String, dynamic>{
      'title': instance.title,
      'mediaText': instance.mediaText,
    };
