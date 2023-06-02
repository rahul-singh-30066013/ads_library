// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_name_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PersonNameModel _$PersonNameModelFromJson(Map<String, dynamic> json) {
  return _PersonNameModel.fromJson(json);
}

/// @nodoc
mixin _$PersonNameModel {
  @JsonKey(name: 'salutationId')
  int get salutationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'salutationText')
  String get salutationText => throw _privateConstructorUsedError;
  @JsonKey(name: 'firstName')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastName')
  String get lastName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonNameModelCopyWith<PersonNameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonNameModelCopyWith<$Res> {
  factory $PersonNameModelCopyWith(
          PersonNameModel value, $Res Function(PersonNameModel) then) =
      _$PersonNameModelCopyWithImpl<$Res, PersonNameModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'salutationId') int salutationId,
      @JsonKey(name: 'salutationText') String salutationText,
      @JsonKey(name: 'firstName') String firstName,
      @JsonKey(name: 'lastName') String lastName});
}

/// @nodoc
class _$PersonNameModelCopyWithImpl<$Res, $Val extends PersonNameModel>
    implements $PersonNameModelCopyWith<$Res> {
  _$PersonNameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salutationId = null,
    Object? salutationText = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_value.copyWith(
      salutationId: null == salutationId
          ? _value.salutationId
          : salutationId // ignore: cast_nullable_to_non_nullable
              as int,
      salutationText: null == salutationText
          ? _value.salutationText
          : salutationText // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PersonNameModelCopyWith<$Res>
    implements $PersonNameModelCopyWith<$Res> {
  factory _$$_PersonNameModelCopyWith(
          _$_PersonNameModel value, $Res Function(_$_PersonNameModel) then) =
      __$$_PersonNameModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'salutationId') int salutationId,
      @JsonKey(name: 'salutationText') String salutationText,
      @JsonKey(name: 'firstName') String firstName,
      @JsonKey(name: 'lastName') String lastName});
}

/// @nodoc
class __$$_PersonNameModelCopyWithImpl<$Res>
    extends _$PersonNameModelCopyWithImpl<$Res, _$_PersonNameModel>
    implements _$$_PersonNameModelCopyWith<$Res> {
  __$$_PersonNameModelCopyWithImpl(
      _$_PersonNameModel _value, $Res Function(_$_PersonNameModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salutationId = null,
    Object? salutationText = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_$_PersonNameModel(
      salutationId: null == salutationId
          ? _value.salutationId
          : salutationId // ignore: cast_nullable_to_non_nullable
              as int,
      salutationText: null == salutationText
          ? _value.salutationText
          : salutationText // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PersonNameModel implements _PersonNameModel {
  const _$_PersonNameModel(
      {@JsonKey(name: 'salutationId') this.salutationId = 0,
      @JsonKey(name: 'salutationText') this.salutationText = '',
      @JsonKey(name: 'firstName') this.firstName = '',
      @JsonKey(name: 'lastName') this.lastName = ''});

  factory _$_PersonNameModel.fromJson(Map<String, dynamic> json) =>
      _$$_PersonNameModelFromJson(json);

  @override
  @JsonKey(name: 'salutationId')
  final int salutationId;
  @override
  @JsonKey(name: 'salutationText')
  final String salutationText;
  @override
  @JsonKey(name: 'firstName')
  final String firstName;
  @override
  @JsonKey(name: 'lastName')
  final String lastName;

  @override
  String toString() {
    return 'PersonNameModel(salutationId: $salutationId, salutationText: $salutationText, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PersonNameModel &&
            (identical(other.salutationId, salutationId) ||
                other.salutationId == salutationId) &&
            (identical(other.salutationText, salutationText) ||
                other.salutationText == salutationText) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, salutationId, salutationText, firstName, lastName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PersonNameModelCopyWith<_$_PersonNameModel> get copyWith =>
      __$$_PersonNameModelCopyWithImpl<_$_PersonNameModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PersonNameModelToJson(
      this,
    );
  }
}

abstract class _PersonNameModel implements PersonNameModel {
  const factory _PersonNameModel(
      {@JsonKey(name: 'salutationId') final int salutationId,
      @JsonKey(name: 'salutationText') final String salutationText,
      @JsonKey(name: 'firstName') final String firstName,
      @JsonKey(name: 'lastName') final String lastName}) = _$_PersonNameModel;

  factory _PersonNameModel.fromJson(Map<String, dynamic> json) =
      _$_PersonNameModel.fromJson;

  @override
  @JsonKey(name: 'salutationId')
  int get salutationId;
  @override
  @JsonKey(name: 'salutationText')
  String get salutationText;
  @override
  @JsonKey(name: 'firstName')
  String get firstName;
  @override
  @JsonKey(name: 'lastName')
  String get lastName;
  @override
  @JsonKey(ignore: true)
  _$$_PersonNameModelCopyWith<_$_PersonNameModel> get copyWith =>
      throw _privateConstructorUsedError;
}
