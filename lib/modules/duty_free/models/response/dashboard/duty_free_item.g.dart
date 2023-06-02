// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeItem _$$_DutyFreeItemFromJson(Map<String, dynamic> json) =>
    _$_DutyFreeItem(
      uniqueId: json['uniqueId'] as String? ?? '',
      tagName: json['tagName'] == null
          ? null
          : TagName.fromJson(json['tagName'] as Map<String, dynamic>),
      contactDetail: json['contactDetail'] == null
          ? null
          : ContactDetail.fromJson(
              json['contactDetail'] as Map<String, dynamic>),
      imageSrc: json['imageSrc'] as String? ?? '',
      mobileImage: json['mobileImage'] as String? ?? '',
      mobileImagesrc: json['mobileImagesrc'] as String? ?? '',
      videoSrc: json['videoSrc'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      webDescription: (json['webDescription'] as List<dynamic>?)
          ?.map((e) => RepublicRewardTAndC.fromJson(e as Map<String, dynamic>))
          .toList(),
      ctaLink: json['ctaLink'] as String? ?? '',
      ctaUrl: json['ctaUrl'] as String? ?? '',
      subTitle: json['subTitle'] as String? ?? '',
      filterName: json['filterName'] as String? ?? '',
      filterLink: json['filterLink'] as String? ?? '',
      materialGroup: json['materialGroup'] as String? ?? '',
      category: json['category'] as String? ?? '',
      subCategory: json['subCategory'] as String? ?? '',
      brand: json['brand'] as String? ?? '',
      popular: json['popular'] as bool? ?? false,
      newArrival: json['newArrival'] as bool? ?? false,
      showOnHomepage: json['showOnHomepage'] as bool? ?? false,
      cdnPath: json['cdnPath'] as String? ?? '',
      code: json['code'] as String? ?? '',
      deepLink: json['deepLink'] as String? ?? '',
      apiUrl: json['apiUrl'] as String? ?? '',
      storeType: json['storeType'] as String? ?? '',
      restricted: json['restricted'] as bool? ?? false,
      sortorder: json['sortorder'] as int? ?? 0,
      widgetType: json['widgetType'] as String? ?? '',
      skuCode: json['skuCode'] as String? ?? '',
      isAirportSelectNeeded: json['isAirportSelectNeeded'] as bool? ?? false,
      disableForAirport: json['disableForAirport'] as bool? ?? false,
      enableCircle: json['enableCircle'] as bool? ?? true,
      promoCode: json['promoCode'] as String? ?? '',
      exclusive: json['exclusive'] as bool? ?? false,
    );

Map<String, dynamic> _$$_DutyFreeItemToJson(_$_DutyFreeItem instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'tagName': instance.tagName,
      'contactDetail': instance.contactDetail,
      'imageSrc': instance.imageSrc,
      'mobileImage': instance.mobileImage,
      'mobileImagesrc': instance.mobileImagesrc,
      'videoSrc': instance.videoSrc,
      'title': instance.title,
      'description': instance.description,
      'webDescription': instance.webDescription,
      'ctaLink': instance.ctaLink,
      'ctaUrl': instance.ctaUrl,
      'subTitle': instance.subTitle,
      'filterName': instance.filterName,
      'filterLink': instance.filterLink,
      'materialGroup': instance.materialGroup,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'brand': instance.brand,
      'popular': instance.popular,
      'newArrival': instance.newArrival,
      'showOnHomepage': instance.showOnHomepage,
      'cdnPath': instance.cdnPath,
      'code': instance.code,
      'deepLink': instance.deepLink,
      'apiUrl': instance.apiUrl,
      'storeType': instance.storeType,
      'restricted': instance.restricted,
      'sortorder': instance.sortorder,
      'widgetType': instance.widgetType,
      'skuCode': instance.skuCode,
      'isAirportSelectNeeded': instance.isAirportSelectNeeded,
      'disableForAirport': instance.disableForAirport,
      'enableCircle': instance.enableCircle,
      'promoCode': instance.promoCode,
      'exclusive': instance.exclusive,
    };

_$_TagName _$$_TagNameFromJson(Map<String, dynamic> json) => _$_TagName(
      json['name'] as String?,
      json['backgroundColor'] as String?,
      json['textColor'] as String?,
    );

Map<String, dynamic> _$$_TagNameToJson(_$_TagName instance) =>
    <String, dynamic>{
      'name': instance.name,
      'backgroundColor': instance.backgroundColor,
      'textColor': instance.textColor,
    };

_$_RepublicRewardTAndC _$$_RepublicRewardTAndCFromJson(
        Map<String, dynamic> json) =>
    _$_RepublicRewardTAndC(
      json['list'] as String?,
    );

Map<String, dynamic> _$$_RepublicRewardTAndCToJson(
        _$_RepublicRewardTAndC instance) =>
    <String, dynamic>{
      'list': instance.list,
    };

_$_ContactDetail _$$_ContactDetailFromJson(Map<String, dynamic> json) =>
    _$_ContactDetail(
      json['phone'] == null
          ? null
          : ContactAttributes.fromJson(json['phone'] as Map<String, dynamic>),
      json['email'] == null
          ? null
          : ContactAttributes.fromJson(json['email'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ContactDetailToJson(_$_ContactDetail instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
    };

_$_ContactAttributes _$$_ContactAttributesFromJson(Map<String, dynamic> json) =>
    _$_ContactAttributes(
      json['name'] as String?,
      json['title'] as String?,
      json['richText'] as String?,
    );

Map<String, dynamic> _$$_ContactAttributesToJson(
        _$_ContactAttributes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'richText': instance.richText,
    };
