// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_core_masters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SiteCoreMasters _$$_SiteCoreMastersFromJson(Map<String, dynamic> json) =>
    _$_SiteCoreMasters(
      elements: (json['elements'] as List<dynamic>?)
              ?.map((e) => Element.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_SiteCoreMastersToJson(_$_SiteCoreMasters instance) =>
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
      country: (json['country'] as List<dynamic>?)
              ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nationality: (json['nationality'] as List<dynamic>?)
              ?.map((e) => Nationality.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      bookingStatus: (json['bookingStatus'] as List<dynamic>?)
              ?.map((e) => BookingStatus.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      flyingClass: (json['flyingClass'] as List<dynamic>?)
              ?.map((e) => BookingStatus.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      passengerType: (json['passengerType'] as List<dynamic>?)
              ?.map((e) => BookingStatus.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      serviceType: (json['serviceType'] as List<dynamic>?)
              ?.map((e) => BookingStatus.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      salutation: (json['salutation'] as List<dynamic>?)
              ?.map((e) => Salutation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      state: (json['state'] as List<dynamic>?)
              ?.map((e) => State.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      travelSector: (json['travelSector'] as List<dynamic>?)
              ?.map((e) => TravelSector.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_FieldsToJson(_$_Fields instance) => <String, dynamic>{
      'country': instance.country,
      'nationality': instance.nationality,
      'bookingStatus': instance.bookingStatus,
      'flyingClass': instance.flyingClass,
      'passengerType': instance.passengerType,
      'serviceType': instance.serviceType,
      'salutation': instance.salutation,
      'state': instance.state,
      'travelSector': instance.travelSector,
    };

_$_BookingStatus _$$_BookingStatusFromJson(Map<String, dynamic> json) =>
    _$_BookingStatus(
      label: json['label'] as String? ?? '',
      order: json['order'] as String? ?? '',
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$$_BookingStatusToJson(_$_BookingStatus instance) =>
    <String, dynamic>{
      'label': instance.label,
      'order': instance.order,
      'id': instance.id,
    };

_$_Country _$$_CountryFromJson(Map<String, dynamic> json) => _$_Country(
      countryName: json['countryName'] as String? ?? '',
      dialCode: json['dialCode'] as String? ?? '',
      isO3: json['isO3'] as String? ?? '',
      isO2: json['isO2'] as String? ?? '',
      currencyName: json['currencyName'] as String? ?? '',
      currencyCode: json['currencyCode'] as String? ?? '',
      untermEnglish: json['untermEnglish'] as String? ?? '',
      regionName: json['regionName'] as String? ?? '',
      capital: json['capital'] as String? ?? '',
      continent: json['continent'] as String? ?? '',
      tld: json['tld'] as String? ?? '',
      languages: json['languages'] as String? ?? '',
      isDeleted: json['isDeleted'] as bool? ?? false,
      id: json['id'] as String? ?? '',
      countryFlagImage: json['countryFlagImage'] as String? ?? '',
    );

Map<String, dynamic> _$$_CountryToJson(_$_Country instance) =>
    <String, dynamic>{
      'countryName': instance.countryName,
      'dialCode': instance.dialCode,
      'isO3': instance.isO3,
      'isO2': instance.isO2,
      'currencyName': instance.currencyName,
      'currencyCode': instance.currencyCode,
      'untermEnglish': instance.untermEnglish,
      'regionName': instance.regionName,
      'capital': instance.capital,
      'continent': instance.continent,
      'tld': instance.tld,
      'languages': instance.languages,
      'isDeleted': instance.isDeleted,
      'id': instance.id,
      'countryFlagImage': instance.countryFlagImage,
    };

_$_Nationality _$$_NationalityFromJson(Map<String, dynamic> json) =>
    _$_Nationality(
      countryName: json['countryName'] as String? ?? '',
      nationality: json['nationality'] as String? ?? '',
      countryFlagImage: json['countryFlagImage'] as String? ?? '',
    );

Map<String, dynamic> _$$_NationalityToJson(_$_Nationality instance) =>
    <String, dynamic>{
      'countryName': instance.countryName,
      'nationality': instance.nationality,
      'countryFlagImage': instance.countryFlagImage,
    };

_$_Salutation _$$_SalutationFromJson(Map<String, dynamic> json) =>
    _$_Salutation(
      label: json['label'] as String? ?? '',
      order: json['order'] as String? ?? '',
      id: json['id'] as String? ?? '',
      isAdult: json['is_Adult'] as String? ?? '',
      isChild: json['is_Child'] as String? ?? '',
      isInfant: json['is_Infant'] as String? ?? '',
    );

Map<String, dynamic> _$$_SalutationToJson(_$_Salutation instance) =>
    <String, dynamic>{
      'label': instance.label,
      'order': instance.order,
      'id': instance.id,
      'is_Adult': instance.isAdult,
      'is_Child': instance.isChild,
      'is_Infant': instance.isInfant,
    };

_$_State _$$_StateFromJson(Map<String, dynamic> json) => _$_State(
      id: json['id'] as String? ?? '',
      stateImport: json['import'] as String? ?? '',
      name: json['name'] as String? ?? '',
      countryMaster: json['country_Master'] as String? ?? '',
      countryCode: json['country_Code'] as String? ?? '',
      stateCode: json['state_Code'] as String? ?? '',
      tinCode: json['updated_State_Code'] as String? ?? '',
      latitude: json['latitude'] as String? ?? '',
      longitude: json['longitude'] as String? ?? '',
    );

Map<String, dynamic> _$$_StateToJson(_$_State instance) => <String, dynamic>{
      'id': instance.id,
      'import': instance.stateImport,
      'name': instance.name,
      'country_Master': instance.countryMaster,
      'country_Code': instance.countryCode,
      'state_Code': instance.stateCode,
      'updated_State_Code': instance.tinCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$_TravelSector _$$_TravelSectorFromJson(Map<String, dynamic> json) =>
    _$_TravelSector(
      label: json['label'] as String? ?? '',
      order: json['order'] as String? ?? '',
      id: json['id'] as String? ?? '',
      isTransit: json['is_Transit'] as String? ?? '',
    );

Map<String, dynamic> _$$_TravelSectorToJson(_$_TravelSector instance) =>
    <String, dynamic>{
      'label': instance.label,
      'order': instance.order,
      'id': instance.id,
      'is_Transit': instance.isTransit,
    };

_$_Params _$$_ParamsFromJson(Map<String, dynamic> json) => _$_Params();

Map<String, dynamic> _$$_ParamsToJson(_$_Params instance) =>
    <String, dynamic>{};
