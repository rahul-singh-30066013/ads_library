// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination_address_details_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DestinationAddressDetailsLocationModel
    _$$_DestinationAddressDetailsLocationModelFromJson(
            Map<String, dynamic> json) =>
        _$_DestinationAddressDetailsLocationModel(
          result: json['result'] == null
              ? null
              : AddressDetailModel.fromJson(
                  json['result'] as Map<String, dynamic>),
          results: (json['results'] as List<dynamic>?)
              ?.map(
                  (e) => AddressDetailModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          status: json['status'] as String?,
        );

Map<String, dynamic> _$$_DestinationAddressDetailsLocationModelToJson(
        _$_DestinationAddressDetailsLocationModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'results': instance.results,
      'status': instance.status,
    };

_$_AddressDetailModel _$$_AddressDetailModelFromJson(
        Map<String, dynamic> json) =>
    _$_AddressDetailModel(
      formattedAddress: json['formattedAddress'] as String?,
      geometry: json['geometry'] == null
          ? null
          : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      name: json['name'] as String?,
      placeId: json['placeId'] as String?,
      addressComponents: (json['address_components'] as List<dynamic>?)
          ?.map((e) => AddressComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      postcodeLocalities: (json['postcode_localities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_AddressDetailModelToJson(
        _$_AddressDetailModel instance) =>
    <String, dynamic>{
      'formattedAddress': instance.formattedAddress,
      'geometry': instance.geometry,
      'name': instance.name,
      'placeId': instance.placeId,
      'address_components': instance.addressComponents,
      'postcode_localities': instance.postcodeLocalities,
    };

_$_AddressComponent _$$_AddressComponentFromJson(Map<String, dynamic> json) =>
    _$_AddressComponent(
      longName: json['long_name'] as String?,
      shortName: json['short_name'] as String?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    );

Map<String, dynamic> _$$_AddressComponentToJson(_$_AddressComponent instance) =>
    <String, dynamic>{
      'long_name': instance.longName,
      'short_name': instance.shortName,
      'types': instance.types,
    };
