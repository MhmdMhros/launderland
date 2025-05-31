// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paymob_meta_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymobMetaModel _$PaymobMetaModelFromJson(Map<String, dynamic> json) {
  return _PaymobMetaModel.fromJson(json);
}

/// @nodoc
mixin _$PaymobMetaModel {
  int? get merchant_order_id => throw _privateConstructorUsedError;
  set merchant_order_id(int? value) => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  set type(String? value) => throw _privateConstructorUsedError;
  String? get delivery_needed => throw _privateConstructorUsedError;
  set delivery_needed(String? value) => throw _privateConstructorUsedError;
  int? get amount_cents => throw _privateConstructorUsedError;
  set amount_cents(int? value) => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  set currency(String? value) => throw _privateConstructorUsedError;
  List<Items>? get items => throw _privateConstructorUsedError;
  set items(List<Items>? value) => throw _privateConstructorUsedError;

  /// Serializes this PaymobMetaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymobMetaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymobMetaModelCopyWith<PaymobMetaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymobMetaModelCopyWith<$Res> {
  factory $PaymobMetaModelCopyWith(
          PaymobMetaModel value, $Res Function(PaymobMetaModel) then) =
      _$PaymobMetaModelCopyWithImpl<$Res, PaymobMetaModel>;
  @useResult
  $Res call(
      {int? merchant_order_id,
      String? type,
      String? delivery_needed,
      int? amount_cents,
      String? currency,
      List<Items>? items});
}

/// @nodoc
class _$PaymobMetaModelCopyWithImpl<$Res, $Val extends PaymobMetaModel>
    implements $PaymobMetaModelCopyWith<$Res> {
  _$PaymobMetaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymobMetaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchant_order_id = freezed,
    Object? type = freezed,
    Object? delivery_needed = freezed,
    Object? amount_cents = freezed,
    Object? currency = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      merchant_order_id: freezed == merchant_order_id
          ? _value.merchant_order_id
          : merchant_order_id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      delivery_needed: freezed == delivery_needed
          ? _value.delivery_needed
          : delivery_needed // ignore: cast_nullable_to_non_nullable
              as String?,
      amount_cents: freezed == amount_cents
          ? _value.amount_cents
          : amount_cents // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Items>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymobMetaModelImplCopyWith<$Res>
    implements $PaymobMetaModelCopyWith<$Res> {
  factory _$$PaymobMetaModelImplCopyWith(_$PaymobMetaModelImpl value,
          $Res Function(_$PaymobMetaModelImpl) then) =
      __$$PaymobMetaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? merchant_order_id,
      String? type,
      String? delivery_needed,
      int? amount_cents,
      String? currency,
      List<Items>? items});
}

/// @nodoc
class __$$PaymobMetaModelImplCopyWithImpl<$Res>
    extends _$PaymobMetaModelCopyWithImpl<$Res, _$PaymobMetaModelImpl>
    implements _$$PaymobMetaModelImplCopyWith<$Res> {
  __$$PaymobMetaModelImplCopyWithImpl(
      _$PaymobMetaModelImpl _value, $Res Function(_$PaymobMetaModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymobMetaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchant_order_id = freezed,
    Object? type = freezed,
    Object? delivery_needed = freezed,
    Object? amount_cents = freezed,
    Object? currency = freezed,
    Object? items = freezed,
  }) {
    return _then(_$PaymobMetaModelImpl(
      merchant_order_id: freezed == merchant_order_id
          ? _value.merchant_order_id
          : merchant_order_id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      delivery_needed: freezed == delivery_needed
          ? _value.delivery_needed
          : delivery_needed // ignore: cast_nullable_to_non_nullable
              as String?,
      amount_cents: freezed == amount_cents
          ? _value.amount_cents
          : amount_cents // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Items>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymobMetaModelImpl
    with DiagnosticableTreeMixin
    implements _PaymobMetaModel {
  _$PaymobMetaModelImpl(
      {this.merchant_order_id,
      this.type,
      this.delivery_needed,
      this.amount_cents,
      this.currency,
      this.items});

  factory _$PaymobMetaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymobMetaModelImplFromJson(json);

  @override
  int? merchant_order_id;
  @override
  String? type;
  @override
  String? delivery_needed;
  @override
  int? amount_cents;
  @override
  String? currency;
  @override
  List<Items>? items;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymobMetaModel(merchant_order_id: $merchant_order_id, type: $type, delivery_needed: $delivery_needed, amount_cents: $amount_cents, currency: $currency, items: $items)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaymobMetaModel'))
      ..add(DiagnosticsProperty('merchant_order_id', merchant_order_id))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('delivery_needed', delivery_needed))
      ..add(DiagnosticsProperty('amount_cents', amount_cents))
      ..add(DiagnosticsProperty('currency', currency))
      ..add(DiagnosticsProperty('items', items));
  }

  /// Create a copy of PaymobMetaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymobMetaModelImplCopyWith<_$PaymobMetaModelImpl> get copyWith =>
      __$$PaymobMetaModelImplCopyWithImpl<_$PaymobMetaModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymobMetaModelImplToJson(
      this,
    );
  }
}

abstract class _PaymobMetaModel implements PaymobMetaModel {
  factory _PaymobMetaModel(
      {int? merchant_order_id,
      String? type,
      String? delivery_needed,
      int? amount_cents,
      String? currency,
      List<Items>? items}) = _$PaymobMetaModelImpl;

  factory _PaymobMetaModel.fromJson(Map<String, dynamic> json) =
      _$PaymobMetaModelImpl.fromJson;

  @override
  int? get merchant_order_id;
  set merchant_order_id(int? value);
  @override
  String? get type;
  set type(String? value);
  @override
  String? get delivery_needed;
  set delivery_needed(String? value);
  @override
  int? get amount_cents;
  set amount_cents(int? value);
  @override
  String? get currency;
  set currency(String? value);
  @override
  List<Items>? get items;
  set items(List<Items>? value);

  /// Create a copy of PaymobMetaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymobMetaModelImplCopyWith<_$PaymobMetaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return _Items.fromJson(json);
}

/// @nodoc
mixin _$Items {
  String? get name => throw _privateConstructorUsedError;
  set name(String? value) => throw _privateConstructorUsedError;
  int? get amount_cents => throw _privateConstructorUsedError;
  set amount_cents(int? value) => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  set description(String? value) => throw _privateConstructorUsedError;
  String? get quantity => throw _privateConstructorUsedError;
  set quantity(String? value) => throw _privateConstructorUsedError;

  /// Serializes this Items to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Items
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemsCopyWith<Items> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemsCopyWith<$Res> {
  factory $ItemsCopyWith(Items value, $Res Function(Items) then) =
      _$ItemsCopyWithImpl<$Res, Items>;
  @useResult
  $Res call(
      {String? name, int? amount_cents, String? description, String? quantity});
}

/// @nodoc
class _$ItemsCopyWithImpl<$Res, $Val extends Items>
    implements $ItemsCopyWith<$Res> {
  _$ItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Items
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? amount_cents = freezed,
    Object? description = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount_cents: freezed == amount_cents
          ? _value.amount_cents
          : amount_cents // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemsImplCopyWith<$Res> implements $ItemsCopyWith<$Res> {
  factory _$$ItemsImplCopyWith(
          _$ItemsImpl value, $Res Function(_$ItemsImpl) then) =
      __$$ItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name, int? amount_cents, String? description, String? quantity});
}

/// @nodoc
class __$$ItemsImplCopyWithImpl<$Res>
    extends _$ItemsCopyWithImpl<$Res, _$ItemsImpl>
    implements _$$ItemsImplCopyWith<$Res> {
  __$$ItemsImplCopyWithImpl(
      _$ItemsImpl _value, $Res Function(_$ItemsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Items
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? amount_cents = freezed,
    Object? description = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$ItemsImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount_cents: freezed == amount_cents
          ? _value.amount_cents
          : amount_cents // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemsImpl with DiagnosticableTreeMixin implements _Items {
  _$ItemsImpl({this.name, this.amount_cents, this.description, this.quantity});

  factory _$ItemsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemsImplFromJson(json);

  @override
  String? name;
  @override
  int? amount_cents;
  @override
  String? description;
  @override
  String? quantity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Items(name: $name, amount_cents: $amount_cents, description: $description, quantity: $quantity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Items'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('amount_cents', amount_cents))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('quantity', quantity));
  }

  /// Create a copy of Items
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemsImplCopyWith<_$ItemsImpl> get copyWith =>
      __$$ItemsImplCopyWithImpl<_$ItemsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemsImplToJson(
      this,
    );
  }
}

abstract class _Items implements Items {
  factory _Items(
      {String? name,
      int? amount_cents,
      String? description,
      String? quantity}) = _$ItemsImpl;

  factory _Items.fromJson(Map<String, dynamic> json) = _$ItemsImpl.fromJson;

  @override
  String? get name;
  set name(String? value);
  @override
  int? get amount_cents;
  set amount_cents(int? value);
  @override
  String? get description;
  set description(String? value);
  @override
  String? get quantity;
  set quantity(String? value);

  /// Create a copy of Items
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemsImplCopyWith<_$ItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
