// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  int? get id => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  TitleTranslations? get titleTranslations =>
      throw _privateConstructorUsedError;
  Meta? get meta => throw _privateConstructorUsedError;
  int? get sortOrder => throw _privateConstructorUsedError;
  MediaUrls? get mediaUrls => throw _privateConstructorUsedError;

  /// Serializes this CategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call(
      {int? id,
      String? slug,
      String? title,
      TitleTranslations? titleTranslations,
      Meta? meta,
      int? sortOrder,
      MediaUrls? mediaUrls});

  $TitleTranslationsCopyWith<$Res>? get titleTranslations;
  $MetaCopyWith<$Res>? get meta;
  $MediaUrlsCopyWith<$Res>? get mediaUrls;
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? title = freezed,
    Object? titleTranslations = freezed,
    Object? meta = freezed,
    Object? sortOrder = freezed,
    Object? mediaUrls = freezed,
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
      titleTranslations: freezed == titleTranslations
          ? _value.titleTranslations
          : titleTranslations // ignore: cast_nullable_to_non_nullable
              as TitleTranslations?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaUrls: freezed == mediaUrls
          ? _value.mediaUrls
          : mediaUrls // ignore: cast_nullable_to_non_nullable
              as MediaUrls?,
    ) as $Val);
  }

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TitleTranslationsCopyWith<$Res>? get titleTranslations {
    if (_value.titleTranslations == null) {
      return null;
    }

    return $TitleTranslationsCopyWith<$Res>(_value.titleTranslations!, (value) {
      return _then(_value.copyWith(titleTranslations: value) as $Val);
    });
  }

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $MetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MediaUrlsCopyWith<$Res>? get mediaUrls {
    if (_value.mediaUrls == null) {
      return null;
    }

    return $MediaUrlsCopyWith<$Res>(_value.mediaUrls!, (value) {
      return _then(_value.copyWith(mediaUrls: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
          _$CategoryModelImpl value, $Res Function(_$CategoryModelImpl) then) =
      __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? slug,
      String? title,
      TitleTranslations? titleTranslations,
      Meta? meta,
      int? sortOrder,
      MediaUrls? mediaUrls});

  @override
  $TitleTranslationsCopyWith<$Res>? get titleTranslations;
  @override
  $MetaCopyWith<$Res>? get meta;
  @override
  $MediaUrlsCopyWith<$Res>? get mediaUrls;
}

/// @nodoc
class __$$CategoryModelImplCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$CategoryModelImpl>
    implements _$$CategoryModelImplCopyWith<$Res> {
  __$$CategoryModelImplCopyWithImpl(
      _$CategoryModelImpl _value, $Res Function(_$CategoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? title = freezed,
    Object? titleTranslations = freezed,
    Object? meta = freezed,
    Object? sortOrder = freezed,
    Object? mediaUrls = freezed,
  }) {
    return _then(_$CategoryModelImpl(
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
      titleTranslations: freezed == titleTranslations
          ? _value.titleTranslations
          : titleTranslations // ignore: cast_nullable_to_non_nullable
              as TitleTranslations?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
      sortOrder: freezed == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaUrls: freezed == mediaUrls
          ? _value.mediaUrls
          : mediaUrls // ignore: cast_nullable_to_non_nullable
              as MediaUrls?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryModelImpl
    with DiagnosticableTreeMixin
    implements _CategoryModel {
  _$CategoryModelImpl(
      {this.id,
      this.slug,
      this.title,
      this.titleTranslations,
      this.meta,
      this.sortOrder,
      this.mediaUrls});

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? slug;
  @override
  final String? title;
  @override
  final TitleTranslations? titleTranslations;
  @override
  final Meta? meta;
  @override
  final int? sortOrder;
  @override
  final MediaUrls? mediaUrls;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoryModel(id: $id, slug: $slug, title: $title, titleTranslations: $titleTranslations, meta: $meta, sortOrder: $sortOrder, mediaUrls: $mediaUrls)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CategoryModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('titleTranslations', titleTranslations))
      ..add(DiagnosticsProperty('meta', meta))
      ..add(DiagnosticsProperty('sortOrder', sortOrder))
      ..add(DiagnosticsProperty('mediaUrls', mediaUrls));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleTranslations, titleTranslations) ||
                other.titleTranslations == titleTranslations) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.mediaUrls, mediaUrls) ||
                other.mediaUrls == mediaUrls));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, slug, title,
      titleTranslations, meta, sortOrder, mediaUrls);

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      __$$CategoryModelImplCopyWithImpl<_$CategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryModel implements CategoryModel {
  factory _CategoryModel(
      {final int? id,
      final String? slug,
      final String? title,
      final TitleTranslations? titleTranslations,
      final Meta? meta,
      final int? sortOrder,
      final MediaUrls? mediaUrls}) = _$CategoryModelImpl;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get slug;
  @override
  String? get title;
  @override
  TitleTranslations? get titleTranslations;
  @override
  Meta? get meta;
  @override
  int? get sortOrder;
  @override
  MediaUrls? get mediaUrls;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
