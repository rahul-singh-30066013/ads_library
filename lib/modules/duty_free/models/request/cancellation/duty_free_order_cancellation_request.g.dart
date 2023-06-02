// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_free_order_cancellation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DutyFreeOrderCancellationRequest
    _$$_DutyFreeOrderCancellationRequestFromJson(Map<String, dynamic> json) =>
        _$_DutyFreeOrderCancellationRequest(
          reason: json['reason'] as String? ?? '',
          orderReferenceId: json['orderReferenceId'] as String? ?? '',
        );

Map<String, dynamic> _$$_DutyFreeOrderCancellationRequestToJson(
        _$_DutyFreeOrderCancellationRequest instance) =>
    <String, dynamic>{
      'reason': instance.reason,
      'orderReferenceId': instance.orderReferenceId,
    };
