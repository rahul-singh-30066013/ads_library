// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_retrieve_member_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoyaltyRetrieveMemberModel _$LoyaltyRetrieveMemberModelFromJson(
    Map<String, dynamic> json) {
  return _LoyaltyRetrieveMemberModel.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyRetrieveMemberModel {
  String get mobileNumber => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get referralCode => throw _privateConstructorUsedError;
  String get referralLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoyaltyRetrieveMemberModelCopyWith<LoyaltyRetrieveMemberModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyRetrieveMemberModelCopyWith<$Res> {
  factory $LoyaltyRetrieveMemberModelCopyWith(LoyaltyRetrieveMemberModel value,
          $Res Function(LoyaltyRetrieveMemberModel) then) =
      _$LoyaltyRetrieveMemberModelCopyWithImpl<$Res,
          LoyaltyRetrieveMemberModel>;
  @useResult
  $Res call(
      {String mobileNumber,
      String firstName,
      String lastName,
      String referralCode,
      String referralLink});
}

/// @nodoc
class _$LoyaltyRetrieveMemberModelCopyWithImpl<$Res,
        $Val extends LoyaltyRetrieveMemberModel>
    implements $LoyaltyRetrieveMemberModelCopyWith<$Res> {
  _$LoyaltyRetrieveMemberModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobileNumber = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? referralCode = null,
    Object? referralLink = null,
  }) {
    return _then(_value.copyWith(
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      referralLink: null == referralLink
          ? _value.referralLink
          : referralLink // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoyaltyRetrieveMemberModelCopyWith<$Res>
    implements $LoyaltyRetrieveMemberModelCopyWith<$Res> {
  factory _$$_LoyaltyRetrieveMemberModelCopyWith(
          _$_LoyaltyRetrieveMemberModel value,
          $Res Function(_$_LoyaltyRetrieveMemberModel) then) =
      __$$_LoyaltyRetrieveMemberModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mobileNumber,
      String firstName,
      String lastName,
      String referralCode,
      String referralLink});
}

/// @nodoc
class __$$_LoyaltyRetrieveMemberModelCopyWithImpl<$Res>
    extends _$LoyaltyRetrieveMemberModelCopyWithImpl<$Res,
        _$_LoyaltyRetrieveMemberModel>
    implements _$$_LoyaltyRetrieveMemberModelCopyWith<$Res> {
  __$$_LoyaltyRetrieveMemberModelCopyWithImpl(
      _$_LoyaltyRetrieveMemberModel _value,
      $Res Function(_$_LoyaltyRetrieveMemberModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobileNumber = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? referralCode = null,
    Object? referralLink = null,
  }) {
    return _then(_$_LoyaltyRetrieveMemberModel(
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
      referralLink: null == referralLink
          ? _value.referralLink
          : referralLink // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoyaltyRetrieveMemberModel implements _LoyaltyRetrieveMemberModel {
  const _$_LoyaltyRetrieveMemberModel(
      {this.mobileNumber = '',
      this.firstName = '',
      this.lastName = '',
      this.referralCode = '',
      this.referralLink = ''});

  factory _$_LoyaltyRetrieveMemberModel.fromJson(Map<String, dynamic> json) =>
      _$$_LoyaltyRetrieveMemberModelFromJson(json);

  @override
  @JsonKey()
  final String mobileNumber;
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;
  @override
  @JsonKey()
  final String referralCode;
  @override
  @JsonKey()
  final String referralLink;

  @override
  String toString() {
    return 'LoyaltyRetrieveMemberModel(mobileNumber: $mobileNumber, firstName: $firstName, lastName: $lastName, referralCode: $referralCode, referralLink: $referralLink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoyaltyRetrieveMemberModel &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.referralLink, referralLink) ||
                other.referralLink == referralLink));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mobileNumber, firstName,
      lastName, referralCode, referralLink);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoyaltyRetrieveMemberModelCopyWith<_$_LoyaltyRetrieveMemberModel>
      get copyWith => __$$_LoyaltyRetrieveMemberModelCopyWithImpl<
          _$_LoyaltyRetrieveMemberModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoyaltyRetrieveMemberModelToJson(
      this,
    );
  }
}

abstract class _LoyaltyRetrieveMemberModel
    implements LoyaltyRetrieveMemberModel {
  const factory _LoyaltyRetrieveMemberModel(
      {final String mobileNumber,
      final String firstName,
      final String lastName,
      final String referralCode,
      final String referralLink}) = _$_LoyaltyRetrieveMemberModel;

  factory _LoyaltyRetrieveMemberModel.fromJson(Map<String, dynamic> json) =
      _$_LoyaltyRetrieveMemberModel.fromJson;

  @override
  String get mobileNumber;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get referralCode;
  @override
  String get referralLink;
  @override
  @JsonKey(ignore: true)
  _$$_LoyaltyRetrieveMemberModelCopyWith<_$_LoyaltyRetrieveMemberModel>
      get copyWith => throw _privateConstructorUsedError;
}
