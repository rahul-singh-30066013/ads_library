// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookingDetailsResponseModel _$$_BookingDetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_BookingDetailsResponseModel(
      createBooking:
          CreateBooking.fromJson(json['createBooking'] as Map<String, dynamic>),
      packageDeatil: json['packageDeatil'] == null
          ? const PackageDetail()
          : PackageDetail.fromJson(
              json['packageDeatil'] as Map<String, dynamic>),
      standAloneProductDetails: json['standAloneProductDetails'] == null
          ? const PackageDetail()
          : PackageDetail.fromJson(
              json['standAloneProductDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BookingDetailsResponseModelToJson(
        _$_BookingDetailsResponseModel instance) =>
    <String, dynamic>{
      'createBooking': instance.createBooking,
      'packageDeatil': instance.packageDeatil,
      'standAloneProductDetails': instance.standAloneProductDetails,
    };

_$_CreateBooking _$$_CreateBookingFromJson(Map<String, dynamic> json) =>
    _$_CreateBooking(
      userId: json['userId'] as String? ?? '',
      orderId: json['orderId'] as String? ?? '',
      transactionId: json['transctionID'] as String? ?? '',
      travelSectorId: json['travelSectorId'] as int? ?? 0,
      serviceTypeId: json['serviceTypeId'] as int? ?? 0,
      bookedOn: json['bookedOn'] as String? ?? '',
      numberOfAdult: json['numberOfAdult'] as int? ?? 0,
      numberOfChild: json['numberOfChild'] as int? ?? 0,
      numberOfInfant: json['numberOfInfant'] as int? ?? 0,
      bookingStatusId: json['bookingStatusId'] as int? ?? 0,
      packageId: json['packageId'] as int? ?? 0,
      tripDetail:
          TripDetail.fromJson(json['tripDetail'] as Map<String, dynamic>),
      roundTripDetail: json['roundTripDetail'] == null
          ? const TripDetail()
          : TripDetail.fromJson(
              json['roundTripDetail'] as Map<String, dynamic>),
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0,
      travelers: (json['travelers'] as List<dynamic>?)
              ?.map((e) => TravellersModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      overallStatus: json['overallStatus'] == null
          ? null
          : OverallStatus.fromJson(
              json['overallStatus'] as Map<String, dynamic>),
      isPartialCancel: json['isPartialCancell'] as bool? ?? false,
      isUpgradeAvailable: json['isUpgradeAvailable'] as bool? ?? false,
      isGroupPackage: json['isGroupPackage'] as bool? ?? false,
      placardInfo: json['placardInfo'] == null
          ? const PlacardInfo()
          : PlacardInfo.fromJson(json['placardInfo'] as Map<String, dynamic>),
      billingInfo: json['billingInfo'] == null
          ? const BillingInfo()
          : BillingInfo.fromJson(json['billingInfo'] as Map<String, dynamic>),
      addOnsList: (json['addOnsList'] as List<dynamic>?)
              ?.map((e) => AddOnsListModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      loyaltyPoint: json['loyaltyPoint'] == null
          ? const LoyaltyPoint()
          : LoyaltyPoint.fromJson(json['loyaltyPoint'] as Map<String, dynamic>),
      paymentDetails: (json['paymentDetails'] as List<dynamic>?)
              ?.map((e) => PaymentDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      refundDetails: (json['refundDetails'] as List<dynamic>?)
              ?.map((e) => PaymentDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      rescheduleDetail: json['rescheduleDetail'] == null
          ? const RescheduleDetail()
          : RescheduleDetail.fromJson(
              json['rescheduleDetail'] as Map<String, dynamic>),
      totalFare: json['totalFare'] == null
          ? const TotalFare()
          : TotalFare.fromJson(json['totalFare'] as Map<String, dynamic>),
      totalTax: json['totalTax'] == null
          ? const TotalFare()
          : TotalFare.fromJson(json['totalTax'] as Map<String, dynamic>),
      isFullfilled: json['isFullfilled'] as bool? ?? false,
      pranaamBookingType: json['pranaamBookingType'] as String? ?? '',
    );

Map<String, dynamic> _$$_CreateBookingToJson(_$_CreateBooking instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'orderId': instance.orderId,
      'transctionID': instance.transactionId,
      'travelSectorId': instance.travelSectorId,
      'serviceTypeId': instance.serviceTypeId,
      'bookedOn': instance.bookedOn,
      'numberOfAdult': instance.numberOfAdult,
      'numberOfChild': instance.numberOfChild,
      'numberOfInfant': instance.numberOfInfant,
      'bookingStatusId': instance.bookingStatusId,
      'packageId': instance.packageId,
      'tripDetail': instance.tripDetail,
      'roundTripDetail': instance.roundTripDetail,
      'totalPrice': instance.totalPrice,
      'travelers': instance.travelers,
      'overallStatus': instance.overallStatus,
      'isPartialCancell': instance.isPartialCancel,
      'isUpgradeAvailable': instance.isUpgradeAvailable,
      'isGroupPackage': instance.isGroupPackage,
      'placardInfo': instance.placardInfo,
      'billingInfo': instance.billingInfo,
      'addOnsList': instance.addOnsList,
      'loyaltyPoint': instance.loyaltyPoint,
      'paymentDetails': instance.paymentDetails,
      'refundDetails': instance.refundDetails,
      'rescheduleDetail': instance.rescheduleDetail,
      'totalFare': instance.totalFare,
      'totalTax': instance.totalTax,
      'isFullfilled': instance.isFullfilled,
      'pranaamBookingType': instance.pranaamBookingType,
    };

_$_RescheduleDetail _$$_RescheduleDetailFromJson(Map<String, dynamic> json) =>
    _$_RescheduleDetail(
      originalBookingId: json['originalBookingId'] as int? ?? 0,
      isReschedule: json['isReschedule'] as bool? ?? false,
      rescheduleAdultCharges:
          (json['rescheduleAdultCharges'] as num?)?.toDouble() ?? 0.0,
      rescheduleChildCharges:
          (json['rescheduleChildCharges'] as num?)?.toDouble() ?? 0.0,
      rescheduleInfantCharges:
          (json['rescheduleInfantCharges'] as num?)?.toDouble() ?? 0.0,
      rescheduleAdultChargesCgst:
          (json['rescheduleAdultChargesCGST'] as num?)?.toDouble() ?? 0.0,
      rescheduleChildChargesCgst:
          (json['rescheduleChildChargesCGST'] as num?)?.toDouble() ?? 0.0,
      rescheduleInfantChargesCgst:
          (json['rescheduleInfantChargesCGST'] as num?)?.toDouble() ?? 0.0,
      rescheduleAdultChargesSgst:
          (json['rescheduleAdultChargesSGST'] as num?)?.toDouble() ?? 0.0,
      rescheduleChildChargesSgst:
          (json['rescheduleChildChargesSGST'] as num?)?.toDouble() ?? 0.0,
      rescheduleInfantChargesSgst:
          (json['rescheduleInfantChargesSGST'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$_RescheduleDetailToJson(_$_RescheduleDetail instance) =>
    <String, dynamic>{
      'originalBookingId': instance.originalBookingId,
      'isReschedule': instance.isReschedule,
      'rescheduleAdultCharges': instance.rescheduleAdultCharges,
      'rescheduleChildCharges': instance.rescheduleChildCharges,
      'rescheduleInfantCharges': instance.rescheduleInfantCharges,
      'rescheduleAdultChargesCGST': instance.rescheduleAdultChargesCgst,
      'rescheduleChildChargesCGST': instance.rescheduleChildChargesCgst,
      'rescheduleInfantChargesCGST': instance.rescheduleInfantChargesCgst,
      'rescheduleAdultChargesSGST': instance.rescheduleAdultChargesSgst,
      'rescheduleChildChargesSGST': instance.rescheduleChildChargesSgst,
      'rescheduleInfantChargesSGST': instance.rescheduleInfantChargesSgst,
    };

_$_OverallStatus _$$_OverallStatusFromJson(Map<String, dynamic> json) =>
    _$_OverallStatus(
      (json['statusHistory'] as List<dynamic>)
          .map((e) => StatusHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OverallStatusToJson(_$_OverallStatus instance) =>
    <String, dynamic>{
      'statusHistory': instance.statusHistory,
    };

_$_TripStatus _$$_TripStatusFromJson(Map<String, dynamic> json) =>
    _$_TripStatus(
      statusHistory: (json['statusHistory'] as List<dynamic>?)
              ?.map((e) =>
                  TripStatusStatusHistory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TripStatusToJson(_$_TripStatus instance) =>
    <String, dynamic>{
      'statusHistory': instance.statusHistory,
    };

_$_TripStatusStatusHistory _$$_TripStatusStatusHistoryFromJson(
        Map<String, dynamic> json) =>
    _$_TripStatusStatusHistory(
      status: json['status'] as String? ?? '',
      orderStatus: json['orderStatus'] as String? ?? '',
      modifiedOn: json['modifiedOn'] as String? ?? '',
    );

Map<String, dynamic> _$$_TripStatusStatusHistoryToJson(
        _$_TripStatusStatusHistory instance) =>
    <String, dynamic>{
      'status': instance.status,
      'orderStatus': instance.orderStatus,
      'modifiedOn': instance.modifiedOn,
    };

_$_LoyaltyPoint _$$_LoyaltyPointFromJson(Map<String, dynamic> json) =>
    _$_LoyaltyPoint(
      loyaltyPointByTransactions: json['loyaltyPointByTransactions'] == null
          ? null
          : LoyaltyPointByTransactions.fromJson(
              json['loyaltyPointByTransactions'] as Map<String, dynamic>),
      pendingRewardPoints: json['pendingRewardPoints'] as int? ?? 0,
      earnedRewardPoints: json['earnedRewardPoints'] as int? ?? 0,
      burnedRewardPoints: json['burnedRewardPoints'] as int? ?? 0,
    );

Map<String, dynamic> _$$_LoyaltyPointToJson(_$_LoyaltyPoint instance) =>
    <String, dynamic>{
      'loyaltyPointByTransactions': instance.loyaltyPointByTransactions,
      'pendingRewardPoints': instance.pendingRewardPoints,
      'earnedRewardPoints': instance.earnedRewardPoints,
      'burnedRewardPoints': instance.burnedRewardPoints,
    };

_$_LoyaltyPointByTransactions _$$_LoyaltyPointByTransactionsFromJson(
        Map<String, dynamic> json) =>
    _$_LoyaltyPointByTransactions(
      lastpendingRewardPoints: json['lastpendingRewardPoints'] as int? ?? 0,
      earnedRewardPoints: json['earnedRewardPoints'] as int? ?? 0,
      lastburnedRewardPoints: json['lastburnedRewardPoints'] as int? ?? 0,
    );

Map<String, dynamic> _$$_LoyaltyPointByTransactionsToJson(
        _$_LoyaltyPointByTransactions instance) =>
    <String, dynamic>{
      'lastpendingRewardPoints': instance.lastpendingRewardPoints,
      'earnedRewardPoints': instance.earnedRewardPoints,
      'lastburnedRewardPoints': instance.lastburnedRewardPoints,
    };

_$_PaymentDetails _$$_PaymentDetailsFromJson(Map<String, dynamic> json) =>
    _$_PaymentDetails(
      transactionMode: json['transactionMode'] as String? ?? '',
      transactionCode: json['transactionCode'] as String? ?? '',
      status: json['status'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_PaymentDetailsToJson(_$_PaymentDetails instance) =>
    <String, dynamic>{
      'transactionMode': instance.transactionMode,
      'transactionCode': instance.transactionCode,
      'status': instance.status,
      'amount': instance.amount,
    };

_$_StatusHistory _$$_StatusHistoryFromJson(Map<String, dynamic> json) =>
    _$_StatusHistory(
      status: json['status'] as String? ?? '',
      orderStatus: json['orderStatus'] as String? ?? '',
      modifiedOn: json['modifiedOn'] as String? ?? '',
    );

Map<String, dynamic> _$$_StatusHistoryToJson(_$_StatusHistory instance) =>
    <String, dynamic>{
      'status': instance.status,
      'orderStatus': instance.orderStatus,
      'modifiedOn': instance.modifiedOn,
    };
