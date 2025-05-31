// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_methods_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentMethodsModel _$PaymentMethodsModelFromJson(Map<String, dynamic> json) {
  return _PaymentMethodsModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodsModel {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get meta => throw _privateConstructorUsedError;
  int? get enabled => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  TitleTranslations? get title_translations =>
      throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethodsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethodsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodsModelCopyWith<PaymentMethodsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodsModelCopyWith<$Res> {
  factory $PaymentMethodsModelCopyWith(
          PaymentMethodsModel value, $Res Function(PaymentMethodsModel) then) =
      _$PaymentMethodsModelCopyWithImpl<$Res, PaymentMethodsModel>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? slug,
      String? meta,
      int? enabled,
      String? type,
      TitleTranslations? title_translations,
      String? image});
}

/// @nodoc
class _$PaymentMethodsModelCopyWithImpl<$Res, $Val extends PaymentMethodsModel>
    implements $PaymentMethodsModelCopyWith<$Res> {
  _$PaymentMethodsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethodsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? slug = freezed,
    Object? meta = freezed,
    Object? enabled = freezed,
    Object? type = freezed,
    Object? title_translations = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
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
      title_translations: freezed == title_translations
          ? _value.title_translations
          : title_translations // ignore: cast_nullable_to_non_nullable
              as TitleTranslations?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodsModelImplCopyWith<$Res>
    implements $PaymentMethodsModelCopyWith<$Res> {
  factory _$$PaymentMethodsModelImplCopyWith(_$PaymentMethodsModelImpl value,
          $Res Function(_$PaymentMethodsModelImpl) then) =
      __$$PaymentMethodsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? slug,
      String? meta,
      int? enabled,
      String? type,
      TitleTranslations? title_translations,
      String? image});
}

/// @nodoc
class __$$PaymentMethodsModelImplCopyWithImpl<$Res>
    extends _$PaymentMethodsModelCopyWithImpl<$Res, _$PaymentMethodsModelImpl>
    implements _$$PaymentMethodsModelImplCopyWith<$Res> {
  __$$PaymentMethodsModelImplCopyWithImpl(_$PaymentMethodsModelImpl _value,
      $Res Function(_$PaymentMethodsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMethodsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? slug = freezed,
    Object? meta = freezed,
    Object? enabled = freezed,
    Object? type = freezed,
    Object? title_translations = freezed,
    Object? image = freezed,
  }) {
    return _then(_$PaymentMethodsModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
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
      title_translations: freezed == title_translations
          ? _value.title_translations
          : title_translations // ignore: cast_nullable_to_non_nullable
              as TitleTranslations?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodsModelImpl implements _PaymentMethodsModel {
  _$PaymentMethodsModelImpl(
      {this.id,
      this.title,
      this.slug,
      this.meta,
      this.enabled,
      this.type,
      this.title_translations,
      this.image});

  factory _$PaymentMethodsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodsModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? slug;
  @override
  final String? meta;
  @override
  final int? enabled;
  @override
  final String? type;
  @override
  final TitleTranslations? title_translations;
  @override
  final String? image;

  @override
  String toString() {
    return 'PaymentMethodsModel(id: $id, title: $title, slug: $slug, meta: $meta, enabled: $enabled, type: $type, title_translations: $title_translations, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title_translations, title_translations) ||
                other.title_translations == title_translations) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, slug, meta, enabled,
      type, title_translations, image);

  /// Create a copy of PaymentMethodsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodsModelImplCopyWith<_$PaymentMethodsModelImpl> get copyWith =>
      __$$PaymentMethodsModelImplCopyWithImpl<_$PaymentMethodsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodsModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethodsModel implements PaymentMethodsModel {
  factory _PaymentMethodsModel(
      {final int? id,
      final String? title,
      final String? slug,
      final String? meta,
      final int? enabled,
      final String? type,
      final TitleTranslations? title_translations,
      final String? image}) = _$PaymentMethodsModelImpl;

  factory _PaymentMethodsModel.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodsModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get slug;
  @override
  String? get meta;
  @override
  int? get enabled;
  @override
  String? get type;
  @override
  TitleTranslations? get title_translations;
  @override
  String? get image;

  /// Create a copy of PaymentMethodsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodsModelImplCopyWith<_$PaymentMethodsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
