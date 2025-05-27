// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderRequestModel _$OrderRequestModelFromJson(Map<String, dynamic> json) {
  return _OrderRequestModel.fromJson(json);
}

/// @nodoc
mixin _$OrderRequestModel {
  int? get address_id => throw _privateConstructorUsedError;
  set address_id(int? value) => throw _privateConstructorUsedError;
  int? get payment_method_id => throw _privateConstructorUsedError;
  set payment_method_id(int? value) => throw _privateConstructorUsedError;
  String? get payment_method_slug => throw _privateConstructorUsedError;
  set payment_method_slug(String? value) => throw _privateConstructorUsedError;
  String? get coupon_code => throw _privateConstructorUsedError;
  set coupon_code(String? value) => throw _privateConstructorUsedError;
  List<Product>? get products => throw _privateConstructorUsedError;
  set products(List<Product>? value) => throw _privateConstructorUsedError;
  String? get meta => throw _privateConstructorUsedError;
  set meta(String? value) => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  set notes(String? value) => throw _privateConstructorUsedError;
  String? get order_type => throw _privateConstructorUsedError;
  set order_type(String? value) => throw _privateConstructorUsedError;
  double? get wallet_balance => throw _privateConstructorUsedError;
  set wallet_balance(double? value) => throw _privateConstructorUsedError;

  /// Serializes this OrderRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderRequestModelCopyWith<OrderRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderRequestModelCopyWith<$Res> {
  factory $OrderRequestModelCopyWith(
          OrderRequestModel value, $Res Function(OrderRequestModel) then) =
      _$OrderRequestModelCopyWithImpl<$Res, OrderRequestModel>;
  @useResult
  $Res call(
      {int? address_id,
      int? payment_method_id,
      String? payment_method_slug,
      String? coupon_code,
      List<Product>? products,
      String? meta,
      String? notes,
      String? order_type,
      double? wallet_balance});
}

/// @nodoc
class _$OrderRequestModelCopyWithImpl<$Res, $Val extends OrderRequestModel>
    implements $OrderRequestModelCopyWith<$Res> {
  _$OrderRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address_id = freezed,
    Object? payment_method_id = freezed,
    Object? payment_method_slug = freezed,
    Object? coupon_code = freezed,
    Object? products = freezed,
    Object? meta = freezed,
    Object? notes = freezed,
    Object? order_type = freezed,
    Object? wallet_balance = freezed,
  }) {
    return _then(_value.copyWith(
      address_id: freezed == address_id
          ? _value.address_id
          : address_id // ignore: cast_nullable_to_non_nullable
              as int?,
      payment_method_id: freezed == payment_method_id
          ? _value.payment_method_id
          : payment_method_id // ignore: cast_nullable_to_non_nullable
              as int?,
      payment_method_slug: freezed == payment_method_slug
          ? _value.payment_method_slug
          : payment_method_slug // ignore: cast_nullable_to_non_nullable
              as String?,
      coupon_code: freezed == coupon_code
          ? _value.coupon_code
          : coupon_code // ignore: cast_nullable_to_non_nullable
              as String?,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      order_type: freezed == order_type
          ? _value.order_type
          : order_type // ignore: cast_nullable_to_non_nullable
              as String?,
      wallet_balance: freezed == wallet_balance
          ? _value.wallet_balance
          : wallet_balance // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderRequestModelImplCopyWith<$Res>
    implements $OrderRequestModelCopyWith<$Res> {
  factory _$$OrderRequestModelImplCopyWith(_$OrderRequestModelImpl value,
          $Res Function(_$OrderRequestModelImpl) then) =
      __$$OrderRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? address_id,
      int? payment_method_id,
      String? payment_method_slug,
      String? coupon_code,
      List<Product>? products,
      String? meta,
      String? notes,
      String? order_type,
      double? wallet_balance});
}

/// @nodoc
class __$$OrderRequestModelImplCopyWithImpl<$Res>
    extends _$OrderRequestModelCopyWithImpl<$Res, _$OrderRequestModelImpl>
    implements _$$OrderRequestModelImplCopyWith<$Res> {
  __$$OrderRequestModelImplCopyWithImpl(_$OrderRequestModelImpl _value,
      $Res Function(_$OrderRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address_id = freezed,
    Object? payment_method_id = freezed,
    Object? payment_method_slug = freezed,
    Object? coupon_code = freezed,
    Object? products = freezed,
    Object? meta = freezed,
    Object? notes = freezed,
    Object? order_type = freezed,
    Object? wallet_balance = freezed,
  }) {
    return _then(_$OrderRequestModelImpl(
      address_id: freezed == address_id
          ? _value.address_id
          : address_id // ignore: cast_nullable_to_non_nullable
              as int?,
      payment_method_id: freezed == payment_method_id
          ? _value.payment_method_id
          : payment_method_id // ignore: cast_nullable_to_non_nullable
              as int?,
      payment_method_slug: freezed == payment_method_slug
          ? _value.payment_method_slug
          : payment_method_slug // ignore: cast_nullable_to_non_nullable
              as String?,
      coupon_code: freezed == coupon_code
          ? _value.coupon_code
          : coupon_code // ignore: cast_nullable_to_non_nullable
              as String?,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      order_type: freezed == order_type
          ? _value.order_type
          : order_type // ignore: cast_nullable_to_non_nullable
              as String?,
      wallet_balance: freezed == wallet_balance
          ? _value.wallet_balance
          : wallet_balance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderRequestModelImpl implements _OrderRequestModel {
  _$OrderRequestModelImpl(
      {this.address_id,
      this.payment_method_id,
      this.payment_method_slug,
      this.coupon_code,
      this.products,
      this.meta,
      this.notes,
      this.order_type,
      this.wallet_balance});

  factory _$OrderRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderRequestModelImplFromJson(json);

  @override
  int? address_id;
  @override
  int? payment_method_id;
  @override
  String? payment_method_slug;
  @override
  String? coupon_code;
  @override
  List<Product>? products;
  @override
  String? meta;
  @override
  String? notes;
  @override
  String? order_type;
  @override
  double? wallet_balance;

  @override
  String toString() {
    return 'OrderRequestModel(address_id: $address_id, payment_method_id: $payment_method_id, payment_method_slug: $payment_method_slug, coupon_code: $coupon_code, products: $products, meta: $meta, notes: $notes, order_type: $order_type, wallet_balance: $wallet_balance)';
  }

  /// Create a copy of OrderRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderRequestModelImplCopyWith<_$OrderRequestModelImpl> get copyWith =>
      __$$OrderRequestModelImplCopyWithImpl<_$OrderRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderRequestModelImplToJson(
      this,
    );
  }
}

abstract class _OrderRequestModel implements OrderRequestModel {
  factory _OrderRequestModel(
      {int? address_id,
      int? payment_method_id,
      String? payment_method_slug,
      String? coupon_code,
      List<Product>? products,
      String? meta,
      String? notes,
      String? order_type,
      double? wallet_balance}) = _$OrderRequestModelImpl;

  factory _OrderRequestModel.fromJson(Map<String, dynamic> json) =
      _$OrderRequestModelImpl.fromJson;

  @override
  int? get address_id;
  set address_id(int? value);
  @override
  int? get payment_method_id;
  set payment_method_id(int? value);
  @override
  String? get payment_method_slug;
  set payment_method_slug(String? value);
  @override
  String? get coupon_code;
  set coupon_code(String? value);
  @override
  List<Product>? get products;
  set products(List<Product>? value);
  @override
  String? get meta;
  set meta(String? value);
  @override
  String? get notes;
  set notes(String? value);
  @override
  String? get order_type;
  set order_type(String? value);
  @override
  double? get wallet_balance;
  set wallet_balance(double? value);

  /// Create a copy of OrderRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderRequestModelImplCopyWith<_$OrderRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  int? get id => throw _privateConstructorUsedError;
  set id(int? value) => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  set quantity(int? value) => throw _privateConstructorUsedError;
  List<Addon>? get addons => throw _privateConstructorUsedError;
  set addons(List<Addon>? value) => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call({int? id, int? quantity, List<Addon>? addons});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? quantity = freezed,
    Object? addons = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      addons: freezed == addons
          ? _value.addons
          : addons // ignore: cast_nullable_to_non_nullable
              as List<Addon>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? quantity, List<Addon>? addons});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? quantity = freezed,
    Object? addons = freezed,
  }) {
    return _then(_$ProductImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      addons: freezed == addons
          ? _value.addons
          : addons // ignore: cast_nullable_to_non_nullable
              as List<Addon>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  _$ProductImpl({this.id, this.quantity, this.addons});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  int? id;
  @override
  int? quantity;
  @override
  List<Addon>? addons;

  @override
  String toString() {
    return 'Product(id: $id, quantity: $quantity, addons: $addons)';
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  factory _Product({int? id, int? quantity, List<Addon>? addons}) =
      _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  int? get id;
  set id(int? value);
  @override
  int? get quantity;
  set quantity(int? value);
  @override
  List<Addon>? get addons;
  set addons(List<Addon>? value);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Addon _$AddonFromJson(Map<String, dynamic> json) {
  return _Addon.fromJson(json);
}

/// @nodoc
mixin _$Addon {
  int? get choice_id => throw _privateConstructorUsedError;
  set choice_id(int? value) => throw _privateConstructorUsedError;

  /// Serializes this Addon to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Addon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddonCopyWith<Addon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddonCopyWith<$Res> {
  factory $AddonCopyWith(Addon value, $Res Function(Addon) then) =
      _$AddonCopyWithImpl<$Res, Addon>;
  @useResult
  $Res call({int? choice_id});
}

/// @nodoc
class _$AddonCopyWithImpl<$Res, $Val extends Addon>
    implements $AddonCopyWith<$Res> {
  _$AddonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Addon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? choice_id = freezed,
  }) {
    return _then(_value.copyWith(
      choice_id: freezed == choice_id
          ? _value.choice_id
          : choice_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddonImplCopyWith<$Res> implements $AddonCopyWith<$Res> {
  factory _$$AddonImplCopyWith(
          _$AddonImpl value, $Res Function(_$AddonImpl) then) =
      __$$AddonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? choice_id});
}

/// @nodoc
class __$$AddonImplCopyWithImpl<$Res>
    extends _$AddonCopyWithImpl<$Res, _$AddonImpl>
    implements _$$AddonImplCopyWith<$Res> {
  __$$AddonImplCopyWithImpl(
      _$AddonImpl _value, $Res Function(_$AddonImpl) _then)
      : super(_value, _then);

  /// Create a copy of Addon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? choice_id = freezed,
  }) {
    return _then(_$AddonImpl(
      choice_id: freezed == choice_id
          ? _value.choice_id
          : choice_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddonImpl implements _Addon {
  _$AddonImpl({this.choice_id});

  factory _$AddonImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddonImplFromJson(json);

  @override
  int? choice_id;

  @override
  String toString() {
    return 'Addon(choice_id: $choice_id)';
  }

  /// Create a copy of Addon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddonImplCopyWith<_$AddonImpl> get copyWith =>
      __$$AddonImplCopyWithImpl<_$AddonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddonImplToJson(
      this,
    );
  }
}

abstract class _Addon implements Addon {
  factory _Addon({int? choice_id}) = _$AddonImpl;

  factory _Addon.fromJson(Map<String, dynamic> json) = _$AddonImpl.fromJson;

  @override
  int? get choice_id;
  set choice_id(int? value);

  /// Create a copy of Addon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddonImplCopyWith<_$AddonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  AddressModel get location_pickup => throw _privateConstructorUsedError;
  set location_pickup(AddressModel value) => throw _privateConstructorUsedError;
  AddressModel get location_drop => throw _privateConstructorUsedError;
  set location_drop(AddressModel value) => throw _privateConstructorUsedError;
  String get time_pickup => throw _privateConstructorUsedError;
  set time_pickup(String value) => throw _privateConstructorUsedError;
  String get time_drop => throw _privateConstructorUsedError;
  set time_drop(String value) => throw _privateConstructorUsedError;
  String get time_pickup_slot => throw _privateConstructorUsedError;
  set time_pickup_slot(String value) => throw _privateConstructorUsedError;
  String get time_drop_slot => throw _privateConstructorUsedError;
  set time_drop_slot(String value) => throw _privateConstructorUsedError;

  /// Serializes this Meta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call(
      {AddressModel location_pickup,
      AddressModel location_drop,
      String time_pickup,
      String time_drop,
      String time_pickup_slot,
      String time_drop_slot});

  $AddressModelCopyWith<$Res> get location_pickup;
  $AddressModelCopyWith<$Res> get location_drop;
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location_pickup = null,
    Object? location_drop = null,
    Object? time_pickup = null,
    Object? time_drop = null,
    Object? time_pickup_slot = null,
    Object? time_drop_slot = null,
  }) {
    return _then(_value.copyWith(
      location_pickup: null == location_pickup
          ? _value.location_pickup
          : location_pickup // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      location_drop: null == location_drop
          ? _value.location_drop
          : location_drop // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      time_pickup: null == time_pickup
          ? _value.time_pickup
          : time_pickup // ignore: cast_nullable_to_non_nullable
              as String,
      time_drop: null == time_drop
          ? _value.time_drop
          : time_drop // ignore: cast_nullable_to_non_nullable
              as String,
      time_pickup_slot: null == time_pickup_slot
          ? _value.time_pickup_slot
          : time_pickup_slot // ignore: cast_nullable_to_non_nullable
              as String,
      time_drop_slot: null == time_drop_slot
          ? _value.time_drop_slot
          : time_drop_slot // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res> get location_pickup {
    return $AddressModelCopyWith<$Res>(_value.location_pickup, (value) {
      return _then(_value.copyWith(location_pickup: value) as $Val);
    });
  }

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res> get location_drop {
    return $AddressModelCopyWith<$Res>(_value.location_drop, (value) {
      return _then(_value.copyWith(location_drop: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MetaImplCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$MetaImplCopyWith(
          _$MetaImpl value, $Res Function(_$MetaImpl) then) =
      __$$MetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AddressModel location_pickup,
      AddressModel location_drop,
      String time_pickup,
      String time_drop,
      String time_pickup_slot,
      String time_drop_slot});

  @override
  $AddressModelCopyWith<$Res> get location_pickup;
  @override
  $AddressModelCopyWith<$Res> get location_drop;
}

/// @nodoc
class __$$MetaImplCopyWithImpl<$Res>
    extends _$MetaCopyWithImpl<$Res, _$MetaImpl>
    implements _$$MetaImplCopyWith<$Res> {
  __$$MetaImplCopyWithImpl(_$MetaImpl _value, $Res Function(_$MetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location_pickup = null,
    Object? location_drop = null,
    Object? time_pickup = null,
    Object? time_drop = null,
    Object? time_pickup_slot = null,
    Object? time_drop_slot = null,
  }) {
    return _then(_$MetaImpl(
      location_pickup: null == location_pickup
          ? _value.location_pickup
          : location_pickup // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      location_drop: null == location_drop
          ? _value.location_drop
          : location_drop // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      time_pickup: null == time_pickup
          ? _value.time_pickup
          : time_pickup // ignore: cast_nullable_to_non_nullable
              as String,
      time_drop: null == time_drop
          ? _value.time_drop
          : time_drop // ignore: cast_nullable_to_non_nullable
              as String,
      time_pickup_slot: null == time_pickup_slot
          ? _value.time_pickup_slot
          : time_pickup_slot // ignore: cast_nullable_to_non_nullable
              as String,
      time_drop_slot: null == time_drop_slot
          ? _value.time_drop_slot
          : time_drop_slot // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaImpl implements _Meta {
  _$MetaImpl(
      {required this.location_pickup,
      required this.location_drop,
      required this.time_pickup,
      required this.time_drop,
      required this.time_pickup_slot,
      required this.time_drop_slot});

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  AddressModel location_pickup;
  @override
  AddressModel location_drop;
  @override
  String time_pickup;
  @override
  String time_drop;
  @override
  String time_pickup_slot;
  @override
  String time_drop_slot;

  @override
  String toString() {
    return 'Meta(location_pickup: $location_pickup, location_drop: $location_drop, time_pickup: $time_pickup, time_drop: $time_drop, time_pickup_slot: $time_pickup_slot, time_drop_slot: $time_drop_slot)';
  }

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      __$$MetaImplCopyWithImpl<_$MetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaImplToJson(
      this,
    );
  }
}

abstract class _Meta implements Meta {
  factory _Meta(
      {required AddressModel location_pickup,
      required AddressModel location_drop,
      required String time_pickup,
      required String time_drop,
      required String time_pickup_slot,
      required String time_drop_slot}) = _$MetaImpl;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  AddressModel get location_pickup;
  set location_pickup(AddressModel value);
  @override
  AddressModel get location_drop;
  set location_drop(AddressModel value);
  @override
  String get time_pickup;
  set time_pickup(String value);
  @override
  String get time_drop;
  set time_drop(String value);
  @override
  String get time_pickup_slot;
  set time_pickup_slot(String value);
  @override
  String get time_drop_slot;
  set time_drop_slot(String value);

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
