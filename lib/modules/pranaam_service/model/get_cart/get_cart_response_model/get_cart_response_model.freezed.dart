// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_cart_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetCartResponseModel _$GetCartResponseModelFromJson(Map<String, dynamic> json) {
  return _GetCartResponseModel.fromJson(json);
}

/// @nodoc
mixin _$GetCartResponseModel {
  CartResponse get cartResponse => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetCartResponseModelCopyWith<GetCartResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCartResponseModelCopyWith<$Res> {
  factory $GetCartResponseModelCopyWith(GetCartResponseModel value,
          $Res Function(GetCartResponseModel) then) =
      _$GetCartResponseModelCopyWithImpl<$Res, GetCartResponseModel>;
  @useResult
  $Res call({CartResponse cartResponse});

  $CartResponseCopyWith<$Res> get cartResponse;
}

/// @nodoc
class _$GetCartResponseModelCopyWithImpl<$Res,
        $Val extends GetCartResponseModel>
    implements $GetCartResponseModelCopyWith<$Res> {
  _$GetCartResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartResponse = null,
  }) {
    return _then(_value.copyWith(
      cartResponse: null == cartResponse
          ? _value.cartResponse
          : cartResponse // ignore: cast_nullable_to_non_nullable
              as CartResponse,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CartResponseCopyWith<$Res> get cartResponse {
    return $CartResponseCopyWith<$Res>(_value.cartResponse, (value) {
      return _then(_value.copyWith(cartResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GetCartResponseModelCopyWith<$Res>
    implements $GetCartResponseModelCopyWith<$Res> {
  factory _$$_GetCartResponseModelCopyWith(_$_GetCartResponseModel value,
          $Res Function(_$_GetCartResponseModel) then) =
      __$$_GetCartResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CartResponse cartResponse});

  @override
  $CartResponseCopyWith<$Res> get cartResponse;
}

/// @nodoc
class __$$_GetCartResponseModelCopyWithImpl<$Res>
    extends _$GetCartResponseModelCopyWithImpl<$Res, _$_GetCartResponseModel>
    implements _$$_GetCartResponseModelCopyWith<$Res> {
  __$$_GetCartResponseModelCopyWithImpl(_$_GetCartResponseModel _value,
      $Res Function(_$_GetCartResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartResponse = null,
  }) {
    return _then(_$_GetCartResponseModel(
      cartResponse: null == cartResponse
          ? _value.cartResponse
          : cartResponse // ignore: cast_nullable_to_non_nullable
              as CartResponse,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetCartResponseModel implements _GetCartResponseModel {
  const _$_GetCartResponseModel({required this.cartResponse});

  factory _$_GetCartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_GetCartResponseModelFromJson(json);

  @override
  final CartResponse cartResponse;

  @override
  String toString() {
    return 'GetCartResponseModel(cartResponse: $cartResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetCartResponseModel &&
            (identical(other.cartResponse, cartResponse) ||
                other.cartResponse == cartResponse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cartResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetCartResponseModelCopyWith<_$_GetCartResponseModel> get copyWith =>
      __$$_GetCartResponseModelCopyWithImpl<_$_GetCartResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetCartResponseModelToJson(
      this,
    );
  }
}

abstract class _GetCartResponseModel implements GetCartResponseModel {
  const factory _GetCartResponseModel(
      {required final CartResponse cartResponse}) = _$_GetCartResponseModel;

  factory _GetCartResponseModel.fromJson(Map<String, dynamic> json) =
      _$_GetCartResponseModel.fromJson;

  @override
  CartResponse get cartResponse;
  @override
  @JsonKey(ignore: true)
  _$$_GetCartResponseModelCopyWith<_$_GetCartResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
