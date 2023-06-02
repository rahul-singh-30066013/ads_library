// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cancel_booking_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CancelBookingRequestModel _$CancelBookingRequestModelFromJson(
    Map<String, dynamic> json) {
  return _CancelBookingRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CancelBookingRequestModel {
  String get orderReferenceId => throw _privateConstructorUsedError;
  List<int> get passengerIdList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CancelBookingRequestModelCopyWith<CancelBookingRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelBookingRequestModelCopyWith<$Res> {
  factory $CancelBookingRequestModelCopyWith(CancelBookingRequestModel value,
          $Res Function(CancelBookingRequestModel) then) =
      _$CancelBookingRequestModelCopyWithImpl<$Res, CancelBookingRequestModel>;
  @useResult
  $Res call({String orderReferenceId, List<int> passengerIdList});
}

/// @nodoc
class _$CancelBookingRequestModelCopyWithImpl<$Res,
        $Val extends CancelBookingRequestModel>
    implements $CancelBookingRequestModelCopyWith<$Res> {
  _$CancelBookingRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderReferenceId = null,
    Object? passengerIdList = null,
  }) {
    return _then(_value.copyWith(
      orderReferenceId: null == orderReferenceId
          ? _value.orderReferenceId
          : orderReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      passengerIdList: null == passengerIdList
          ? _value.passengerIdList
          : passengerIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CancelBookingRequestModelCopyWith<$Res>
    implements $CancelBookingRequestModelCopyWith<$Res> {
  factory _$$_CancelBookingRequestModelCopyWith(
          _$_CancelBookingRequestModel value,
          $Res Function(_$_CancelBookingRequestModel) then) =
      __$$_CancelBookingRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String orderReferenceId, List<int> passengerIdList});
}

/// @nodoc
class __$$_CancelBookingRequestModelCopyWithImpl<$Res>
    extends _$CancelBookingRequestModelCopyWithImpl<$Res,
        _$_CancelBookingRequestModel>
    implements _$$_CancelBookingRequestModelCopyWith<$Res> {
  __$$_CancelBookingRequestModelCopyWithImpl(
      _$_CancelBookingRequestModel _value,
      $Res Function(_$_CancelBookingRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderReferenceId = null,
    Object? passengerIdList = null,
  }) {
    return _then(_$_CancelBookingRequestModel(
      orderReferenceId: null == orderReferenceId
          ? _value.orderReferenceId
          : orderReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      passengerIdList: null == passengerIdList
          ? _value.passengerIdList
          : passengerIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CancelBookingRequestModel implements _CancelBookingRequestModel {
  const _$_CancelBookingRequestModel(
      {required this.orderReferenceId, required this.passengerIdList});

  factory _$_CancelBookingRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_CancelBookingRequestModelFromJson(json);

  @override
  final String orderReferenceId;
  @override
  final List<int> passengerIdList;

  @override
  String toString() {
    return 'CancelBookingRequestModel(orderReferenceId: $orderReferenceId, passengerIdList: $passengerIdList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CancelBookingRequestModel &&
            (identical(other.orderReferenceId, orderReferenceId) ||
                other.orderReferenceId == orderReferenceId) &&
            const DeepCollectionEquality()
                .equals(other.passengerIdList, passengerIdList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderReferenceId,
      const DeepCollectionEquality().hash(passengerIdList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CancelBookingRequestModelCopyWith<_$_CancelBookingRequestModel>
      get copyWith => __$$_CancelBookingRequestModelCopyWithImpl<
          _$_CancelBookingRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CancelBookingRequestModelToJson(
      this,
    );
  }
}

abstract class _CancelBookingRequestModel implements CancelBookingRequestModel {
  const factory _CancelBookingRequestModel(
      {required final String orderReferenceId,
      required final List<int> passengerIdList}) = _$_CancelBookingRequestModel;

  factory _CancelBookingRequestModel.fromJson(Map<String, dynamic> json) =
      _$_CancelBookingRequestModel.fromJson;

  @override
  String get orderReferenceId;
  @override
  List<int> get passengerIdList;
  @override
  @JsonKey(ignore: true)
  _$$_CancelBookingRequestModelCopyWith<_$_CancelBookingRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}
