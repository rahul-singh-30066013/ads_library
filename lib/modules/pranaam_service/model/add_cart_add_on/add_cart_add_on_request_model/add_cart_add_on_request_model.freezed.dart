// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_cart_add_on_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddCartAddOnRequestModel _$AddCartAddOnRequestModelFromJson(
    Map<String, dynamic> json) {
  return _AddCartAddOnRequestModel.fromJson(json);
}

/// @nodoc
mixin _$AddCartAddOnRequestModel {
  int? get packageId => throw _privateConstructorUsedError;
  String get serviceName => throw _privateConstructorUsedError;
  String get serviceDescription => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get addOnServiceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddCartAddOnRequestModelCopyWith<AddCartAddOnRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCartAddOnRequestModelCopyWith<$Res> {
  factory $AddCartAddOnRequestModelCopyWith(AddCartAddOnRequestModel value,
          $Res Function(AddCartAddOnRequestModel) then) =
      _$AddCartAddOnRequestModelCopyWithImpl<$Res, AddCartAddOnRequestModel>;
  @useResult
  $Res call(
      {int? packageId,
      String serviceName,
      String serviceDescription,
      double price,
      int quantity,
      int addOnServiceId});
}

/// @nodoc
class _$AddCartAddOnRequestModelCopyWithImpl<$Res,
        $Val extends AddCartAddOnRequestModel>
    implements $AddCartAddOnRequestModelCopyWith<$Res> {
  _$AddCartAddOnRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageId = freezed,
    Object? serviceName = null,
    Object? serviceDescription = null,
    Object? price = null,
    Object? quantity = null,
    Object? addOnServiceId = null,
  }) {
    return _then(_value.copyWith(
      packageId: freezed == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      serviceDescription: null == serviceDescription
          ? _value.serviceDescription
          : serviceDescription // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      addOnServiceId: null == addOnServiceId
          ? _value.addOnServiceId
          : addOnServiceId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddCartAddOnRequestModelCopyWith<$Res>
    implements $AddCartAddOnRequestModelCopyWith<$Res> {
  factory _$$_AddCartAddOnRequestModelCopyWith(
          _$_AddCartAddOnRequestModel value,
          $Res Function(_$_AddCartAddOnRequestModel) then) =
      __$$_AddCartAddOnRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? packageId,
      String serviceName,
      String serviceDescription,
      double price,
      int quantity,
      int addOnServiceId});
}

/// @nodoc
class __$$_AddCartAddOnRequestModelCopyWithImpl<$Res>
    extends _$AddCartAddOnRequestModelCopyWithImpl<$Res,
        _$_AddCartAddOnRequestModel>
    implements _$$_AddCartAddOnRequestModelCopyWith<$Res> {
  __$$_AddCartAddOnRequestModelCopyWithImpl(_$_AddCartAddOnRequestModel _value,
      $Res Function(_$_AddCartAddOnRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageId = freezed,
    Object? serviceName = null,
    Object? serviceDescription = null,
    Object? price = null,
    Object? quantity = null,
    Object? addOnServiceId = null,
  }) {
    return _then(_$_AddCartAddOnRequestModel(
      packageId: freezed == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      serviceDescription: null == serviceDescription
          ? _value.serviceDescription
          : serviceDescription // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      addOnServiceId: null == addOnServiceId
          ? _value.addOnServiceId
          : addOnServiceId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddCartAddOnRequestModel implements _AddCartAddOnRequestModel {
  const _$_AddCartAddOnRequestModel(
      {required this.packageId,
      required this.serviceName,
      required this.serviceDescription,
      required this.price,
      required this.quantity,
      required this.addOnServiceId});

  factory _$_AddCartAddOnRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_AddCartAddOnRequestModelFromJson(json);

  @override
  final int? packageId;
  @override
  final String serviceName;
  @override
  final String serviceDescription;
  @override
  final double price;
  @override
  final int quantity;
  @override
  final int addOnServiceId;

  @override
  String toString() {
    return 'AddCartAddOnRequestModel(packageId: $packageId, serviceName: $serviceName, serviceDescription: $serviceDescription, price: $price, quantity: $quantity, addOnServiceId: $addOnServiceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddCartAddOnRequestModel &&
            (identical(other.packageId, packageId) ||
                other.packageId == packageId) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.serviceDescription, serviceDescription) ||
                other.serviceDescription == serviceDescription) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.addOnServiceId, addOnServiceId) ||
                other.addOnServiceId == addOnServiceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, packageId, serviceName,
      serviceDescription, price, quantity, addOnServiceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddCartAddOnRequestModelCopyWith<_$_AddCartAddOnRequestModel>
      get copyWith => __$$_AddCartAddOnRequestModelCopyWithImpl<
          _$_AddCartAddOnRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddCartAddOnRequestModelToJson(
      this,
    );
  }
}

abstract class _AddCartAddOnRequestModel implements AddCartAddOnRequestModel {
  const factory _AddCartAddOnRequestModel(
      {required final int? packageId,
      required final String serviceName,
      required final String serviceDescription,
      required final double price,
      required final int quantity,
      required final int addOnServiceId}) = _$_AddCartAddOnRequestModel;

  factory _AddCartAddOnRequestModel.fromJson(Map<String, dynamic> json) =
      _$_AddCartAddOnRequestModel.fromJson;

  @override
  int? get packageId;
  @override
  String get serviceName;
  @override
  String get serviceDescription;
  @override
  double get price;
  @override
  int get quantity;
  @override
  int get addOnServiceId;
  @override
  @JsonKey(ignore: true)
  _$$_AddCartAddOnRequestModelCopyWith<_$_AddCartAddOnRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}
