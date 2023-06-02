// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FlightStatusModel _$$_FlightStatusModelFromJson(Map<String, dynamic> json) =>
    _$_FlightStatusModel(
      flightsegment: (json['flightsegment'] as List<dynamic>?)
              ?.map((e) =>
                  FlightStatusSegment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_FlightStatusModelToJson(
        _$_FlightStatusModel instance) =>
    <String, dynamic>{
      'flightsegment': instance.flightsegment,
    };

_$_FlightStatusSegment _$$_FlightStatusSegmentFromJson(
        Map<String, dynamic> json) =>
    _$_FlightStatusSegment(
      iatalocalairport: json['iatalocalairport'] as String? ?? '',
      iatalocalairportcode: json['iatalocalairportcode'] as String? ?? '',
      iataroute: json['iataroute'] as String? ?? '',
      iataroutecode: json['iataroutecode'] as String? ?? '',
      estimatedtime: json['estimatedtime'] as String? ?? '',
      actualtime: json['actualtime'] as String? ?? '',
      airlinecode: json['airlinecode'] as String? ?? '',
      flightnumber: json['flightnumber'] as String? ?? '',
      terminal: json['terminal'] as String? ?? '',
      aircrafttype: json['aircrafttype'] as String? ?? '',
      flighttype: json['flighttype'] as String? ?? '',
      status: json['status'] as String? ?? '',
      remarkes: json['remarkes'] as String? ?? '',
      flightkind: json['flightkind'] as String? ?? '',
      scheduletime: json['scheduletime'] as String? ?? '',
      estimateddate: json['estimateddate'] as String? ?? '',
      actualdate: json['actualdate'] as String? ?? '',
      scheduledate: json['scheduledate'] as String? ?? '',
      cardId: json['cardId'] as String? ?? '',
      stands: (json['stands'] as List<dynamic>?)
              ?.map((e) => Carousel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      gates: (json['gates'] as List<dynamic>?)
              ?.map((e) => Carousel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      carousel: (json['carousel'] as List<dynamic>?)
              ?.map((e) => Carousel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      checkInCounter: (json['checkInCounter'] as List<dynamic>?)
              ?.map((e) => Carousel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      codeShare: (json['codeShare'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isFlightAdded: json['isFlightAdded'] as bool? ?? false,
      isFlightAdding: json['isFlightAdding'] as bool? ?? false,
    );

Map<String, dynamic> _$$_FlightStatusSegmentToJson(
        _$_FlightStatusSegment instance) =>
    <String, dynamic>{
      'iatalocalairport': instance.iatalocalairport,
      'iatalocalairportcode': instance.iatalocalairportcode,
      'iataroute': instance.iataroute,
      'iataroutecode': instance.iataroutecode,
      'estimatedtime': instance.estimatedtime,
      'actualtime': instance.actualtime,
      'airlinecode': instance.airlinecode,
      'flightnumber': instance.flightnumber,
      'terminal': instance.terminal,
      'aircrafttype': instance.aircrafttype,
      'flighttype': instance.flighttype,
      'status': instance.status,
      'remarkes': instance.remarkes,
      'flightkind': instance.flightkind,
      'scheduletime': instance.scheduletime,
      'estimateddate': instance.estimateddate,
      'actualdate': instance.actualdate,
      'scheduledate': instance.scheduledate,
      'cardId': instance.cardId,
      'stands': instance.stands,
      'gates': instance.gates,
      'carousel': instance.carousel,
      'checkInCounter': instance.checkInCounter,
      'codeShare': instance.codeShare,
      'isFlightAdded': instance.isFlightAdded,
      'isFlightAdding': instance.isFlightAdding,
    };

_$_Carousel _$$_CarouselFromJson(Map<String, dynamic> json) => _$_Carousel(
      fromtime: json['fromtime'] as String? ?? '',
      totime: json['totime'] as String? ?? '',
      carousel: json['carousel'] as String? ?? '',
      sequence: json['sequence'] as int? ?? 0,
      gate: json['gate'] as String? ?? '',
      stand: json['stand'] as String? ?? '',
      checkincounter: json['checkincounter'] as String? ?? '',
    );

Map<String, dynamic> _$$_CarouselToJson(_$_Carousel instance) =>
    <String, dynamic>{
      'fromtime': instance.fromtime,
      'totime': instance.totime,
      'carousel': instance.carousel,
      'sequence': instance.sequence,
      'gate': instance.gate,
      'stand': instance.stand,
      'checkincounter': instance.checkincounter,
    };
