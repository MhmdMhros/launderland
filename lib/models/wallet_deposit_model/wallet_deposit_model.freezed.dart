// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_deposit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WalletDepositModel _$WalletDepositModelFromJson(Map<String, dynamic> json) {
  return _WalletDepositModel.fromJson(json);
}

/// @nodoc
mixin _$WalletDepositModel {
  int? get id => throw _privateConstructorUsedError;
  int? get payable_id => throw _privateConstructorUsedError;
  int? get payer_id => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  PaymentMethod? get payment_method => throw _privateConstructorUsedError;

  /// Serializes this WalletDepositModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletDepositModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletDepositModelCopyWith<WalletDepositModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletDepositModelCopyWith<$Res> {
  factory $WalletDepositModelCopyWith(
          WalletDepositModel value, $Res Function(WalletDepositModel) then) =
      _$WalletDepositModelCopyWithImpl<$Res, WalletDepositModel>;
  @useResult
  $Res call(
      {int? id,
      int? payable_id,
      int? payer_id,
      int? amount,
      String? status,
      PaymentMethod? payment_method});

  $PaymentMethodCopyWith<$Res>? get payment_method;
}

/// @nodoc
class _$WalletDepositModelCopyWithImpl<$Res, $Val extends WalletDepositModel>
    implements $WalletDepositModelCopyWith<$Res> {
  _$WalletDepositModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletDepositModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? payable_id = freezed,
    Object? payer_id = freezed,
    Object? amount = freezed,
    Object? status = freezed,
    Object? payment_method = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      payable_id: freezed == payable_id
          ? _value.payable_id
          : payable_id // ignore: cast_nullable_to_non_nullable
              as int?,
      payer_id: freezed == payer_id
          ? _value.payer_id
          : payer_id // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      payment_method: freezed == payment_method
          ? _value.payment_method
          : payment_method // ignore: cast_nullable_to_non_nullable
              as PaymentMethod?,
    ) as $Val);
  }

  /// Create a copy of WalletDepositModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodCopyWith<$Res>? get payment_method {
    if (_value.payment_method == null) {
      return null;
    }

    return $PaymentMethodCopyWith<$Res>(_value.payment_method!, (value) {
      return _then(_value.copyWith(payment_method: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WalletDepositModelImplCopyWith<$Res>
    implements $WalletDepositModelCopyWith<$Res> {
  factory _$$WalletDepositModelImplCopyWith(_$WalletDepositModelImpl value,
          $Res Function(_$WalletDepositModelImpl) then) =
      __$$WalletDepositModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? payable_id,
      int? payer_id,
      int? amount,
      String? status,
      PaymentMethod? payment_method});

  @override
  $PaymentMethodCopyWith<$Res>? get payment_method;
}

/// @nodoc
class __$$WalletDepositModelImplCopyWithImpl<$Res>
    extends _$WalletDepositModelCopyWithImpl<$Res, _$WalletDepositModelImpl>
    implements _$$WalletDepositModelImplCopyWith<$Res> {
  __$$WalletDepositModelImplCopyWithImpl(_$WalletDepositModelImpl _value,
      $Res Function(_$WalletDepositModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletDepositModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? payable_id = freezed,
    Object? payer_id = freezed,
    Object? amount = freezed,
    Object? status = freezed,
    Object? payment_method = freezed,
  }) {
    return _then(_$WalletDepositModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      payable_id: freezed == payable_id
          ? _value.payable_id
          : payable_id // ignore: cast_nullable_to_non_nullable
              as int?,
      payer_id: freezed == payer_id
          ? _value.payer_id
          : payer_id // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      payment_method: freezed == payment_method
          ? _value.payment_method
          : payment_method // ignore: cast_nullable_to_non_nullable
              as PaymentMethod?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletDepositModelImpl
    with DiagnosticableTreeMixin
    implements _WalletDepositModel {
  _$WalletDepositModelImpl(
      {this.id,
      this.payable_id,
      this.payer_id,
      this.amount,
      this.status,
      this.payment_method});

  factory _$WalletDepositModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletDepositModelImplFromJson(json);

  @override
  final int? id;
  @override
  final int? payable_id;
  @override
  final int? payer_id;
  @override
  final int? amount;
  @override
  final String? status;
  @override
  final PaymentMethod? payment_method;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletDepositModel(id: $id, payable_id: $payable_id, payer_id: $payer_id, amount: $amount, status: $status, payment_method: $payment_method)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalletDepositModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('payable_id', payable_id))
      ..add(DiagnosticsProperty('payer_id', payer_id))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('payment_method', payment_method));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletDepositModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.payable_id, payable_id) ||
                other.payable_id == payable_id) &&
            (identical(other.payer_id, payer_id) ||
                other.payer_id == payer_id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.payment_method, payment_method) ||
                other.payment_method == payment_method));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, payable_id, payer_id, amount, status, payment_method);

  /// Create a copy of WalletDepositModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletDepositModelImplCopyWith<_$WalletDepositModelImpl> get copyWith =>
      __$$WalletDepositModelImplCopyWithImpl<_$WalletDepositModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletDepositModelImplToJson(
      this,
    );
  }
}

abstract class _WalletDepositModel implements WalletDepositModel {
  factory _WalletDepositModel(
      {final int? id,
      final int? payable_id,
      final int? payer_id,
      final int? amount,
      final String? status,
      final PaymentMethod? payment_method}) = _$WalletDepositModelImpl;

  factory _WalletDepositModel.fromJson(Map<String, dynamic> json) =
      _$WalletDepositModelImpl.fromJson;

  @override
  int? get id;
  @override
  int? get payable_id;
  @override
  int? get payer_id;
  @override
  int? get amount;
  @override
  String? get status;
  @override
  PaymentMethod? get payment_method;

  /// Create a copy of WalletDepositModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletDepositModelImplCopyWith<_$WalletDepositModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) {
  return _PaymentMethod.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethod {
  int? get id => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  TitleTranslations? get title_translations =>
      throw _privateConstructorUsedError;
  String? get meta => throw _privateConstructorUsedError;
  int? get enabled => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodCopyWith<PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodCopyWith<$Res> {
  factory $PaymentMethodCopyWith(
          PaymentMethod value, $Res Function(PaymentMethod) then) =
      _$PaymentMethodCopyWithImpl<$Res, PaymentMethod>;
  @useResult
  $Res call(
      {int? id,
      String? slug,
      String? title,
      TitleTranslations? title_translations,
      String? meta,
      int? enabled,
      String? type});

  $TitleTranslationsCopyWith<$Res>? get title_translations;
}

/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res, $Val extends PaymentMethod>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? title = freezed,
    Object? title_translations = freezed,
    Object? meta = freezed,
    Object? enabled = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      title_translations: freezed == title_translations
          ? _value.title_translations
          : title_translations // ignore: cast_nullable_to_non_nullable
              as TitleTranslations?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as String?,
      enabled: freezed == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TitleTranslationsCopyWith<$Res>? get title_translations {
    if (_value.title_translations == null) {
      return null;
    }

    return $TitleTranslationsCopyWith<$Res>(_value.title_translations!,
        (value) {
      return _then(_value.copyWith(title_translations: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentMethodImplCopyWith<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  factory _$$PaymentMethodImplCopyWith(
          _$PaymentMethodImpl value, $Res Function(_$PaymentMethodImpl) then) =
      __$$PaymentMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? slug,
      String? title,
      TitleTranslations? title_translations,
      String? meta,
      int? enabled,
      String? type});

  @override
  $TitleTranslationsCopyWith<$Res>? get title_translations;
}

/// @nodoc
class __$$PaymentMethodImplCopyWithImpl<$Res>
    extends _$PaymentMethodCopyWithImpl<$Res, _$PaymentMethodImpl>
    implements _$$PaymentMethodImplCopyWith<$Res> {
  __$$PaymentMethodImplCopyWithImpl(
      _$PaymentMethodImpl _value, $Res Function(_$PaymentMethodImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? title = freezed,
    Object? title_translations = freezed,
    Object? meta = freezed,
    Object? enabled = freezed,
    Object? type = freezed,
  }) {
    return _then(_$PaymentMethodImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      title_translations: freezed == title_translations
          ? _value.title_translations
          : title_translations // ignore: cast_nullable_to_non_nullable
              as TitleTranslations?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as String?,
      enabled: freezed == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodImpl
    with DiagnosticableTreeMixin
    implements _PaymentMethod {
  _$PaymentMethodImpl(
      {this.id,
      this.slug,
      this.title,
      this.title_translations,
      this.meta,
      this.enabled,
      this.type});

  factory _$PaymentMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodImplFromJson(json);

  @override
  final int? id;
  @override
  final String? slug;
  @override
  final String? title;
  @override
  final TitleTranslations? title_translations;
  @override
  final String? meta;
  @override
  final int? enabled;
  @override
  final String? type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymentMethod(id: $id, slug: $slug, title: $title, title_translations: $title_translations, meta: $meta, enabled: $enabled, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaymentMethod'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('title_translations', title_translations))
      ..add(DiagnosticsProperty('meta', meta))
      ..add(DiagnosticsProperty('enabled', enabled))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.title_translations, title_translations) ||
                other.title_translations == title_translations) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, slug, title, title_translations, meta, enabled, type);

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      __$$PaymentMethodImplCopyWithImpl<_$PaymentMethodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethod implements PaymentMethod {
  factory _PaymentMethod(
      {final int? id,
      final String? slug,
      final String? title,
      final TitleTranslations? title_translations,
      final String? meta,
      final int? enabled,
      final String? type}) = _$PaymentMethodImpl;

  factory _PaymentMethod.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodImpl.fromJson;

  @override
  int? get id;
  @override
  String? get slug;
  @override
  String? get title;
  @override
  TitleTranslations? get title_translations;
  @override
  String? get meta;
  @override
  int? get enabled;
  @override
  String? get type;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
