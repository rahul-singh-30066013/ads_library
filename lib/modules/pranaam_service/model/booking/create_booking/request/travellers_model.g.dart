// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travellers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TravellersModel _$$_TravellersModelFromJson(Map<String, dynamic> json) =>
    _$_TravellersModel(
      personName: json['personName'] == null
          ? const PersonNameModel()
          : PersonNameModel.fromJson(
              json['personName'] as Map<String, dynamic>),
      countryDetails: json['country'] == null
          ? const CountryModel()
          : CountryModel.fromJson(json['country'] as Map<String, dynamic>),
      travellersAge: json['age'] as int? ?? 0,
      passengerTypeId: json['passengerTypeID'] as int? ?? 0,
      passportNumber: json['passportNumber'] as String?,
      passengerStatus: json['passengerStatus'] as String?,
      passengerTypeName: json['passengerTypeName'] as String?,
      passengerTypeCode: json['passengerTypeCode'] as String?,
      spocPhone: json['spocPhone'] as String? ?? '',
      flyingClassId: json['flyingClassId'] as int?,
      flyingClass: json['flyingClass'] as String?,
      flyingClassName: json['flyingClassName'] as String?,
      passengerId: json['passengerId'] as int? ?? 0,
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$$_TravellersModelToJson(_$_TravellersModel instance) =>
    <String, dynamic>{
      'personName': instance.personName.toJson(),
      'country': instance.countryDetails.toJson(),
      'age': instance.travellersAge,
      'passengerTypeID': instance.passengerTypeId,
      'passportNumber': instance.passportNumber,
      'passengerStatus': instance.passengerStatus,
      'passengerTypeName': instance.passengerTypeName,
      'passengerTypeCode': instance.passengerTypeCode,
      'spocPhone': instance.spocPhone,
      'flyingClassId': instance.flyingClassId,
      'flyingClass': instance.flyingClass,
      'flyingClassName': instance.flyingClassName,
      'passengerId': instance.passengerId,
      'email': instance.email,
    };
