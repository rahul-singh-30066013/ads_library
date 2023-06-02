// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionHistory _$TransactionHistoryFromJson(Map<String, dynamic> json) {
  return _TransactionHistory.fromJson(json);
}

/// @nodoc
mixin _$TransactionHistory {
  String? get transactionReferenceId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  PaidBy? get paidBy => throw _privateConstructorUsedError;
  String? get transactionMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionHistoryCopyWith<TransactionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionHistoryCopyWith<$Res> {
  factory $TransactionHistoryCopyWith(
          TransactionHistory value, $Res Function(TransactionHistory) then) =
      _$TransactionHistoryCopyWithImpl<$Res, TransactionHistory>;
  @useResult
  $Res call(
      {String? transactionReferenceId,
      String? status,
      PaidBy? paidBy,
      String? transactionMode});

  $PaidByCopyWith<$Res>? get paidBy;
}

/// @nodoc
class _$TransactionHistoryCopyWithImpl<$Res, $Val extends TransactionHistory>
    implements $TransactionHistoryCopyWith<$Res> {
  _$TransactionHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionReferenceId = freezed,
    Object? status = freezed,
    Object? paidBy = freezed,
    Object? transactionMode = freezed,
  }) {
    return _then(_value.copyWith(
      transactionReferenceId: freezed == transactionReferenceId
          ? _value.transactionReferenceId
          : transactionReferenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      paidBy: freezed == paidBy
          ? _value.paidBy
          : paidBy // ignore: cast_nullable_to_non_nullable
              as PaidBy?,
      transactionMode: freezed == transactionMode
          ? _value.transactionMode
          : transactionMode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaidByCopyWith<$Res>? get paidBy {
    if (_value.paidBy == null) {
      return null;
    }

    return $PaidByCopyWith<$Res>(_value.paidBy!, (value) {
      return _then(_value.copyWith(paidBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TransactionHistoryCopyWith<$Res>
    implements $TransactionHistoryCopyWith<$Res> {
  factory _$$_TransactionHistoryCopyWith(_$_TransactionHistory value,
          $Res Function(_$_TransactionHistory) then) =
      __$$_TransactionHistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? transactionReferenceId,
      String? status,
      PaidBy? paidBy,
      String? transactionMode});

  @override
  $PaidByCopyWith<$Res>? get paidBy;
}

/// @nodoc
class __$$_TransactionHistoryCopyWithImpl<$Res>
    extends _$TransactionHistoryCopyWithImpl<$Res, _$_TransactionHistory>
    implements _$$_TransactionHistoryCopyWith<$Res> {
  __$$_TransactionHistoryCopyWithImpl(
      _$_TransactionHistory _value, $Res Function(_$_TransactionHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionReferenceId = freezed,
    Object? status = freezed,
    Object? paidBy = freezed,
    Object? transactionMode = freezed,
  }) {
    return _then(_$_TransactionHistory(
      transactionReferenceId: freezed == transactionReferenceId
          ? _value.transactionReferenceId
          : transactionReferenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      paidBy: freezed == paidBy
          ? _value.paidBy
          : paidBy // ignore: cast_nullable_to_non_nullable
              as PaidBy?,
      transactionMode: freezed == transactionMode
          ? _value.transactionMode
          : transactionMode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionHistory implements _TransactionHistory {
  const _$_TransactionHistory(
      {this.transactionReferenceId,
      this.status,
      this.paidBy,
      this.transactionMode});

  factory _$_TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionHistoryFromJson(json);

  @override
  final String? transactionReferenceId;
  @override
  final String? status;
  @override
  final PaidBy? paidBy;
  @override
  final String? transactionMode;

  @override
  String toString() {
    return 'TransactionHistory(transactionReferenceId: $transactionReferenceId, status: $status, paidBy: $paidBy, transactionMode: $transactionMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionHistory &&
            (identical(other.transactionReferenceId, transactionReferenceId) ||
                other.transactionReferenceId == transactionReferenceId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paidBy, paidBy) || other.paidBy == paidBy) &&
            (identical(other.transactionMode, transactionMode) ||
                other.transactionMode == transactionMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, transactionReferenceId, status, paidBy, transactionMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionHistoryCopyWith<_$_TransactionHistory> get copyWith =>
      __$$_TransactionHistoryCopyWithImpl<_$_TransactionHistory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionHistoryToJson(
      this,
    );
  }
}

abstract class _TransactionHistory implements TransactionHistory {
  const factory _TransactionHistory(
      {final String? transactionReferenceId,
      final String? status,
      final PaidBy? paidBy,
      final String? transactionMode}) = _$_TransactionHistory;

  factory _TransactionHistory.fromJson(Map<String, dynamic> json) =
      _$_TransactionHistory.fromJson;

  @override
  String? get transactionReferenceId;
  @override
  String? get status;
  @override
  PaidBy? get paidBy;
  @override
  String? get transactionMode;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionHistoryCopyWith<_$_TransactionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

PaidBy _$PaidByFromJson(Map<String, dynamic> json) {
  return _PaidBy.fromJson(json);
}

/// @nodoc
mixin _$PaidBy {
  Bank? get bank => throw _privateConstructorUsedError;
  Bank? get loyalty => throw _privateConstructorUsedError;
  Bank? get promo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaidByCopyWith<PaidBy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaidByCopyWith<$Res> {
  factory $PaidByCopyWith(PaidBy value, $Res Function(PaidBy) then) =
      _$PaidByCopyWithImpl<$Res, PaidBy>;
  @useResult
  $Res call({Bank? bank, Bank? loyalty, Bank? promo});

  $BankCopyWith<$Res>? get bank;
  $BankCopyWith<$Res>? get loyalty;
  $BankCopyWith<$Res>? get promo;
}

/// @nodoc
class _$PaidByCopyWithImpl<$Res, $Val extends PaidBy>
    implements $PaidByCopyWith<$Res> {
  _$PaidByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bank = freezed,
    Object? loyalty = freezed,
    Object? promo = freezed,
  }) {
    return _then(_value.copyWith(
      bank: freezed == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as Bank?,
      loyalty: freezed == loyalty
          ? _value.loyalty
          : loyalty // ignore: cast_nullable_to_non_nullable
              as Bank?,
      promo: freezed == promo
          ? _value.promo
          : promo // ignore: cast_nullable_to_non_nullable
              as Bank?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BankCopyWith<$Res>? get bank {
    if (_value.bank == null) {
      return null;
    }

    return $BankCopyWith<$Res>(_value.bank!, (value) {
      return _then(_value.copyWith(bank: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BankCopyWith<$Res>? get loyalty {
    if (_value.loyalty == null) {
      return null;
    }

    return $BankCopyWith<$Res>(_value.loyalty!, (value) {
      return _then(_value.copyWith(loyalty: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BankCopyWith<$Res>? get promo {
    if (_value.promo == null) {
      return null;
    }

    return $BankCopyWith<$Res>(_value.promo!, (value) {
      return _then(_value.copyWith(promo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PaidByCopyWith<$Res> implements $PaidByCopyWith<$Res> {
  factory _$$_PaidByCopyWith(_$_PaidBy value, $Res Function(_$_PaidBy) then) =
      __$$_PaidByCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Bank? bank, Bank? loyalty, Bank? promo});

  @override
  $BankCopyWith<$Res>? get bank;
  @override
  $BankCopyWith<$Res>? get loyalty;
  @override
  $BankCopyWith<$Res>? get promo;
}

/// @nodoc
class __$$_PaidByCopyWithImpl<$Res>
    extends _$PaidByCopyWithImpl<$Res, _$_PaidBy>
    implements _$$_PaidByCopyWith<$Res> {
  __$$_PaidByCopyWithImpl(_$_PaidBy _value, $Res Function(_$_PaidBy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bank = freezed,
    Object? loyalty = freezed,
    Object? promo = freezed,
  }) {
    return _then(_$_PaidBy(
      bank: freezed == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as Bank?,
      loyalty: freezed == loyalty
          ? _value.loyalty
          : loyalty // ignore: cast_nullable_to_non_nullable
              as Bank?,
      promo: freezed == promo
          ? _value.promo
          : promo // ignore: cast_nullable_to_non_nullable
              as Bank?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaidBy implements _PaidBy {
  const _$_PaidBy({this.bank, this.loyalty, this.promo});

  factory _$_PaidBy.fromJson(Map<String, dynamic> json) =>
      _$$_PaidByFromJson(json);

  @override
  final Bank? bank;
  @override
  final Bank? loyalty;
  @override
  final Bank? promo;

  @override
  String toString() {
    return 'PaidBy(bank: $bank, loyalty: $loyalty, promo: $promo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaidBy &&
            (identical(other.bank, bank) || other.bank == bank) &&
            (identical(other.loyalty, loyalty) || other.loyalty == loyalty) &&
            (identical(other.promo, promo) || other.promo == promo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bank, loyalty, promo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaidByCopyWith<_$_PaidBy> get copyWith =>
      __$$_PaidByCopyWithImpl<_$_PaidBy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaidByToJson(
      this,
    );
  }
}

abstract class _PaidBy implements PaidBy {
  const factory _PaidBy(
      {final Bank? bank, final Bank? loyalty, final Bank? promo}) = _$_PaidBy;

  factory _PaidBy.fromJson(Map<String, dynamic> json) = _$_PaidBy.fromJson;

  @override
  Bank? get bank;
  @override
  Bank? get loyalty;
  @override
  Bank? get promo;
  @override
  @JsonKey(ignore: true)
  _$$_PaidByCopyWith<_$_PaidBy> get copyWith =>
      throw _privateConstructorUsedError;
}

Bank _$BankFromJson(Map<String, dynamic> json) {
  return _Bank.fromJson(json);
}

/// @nodoc
mixin _$Bank {
  double? get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankCopyWith<Bank> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankCopyWith<$Res> {
  factory $BankCopyWith(Bank value, $Res Function(Bank) then) =
      _$BankCopyWithImpl<$Res, Bank>;
  @useResult
  $Res call({double? amount});
}

/// @nodoc
class _$BankCopyWithImpl<$Res, $Val extends Bank>
    implements $BankCopyWith<$Res> {
  _$BankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BankCopyWith<$Res> implements $BankCopyWith<$Res> {
  factory _$$_BankCopyWith(_$_Bank value, $Res Function(_$_Bank) then) =
      __$$_BankCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? amount});
}

/// @nodoc
class __$$_BankCopyWithImpl<$Res> extends _$BankCopyWithImpl<$Res, _$_Bank>
    implements _$$_BankCopyWith<$Res> {
  __$$_BankCopyWithImpl(_$_Bank _value, $Res Function(_$_Bank) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
  }) {
    return _then(_$_Bank(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Bank implements _Bank {
  const _$_Bank({this.amount});

  factory _$_Bank.fromJson(Map<String, dynamic> json) => _$$_BankFromJson(json);

  @override
  final double? amount;

  @override
  String toString() {
    return 'Bank(amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bank &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BankCopyWith<_$_Bank> get copyWith =>
      __$$_BankCopyWithImpl<_$_Bank>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BankToJson(
      this,
    );
  }
}

abstract class _Bank implements Bank {
  const factory _Bank({final double? amount}) = _$_Bank;

  factory _Bank.fromJson(Map<String, dynamic> json) = _$_Bank.fromJson;

  @override
  double? get amount;
  @override
  @JsonKey(ignore: true)
  _$$_BankCopyWith<_$_Bank> get copyWith => throw _privateConstructorUsedError;
}
