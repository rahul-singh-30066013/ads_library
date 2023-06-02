// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_feedback_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerFeedbackResponse _$$_CustomerFeedbackResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerFeedbackResponse(
      incidentDetail: json['incidentDetail'] == null
          ? null
          : IncidentDetail.fromJson(
              json['incidentDetail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CustomerFeedbackResponseToJson(
        _$_CustomerFeedbackResponse instance) =>
    <String, dynamic>{
      'incidentDetail': instance.incidentDetail,
    };

_$_IncidentDetail _$$_IncidentDetailFromJson(Map<String, dynamic> json) =>
    _$_IncidentDetail(
      incidentId: json['incidentId'] as String? ?? '',
    );

Map<String, dynamic> _$$_IncidentDetailToJson(_$_IncidentDetail instance) =>
    <String, dynamic>{
      'incidentId': instance.incidentId,
    };
