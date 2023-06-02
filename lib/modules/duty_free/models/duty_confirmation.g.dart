// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_confirmation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DutyConfirmation _$DutyConfirmationFromJson(Map<String, dynamic> json) =>
    DutyConfirmation(
      orderList: (json['order_list'] as List<dynamic>?)
          ?.map((e) => OrderList.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookingConfirmation: json['booking_confirmation_item'] == null
          ? null
          : BookingConfirmation.fromJson(
              json['booking_confirmation_item'] as Map<String, dynamic>),
      recommendedList: (json['recommended_list'] as List<dynamic>?)
          ?.map((e) => RecommendedList.fromJson(e as Map<String, dynamic>))
          .toList(),
      offerBanner: json['offer_banner'] == null
          ? null
          : OfferBanner.fromJson(json['offer_banner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DutyConfirmationToJson(DutyConfirmation instance) =>
    <String, dynamic>{
      'order_list': instance.orderList,
      'recommended_list': instance.recommendedList,
      'booking_confirmation_item': instance.bookingConfirmation,
      'offer_banner': instance.offerBanner,
    };

OfferBanner _$OfferBannerFromJson(Map<String, dynamic> json) => OfferBanner(
      offerTitle: json['offerTitle'] as String?,
      offerDescription: json['offerDescription'] as String?,
      offerImage: json['offerImage'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$OfferBannerToJson(OfferBanner instance) =>
    <String, dynamic>{
      'offerTitle': instance.offerTitle,
      'offerDescription': instance.offerDescription,
      'offerImage': instance.offerImage,
      'email': instance.email,
    };

OrderList _$OrderListFromJson(Map<String, dynamic> json) => OrderList(
      title: json['title'] as String?,
      actualPrice: json['actualPrice'] as String?,
      discountedPrice: json['discountedPrice'] as String?,
    );

Map<String, dynamic> _$OrderListToJson(OrderList instance) => <String, dynamic>{
      'title': instance.title,
      'actualPrice': instance.actualPrice,
      'discountedPrice': instance.discountedPrice,
    };

BookingConfirmation _$BookingConfirmationFromJson(Map<String, dynamic> json) =>
    BookingConfirmation(
      orderID: json['orderID'] as String?,
      dutyFreeName: json['dutyFreeName'] as String?,
      collectionPoint: json['collectionPoint'] as String?,
      paymentDetail: json['paymentDetail'] as String?,
    );

Map<String, dynamic> _$BookingConfirmationToJson(
        BookingConfirmation instance) =>
    <String, dynamic>{
      'orderID': instance.orderID,
      'dutyFreeName': instance.dutyFreeName,
      'collectionPoint': instance.collectionPoint,
      'paymentDetail': instance.paymentDetail,
    };

RecommendedList _$RecommendedListFromJson(Map<String, dynamic> json) =>
    RecommendedList(
      title: json['title'] as String?,
      actualPrice: json['actualPrice'] as String?,
      discountedPrice: json['discountedPrice'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$RecommendedListToJson(RecommendedList instance) =>
    <String, dynamic>{
      'title': instance.title,
      'actualPrice': instance.actualPrice,
      'discountedPrice': instance.discountedPrice,
      'image': instance.image,
    };
