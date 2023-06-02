// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pranaam_dashboard_site_core_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PranaamDashboardSiteCoreResponse
    _$$_PranaamDashboardSiteCoreResponseFromJson(Map<String, dynamic> json) =>
        _$_PranaamDashboardSiteCoreResponse(
          name: json['name'] as String? ?? '',
          path: json['path'] as String? ?? '',
          elements: (json['elements'] as List<dynamic>?)
                  ?.map((e) => Element.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
        );

Map<String, dynamic> _$$_PranaamDashboardSiteCoreResponseToJson(
        _$_PranaamDashboardSiteCoreResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
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
          ? const Fields()
          : Fields.fromJson(json['fields'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ElementToJson(_$_Element instance) =>
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
    );

Map<String, dynamic> _$$_FieldsToJson(_$_Fields instance) => <String, dynamic>{
      'widget': instance.widget,
      'title': instance.title,
      'list': instance.list,
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
      btnText: json['btnText'] as String? ?? '',
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
      carouselParam: json['carouselParam'] == null
          ? const CarouselParam()
          : CarouselParam.fromJson(
              json['carouselParam'] as Map<String, dynamic>),
      widgetItems: (json['widgetItems'] as List<dynamic>?)
              ?.map((e) => WidgetItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      widgetItem: json['widgetItem'] == null
          ? const WidgetItem()
          : WidgetItem.fromJson(json['widgetItem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DashboardItemToJson(_$_DashboardItem instance) =>
    <String, dynamic>{
      'widgetId': instance.widgetId,
      'widgetType': instance.widgetType,
      'title': instance.title,
      'btnText': instance.btnText,
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
      'widgetItem': instance.widgetItem,
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
      uniqueId: json['uniqueId'] as String? ?? '',
      btnText: json['btnText'] as String? ?? '',
      appbtnText: json['appbtnText'] as String? ?? '',
      appbtnUrl: json['appbtnUrl'] as String? ?? '',
      imageSrc: json['imageSrc'] as String? ?? '',
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
      imgSrc: json['imgSrc'] as String? ?? '',
      alt: json['alt'] as String? ?? '',
      value: json['value'] as String? ?? '',
      text: json['text'] as String? ?? '',
      src: json['src'] as String? ?? '',
      btn: json['btn'] as String? ?? '',
      btnUrl: json['btnUrl'] as String? ?? '',
      carousalItems: json['carousalItems'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      appDesc: (json['appDesc'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      btnTitle: json['btnTitle'] as String? ?? '',
      price: json['price'] as String? ?? '',
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      urlMp4: json['urlMp4'] as String? ?? '',
      urlOgg: json['urlOgg'] as String? ?? '',
      mobileImage: json['mobileImage'] as String? ?? '',
      posterImage: json['posterImage'] as String? ?? '',
      contactDetail: json['contactDetail'] == null
          ? null
          : ContactDetail.fromJson(
              json['contactDetail'] as Map<String, dynamic>),
      pranaamPackage: json['pranaamPackage'] == null
          ? const PranaamPackage()
          : PranaamPackage.fromJson(
              json['pranaamPackage'] as Map<String, dynamic>),
      tabContent: (json['tabContent'] as List<dynamic>?)
              ?.map((e) => TabContentItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_WidgetItemToJson(_$_WidgetItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'uniqueId': instance.uniqueId,
      'btnText': instance.btnText,
      'appbtnText': instance.appbtnText,
      'appbtnUrl': instance.appbtnUrl,
      'imageSrc': instance.imageSrc,
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
      'imgSrc': instance.imgSrc,
      'alt': instance.alt,
      'value': instance.value,
      'text': instance.text,
      'src': instance.src,
      'btn': instance.btn,
      'btnUrl': instance.btnUrl,
      'carousalItems': instance.carousalItems,
      'items': instance.items,
      'appDesc': instance.appDesc,
      'btnTitle': instance.btnTitle,
      'price': instance.price,
      'options': instance.options,
      'urlMp4': instance.urlMp4,
      'urlOgg': instance.urlOgg,
      'mobileImage': instance.mobileImage,
      'posterImage': instance.posterImage,
      'contactDetail': instance.contactDetail,
      'pranaamPackage': instance.pranaamPackage,
      'tabContent': instance.tabContent,
    };

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      id: json['id'] as String? ?? '',
      src: json['src'] as String? ?? '',
      alt: json['alt'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      initialPrice: json['initialPrice'] as String? ?? '',
      finalPrice: json['finalPrice'] as String? ?? '0',
      btnText: json['btnText'] as String? ?? '',
      btnUrl: json['btnUrl'] as String? ?? '',
      btnVariant: json['btnVariant'] as String? ?? '',
      desktopImage: json['desktopImage'] as String? ?? '',
      desktopImageAlt: json['desktopImageAlt'] as String? ?? '',
      mobileImage: json['mobileImage'] as String? ?? '',
      mobileImageAlt: json['mobileImageAlt'] as String? ?? '',
      thumbnailImage: json['thumbnailImage'] as String? ?? '',
      thumbnailImageAlt: json['thumbnailImageAlt'] as String? ?? '',
      imageSrc: json['imageSrc'] as String? ?? '',
      ctaLink: json['ctaLink'] as String? ?? '',
      deepLink: json['deepLink'] as String? ?? '',
      subTitle: json['subTitle'] as String? ?? '',
      materialGroup: json['materialGroup'] as String? ?? '',
      category: json['category'] as String? ?? '',
      subCategory: json['subCategory'] as String? ?? '',
      brand: json['brand'] as String? ?? '',
      storeType: json['storeType'] as String? ?? '',
      appCtaLink: json['appCtaLink'] as String? ?? '',
      cardDesc: json['cardDesc'] as String? ?? '',
      restricted: json['restricted'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'id': instance.id,
      'src': instance.src,
      'alt': instance.alt,
      'title': instance.title,
      'description': instance.description,
      'initialPrice': instance.initialPrice,
      'finalPrice': instance.finalPrice,
      'btnText': instance.btnText,
      'btnUrl': instance.btnUrl,
      'btnVariant': instance.btnVariant,
      'desktopImage': instance.desktopImage,
      'desktopImageAlt': instance.desktopImageAlt,
      'mobileImage': instance.mobileImage,
      'mobileImageAlt': instance.mobileImageAlt,
      'thumbnailImage': instance.thumbnailImage,
      'thumbnailImageAlt': instance.thumbnailImageAlt,
      'imageSrc': instance.imageSrc,
      'ctaLink': instance.ctaLink,
      'deepLink': instance.deepLink,
      'subTitle': instance.subTitle,
      'materialGroup': instance.materialGroup,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'brand': instance.brand,
      'storeType': instance.storeType,
      'appCtaLink': instance.appCtaLink,
      'cardDesc': instance.cardDesc,
      'restricted': instance.restricted,
    };

_$_Option _$$_OptionFromJson(Map<String, dynamic> json) => _$_Option(
      title: json['title'] as String? ?? '',
      imgSrc: json['imgSrc'] as String? ?? '',
      alt: json['alt'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$_OptionToJson(_$_Option instance) => <String, dynamic>{
      'title': instance.title,
      'imgSrc': instance.imgSrc,
      'alt': instance.alt,
      'description': instance.description,
    };

_$_Params _$$_ParamsFromJson(Map<String, dynamic> json) => _$_Params(
      widget: json['widget'] as String? ?? '',
    );

Map<String, dynamic> _$$_ParamsToJson(_$_Params instance) => <String, dynamic>{
      'widget': instance.widget,
    };

_$_CarouselParam _$$_CarouselParamFromJson(Map<String, dynamic> json) =>
    _$_CarouselParam(
      enableInfiniteScroll: json['enableInfiniteScroll'] as String? ?? '',
      enlargeCenterPage: json['enlargeCenterPage'] as String? ?? '',
      autoPlay: json['autoPlay'] as String? ?? '',
      viewportFraction: json['viewportFraction'] as String? ?? '',
    );

Map<String, dynamic> _$$_CarouselParamToJson(_$_CarouselParam instance) =>
    <String, dynamic>{
      'enableInfiniteScroll': instance.enableInfiniteScroll,
      'enlargeCenterPage': instance.enlargeCenterPage,
      'autoPlay': instance.autoPlay,
      'viewportFraction': instance.viewportFraction,
    };

_$_PranaamPackage _$$_PranaamPackageFromJson(Map<String, dynamic> json) =>
    _$_PranaamPackage(
      title: json['title'] as String? ?? '',
      cards: json['cards'] == null
          ? const Cards()
          : Cards.fromJson(json['cards'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PranaamPackageToJson(_$_PranaamPackage instance) =>
    <String, dynamic>{
      'title': instance.title,
      'cards': instance.cards,
    };

_$_TabContent _$$_TabContentFromJson(Map<String, dynamic> json) =>
    _$_TabContent(
      tabContentItems: (json['tabContentItems'] as List<dynamic>?)
              ?.map((e) => TabContentItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TabContentToJson(_$_TabContent instance) =>
    <String, dynamic>{
      'tabContentItems': instance.tabContentItems,
    };

_$_TabContentItem _$$_TabContentItemFromJson(Map<String, dynamic> json) =>
    _$_TabContentItem(
      title: json['title'] as String? ?? '',
      cards: (json['cards'] as List<dynamic>?)
              ?.map((e) => CardsItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TabContentItemToJson(_$_TabContentItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'cards': instance.cards,
    };

_$_Cards _$$_CardsFromJson(Map<String, dynamic> json) => _$_Cards(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => CardsItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CardsToJson(_$_Cards instance) => <String, dynamic>{
      'items': instance.items,
    };

_$_CardsItem _$$_CardsItemFromJson(Map<String, dynamic> json) => _$_CardsItem(
      id: json['id'] as String? ?? '',
      src: json['src'] as String? ?? '',
      alt: json['alt'] as String? ?? '',
      title: json['title'] as String? ?? '',
      desc: json['desc'] as String? ?? '',
      value: json['value'] as String? ?? '',
      cardDesc: json['cardDesc'] as String? ?? '',
      finalPrice: json['finalPrice'] as String? ?? '',
      btnText: json['btnText'] as String? ?? '',
      btnUrl: json['btnUrl'] as String? ?? '',
      btnVariant: json['btnVariant'] as String? ?? '',
      mobileImage: json['mobileImage'] as String? ?? '',
      mobileImageAlt: json['mobileImageAlt'] as String? ?? '',
      webImage: json['webImage'] as String? ?? '',
      webImageAlt: json['webImageAlt'] as String? ?? '',
      thumbnailImage: json['thumbnailImage'] as String? ?? '',
      thumbnailImageAlt: json['thumbnailImageAlt'] as String? ?? '',
      isRecommended: json['isRecommended'] as bool? ?? false,
    );

Map<String, dynamic> _$$_CardsItemToJson(_$_CardsItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'src': instance.src,
      'alt': instance.alt,
      'title': instance.title,
      'desc': instance.desc,
      'value': instance.value,
      'cardDesc': instance.cardDesc,
      'finalPrice': instance.finalPrice,
      'btnText': instance.btnText,
      'btnUrl': instance.btnUrl,
      'btnVariant': instance.btnVariant,
      'mobileImage': instance.mobileImage,
      'mobileImageAlt': instance.mobileImageAlt,
      'webImage': instance.webImage,
      'webImageAlt': instance.webImageAlt,
      'thumbnailImage': instance.thumbnailImage,
      'thumbnailImageAlt': instance.thumbnailImageAlt,
      'isRecommended': instance.isRecommended,
    };
