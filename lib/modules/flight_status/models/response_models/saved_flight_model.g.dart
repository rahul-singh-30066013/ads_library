// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_flight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SavedFlightModel _$$_SavedFlightModelFromJson(Map<String, dynamic> json) =>
    _$_SavedFlightModel(
      totalRecords: json['totalRecords'] as int? ?? 0,
      totalPages: json['totalPages'] as int? ?? 0,
      pageSize: json['pageSize'] as int? ?? 0,
      promoId: json['promoId'] as int? ?? 0,
      flights: (json['flights'] as List<dynamic>?)
              ?.map((e) =>
                  SavedFlightListData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_SavedFlightModelToJson(_$_SavedFlightModel instance) =>
    <String, dynamic>{
      'totalRecords': instance.totalRecords,
      'totalPages': instance.totalPages,
      'pageSize': instance.pageSize,
      'promoId': instance.promoId,
      'flights': instance.flights,
    };

_$_SavedFlightListData _$$_SavedFlightListDataFromJson(
        Map<String, dynamic> json) =>
    _$_SavedFlightListData(
      cardId: json['cardId'] as String? ?? '',
      airlineCode: json['airlineCode'] as String? ?? '',
      flightNo: json['flightNo'] as String? ?? '',
      flightName: json['flightName'] as String? ?? '',
      scheduledDate: json['scheduledDate'] as String? ?? '',
      scheduledTime: json['scheduledTime'] as String? ?? '',
      upcomingDate: json['upcomingDate'] as String? ?? '',
      origin: json['origin'] == null
          ? null
          : Origin.fromJson(json['origin'] as Map<String, dynamic>),
      destination: json['destination'] == null
          ? null
          : Destination.fromJson(json['destination'] as Map<String, dynamic>),
      terminal: json['terminal'] as String? ?? '',
      status: json['status'] as String? ?? '',
      remarkes: json['remarkes'] as String? ?? '',
      type: json['type'] as String? ?? '',
      baggageBelt: json['baggageBelt'] as String? ?? '',
      mobileNo: json['mobileNo'] as String? ?? '',
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$_SavedFlightListDataToJson(
        _$_SavedFlightListData instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'airlineCode': instance.airlineCode,
      'flightNo': instance.flightNo,
      'flightName': instance.flightName,
      'scheduledDate': instance.scheduledDate,
      'scheduledTime': instance.scheduledTime,
      'upcomingDate': instance.upcomingDate,
      'origin': instance.origin,
      'destination': instance.destination,
      'terminal': instance.terminal,
      'status': instance.status,
      'remarkes': instance.remarkes,
      'type': instance.type,
      'baggageBelt': instance.baggageBelt,
      'mobileNo': instance.mobileNo,
      'isSelected': instance.isSelected,
    };

_$_Origin _$$_OriginFromJson(Map<String, dynamic> json) => _$_Origin(
      name: json['name'] as String? ?? '',
      code: json['code'] as String? ?? '',
    );

Map<String, dynamic> _$$_OriginToJson(_$_Origin instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$_Destination _$$_DestinationFromJson(Map<String, dynamic> json) =>
    _$_Destination(
      name: json['name'] as String? ?? '',
      code: json['code'] as String? ?? '',
    );

Map<String, dynamic> _$$_DestinationToJson(_$_Destination instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };
