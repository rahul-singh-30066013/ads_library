// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_item_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoyaltyItemDetailModel _$LoyaltyItemDetailModelFromJson(
    Map<String, dynamic> json) {
  return _LoyaltyItemDetailModel.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyItemDetailModel {
  @JsonKey(name: 'data')
  List<LoyaltyItemDetailData> get loyaltyItemDetailData =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoyaltyItemDetailModelCopyWith<LoyaltyItemDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyItemDetailModelCopyWith<$Res> {
  factory $LoyaltyItemDetailModelCopyWith(LoyaltyItemDetailModel value,
          $Res Function(LoyaltyItemDetailModel) then) =
      _$LoyaltyItemDetailModelCopyWithImpl<$Res, LoyaltyItemDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'data')
          List<LoyaltyItemDetailData> loyaltyItemDetailData});
}

/// @nodoc
class _$LoyaltyItemDetailModelCopyWithImpl<$Res,
        $Val extends LoyaltyItemDetailModel>
    implements $LoyaltyItemDetailModelCopyWith<$Res> {
  _$LoyaltyItemDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loyaltyItemDetailData = null,
  }) {
    return _then(_value.copyWith(
      loyaltyItemDetailData: null == loyaltyItemDetailData
          ? _value.loyaltyItemDetailData
          : loyaltyItemDetailData // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyItemDetailData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoyaltyItemDetailModelCopyWith<$Res>
    implements $LoyaltyItemDetailModelCopyWith<$Res> {
  factory _$$_LoyaltyItemDetailModelCopyWith(_$_LoyaltyItemDetailModel value,
          $Res Function(_$_LoyaltyItemDetailModel) then) =
      __$$_LoyaltyItemDetailModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'data')
          List<LoyaltyItemDetailData> loyaltyItemDetailData});
}

/// @nodoc
class __$$_LoyaltyItemDetailModelCopyWithImpl<$Res>
    extends _$LoyaltyItemDetailModelCopyWithImpl<$Res,
        _$_LoyaltyItemDetailModel>
    implements _$$_LoyaltyItemDetailModelCopyWith<$Res> {
  __$$_LoyaltyItemDetailModelCopyWithImpl(_$_LoyaltyItemDetailModel _value,
      $Res Function(_$_LoyaltyItemDetailModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loyaltyItemDetailData = null,
  }) {
    return _then(_$_LoyaltyItemDetailModel(
      loyaltyItemDetailData: null == loyaltyItemDetailData
          ? _value.loyaltyItemDetailData
          : loyaltyItemDetailData // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyItemDetailData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoyaltyItemDetailModel implements _LoyaltyItemDetailModel {
  const _$_LoyaltyItemDetailModel(
      {@JsonKey(name: 'data') this.loyaltyItemDetailData = const []});

  factory _$_LoyaltyItemDetailModel.fromJson(Map<String, dynamic> json) =>
      _$$_LoyaltyItemDetailModelFromJson(json);

  @override
  @JsonKey(name: 'data')
  final List<LoyaltyItemDetailData> loyaltyItemDetailData;

  @override
  String toString() {
    return 'LoyaltyItemDetailModel(loyaltyItemDetailData: $loyaltyItemDetailData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoyaltyItemDetailModel &&
            const DeepCollectionEquality()
                .equals(other.loyaltyItemDetailData, loyaltyItemDetailData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loyaltyItemDetailData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoyaltyItemDetailModelCopyWith<_$_LoyaltyItemDetailModel> get copyWith =>
      __$$_LoyaltyItemDetailModelCopyWithImpl<_$_LoyaltyItemDetailModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoyaltyItemDetailModelToJson(
      this,
    );
  }
}

abstract class _LoyaltyItemDetailModel implements LoyaltyItemDetailModel {
  const factory _LoyaltyItemDetailModel(
          {@JsonKey(name: 'data')
              final List<LoyaltyItemDetailData> loyaltyItemDetailData}) =
      _$_LoyaltyItemDetailModel;

  factory _LoyaltyItemDetailModel.fromJson(Map<String, dynamic> json) =
      _$_LoyaltyItemDetailModel.fromJson;

  @override
  @JsonKey(name: 'data')
  List<LoyaltyItemDetailData> get loyaltyItemDetailData;
  @override
  @JsonKey(ignore: true)
  _$$_LoyaltyItemDetailModelCopyWith<_$_LoyaltyItemDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

LoyaltyItemDetailData _$LoyaltyItemDetailDataFromJson(
    Map<String, dynamic> json) {
  return _LoyaltyItemDetailData.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyItemDetailData {
  String get name => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoyaltyItemDetailDataCopyWith<LoyaltyItemDetailData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyItemDetailDataCopyWith<$Res> {
  factory $LoyaltyItemDetailDataCopyWith(LoyaltyItemDetailData value,
          $Res Function(LoyaltyItemDetailData) then) =
      _$LoyaltyItemDetailDataCopyWithImpl<$Res, LoyaltyItemDetailData>;
  @useResult
  $Res call({String name, int quantity, int price});
}

/// @nodoc
class _$LoyaltyItemDetailDataCopyWithImpl<$Res,
        $Val extends LoyaltyItemDetailData>
    implements $LoyaltyItemDetailDataCopyWith<$Res> {
  _$LoyaltyItemDetailDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoyaltyItemDetailDataCopyWith<$Res>
    implements $LoyaltyItemDetailDataCopyWith<$Res> {
  factory _$$_LoyaltyItemDetailDataCopyWith(_$_LoyaltyItemDetailData value,
          $Res Function(_$_LoyaltyItemDetailData) then) =
      __$$_LoyaltyItemDetailDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int quantity, int price});
}

/// @nodoc
class __$$_LoyaltyItemDetailDataCopyWithImpl<$Res>
    extends _$LoyaltyItemDetailDataCopyWithImpl<$Res, _$_LoyaltyItemDetailData>
    implements _$$_LoyaltyItemDetailDataCopyWith<$Res> {
  __$$_LoyaltyItemDetailDataCopyWithImpl(_$_LoyaltyItemDetailData _value,
      $Res Function(_$_LoyaltyItemDetailData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_$_LoyaltyItemDetailData(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoyaltyItemDetailData implements _LoyaltyItemDetailData {
  const _$_LoyaltyItemDetailData(
      {this.name = '', this.quantity = 0, this.price = 0});

  factory _$_LoyaltyItemDetailData.fromJson(Map<String, dynamic> json) =>
      _$$_LoyaltyItemDetailDataFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final int price;

  @override
  String toString() {
    return 'LoyaltyItemDetailData(name: $name, quantity: $quantity, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoyaltyItemDetailData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, quantity, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoyaltyItemDetailDataCopyWith<_$_LoyaltyItemDetailData> get copyWith =>
      __$$_LoyaltyItemDetailDataCopyWithImpl<_$_LoyaltyItemDetailData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoyaltyItemDetailDataToJson(
      this,
    );
  }
}

abstract class _LoyaltyItemDetailData implements LoyaltyItemDetailData {
  const factory _LoyaltyItemDetailData(
      {final String name,
      final int quantity,
      final int price}) = _$_LoyaltyItemDetailData;

  factory _LoyaltyItemDetailData.fromJson(Map<String, dynamic> json) =
      _$_LoyaltyItemDetailData.fromJson;

  @override
  String get name;
  @override
  int get quantity;
  @override
  int get price;
  @override
  @JsonKey(ignore: true)
  _$$_LoyaltyItemDetailDataCopyWith<_$_LoyaltyItemDetailData> get copyWith =>
      throw _privateConstructorUsedError;
}
