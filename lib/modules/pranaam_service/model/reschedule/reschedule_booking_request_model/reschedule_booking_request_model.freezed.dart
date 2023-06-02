// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reschedule_booking_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RescheduleBookingRequestModel _$RescheduleBookingRequestModelFromJson(
    Map<String, dynamic> json) {
  return _RescheduleBookingRequestModel.fromJson(json);
}

/// @nodoc
mixin _$RescheduleBookingRequestModel {
  @JsonKey(name: 'bookingId')
  int get bookingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'referenceId')
  String get referenceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'phoneNo')
  String get phoneNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'countryDialCode')
  String get countryDialCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'rescheduleCharges')
  double get rescheduleCharges => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPartialReshedule')
  bool get isPartialReshedule => throw _privateConstructorUsedError;
  @JsonKey(name: 'passengerIdList')
  List<int> get passengerIdList => throw _privateConstructorUsedError;
  @JsonKey(name: 'tripInfo')
  TripInfo get tripInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentInfo')
  PaymentInfo get paymentInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RescheduleBookingRequestModelCopyWith<RescheduleBookingRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RescheduleBookingRequestModelCopyWith<$Res> {
  factory $RescheduleBookingRequestModelCopyWith(
          RescheduleBookingRequestModel value,
          $Res Function(RescheduleBookingRequestModel) then) =
      _$RescheduleBookingRequestModelCopyWithImpl<$Res,
          RescheduleBookingRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bookingId') int bookingId,
      @JsonKey(name: 'referenceId') String referenceId,
      @JsonKey(name: 'phoneNo') String phoneNo,
      @JsonKey(name: 'countryDialCode') String countryDialCode,
      @JsonKey(name: 'rescheduleCharges') double rescheduleCharges,
      @JsonKey(name: 'isPartialReshedule') bool isPartialReshedule,
      @JsonKey(name: 'passengerIdList') List<int> passengerIdList,
      @JsonKey(name: 'tripInfo') TripInfo tripInfo,
      @JsonKey(name: 'paymentInfo') PaymentInfo paymentInfo});

  $TripInfoCopyWith<$Res> get tripInfo;
  $PaymentInfoCopyWith<$Res> get paymentInfo;
}

/// @nodoc
class _$RescheduleBookingRequestModelCopyWithImpl<$Res,
        $Val extends RescheduleBookingRequestModel>
    implements $RescheduleBookingRequestModelCopyWith<$Res> {
  _$RescheduleBookingRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? referenceId = null,
    Object? phoneNo = null,
    Object? countryDialCode = null,
    Object? rescheduleCharges = null,
    Object? isPartialReshedule = null,
    Object? passengerIdList = null,
    Object? tripInfo = null,
    Object? paymentInfo = null,
  }) {
    return _then(_value.copyWith(
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int,
      referenceId: null == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNo: null == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String,
      countryDialCode: null == countryDialCode
          ? _value.countryDialCode
          : countryDialCode // ignore: cast_nullable_to_non_nullable
              as String,
      rescheduleCharges: null == rescheduleCharges
          ? _value.rescheduleCharges
          : rescheduleCharges // ignore: cast_nullable_to_non_nullable
              as double,
      isPartialReshedule: null == isPartialReshedule
          ? _value.isPartialReshedule
          : isPartialReshedule // ignore: cast_nullable_to_non_nullable
              as bool,
      passengerIdList: null == passengerIdList
          ? _value.passengerIdList
          : passengerIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      tripInfo: null == tripInfo
          ? _value.tripInfo
          : tripInfo // ignore: cast_nullable_to_non_nullable
              as TripInfo,
      paymentInfo: null == paymentInfo
          ? _value.paymentInfo
          : paymentInfo // ignore: cast_nullable_to_non_nullable
              as PaymentInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TripInfoCopyWith<$Res> get tripInfo {
    return $TripInfoCopyWith<$Res>(_value.tripInfo, (value) {
      return _then(_value.copyWith(tripInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentInfoCopyWith<$Res> get paymentInfo {
    return $PaymentInfoCopyWith<$Res>(_value.paymentInfo, (value) {
      return _then(_value.copyWith(paymentInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RescheduleBookingRequestModelCopyWith<$Res>
    implements $RescheduleBookingRequestModelCopyWith<$Res> {
  factory _$$_RescheduleBookingRequestModelCopyWith(
          _$_RescheduleBookingRequestModel value,
          $Res Function(_$_RescheduleBookingRequestModel) then) =
      __$$_RescheduleBookingRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bookingId') int bookingId,
      @JsonKey(name: 'referenceId') String referenceId,
      @JsonKey(name: 'phoneNo') String phoneNo,
      @JsonKey(name: 'countryDialCode') String countryDialCode,
      @JsonKey(name: 'rescheduleCharges') double rescheduleCharges,
      @JsonKey(name: 'isPartialReshedule') bool isPartialReshedule,
      @JsonKey(name: 'passengerIdList') List<int> passengerIdList,
      @JsonKey(name: 'tripInfo') TripInfo tripInfo,
      @JsonKey(name: 'paymentInfo') PaymentInfo paymentInfo});

  @override
  $TripInfoCopyWith<$Res> get tripInfo;
  @override
  $PaymentInfoCopyWith<$Res> get paymentInfo;
}

/// @nodoc
class __$$_RescheduleBookingRequestModelCopyWithImpl<$Res>
    extends _$RescheduleBookingRequestModelCopyWithImpl<$Res,
        _$_RescheduleBookingRequestModel>
    implements _$$_RescheduleBookingRequestModelCopyWith<$Res> {
  __$$_RescheduleBookingRequestModelCopyWithImpl(
      _$_RescheduleBookingRequestModel _value,
      $Res Function(_$_RescheduleBookingRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? referenceId = null,
    Object? phoneNo = null,
    Object? countryDialCode = null,
    Object? rescheduleCharges = null,
    Object? isPartialReshedule = null,
    Object? passengerIdList = null,
    Object? tripInfo = null,
    Object? paymentInfo = null,
  }) {
    return _then(_$_RescheduleBookingRequestModel(
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int,
      referenceId: null == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNo: null == phoneNo
          ? _value.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String,
      countryDialCode: null == countryDialCode
          ? _value.countryDialCode
          : countryDialCode // ignore: cast_nullable_to_non_nullable
              as String,
      rescheduleCharges: null == rescheduleCharges
          ? _value.rescheduleCharges
          : rescheduleCharges // ignore: cast_nullable_to_non_nullable
              as double,
      isPartialReshedule: null == isPartialReshedule
          ? _value.isPartialReshedule
          : isPartialReshedule // ignore: cast_nullable_to_non_nullable
              as bool,
      passengerIdList: null == passengerIdList
          ? _value.passengerIdList
          : passengerIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      tripInfo: null == tripInfo
          ? _value.tripInfo
          : tripInfo // ignore: cast_nullable_to_non_nullable
              as TripInfo,
      paymentInfo: null == paymentInfo
          ? _value.paymentInfo
          : paymentInfo // ignore: cast_nullable_to_non_nullable
              as PaymentInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RescheduleBookingRequestModel
    implements _RescheduleBookingRequestModel {
  const _$_RescheduleBookingRequestModel(
      {@JsonKey(name: 'bookingId') this.bookingId = 0,
      @JsonKey(name: 'referenceId') this.referenceId = '',
      @JsonKey(name: 'phoneNo') this.phoneNo = '',
      @JsonKey(name: 'countryDialCode') this.countryDialCode = '',
      @JsonKey(name: 'rescheduleCharges') this.rescheduleCharges = 0,
      @JsonKey(name: 'isPartialReshedule') this.isPartialReshedule = false,
      @JsonKey(name: 'passengerIdList') this.passengerIdList = const [],
      @JsonKey(name: 'tripInfo') this.tripInfo = const TripInfo(),
      @JsonKey(name: 'paymentInfo') this.paymentInfo = const PaymentInfo()});

  factory _$_RescheduleBookingRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_RescheduleBookingRequestModelFromJson(json);

  @override
  @JsonKey(name: 'bookingId')
  final int bookingId;
  @override
  @JsonKey(name: 'referenceId')
  final String referenceId;
  @override
  @JsonKey(name: 'phoneNo')
  final String phoneNo;
  @override
  @JsonKey(name: 'countryDialCode')
  final String countryDialCode;
  @override
  @JsonKey(name: 'rescheduleCharges')
  final double rescheduleCharges;
  @override
  @JsonKey(name: 'isPartialReshedule')
  final bool isPartialReshedule;
  @override
  @JsonKey(name: 'passengerIdList')
  final List<int> passengerIdList;
  @override
  @JsonKey(name: 'tripInfo')
  final TripInfo tripInfo;
  @override
  @JsonKey(name: 'paymentInfo')
  final PaymentInfo paymentInfo;

  @override
  String toString() {
    return 'RescheduleBookingRequestModel(bookingId: $bookingId, referenceId: $referenceId, phoneNo: $phoneNo, countryDialCode: $countryDialCode, rescheduleCharges: $rescheduleCharges, isPartialReshedule: $isPartialReshedule, passengerIdList: $passengerIdList, tripInfo: $tripInfo, paymentInfo: $paymentInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RescheduleBookingRequestModel &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.referenceId, referenceId) ||
                other.referenceId == referenceId) &&
            (identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo) &&
            (identical(other.countryDialCode, countryDialCode) ||
                other.countryDialCode == countryDialCode) &&
            (identical(other.rescheduleCharges, rescheduleCharges) ||
                other.rescheduleCharges == rescheduleCharges) &&
            (identical(other.isPartialReshedule, isPartialReshedule) ||
                other.isPartialReshedule == isPartialReshedule) &&
            const DeepCollectionEquality()
                .equals(other.passengerIdList, passengerIdList) &&
            (identical(other.tripInfo, tripInfo) ||
                other.tripInfo == tripInfo) &&
            (identical(other.paymentInfo, paymentInfo) ||
                other.paymentInfo == paymentInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bookingId,
      referenceId,
      phoneNo,
      countryDialCode,
      rescheduleCharges,
      isPartialReshedule,
      const DeepCollectionEquality().hash(passengerIdList),
      tripInfo,
      paymentInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RescheduleBookingRequestModelCopyWith<_$_RescheduleBookingRequestModel>
      get copyWith => __$$_RescheduleBookingRequestModelCopyWithImpl<
          _$_RescheduleBookingRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RescheduleBookingRequestModelToJson(
      this,
    );
  }
}

abstract class _RescheduleBookingRequestModel
    implements RescheduleBookingRequestModel {
  const factory _RescheduleBookingRequestModel(
          {@JsonKey(name: 'bookingId') final int bookingId,
          @JsonKey(name: 'referenceId') final String referenceId,
          @JsonKey(name: 'phoneNo') final String phoneNo,
          @JsonKey(name: 'countryDialCode') final String countryDialCode,
          @JsonKey(name: 'rescheduleCharges') final double rescheduleCharges,
          @JsonKey(name: 'isPartialReshedule') final bool isPartialReshedule,
          @JsonKey(name: 'passengerIdList') final List<int> passengerIdList,
          @JsonKey(name: 'tripInfo') final TripInfo tripInfo,
          @JsonKey(name: 'paymentInfo') final PaymentInfo paymentInfo}) =
      _$_RescheduleBookingRequestModel;

  factory _RescheduleBookingRequestModel.fromJson(Map<String, dynamic> json) =
      _$_RescheduleBookingRequestModel.fromJson;

  @override
  @JsonKey(name: 'bookingId')
  int get bookingId;
  @override
  @JsonKey(name: 'referenceId')
  String get referenceId;
  @override
  @JsonKey(name: 'phoneNo')
  String get phoneNo;
  @override
  @JsonKey(name: 'countryDialCode')
  String get countryDialCode;
  @override
  @JsonKey(name: 'rescheduleCharges')
  double get rescheduleCharges;
  @override
  @JsonKey(name: 'isPartialReshedule')
  bool get isPartialReshedule;
  @override
  @JsonKey(name: 'passengerIdList')
  List<int> get passengerIdList;
  @override
  @JsonKey(name: 'tripInfo')
  TripInfo get tripInfo;
  @override
  @JsonKey(name: 'paymentInfo')
  PaymentInfo get paymentInfo;
  @override
  @JsonKey(ignore: true)
  _$$_RescheduleBookingRequestModelCopyWith<_$_RescheduleBookingRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

PaymentInfo _$PaymentInfoFromJson(Map<String, dynamic> json) {
  return _PaymentInfo.fromJson(json);
}

/// @nodoc
mixin _$PaymentInfo {
  @JsonKey(name: 'mihpayid')
  String get mihpayid => throw _privateConstructorUsedError;
  @JsonKey(name: 'mode')
  String get mode => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'key')
  String get key => throw _privateConstructorUsedError;
  @JsonKey(name: 'txnid')
  String get txnid => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  String get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'addedon')
  String get addedon => throw _privateConstructorUsedError;
  @JsonKey(name: 'productinfo')
  String get productinfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'firstname')
  String get firstname => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastname')
  String get lastname => throw _privateConstructorUsedError;
  @JsonKey(name: 'address1')
  String get address1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'address2')
  String get address2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'city')
  String get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  String get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'country')
  String get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'zipcode')
  String get zipcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'udf1')
  String get udf1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'udf2')
  String get udf2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'udf3')
  String get udf3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'udf4')
  String get udf4 => throw _privateConstructorUsedError;
  @JsonKey(name: 'udf5')
  String get udf5 => throw _privateConstructorUsedError;
  @JsonKey(name: 'udf6')
  String get udf6 => throw _privateConstructorUsedError;
  @JsonKey(name: 'udf7')
  String get udf7 => throw _privateConstructorUsedError;
  @JsonKey(name: 'udf8')
  String get udf8 => throw _privateConstructorUsedError;
  @JsonKey(name: 'udf9')
  String get udf9 => throw _privateConstructorUsedError;
  @JsonKey(name: 'udf10')
  String get udf10 => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_token')
  String get cardToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_no')
  String get cardNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'field0')
  String get field0 => throw _privateConstructorUsedError;
  @JsonKey(name: 'field1')
  String get field1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'field2')
  String get field2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'field3')
  String get field3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'field4')
  String get field4 => throw _privateConstructorUsedError;
  @JsonKey(name: 'field5')
  String get field5 => throw _privateConstructorUsedError;
  @JsonKey(name: 'field6')
  String get field6 => throw _privateConstructorUsedError;
  @JsonKey(name: 'field7')
  String get field7 => throw _privateConstructorUsedError;
  @JsonKey(name: 'field8')
  String get field8 => throw _privateConstructorUsedError;
  @JsonKey(name: 'field9')
  String get field9 => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_source')
  String get paymentSource => throw _privateConstructorUsedError;
  @JsonKey(name: 'PG_TYPE')
  String get pgType => throw _privateConstructorUsedError;
  @JsonKey(name: 'error')
  String get error => throw _privateConstructorUsedError;
  @JsonKey(name: 'error_Message')
  String get errorMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'net_amount_debit')
  String get netAmountDebit => throw _privateConstructorUsedError;
  @JsonKey(name: 'unmappedstatus')
  String get unmappedstatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'hash')
  String get hash => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_ref_no')
  String get bankRefNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_ref_num')
  String get bankRefNum => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankcode')
  String get bankcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'surl')
  String get surl => throw _privateConstructorUsedError;
  @JsonKey(name: 'curl')
  String get curl => throw _privateConstructorUsedError;
  @JsonKey(name: 'furl')
  String get furl => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_hash')
  String get cardHash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentInfoCopyWith<PaymentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInfoCopyWith<$Res> {
  factory $PaymentInfoCopyWith(
          PaymentInfo value, $Res Function(PaymentInfo) then) =
      _$PaymentInfoCopyWithImpl<$Res, PaymentInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'mihpayid') String mihpayid,
      @JsonKey(name: 'mode') String mode,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'key') String key,
      @JsonKey(name: 'txnid') String txnid,
      @JsonKey(name: 'amount') String amount,
      @JsonKey(name: 'addedon') String addedon,
      @JsonKey(name: 'productinfo') String productinfo,
      @JsonKey(name: 'firstname') String firstname,
      @JsonKey(name: 'lastname') String lastname,
      @JsonKey(name: 'address1') String address1,
      @JsonKey(name: 'address2') String address2,
      @JsonKey(name: 'city') String city,
      @JsonKey(name: 'state') String state,
      @JsonKey(name: 'country') String country,
      @JsonKey(name: 'zipcode') String zipcode,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'phone') String phone,
      @JsonKey(name: 'udf1') String udf1,
      @JsonKey(name: 'udf2') String udf2,
      @JsonKey(name: 'udf3') String udf3,
      @JsonKey(name: 'udf4') String udf4,
      @JsonKey(name: 'udf5') String udf5,
      @JsonKey(name: 'udf6') String udf6,
      @JsonKey(name: 'udf7') String udf7,
      @JsonKey(name: 'udf8') String udf8,
      @JsonKey(name: 'udf9') String udf9,
      @JsonKey(name: 'udf10') String udf10,
      @JsonKey(name: 'card_token') String cardToken,
      @JsonKey(name: 'card_no') String cardNo,
      @JsonKey(name: 'field0') String field0,
      @JsonKey(name: 'field1') String field1,
      @JsonKey(name: 'field2') String field2,
      @JsonKey(name: 'field3') String field3,
      @JsonKey(name: 'field4') String field4,
      @JsonKey(name: 'field5') String field5,
      @JsonKey(name: 'field6') String field6,
      @JsonKey(name: 'field7') String field7,
      @JsonKey(name: 'field8') String field8,
      @JsonKey(name: 'field9') String field9,
      @JsonKey(name: 'payment_source') String paymentSource,
      @JsonKey(name: 'PG_TYPE') String pgType,
      @JsonKey(name: 'error') String error,
      @JsonKey(name: 'error_Message') String errorMessage,
      @JsonKey(name: 'net_amount_debit') String netAmountDebit,
      @JsonKey(name: 'unmappedstatus') String unmappedstatus,
      @JsonKey(name: 'hash') String hash,
      @JsonKey(name: 'bank_ref_no') String bankRefNo,
      @JsonKey(name: 'bank_ref_num') String bankRefNum,
      @JsonKey(name: 'bankcode') String bankcode,
      @JsonKey(name: 'surl') String surl,
      @JsonKey(name: 'curl') String curl,
      @JsonKey(name: 'furl') String furl,
      @JsonKey(name: 'card_hash') String cardHash});
}

/// @nodoc
class _$PaymentInfoCopyWithImpl<$Res, $Val extends PaymentInfo>
    implements $PaymentInfoCopyWith<$Res> {
  _$PaymentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mihpayid = null,
    Object? mode = null,
    Object? status = null,
    Object? key = null,
    Object? txnid = null,
    Object? amount = null,
    Object? addedon = null,
    Object? productinfo = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? address1 = null,
    Object? address2 = null,
    Object? city = null,
    Object? state = null,
    Object? country = null,
    Object? zipcode = null,
    Object? email = null,
    Object? phone = null,
    Object? udf1 = null,
    Object? udf2 = null,
    Object? udf3 = null,
    Object? udf4 = null,
    Object? udf5 = null,
    Object? udf6 = null,
    Object? udf7 = null,
    Object? udf8 = null,
    Object? udf9 = null,
    Object? udf10 = null,
    Object? cardToken = null,
    Object? cardNo = null,
    Object? field0 = null,
    Object? field1 = null,
    Object? field2 = null,
    Object? field3 = null,
    Object? field4 = null,
    Object? field5 = null,
    Object? field6 = null,
    Object? field7 = null,
    Object? field8 = null,
    Object? field9 = null,
    Object? paymentSource = null,
    Object? pgType = null,
    Object? error = null,
    Object? errorMessage = null,
    Object? netAmountDebit = null,
    Object? unmappedstatus = null,
    Object? hash = null,
    Object? bankRefNo = null,
    Object? bankRefNum = null,
    Object? bankcode = null,
    Object? surl = null,
    Object? curl = null,
    Object? furl = null,
    Object? cardHash = null,
  }) {
    return _then(_value.copyWith(
      mihpayid: null == mihpayid
          ? _value.mihpayid
          : mihpayid // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      txnid: null == txnid
          ? _value.txnid
          : txnid // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      addedon: null == addedon
          ? _value.addedon
          : addedon // ignore: cast_nullable_to_non_nullable
              as String,
      productinfo: null == productinfo
          ? _value.productinfo
          : productinfo // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      address1: null == address1
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String,
      address2: null == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      zipcode: null == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      udf1: null == udf1
          ? _value.udf1
          : udf1 // ignore: cast_nullable_to_non_nullable
              as String,
      udf2: null == udf2
          ? _value.udf2
          : udf2 // ignore: cast_nullable_to_non_nullable
              as String,
      udf3: null == udf3
          ? _value.udf3
          : udf3 // ignore: cast_nullable_to_non_nullable
              as String,
      udf4: null == udf4
          ? _value.udf4
          : udf4 // ignore: cast_nullable_to_non_nullable
              as String,
      udf5: null == udf5
          ? _value.udf5
          : udf5 // ignore: cast_nullable_to_non_nullable
              as String,
      udf6: null == udf6
          ? _value.udf6
          : udf6 // ignore: cast_nullable_to_non_nullable
              as String,
      udf7: null == udf7
          ? _value.udf7
          : udf7 // ignore: cast_nullable_to_non_nullable
              as String,
      udf8: null == udf8
          ? _value.udf8
          : udf8 // ignore: cast_nullable_to_non_nullable
              as String,
      udf9: null == udf9
          ? _value.udf9
          : udf9 // ignore: cast_nullable_to_non_nullable
              as String,
      udf10: null == udf10
          ? _value.udf10
          : udf10 // ignore: cast_nullable_to_non_nullable
              as String,
      cardToken: null == cardToken
          ? _value.cardToken
          : cardToken // ignore: cast_nullable_to_non_nullable
              as String,
      cardNo: null == cardNo
          ? _value.cardNo
          : cardNo // ignore: cast_nullable_to_non_nullable
              as String,
      field0: null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
      field1: null == field1
          ? _value.field1
          : field1 // ignore: cast_nullable_to_non_nullable
              as String,
      field2: null == field2
          ? _value.field2
          : field2 // ignore: cast_nullable_to_non_nullable
              as String,
      field3: null == field3
          ? _value.field3
          : field3 // ignore: cast_nullable_to_non_nullable
              as String,
      field4: null == field4
          ? _value.field4
          : field4 // ignore: cast_nullable_to_non_nullable
              as String,
      field5: null == field5
          ? _value.field5
          : field5 // ignore: cast_nullable_to_non_nullable
              as String,
      field6: null == field6
          ? _value.field6
          : field6 // ignore: cast_nullable_to_non_nullable
              as String,
      field7: null == field7
          ? _value.field7
          : field7 // ignore: cast_nullable_to_non_nullable
              as String,
      field8: null == field8
          ? _value.field8
          : field8 // ignore: cast_nullable_to_non_nullable
              as String,
      field9: null == field9
          ? _value.field9
          : field9 // ignore: cast_nullable_to_non_nullable
              as String,
      paymentSource: null == paymentSource
          ? _value.paymentSource
          : paymentSource // ignore: cast_nullable_to_non_nullable
              as String,
      pgType: null == pgType
          ? _value.pgType
          : pgType // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      netAmountDebit: null == netAmountDebit
          ? _value.netAmountDebit
          : netAmountDebit // ignore: cast_nullable_to_non_nullable
              as String,
      unmappedstatus: null == unmappedstatus
          ? _value.unmappedstatus
          : unmappedstatus // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      bankRefNo: null == bankRefNo
          ? _value.bankRefNo
          : bankRefNo // ignore: cast_nullable_to_non_nullable
              as String,
      bankRefNum: null == bankRefNum
          ? _value.bankRefNum
          : bankRefNum // ignore: cast_nullable_to_non_nullable
              as String,
      bankcode: null == bankcode
          ? _value.bankcode
          : bankcode // ignore: cast_nullable_to_non_nullable
              as String,
      surl: null == surl
          ? _value.surl
          : surl // ignore: cast_nullable_to_non_nullable
              as String,
      curl: null == curl
          ? _value.curl
          : curl // ignore: cast_nullable_to_non_nullable
              as String,
      furl: null == furl
          ? _value.furl
          : furl // ignore: cast_nullable_to_non_nullable
              as String,
      cardHash: null == cardHash
          ? _value.cardHash
          : cardHash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentInfoCopyWith<$Res>
    implements $PaymentInfoCopyWith<$Res> {
  factory _$$_PaymentInfoCopyWith(
          _$_PaymentInfo value, $Res Function(_$_PaymentInfo) then) =
      __$$_PaymentInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'mihpayid') String mihpayid,
      @JsonKey(name: 'mode') String mode,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'key') String key,
      @JsonKey(name: 'txnid') String txnid,
      @JsonKey(name: 'amount') String amount,
      @JsonKey(name: 'addedon') String addedon,
      @JsonKey(name: 'productinfo') String productinfo,
      @JsonKey(name: 'firstname') String firstname,
      @JsonKey(name: 'lastname') String lastname,
      @JsonKey(name: 'address1') String address1,
      @JsonKey(name: 'address2') String address2,
      @JsonKey(name: 'city') String city,
      @JsonKey(name: 'state') String state,
      @JsonKey(name: 'country') String country,
      @JsonKey(name: 'zipcode') String zipcode,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'phone') String phone,
      @JsonKey(name: 'udf1') String udf1,
      @JsonKey(name: 'udf2') String udf2,
      @JsonKey(name: 'udf3') String udf3,
      @JsonKey(name: 'udf4') String udf4,
      @JsonKey(name: 'udf5') String udf5,
      @JsonKey(name: 'udf6') String udf6,
      @JsonKey(name: 'udf7') String udf7,
      @JsonKey(name: 'udf8') String udf8,
      @JsonKey(name: 'udf9') String udf9,
      @JsonKey(name: 'udf10') String udf10,
      @JsonKey(name: 'card_token') String cardToken,
      @JsonKey(name: 'card_no') String cardNo,
      @JsonKey(name: 'field0') String field0,
      @JsonKey(name: 'field1') String field1,
      @JsonKey(name: 'field2') String field2,
      @JsonKey(name: 'field3') String field3,
      @JsonKey(name: 'field4') String field4,
      @JsonKey(name: 'field5') String field5,
      @JsonKey(name: 'field6') String field6,
      @JsonKey(name: 'field7') String field7,
      @JsonKey(name: 'field8') String field8,
      @JsonKey(name: 'field9') String field9,
      @JsonKey(name: 'payment_source') String paymentSource,
      @JsonKey(name: 'PG_TYPE') String pgType,
      @JsonKey(name: 'error') String error,
      @JsonKey(name: 'error_Message') String errorMessage,
      @JsonKey(name: 'net_amount_debit') String netAmountDebit,
      @JsonKey(name: 'unmappedstatus') String unmappedstatus,
      @JsonKey(name: 'hash') String hash,
      @JsonKey(name: 'bank_ref_no') String bankRefNo,
      @JsonKey(name: 'bank_ref_num') String bankRefNum,
      @JsonKey(name: 'bankcode') String bankcode,
      @JsonKey(name: 'surl') String surl,
      @JsonKey(name: 'curl') String curl,
      @JsonKey(name: 'furl') String furl,
      @JsonKey(name: 'card_hash') String cardHash});
}

/// @nodoc
class __$$_PaymentInfoCopyWithImpl<$Res>
    extends _$PaymentInfoCopyWithImpl<$Res, _$_PaymentInfo>
    implements _$$_PaymentInfoCopyWith<$Res> {
  __$$_PaymentInfoCopyWithImpl(
      _$_PaymentInfo _value, $Res Function(_$_PaymentInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mihpayid = null,
    Object? mode = null,
    Object? status = null,
    Object? key = null,
    Object? txnid = null,
    Object? amount = null,
    Object? addedon = null,
    Object? productinfo = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? address1 = null,
    Object? address2 = null,
    Object? city = null,
    Object? state = null,
    Object? country = null,
    Object? zipcode = null,
    Object? email = null,
    Object? phone = null,
    Object? udf1 = null,
    Object? udf2 = null,
    Object? udf3 = null,
    Object? udf4 = null,
    Object? udf5 = null,
    Object? udf6 = null,
    Object? udf7 = null,
    Object? udf8 = null,
    Object? udf9 = null,
    Object? udf10 = null,
    Object? cardToken = null,
    Object? cardNo = null,
    Object? field0 = null,
    Object? field1 = null,
    Object? field2 = null,
    Object? field3 = null,
    Object? field4 = null,
    Object? field5 = null,
    Object? field6 = null,
    Object? field7 = null,
    Object? field8 = null,
    Object? field9 = null,
    Object? paymentSource = null,
    Object? pgType = null,
    Object? error = null,
    Object? errorMessage = null,
    Object? netAmountDebit = null,
    Object? unmappedstatus = null,
    Object? hash = null,
    Object? bankRefNo = null,
    Object? bankRefNum = null,
    Object? bankcode = null,
    Object? surl = null,
    Object? curl = null,
    Object? furl = null,
    Object? cardHash = null,
  }) {
    return _then(_$_PaymentInfo(
      mihpayid: null == mihpayid
          ? _value.mihpayid
          : mihpayid // ignore: cast_nullable_to_non_nullable
              as String,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      txnid: null == txnid
          ? _value.txnid
          : txnid // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      addedon: null == addedon
          ? _value.addedon
          : addedon // ignore: cast_nullable_to_non_nullable
              as String,
      productinfo: null == productinfo
          ? _value.productinfo
          : productinfo // ignore: cast_nullable_to_non_nullable
              as String,
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      address1: null == address1
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String,
      address2: null == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      zipcode: null == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      udf1: null == udf1
          ? _value.udf1
          : udf1 // ignore: cast_nullable_to_non_nullable
              as String,
      udf2: null == udf2
          ? _value.udf2
          : udf2 // ignore: cast_nullable_to_non_nullable
              as String,
      udf3: null == udf3
          ? _value.udf3
          : udf3 // ignore: cast_nullable_to_non_nullable
              as String,
      udf4: null == udf4
          ? _value.udf4
          : udf4 // ignore: cast_nullable_to_non_nullable
              as String,
      udf5: null == udf5
          ? _value.udf5
          : udf5 // ignore: cast_nullable_to_non_nullable
              as String,
      udf6: null == udf6
          ? _value.udf6
          : udf6 // ignore: cast_nullable_to_non_nullable
              as String,
      udf7: null == udf7
          ? _value.udf7
          : udf7 // ignore: cast_nullable_to_non_nullable
              as String,
      udf8: null == udf8
          ? _value.udf8
          : udf8 // ignore: cast_nullable_to_non_nullable
              as String,
      udf9: null == udf9
          ? _value.udf9
          : udf9 // ignore: cast_nullable_to_non_nullable
              as String,
      udf10: null == udf10
          ? _value.udf10
          : udf10 // ignore: cast_nullable_to_non_nullable
              as String,
      cardToken: null == cardToken
          ? _value.cardToken
          : cardToken // ignore: cast_nullable_to_non_nullable
              as String,
      cardNo: null == cardNo
          ? _value.cardNo
          : cardNo // ignore: cast_nullable_to_non_nullable
              as String,
      field0: null == field0
          ? _value.field0
          : field0 // ignore: cast_nullable_to_non_nullable
              as String,
      field1: null == field1
          ? _value.field1
          : field1 // ignore: cast_nullable_to_non_nullable
              as String,
      field2: null == field2
          ? _value.field2
          : field2 // ignore: cast_nullable_to_non_nullable
              as String,
      field3: null == field3
          ? _value.field3
          : field3 // ignore: cast_nullable_to_non_nullable
              as String,
      field4: null == field4
          ? _value.field4
          : field4 // ignore: cast_nullable_to_non_nullable
              as String,
      field5: null == field5
          ? _value.field5
          : field5 // ignore: cast_nullable_to_non_nullable
              as String,
      field6: null == field6
          ? _value.field6
          : field6 // ignore: cast_nullable_to_non_nullable
              as String,
      field7: null == field7
          ? _value.field7
          : field7 // ignore: cast_nullable_to_non_nullable
              as String,
      field8: null == field8
          ? _value.field8
          : field8 // ignore: cast_nullable_to_non_nullable
              as String,
      field9: null == field9
          ? _value.field9
          : field9 // ignore: cast_nullable_to_non_nullable
              as String,
      paymentSource: null == paymentSource
          ? _value.paymentSource
          : paymentSource // ignore: cast_nullable_to_non_nullable
              as String,
      pgType: null == pgType
          ? _value.pgType
          : pgType // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      netAmountDebit: null == netAmountDebit
          ? _value.netAmountDebit
          : netAmountDebit // ignore: cast_nullable_to_non_nullable
              as String,
      unmappedstatus: null == unmappedstatus
          ? _value.unmappedstatus
          : unmappedstatus // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      bankRefNo: null == bankRefNo
          ? _value.bankRefNo
          : bankRefNo // ignore: cast_nullable_to_non_nullable
              as String,
      bankRefNum: null == bankRefNum
          ? _value.bankRefNum
          : bankRefNum // ignore: cast_nullable_to_non_nullable
              as String,
      bankcode: null == bankcode
          ? _value.bankcode
          : bankcode // ignore: cast_nullable_to_non_nullable
              as String,
      surl: null == surl
          ? _value.surl
          : surl // ignore: cast_nullable_to_non_nullable
              as String,
      curl: null == curl
          ? _value.curl
          : curl // ignore: cast_nullable_to_non_nullable
              as String,
      furl: null == furl
          ? _value.furl
          : furl // ignore: cast_nullable_to_non_nullable
              as String,
      cardHash: null == cardHash
          ? _value.cardHash
          : cardHash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentInfo implements _PaymentInfo {
  const _$_PaymentInfo(
      {@JsonKey(name: 'mihpayid') this.mihpayid = '',
      @JsonKey(name: 'mode') this.mode = '',
      @JsonKey(name: 'status') this.status = '',
      @JsonKey(name: 'key') this.key = '',
      @JsonKey(name: 'txnid') this.txnid = '',
      @JsonKey(name: 'amount') this.amount = '',
      @JsonKey(name: 'addedon') this.addedon = '',
      @JsonKey(name: 'productinfo') this.productinfo = '',
      @JsonKey(name: 'firstname') this.firstname = '',
      @JsonKey(name: 'lastname') this.lastname = '',
      @JsonKey(name: 'address1') this.address1 = '',
      @JsonKey(name: 'address2') this.address2 = '',
      @JsonKey(name: 'city') this.city = '',
      @JsonKey(name: 'state') this.state = '',
      @JsonKey(name: 'country') this.country = '',
      @JsonKey(name: 'zipcode') this.zipcode = '',
      @JsonKey(name: 'email') this.email = '',
      @JsonKey(name: 'phone') this.phone = '',
      @JsonKey(name: 'udf1') this.udf1 = '',
      @JsonKey(name: 'udf2') this.udf2 = '',
      @JsonKey(name: 'udf3') this.udf3 = '',
      @JsonKey(name: 'udf4') this.udf4 = '',
      @JsonKey(name: 'udf5') this.udf5 = '',
      @JsonKey(name: 'udf6') this.udf6 = '',
      @JsonKey(name: 'udf7') this.udf7 = '',
      @JsonKey(name: 'udf8') this.udf8 = '',
      @JsonKey(name: 'udf9') this.udf9 = '',
      @JsonKey(name: 'udf10') this.udf10 = '',
      @JsonKey(name: 'card_token') this.cardToken = '',
      @JsonKey(name: 'card_no') this.cardNo = '',
      @JsonKey(name: 'field0') this.field0 = '',
      @JsonKey(name: 'field1') this.field1 = '',
      @JsonKey(name: 'field2') this.field2 = '',
      @JsonKey(name: 'field3') this.field3 = '',
      @JsonKey(name: 'field4') this.field4 = '',
      @JsonKey(name: 'field5') this.field5 = '',
      @JsonKey(name: 'field6') this.field6 = '',
      @JsonKey(name: 'field7') this.field7 = '',
      @JsonKey(name: 'field8') this.field8 = '',
      @JsonKey(name: 'field9') this.field9 = '',
      @JsonKey(name: 'payment_source') this.paymentSource = '',
      @JsonKey(name: 'PG_TYPE') this.pgType = '',
      @JsonKey(name: 'error') this.error = '',
      @JsonKey(name: 'error_Message') this.errorMessage = '',
      @JsonKey(name: 'net_amount_debit') this.netAmountDebit = '',
      @JsonKey(name: 'unmappedstatus') this.unmappedstatus = '',
      @JsonKey(name: 'hash') this.hash = '',
      @JsonKey(name: 'bank_ref_no') this.bankRefNo = '',
      @JsonKey(name: 'bank_ref_num') this.bankRefNum = '',
      @JsonKey(name: 'bankcode') this.bankcode = '',
      @JsonKey(name: 'surl') this.surl = '',
      @JsonKey(name: 'curl') this.curl = '',
      @JsonKey(name: 'furl') this.furl = '',
      @JsonKey(name: 'card_hash') this.cardHash = ''});

  factory _$_PaymentInfo.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentInfoFromJson(json);

  @override
  @JsonKey(name: 'mihpayid')
  final String mihpayid;
  @override
  @JsonKey(name: 'mode')
  final String mode;
  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'key')
  final String key;
  @override
  @JsonKey(name: 'txnid')
  final String txnid;
  @override
  @JsonKey(name: 'amount')
  final String amount;
  @override
  @JsonKey(name: 'addedon')
  final String addedon;
  @override
  @JsonKey(name: 'productinfo')
  final String productinfo;
  @override
  @JsonKey(name: 'firstname')
  final String firstname;
  @override
  @JsonKey(name: 'lastname')
  final String lastname;
  @override
  @JsonKey(name: 'address1')
  final String address1;
  @override
  @JsonKey(name: 'address2')
  final String address2;
  @override
  @JsonKey(name: 'city')
  final String city;
  @override
  @JsonKey(name: 'state')
  final String state;
  @override
  @JsonKey(name: 'country')
  final String country;
  @override
  @JsonKey(name: 'zipcode')
  final String zipcode;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'phone')
  final String phone;
  @override
  @JsonKey(name: 'udf1')
  final String udf1;
  @override
  @JsonKey(name: 'udf2')
  final String udf2;
  @override
  @JsonKey(name: 'udf3')
  final String udf3;
  @override
  @JsonKey(name: 'udf4')
  final String udf4;
  @override
  @JsonKey(name: 'udf5')
  final String udf5;
  @override
  @JsonKey(name: 'udf6')
  final String udf6;
  @override
  @JsonKey(name: 'udf7')
  final String udf7;
  @override
  @JsonKey(name: 'udf8')
  final String udf8;
  @override
  @JsonKey(name: 'udf9')
  final String udf9;
  @override
  @JsonKey(name: 'udf10')
  final String udf10;
  @override
  @JsonKey(name: 'card_token')
  final String cardToken;
  @override
  @JsonKey(name: 'card_no')
  final String cardNo;
  @override
  @JsonKey(name: 'field0')
  final String field0;
  @override
  @JsonKey(name: 'field1')
  final String field1;
  @override
  @JsonKey(name: 'field2')
  final String field2;
  @override
  @JsonKey(name: 'field3')
  final String field3;
  @override
  @JsonKey(name: 'field4')
  final String field4;
  @override
  @JsonKey(name: 'field5')
  final String field5;
  @override
  @JsonKey(name: 'field6')
  final String field6;
  @override
  @JsonKey(name: 'field7')
  final String field7;
  @override
  @JsonKey(name: 'field8')
  final String field8;
  @override
  @JsonKey(name: 'field9')
  final String field9;
  @override
  @JsonKey(name: 'payment_source')
  final String paymentSource;
  @override
  @JsonKey(name: 'PG_TYPE')
  final String pgType;
  @override
  @JsonKey(name: 'error')
  final String error;
  @override
  @JsonKey(name: 'error_Message')
  final String errorMessage;
  @override
  @JsonKey(name: 'net_amount_debit')
  final String netAmountDebit;
  @override
  @JsonKey(name: 'unmappedstatus')
  final String unmappedstatus;
  @override
  @JsonKey(name: 'hash')
  final String hash;
  @override
  @JsonKey(name: 'bank_ref_no')
  final String bankRefNo;
  @override
  @JsonKey(name: 'bank_ref_num')
  final String bankRefNum;
  @override
  @JsonKey(name: 'bankcode')
  final String bankcode;
  @override
  @JsonKey(name: 'surl')
  final String surl;
  @override
  @JsonKey(name: 'curl')
  final String curl;
  @override
  @JsonKey(name: 'furl')
  final String furl;
  @override
  @JsonKey(name: 'card_hash')
  final String cardHash;

  @override
  String toString() {
    return 'PaymentInfo(mihpayid: $mihpayid, mode: $mode, status: $status, key: $key, txnid: $txnid, amount: $amount, addedon: $addedon, productinfo: $productinfo, firstname: $firstname, lastname: $lastname, address1: $address1, address2: $address2, city: $city, state: $state, country: $country, zipcode: $zipcode, email: $email, phone: $phone, udf1: $udf1, udf2: $udf2, udf3: $udf3, udf4: $udf4, udf5: $udf5, udf6: $udf6, udf7: $udf7, udf8: $udf8, udf9: $udf9, udf10: $udf10, cardToken: $cardToken, cardNo: $cardNo, field0: $field0, field1: $field1, field2: $field2, field3: $field3, field4: $field4, field5: $field5, field6: $field6, field7: $field7, field8: $field8, field9: $field9, paymentSource: $paymentSource, pgType: $pgType, error: $error, errorMessage: $errorMessage, netAmountDebit: $netAmountDebit, unmappedstatus: $unmappedstatus, hash: $hash, bankRefNo: $bankRefNo, bankRefNum: $bankRefNum, bankcode: $bankcode, surl: $surl, curl: $curl, furl: $furl, cardHash: $cardHash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentInfo &&
            (identical(other.mihpayid, mihpayid) ||
                other.mihpayid == mihpayid) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.txnid, txnid) || other.txnid == txnid) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.addedon, addedon) || other.addedon == addedon) &&
            (identical(other.productinfo, productinfo) ||
                other.productinfo == productinfo) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.address1, address1) ||
                other.address1 == address1) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.zipcode, zipcode) || other.zipcode == zipcode) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.udf1, udf1) || other.udf1 == udf1) &&
            (identical(other.udf2, udf2) || other.udf2 == udf2) &&
            (identical(other.udf3, udf3) || other.udf3 == udf3) &&
            (identical(other.udf4, udf4) || other.udf4 == udf4) &&
            (identical(other.udf5, udf5) || other.udf5 == udf5) &&
            (identical(other.udf6, udf6) || other.udf6 == udf6) &&
            (identical(other.udf7, udf7) || other.udf7 == udf7) &&
            (identical(other.udf8, udf8) || other.udf8 == udf8) &&
            (identical(other.udf9, udf9) || other.udf9 == udf9) &&
            (identical(other.udf10, udf10) || other.udf10 == udf10) &&
            (identical(other.cardToken, cardToken) ||
                other.cardToken == cardToken) &&
            (identical(other.cardNo, cardNo) || other.cardNo == cardNo) &&
            (identical(other.field0, field0) || other.field0 == field0) &&
            (identical(other.field1, field1) || other.field1 == field1) &&
            (identical(other.field2, field2) || other.field2 == field2) &&
            (identical(other.field3, field3) || other.field3 == field3) &&
            (identical(other.field4, field4) || other.field4 == field4) &&
            (identical(other.field5, field5) || other.field5 == field5) &&
            (identical(other.field6, field6) || other.field6 == field6) &&
            (identical(other.field7, field7) || other.field7 == field7) &&
            (identical(other.field8, field8) || other.field8 == field8) &&
            (identical(other.field9, field9) || other.field9 == field9) &&
            (identical(other.paymentSource, paymentSource) ||
                other.paymentSource == paymentSource) &&
            (identical(other.pgType, pgType) || other.pgType == pgType) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.netAmountDebit, netAmountDebit) ||
                other.netAmountDebit == netAmountDebit) &&
            (identical(other.unmappedstatus, unmappedstatus) ||
                other.unmappedstatus == unmappedstatus) &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.bankRefNo, bankRefNo) ||
                other.bankRefNo == bankRefNo) &&
            (identical(other.bankRefNum, bankRefNum) ||
                other.bankRefNum == bankRefNum) &&
            (identical(other.bankcode, bankcode) ||
                other.bankcode == bankcode) &&
            (identical(other.surl, surl) || other.surl == surl) &&
            (identical(other.curl, curl) || other.curl == curl) &&
            (identical(other.furl, furl) || other.furl == furl) &&
            (identical(other.cardHash, cardHash) ||
                other.cardHash == cardHash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        mihpayid,
        mode,
        status,
        key,
        txnid,
        amount,
        addedon,
        productinfo,
        firstname,
        lastname,
        address1,
        address2,
        city,
        state,
        country,
        zipcode,
        email,
        phone,
        udf1,
        udf2,
        udf3,
        udf4,
        udf5,
        udf6,
        udf7,
        udf8,
        udf9,
        udf10,
        cardToken,
        cardNo,
        field0,
        field1,
        field2,
        field3,
        field4,
        field5,
        field6,
        field7,
        field8,
        field9,
        paymentSource,
        pgType,
        error,
        errorMessage,
        netAmountDebit,
        unmappedstatus,
        hash,
        bankRefNo,
        bankRefNum,
        bankcode,
        surl,
        curl,
        furl,
        cardHash
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentInfoCopyWith<_$_PaymentInfo> get copyWith =>
      __$$_PaymentInfoCopyWithImpl<_$_PaymentInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentInfoToJson(
      this,
    );
  }
}

abstract class _PaymentInfo implements PaymentInfo {
  const factory _PaymentInfo(
      {@JsonKey(name: 'mihpayid') final String mihpayid,
      @JsonKey(name: 'mode') final String mode,
      @JsonKey(name: 'status') final String status,
      @JsonKey(name: 'key') final String key,
      @JsonKey(name: 'txnid') final String txnid,
      @JsonKey(name: 'amount') final String amount,
      @JsonKey(name: 'addedon') final String addedon,
      @JsonKey(name: 'productinfo') final String productinfo,
      @JsonKey(name: 'firstname') final String firstname,
      @JsonKey(name: 'lastname') final String lastname,
      @JsonKey(name: 'address1') final String address1,
      @JsonKey(name: 'address2') final String address2,
      @JsonKey(name: 'city') final String city,
      @JsonKey(name: 'state') final String state,
      @JsonKey(name: 'country') final String country,
      @JsonKey(name: 'zipcode') final String zipcode,
      @JsonKey(name: 'email') final String email,
      @JsonKey(name: 'phone') final String phone,
      @JsonKey(name: 'udf1') final String udf1,
      @JsonKey(name: 'udf2') final String udf2,
      @JsonKey(name: 'udf3') final String udf3,
      @JsonKey(name: 'udf4') final String udf4,
      @JsonKey(name: 'udf5') final String udf5,
      @JsonKey(name: 'udf6') final String udf6,
      @JsonKey(name: 'udf7') final String udf7,
      @JsonKey(name: 'udf8') final String udf8,
      @JsonKey(name: 'udf9') final String udf9,
      @JsonKey(name: 'udf10') final String udf10,
      @JsonKey(name: 'card_token') final String cardToken,
      @JsonKey(name: 'card_no') final String cardNo,
      @JsonKey(name: 'field0') final String field0,
      @JsonKey(name: 'field1') final String field1,
      @JsonKey(name: 'field2') final String field2,
      @JsonKey(name: 'field3') final String field3,
      @JsonKey(name: 'field4') final String field4,
      @JsonKey(name: 'field5') final String field5,
      @JsonKey(name: 'field6') final String field6,
      @JsonKey(name: 'field7') final String field7,
      @JsonKey(name: 'field8') final String field8,
      @JsonKey(name: 'field9') final String field9,
      @JsonKey(name: 'payment_source') final String paymentSource,
      @JsonKey(name: 'PG_TYPE') final String pgType,
      @JsonKey(name: 'error') final String error,
      @JsonKey(name: 'error_Message') final String errorMessage,
      @JsonKey(name: 'net_amount_debit') final String netAmountDebit,
      @JsonKey(name: 'unmappedstatus') final String unmappedstatus,
      @JsonKey(name: 'hash') final String hash,
      @JsonKey(name: 'bank_ref_no') final String bankRefNo,
      @JsonKey(name: 'bank_ref_num') final String bankRefNum,
      @JsonKey(name: 'bankcode') final String bankcode,
      @JsonKey(name: 'surl') final String surl,
      @JsonKey(name: 'curl') final String curl,
      @JsonKey(name: 'furl') final String furl,
      @JsonKey(name: 'card_hash') final String cardHash}) = _$_PaymentInfo;

  factory _PaymentInfo.fromJson(Map<String, dynamic> json) =
      _$_PaymentInfo.fromJson;

  @override
  @JsonKey(name: 'mihpayid')
  String get mihpayid;
  @override
  @JsonKey(name: 'mode')
  String get mode;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'key')
  String get key;
  @override
  @JsonKey(name: 'txnid')
  String get txnid;
  @override
  @JsonKey(name: 'amount')
  String get amount;
  @override
  @JsonKey(name: 'addedon')
  String get addedon;
  @override
  @JsonKey(name: 'productinfo')
  String get productinfo;
  @override
  @JsonKey(name: 'firstname')
  String get firstname;
  @override
  @JsonKey(name: 'lastname')
  String get lastname;
  @override
  @JsonKey(name: 'address1')
  String get address1;
  @override
  @JsonKey(name: 'address2')
  String get address2;
  @override
  @JsonKey(name: 'city')
  String get city;
  @override
  @JsonKey(name: 'state')
  String get state;
  @override
  @JsonKey(name: 'country')
  String get country;
  @override
  @JsonKey(name: 'zipcode')
  String get zipcode;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'phone')
  String get phone;
  @override
  @JsonKey(name: 'udf1')
  String get udf1;
  @override
  @JsonKey(name: 'udf2')
  String get udf2;
  @override
  @JsonKey(name: 'udf3')
  String get udf3;
  @override
  @JsonKey(name: 'udf4')
  String get udf4;
  @override
  @JsonKey(name: 'udf5')
  String get udf5;
  @override
  @JsonKey(name: 'udf6')
  String get udf6;
  @override
  @JsonKey(name: 'udf7')
  String get udf7;
  @override
  @JsonKey(name: 'udf8')
  String get udf8;
  @override
  @JsonKey(name: 'udf9')
  String get udf9;
  @override
  @JsonKey(name: 'udf10')
  String get udf10;
  @override
  @JsonKey(name: 'card_token')
  String get cardToken;
  @override
  @JsonKey(name: 'card_no')
  String get cardNo;
  @override
  @JsonKey(name: 'field0')
  String get field0;
  @override
  @JsonKey(name: 'field1')
  String get field1;
  @override
  @JsonKey(name: 'field2')
  String get field2;
  @override
  @JsonKey(name: 'field3')
  String get field3;
  @override
  @JsonKey(name: 'field4')
  String get field4;
  @override
  @JsonKey(name: 'field5')
  String get field5;
  @override
  @JsonKey(name: 'field6')
  String get field6;
  @override
  @JsonKey(name: 'field7')
  String get field7;
  @override
  @JsonKey(name: 'field8')
  String get field8;
  @override
  @JsonKey(name: 'field9')
  String get field9;
  @override
  @JsonKey(name: 'payment_source')
  String get paymentSource;
  @override
  @JsonKey(name: 'PG_TYPE')
  String get pgType;
  @override
  @JsonKey(name: 'error')
  String get error;
  @override
  @JsonKey(name: 'error_Message')
  String get errorMessage;
  @override
  @JsonKey(name: 'net_amount_debit')
  String get netAmountDebit;
  @override
  @JsonKey(name: 'unmappedstatus')
  String get unmappedstatus;
  @override
  @JsonKey(name: 'hash')
  String get hash;
  @override
  @JsonKey(name: 'bank_ref_no')
  String get bankRefNo;
  @override
  @JsonKey(name: 'bank_ref_num')
  String get bankRefNum;
  @override
  @JsonKey(name: 'bankcode')
  String get bankcode;
  @override
  @JsonKey(name: 'surl')
  String get surl;
  @override
  @JsonKey(name: 'curl')
  String get curl;
  @override
  @JsonKey(name: 'furl')
  String get furl;
  @override
  @JsonKey(name: 'card_hash')
  String get cardHash;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentInfoCopyWith<_$_PaymentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

TripInfo _$TripInfoFromJson(Map<String, dynamic> json) {
  return _TripInfo.fromJson(json);
}

/// @nodoc
mixin _$TripInfo {
  @JsonKey(name: 'serviceDateTime')
  String get serviceDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'flightName')
  String get flightName => throw _privateConstructorUsedError;
  @JsonKey(name: 'flightNumber')
  String get flightNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'flightTerminal')
  String get flightTerminal => throw _privateConstructorUsedError;
  @JsonKey(name: 'flightDate')
  String get flightDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'flightTime')
  String get flightTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'transitDestRoundTripSecOrigin')
  int get transitDestRoundTripSecOrigin => throw _privateConstructorUsedError;
  @JsonKey(name: 'transitRoundTripSecFlightName')
  String get transitRoundTripSecFlightName =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'transitRoundTripSecFlightNumber')
  int get transitRoundTripSecFlightNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'transitRoundTripSecFlightTerminal')
  String get transitRoundTripSecFlightTerminal =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'transitRoundTripSecFlightDate')
  String get transitRoundTripSecFlightDate =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'transitRoundTripSecFlightTime')
  String get transitRoundTripSecFlightTime =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'roundTripSecServiceDateTime')
  String? get roundTripSecServiceDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripInfoCopyWith<TripInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripInfoCopyWith<$Res> {
  factory $TripInfoCopyWith(TripInfo value, $Res Function(TripInfo) then) =
      _$TripInfoCopyWithImpl<$Res, TripInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'serviceDateTime')
          String serviceDateTime,
      @JsonKey(name: 'flightName')
          String flightName,
      @JsonKey(name: 'flightNumber')
          String flightNumber,
      @JsonKey(name: 'flightTerminal')
          String flightTerminal,
      @JsonKey(name: 'flightDate')
          String flightDate,
      @JsonKey(name: 'flightTime')
          String flightTime,
      @JsonKey(name: 'transitDestRoundTripSecOrigin')
          int transitDestRoundTripSecOrigin,
      @JsonKey(name: 'transitRoundTripSecFlightName')
          String transitRoundTripSecFlightName,
      @JsonKey(name: 'transitRoundTripSecFlightNumber')
          int transitRoundTripSecFlightNumber,
      @JsonKey(name: 'transitRoundTripSecFlightTerminal')
          String transitRoundTripSecFlightTerminal,
      @JsonKey(name: 'transitRoundTripSecFlightDate')
          String transitRoundTripSecFlightDate,
      @JsonKey(name: 'transitRoundTripSecFlightTime')
          String transitRoundTripSecFlightTime,
      @JsonKey(name: 'roundTripSecServiceDateTime')
          String? roundTripSecServiceDateTime});
}

/// @nodoc
class _$TripInfoCopyWithImpl<$Res, $Val extends TripInfo>
    implements $TripInfoCopyWith<$Res> {
  _$TripInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceDateTime = null,
    Object? flightName = null,
    Object? flightNumber = null,
    Object? flightTerminal = null,
    Object? flightDate = null,
    Object? flightTime = null,
    Object? transitDestRoundTripSecOrigin = null,
    Object? transitRoundTripSecFlightName = null,
    Object? transitRoundTripSecFlightNumber = null,
    Object? transitRoundTripSecFlightTerminal = null,
    Object? transitRoundTripSecFlightDate = null,
    Object? transitRoundTripSecFlightTime = null,
    Object? roundTripSecServiceDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      serviceDateTime: null == serviceDateTime
          ? _value.serviceDateTime
          : serviceDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      flightName: null == flightName
          ? _value.flightName
          : flightName // ignore: cast_nullable_to_non_nullable
              as String,
      flightNumber: null == flightNumber
          ? _value.flightNumber
          : flightNumber // ignore: cast_nullable_to_non_nullable
              as String,
      flightTerminal: null == flightTerminal
          ? _value.flightTerminal
          : flightTerminal // ignore: cast_nullable_to_non_nullable
              as String,
      flightDate: null == flightDate
          ? _value.flightDate
          : flightDate // ignore: cast_nullable_to_non_nullable
              as String,
      flightTime: null == flightTime
          ? _value.flightTime
          : flightTime // ignore: cast_nullable_to_non_nullable
              as String,
      transitDestRoundTripSecOrigin: null == transitDestRoundTripSecOrigin
          ? _value.transitDestRoundTripSecOrigin
          : transitDestRoundTripSecOrigin // ignore: cast_nullable_to_non_nullable
              as int,
      transitRoundTripSecFlightName: null == transitRoundTripSecFlightName
          ? _value.transitRoundTripSecFlightName
          : transitRoundTripSecFlightName // ignore: cast_nullable_to_non_nullable
              as String,
      transitRoundTripSecFlightNumber: null == transitRoundTripSecFlightNumber
          ? _value.transitRoundTripSecFlightNumber
          : transitRoundTripSecFlightNumber // ignore: cast_nullable_to_non_nullable
              as int,
      transitRoundTripSecFlightTerminal: null ==
              transitRoundTripSecFlightTerminal
          ? _value.transitRoundTripSecFlightTerminal
          : transitRoundTripSecFlightTerminal // ignore: cast_nullable_to_non_nullable
              as String,
      transitRoundTripSecFlightDate: null == transitRoundTripSecFlightDate
          ? _value.transitRoundTripSecFlightDate
          : transitRoundTripSecFlightDate // ignore: cast_nullable_to_non_nullable
              as String,
      transitRoundTripSecFlightTime: null == transitRoundTripSecFlightTime
          ? _value.transitRoundTripSecFlightTime
          : transitRoundTripSecFlightTime // ignore: cast_nullable_to_non_nullable
              as String,
      roundTripSecServiceDateTime: freezed == roundTripSecServiceDateTime
          ? _value.roundTripSecServiceDateTime
          : roundTripSecServiceDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TripInfoCopyWith<$Res> implements $TripInfoCopyWith<$Res> {
  factory _$$_TripInfoCopyWith(
          _$_TripInfo value, $Res Function(_$_TripInfo) then) =
      __$$_TripInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'serviceDateTime')
          String serviceDateTime,
      @JsonKey(name: 'flightName')
          String flightName,
      @JsonKey(name: 'flightNumber')
          String flightNumber,
      @JsonKey(name: 'flightTerminal')
          String flightTerminal,
      @JsonKey(name: 'flightDate')
          String flightDate,
      @JsonKey(name: 'flightTime')
          String flightTime,
      @JsonKey(name: 'transitDestRoundTripSecOrigin')
          int transitDestRoundTripSecOrigin,
      @JsonKey(name: 'transitRoundTripSecFlightName')
          String transitRoundTripSecFlightName,
      @JsonKey(name: 'transitRoundTripSecFlightNumber')
          int transitRoundTripSecFlightNumber,
      @JsonKey(name: 'transitRoundTripSecFlightTerminal')
          String transitRoundTripSecFlightTerminal,
      @JsonKey(name: 'transitRoundTripSecFlightDate')
          String transitRoundTripSecFlightDate,
      @JsonKey(name: 'transitRoundTripSecFlightTime')
          String transitRoundTripSecFlightTime,
      @JsonKey(name: 'roundTripSecServiceDateTime')
          String? roundTripSecServiceDateTime});
}

/// @nodoc
class __$$_TripInfoCopyWithImpl<$Res>
    extends _$TripInfoCopyWithImpl<$Res, _$_TripInfo>
    implements _$$_TripInfoCopyWith<$Res> {
  __$$_TripInfoCopyWithImpl(
      _$_TripInfo _value, $Res Function(_$_TripInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceDateTime = null,
    Object? flightName = null,
    Object? flightNumber = null,
    Object? flightTerminal = null,
    Object? flightDate = null,
    Object? flightTime = null,
    Object? transitDestRoundTripSecOrigin = null,
    Object? transitRoundTripSecFlightName = null,
    Object? transitRoundTripSecFlightNumber = null,
    Object? transitRoundTripSecFlightTerminal = null,
    Object? transitRoundTripSecFlightDate = null,
    Object? transitRoundTripSecFlightTime = null,
    Object? roundTripSecServiceDateTime = freezed,
  }) {
    return _then(_$_TripInfo(
      serviceDateTime: null == serviceDateTime
          ? _value.serviceDateTime
          : serviceDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      flightName: null == flightName
          ? _value.flightName
          : flightName // ignore: cast_nullable_to_non_nullable
              as String,
      flightNumber: null == flightNumber
          ? _value.flightNumber
          : flightNumber // ignore: cast_nullable_to_non_nullable
              as String,
      flightTerminal: null == flightTerminal
          ? _value.flightTerminal
          : flightTerminal // ignore: cast_nullable_to_non_nullable
              as String,
      flightDate: null == flightDate
          ? _value.flightDate
          : flightDate // ignore: cast_nullable_to_non_nullable
              as String,
      flightTime: null == flightTime
          ? _value.flightTime
          : flightTime // ignore: cast_nullable_to_non_nullable
              as String,
      transitDestRoundTripSecOrigin: null == transitDestRoundTripSecOrigin
          ? _value.transitDestRoundTripSecOrigin
          : transitDestRoundTripSecOrigin // ignore: cast_nullable_to_non_nullable
              as int,
      transitRoundTripSecFlightName: null == transitRoundTripSecFlightName
          ? _value.transitRoundTripSecFlightName
          : transitRoundTripSecFlightName // ignore: cast_nullable_to_non_nullable
              as String,
      transitRoundTripSecFlightNumber: null == transitRoundTripSecFlightNumber
          ? _value.transitRoundTripSecFlightNumber
          : transitRoundTripSecFlightNumber // ignore: cast_nullable_to_non_nullable
              as int,
      transitRoundTripSecFlightTerminal: null ==
              transitRoundTripSecFlightTerminal
          ? _value.transitRoundTripSecFlightTerminal
          : transitRoundTripSecFlightTerminal // ignore: cast_nullable_to_non_nullable
              as String,
      transitRoundTripSecFlightDate: null == transitRoundTripSecFlightDate
          ? _value.transitRoundTripSecFlightDate
          : transitRoundTripSecFlightDate // ignore: cast_nullable_to_non_nullable
              as String,
      transitRoundTripSecFlightTime: null == transitRoundTripSecFlightTime
          ? _value.transitRoundTripSecFlightTime
          : transitRoundTripSecFlightTime // ignore: cast_nullable_to_non_nullable
              as String,
      roundTripSecServiceDateTime: freezed == roundTripSecServiceDateTime
          ? _value.roundTripSecServiceDateTime
          : roundTripSecServiceDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TripInfo implements _TripInfo {
  const _$_TripInfo(
      {@JsonKey(name: 'serviceDateTime')
          this.serviceDateTime = '',
      @JsonKey(name: 'flightName')
          this.flightName = '',
      @JsonKey(name: 'flightNumber')
          this.flightNumber = '',
      @JsonKey(name: 'flightTerminal')
          this.flightTerminal = '',
      @JsonKey(name: 'flightDate')
          this.flightDate = '',
      @JsonKey(name: 'flightTime')
          this.flightTime = '',
      @JsonKey(name: 'transitDestRoundTripSecOrigin')
          this.transitDestRoundTripSecOrigin = 0,
      @JsonKey(name: 'transitRoundTripSecFlightName')
          this.transitRoundTripSecFlightName = '',
      @JsonKey(name: 'transitRoundTripSecFlightNumber')
          this.transitRoundTripSecFlightNumber = 0,
      @JsonKey(name: 'transitRoundTripSecFlightTerminal')
          this.transitRoundTripSecFlightTerminal = '',
      @JsonKey(name: 'transitRoundTripSecFlightDate')
          this.transitRoundTripSecFlightDate = '',
      @JsonKey(name: 'transitRoundTripSecFlightTime')
          this.transitRoundTripSecFlightTime = '',
      @JsonKey(name: 'roundTripSecServiceDateTime')
          this.roundTripSecServiceDateTime});

  factory _$_TripInfo.fromJson(Map<String, dynamic> json) =>
      _$$_TripInfoFromJson(json);

  @override
  @JsonKey(name: 'serviceDateTime')
  final String serviceDateTime;
  @override
  @JsonKey(name: 'flightName')
  final String flightName;
  @override
  @JsonKey(name: 'flightNumber')
  final String flightNumber;
  @override
  @JsonKey(name: 'flightTerminal')
  final String flightTerminal;
  @override
  @JsonKey(name: 'flightDate')
  final String flightDate;
  @override
  @JsonKey(name: 'flightTime')
  final String flightTime;
  @override
  @JsonKey(name: 'transitDestRoundTripSecOrigin')
  final int transitDestRoundTripSecOrigin;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightName')
  final String transitRoundTripSecFlightName;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightNumber')
  final int transitRoundTripSecFlightNumber;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightTerminal')
  final String transitRoundTripSecFlightTerminal;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightDate')
  final String transitRoundTripSecFlightDate;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightTime')
  final String transitRoundTripSecFlightTime;
  @override
  @JsonKey(name: 'roundTripSecServiceDateTime')
  final String? roundTripSecServiceDateTime;

  @override
  String toString() {
    return 'TripInfo(serviceDateTime: $serviceDateTime, flightName: $flightName, flightNumber: $flightNumber, flightTerminal: $flightTerminal, flightDate: $flightDate, flightTime: $flightTime, transitDestRoundTripSecOrigin: $transitDestRoundTripSecOrigin, transitRoundTripSecFlightName: $transitRoundTripSecFlightName, transitRoundTripSecFlightNumber: $transitRoundTripSecFlightNumber, transitRoundTripSecFlightTerminal: $transitRoundTripSecFlightTerminal, transitRoundTripSecFlightDate: $transitRoundTripSecFlightDate, transitRoundTripSecFlightTime: $transitRoundTripSecFlightTime, roundTripSecServiceDateTime: $roundTripSecServiceDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TripInfo &&
            (identical(other.serviceDateTime, serviceDateTime) ||
                other.serviceDateTime == serviceDateTime) &&
            (identical(other.flightName, flightName) ||
                other.flightName == flightName) &&
            (identical(other.flightNumber, flightNumber) ||
                other.flightNumber == flightNumber) &&
            (identical(other.flightTerminal, flightTerminal) ||
                other.flightTerminal == flightTerminal) &&
            (identical(other.flightDate, flightDate) ||
                other.flightDate == flightDate) &&
            (identical(other.flightTime, flightTime) ||
                other.flightTime == flightTime) &&
            (identical(other.transitDestRoundTripSecOrigin, transitDestRoundTripSecOrigin) ||
                other.transitDestRoundTripSecOrigin ==
                    transitDestRoundTripSecOrigin) &&
            (identical(other.transitRoundTripSecFlightName, transitRoundTripSecFlightName) ||
                other.transitRoundTripSecFlightName ==
                    transitRoundTripSecFlightName) &&
            (identical(other.transitRoundTripSecFlightNumber,
                    transitRoundTripSecFlightNumber) ||
                other.transitRoundTripSecFlightNumber ==
                    transitRoundTripSecFlightNumber) &&
            (identical(other.transitRoundTripSecFlightTerminal,
                    transitRoundTripSecFlightTerminal) ||
                other.transitRoundTripSecFlightTerminal ==
                    transitRoundTripSecFlightTerminal) &&
            (identical(other.transitRoundTripSecFlightDate,
                    transitRoundTripSecFlightDate) ||
                other.transitRoundTripSecFlightDate ==
                    transitRoundTripSecFlightDate) &&
            (identical(other.transitRoundTripSecFlightTime,
                    transitRoundTripSecFlightTime) ||
                other.transitRoundTripSecFlightTime ==
                    transitRoundTripSecFlightTime) &&
            (identical(other.roundTripSecServiceDateTime, roundTripSecServiceDateTime) ||
                other.roundTripSecServiceDateTime ==
                    roundTripSecServiceDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      serviceDateTime,
      flightName,
      flightNumber,
      flightTerminal,
      flightDate,
      flightTime,
      transitDestRoundTripSecOrigin,
      transitRoundTripSecFlightName,
      transitRoundTripSecFlightNumber,
      transitRoundTripSecFlightTerminal,
      transitRoundTripSecFlightDate,
      transitRoundTripSecFlightTime,
      roundTripSecServiceDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TripInfoCopyWith<_$_TripInfo> get copyWith =>
      __$$_TripInfoCopyWithImpl<_$_TripInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TripInfoToJson(
      this,
    );
  }
}

abstract class _TripInfo implements TripInfo {
  const factory _TripInfo(
      {@JsonKey(name: 'serviceDateTime')
          final String serviceDateTime,
      @JsonKey(name: 'flightName')
          final String flightName,
      @JsonKey(name: 'flightNumber')
          final String flightNumber,
      @JsonKey(name: 'flightTerminal')
          final String flightTerminal,
      @JsonKey(name: 'flightDate')
          final String flightDate,
      @JsonKey(name: 'flightTime')
          final String flightTime,
      @JsonKey(name: 'transitDestRoundTripSecOrigin')
          final int transitDestRoundTripSecOrigin,
      @JsonKey(name: 'transitRoundTripSecFlightName')
          final String transitRoundTripSecFlightName,
      @JsonKey(name: 'transitRoundTripSecFlightNumber')
          final int transitRoundTripSecFlightNumber,
      @JsonKey(name: 'transitRoundTripSecFlightTerminal')
          final String transitRoundTripSecFlightTerminal,
      @JsonKey(name: 'transitRoundTripSecFlightDate')
          final String transitRoundTripSecFlightDate,
      @JsonKey(name: 'transitRoundTripSecFlightTime')
          final String transitRoundTripSecFlightTime,
      @JsonKey(name: 'roundTripSecServiceDateTime')
          final String? roundTripSecServiceDateTime}) = _$_TripInfo;

  factory _TripInfo.fromJson(Map<String, dynamic> json) = _$_TripInfo.fromJson;

  @override
  @JsonKey(name: 'serviceDateTime')
  String get serviceDateTime;
  @override
  @JsonKey(name: 'flightName')
  String get flightName;
  @override
  @JsonKey(name: 'flightNumber')
  String get flightNumber;
  @override
  @JsonKey(name: 'flightTerminal')
  String get flightTerminal;
  @override
  @JsonKey(name: 'flightDate')
  String get flightDate;
  @override
  @JsonKey(name: 'flightTime')
  String get flightTime;
  @override
  @JsonKey(name: 'transitDestRoundTripSecOrigin')
  int get transitDestRoundTripSecOrigin;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightName')
  String get transitRoundTripSecFlightName;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightNumber')
  int get transitRoundTripSecFlightNumber;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightTerminal')
  String get transitRoundTripSecFlightTerminal;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightDate')
  String get transitRoundTripSecFlightDate;
  @override
  @JsonKey(name: 'transitRoundTripSecFlightTime')
  String get transitRoundTripSecFlightTime;
  @override
  @JsonKey(name: 'roundTripSecServiceDateTime')
  String? get roundTripSecServiceDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_TripInfoCopyWith<_$_TripInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
