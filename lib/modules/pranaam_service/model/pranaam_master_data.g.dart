// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pranaam_master_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PranaamMasterData _$$_PranaamMasterDataFromJson(Map<String, dynamic> json) =>
    _$_PranaamMasterData(
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

Map<String, dynamic> _$$_PranaamMasterDataToJson(
        _$_PranaamMasterData instance) =>
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
              ?.map((e) => BookingStatus.fromJson(e as Map<String, dynamic>))
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
      isTransit: json['isTransit'] as String? ?? '',
    );

Map<String, dynamic> _$$_BookingStatusToJson(_$_BookingStatus instance) =>
    <String, dynamic>{
      'label': instance.label,
      'order': instance.order,
      'id': instance.id,
      'isTransit': instance.isTransit,
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
      isAdult: json['isAdult'] as String? ?? '',
      isChild: json['isChild'] as String? ?? '',
      isInfant: json['isInfant'] as String? ?? '',
    );

Map<String, dynamic> _$$_SalutationToJson(_$_Salutation instance) =>
    <String, dynamic>{
      'label': instance.label,
      'order': instance.order,
      'id': instance.id,
      'isAdult': instance.isAdult,
      'isChild': instance.isChild,
      'isInfant': instance.isInfant,
    };

_$_State _$$_StateFromJson(Map<String, dynamic> json) => _$_State(
      id: json['id'] as String? ?? '',
      stateImport: json['stateImport'] as String? ?? '',
      name: json['name'] as String? ?? '',
      countryMaster: json['countryMaster'] as String? ?? '',
      countryCode: json['countryCode'] as String? ?? '',
      stateCode: json['stateCode'] as String? ?? '',
      latitude: json['latitude'] as String? ?? '',
      longitude: json['longitude'] as String? ?? '',
    );

Map<String, dynamic> _$$_StateToJson(_$_State instance) => <String, dynamic>{
      'id': instance.id,
      'stateImport': instance.stateImport,
      'name': instance.name,
      'countryMaster': instance.countryMaster,
      'countryCode': instance.countryCode,
      'stateCode': instance.stateCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$_Params _$$_ParamsFromJson(Map<String, dynamic> json) => _$_Params();

Map<String, dynamic> _$$_ParamsToJson(_$_Params instance) =>
    <String, dynamic>{};
