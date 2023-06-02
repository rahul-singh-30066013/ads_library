// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_booking_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateBookingRequestModel _$$_CreateBookingRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_CreateBookingRequestModel(
      cartId: json['cartId'] as String? ?? '0',
      bookingStatusId: json['BookingStatus'] as String? ?? '0',
      bookedOn: json['bookedOn'] as String? ?? '0',
      isGSTEnable: json['IsGSTEnable'] as bool? ?? false,
      travellers: (json['travelers'] as List<dynamic>?)
              ?.map((e) => TravellersModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      placardInfo: json['placardInfo'] == null
          ? null
          : PlacardInfo.fromJson(json['placardInfo'] as Map<String, dynamic>),
      billingInfo: json['billingInfo'] == null
          ? null
          : BillingInfo.fromJson(json['billingInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CreateBookingRequestModelToJson(
        _$_CreateBookingRequestModel instance) =>
    <String, dynamic>{
      'cartId': instance.cartId,
      'BookingStatus': instance.bookingStatusId,
      'bookedOn': instance.bookedOn,
      'IsGSTEnable': instance.isGSTEnable,
      'travelers': instance.travellers.map((e) => e.toJson()).toList(),
      'placardInfo': instance.placardInfo?.toJson(),
      'billingInfo': instance.billingInfo?.toJson(),
    };
