// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) {
  return _BannerModel.fromJson(json);
}

/// @nodoc
mixin _$BannerModel {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  TitleTranslations? get titleTranslations =>
      throw _privateConstructorUsedError;
  Meta? get meta => throw _privateConstructorUsedError;
  int? get sortOrder => throw _privateConstructorUsedError;
  MediaUrls? get mediaUrls => throw _privateConstructorUsedError;

  /// Serializes this BannerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BannerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BannerModelCopyWith<BannerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerModelCopyWith<$Res> {
  factory $BannerModelCopyWith(
          BannerModel value, $Res Function(BannerModel) then) =
      _$BannerModelCopyWithImpl<$Res, BannerModel>;
  @useResult
  $Res call(
      {int? id,
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
class _$BannerModelCopyWithImpl<$Res, $Val extends BannerModel>
    implements $BannerModelCopyWith<$Res> {
  _$BannerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BannerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
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

  /// Create a copy of BannerModel
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

  /// Create a copy of BannerModel
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

  /// Create a copy of BannerModel
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
abstract class _$$BannerModelImplCopyWith<$Res>
    implements $BannerModelCopyWith<$Res> {
  factory _$$BannerModelImplCopyWith(
          _$BannerModelImpl value, $Res Function(_$BannerModelImpl) then) =
      __$$BannerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
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
class __$$BannerModelImplCopyWithImpl<$Res>
    extends _$BannerModelCopyWithImpl<$Res, _$BannerModelImpl>
    implements _$$BannerModelImplCopyWith<$Res> {
  __$$BannerModelImplCopyWithImpl(
      _$BannerModelImpl _value, $Res Function(_$BannerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BannerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? titleTranslations = freezed,
    Object? meta = freezed,
    Object? sortOrder = freezed,
    Object? mediaUrls = freezed,
  }) {
    return _then(_$BannerModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$BannerModelImpl with DiagnosticableTreeMixin implements _BannerModel {
  _$BannerModelImpl(
      {this.id,
      this.title,
      this.titleTranslations,
      this.meta,
      this.sortOrder,
      this.mediaUrls});

  factory _$BannerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BannerModelImplFromJson(json);

  @override
  final int? id;
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
    return 'BannerModel(id: $id, title: $title, titleTranslations: $titleTranslations, meta: $meta, sortOrder: $sortOrder, mediaUrls: $mediaUrls)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BannerModel'))
      ..add(DiagnosticsProperty('id', id))
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
            other is _$BannerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
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
  int get hashCode => Object.hash(
      runtimeType, id, title, titleTranslations, meta, sortOrder, mediaUrls);

  /// Create a copy of BannerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerModelImplCopyWith<_$BannerModelImpl> get copyWith =>
      __$$BannerModelImplCopyWithImpl<_$BannerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BannerModelImplToJson(
      this,
    );
  }
}

abstract class _BannerModel implements BannerModel {
  factory _BannerModel(
      {final int? id,
      final String? title,
      final TitleTranslations? titleTranslations,
      final Meta? meta,
      final int? sortOrder,
      final MediaUrls? mediaUrls}) = _$BannerModelImpl;

  factory _BannerModel.fromJson(Map<String, dynamic> json) =
      _$BannerModelImpl.fromJson;

  @override
  int? get id;
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

  /// Create a copy of BannerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BannerModelImplCopyWith<_$BannerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TitleTranslations _$TitleTranslationsFromJson(Map<String, dynamic> json) {
  return _TitleTranslations.fromJson(json);
}

/// @nodoc
mixin _$TitleTranslations {
  String? get en => throw _privateConstructorUsedError;

  /// Serializes this TitleTranslations to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TitleTranslations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TitleTranslationsCopyWith<TitleTranslations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TitleTranslationsCopyWith<$Res> {
  factory $TitleTranslationsCopyWith(
          TitleTranslations value, $Res Function(TitleTranslations) then) =
      _$TitleTranslationsCopyWithImpl<$Res, TitleTranslations>;
  @useResult
  $Res call({String? en});
}

/// @nodoc
class _$TitleTranslationsCopyWithImpl<$Res, $Val extends TitleTranslations>
    implements $TitleTranslationsCopyWith<$Res> {
  _$TitleTranslationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TitleTranslations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? en = freezed,
  }) {
    return _then(_value.copyWith(
      en: freezed == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TitleTranslationsImplCopyWith<$Res>
    implements $TitleTranslationsCopyWith<$Res> {
  factory _$$TitleTranslationsImplCopyWith(_$TitleTranslationsImpl value,
          $Res Function(_$TitleTranslationsImpl) then) =
      __$$TitleTranslationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? en});
}

/// @nodoc
class __$$TitleTranslationsImplCopyWithImpl<$Res>
    extends _$TitleTranslationsCopyWithImpl<$Res, _$TitleTranslationsImpl>
    implements _$$TitleTranslationsImplCopyWith<$Res> {
  __$$TitleTranslationsImplCopyWithImpl(_$TitleTranslationsImpl _value,
      $Res Function(_$TitleTranslationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TitleTranslations
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? en = freezed,
  }) {
    return _then(_$TitleTranslationsImpl(
      en: freezed == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TitleTranslationsImpl
    with DiagnosticableTreeMixin
    implements _TitleTranslations {
  _$TitleTranslationsImpl({this.en});

  factory _$TitleTranslationsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TitleTranslationsImplFromJson(json);

  @override
  final String? en;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TitleTranslations(en: $en)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TitleTranslations'))
      ..add(DiagnosticsProperty('en', en));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TitleTranslationsImpl &&
            (identical(other.en, en) || other.en == en));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, en);

  /// Create a copy of TitleTranslations
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TitleTranslationsImplCopyWith<_$TitleTranslationsImpl> get copyWith =>
      __$$TitleTranslationsImplCopyWithImpl<_$TitleTranslationsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TitleTranslationsImplToJson(
      this,
    );
  }
}

abstract class _TitleTranslations implements TitleTranslations {
  factory _TitleTranslations({final String? en}) = _$TitleTranslationsImpl;

  factory _TitleTranslations.fromJson(Map<String, dynamic> json) =
      _$TitleTranslationsImpl.fromJson;

  @override
  String? get en;

  /// Create a copy of TitleTranslations
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TitleTranslationsImplCopyWith<_$TitleTranslationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  String? get scope => throw _privateConstructorUsedError;
  String? get number => throw _privateConstructorUsedError;

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
  $Res call({String? scope, String? number});
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
    Object? scope = freezed,
    Object? number = freezed,
  }) {
    return _then(_value.copyWith(
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaImplCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$MetaImplCopyWith(
          _$MetaImpl value, $Res Function(_$MetaImpl) then) =
      __$$MetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? scope, String? number});
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
    Object? scope = freezed,
    Object? number = freezed,
  }) {
    return _then(_$MetaImpl(
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaImpl with DiagnosticableTreeMixin implements _Meta {
  _$MetaImpl({this.scope, this.number});

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  final String? scope;
  @override
  final String? number;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Meta(scope: $scope, number: $number)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Meta'))
      ..add(DiagnosticsProperty('scope', scope))
      ..add(DiagnosticsProperty('number', number));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaImpl &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.number, number) || other.number == number));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, scope, number);

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
  factory _Meta({final String? scope, final String? number}) = _$MetaImpl;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  String? get scope;
  @override
  String? get number;

  /// Create a copy of Meta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MediaUrls _$MediaUrlsFromJson(Map<String, dynamic> json) {
  return _MediaUrls.fromJson(json);
}

/// @nodoc
mixin _$MediaUrls {
  List<Images>? get images => throw _privateConstructorUsedError;

  /// Serializes this MediaUrls to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaUrls
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaUrlsCopyWith<MediaUrls> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaUrlsCopyWith<$Res> {
  factory $MediaUrlsCopyWith(MediaUrls value, $Res Function(MediaUrls) then) =
      _$MediaUrlsCopyWithImpl<$Res, MediaUrls>;
  @useResult
  $Res call({List<Images>? images});
}

/// @nodoc
class _$MediaUrlsCopyWithImpl<$Res, $Val extends MediaUrls>
    implements $MediaUrlsCopyWith<$Res> {
  _$MediaUrlsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaUrls
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Images>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaUrlsImplCopyWith<$Res>
    implements $MediaUrlsCopyWith<$Res> {
  factory _$$MediaUrlsImplCopyWith(
          _$MediaUrlsImpl value, $Res Function(_$MediaUrlsImpl) then) =
      __$$MediaUrlsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Images>? images});
}

/// @nodoc
class __$$MediaUrlsImplCopyWithImpl<$Res>
    extends _$MediaUrlsCopyWithImpl<$Res, _$MediaUrlsImpl>
    implements _$$MediaUrlsImplCopyWith<$Res> {
  __$$MediaUrlsImplCopyWithImpl(
      _$MediaUrlsImpl _value, $Res Function(_$MediaUrlsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MediaUrls
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = freezed,
  }) {
    return _then(_$MediaUrlsImpl(
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Images>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaUrlsImpl with DiagnosticableTreeMixin implements _MediaUrls {
  _$MediaUrlsImpl({final List<Images>? images}) : _images = images;

  factory _$MediaUrlsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaUrlsImplFromJson(json);

  final List<Images>? _images;
  @override
  List<Images>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MediaUrls(images: $images)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MediaUrls'))
      ..add(DiagnosticsProperty('images', images));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaUrlsImpl &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_images));

  /// Create a copy of MediaUrls
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaUrlsImplCopyWith<_$MediaUrlsImpl> get copyWith =>
      __$$MediaUrlsImplCopyWithImpl<_$MediaUrlsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaUrlsImplToJson(
      this,
    );
  }
}

abstract class _MediaUrls implements MediaUrls {
  factory _MediaUrls({final List<Images>? images}) = _$MediaUrlsImpl;

  factory _MediaUrls.fromJson(Map<String, dynamic> json) =
      _$MediaUrlsImpl.fromJson;

  @override
  List<Images>? get images;

  /// Create a copy of MediaUrls
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaUrlsImplCopyWith<_$MediaUrlsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return _Images.fromJson(json);
}

/// @nodoc
mixin _$Images {
  String? get image => throw _privateConstructorUsedError;
  String? get thumb => throw _privateConstructorUsedError;

  /// Serializes this Images to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Images
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImagesCopyWith<Images> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesCopyWith<$Res> {
  factory $ImagesCopyWith(Images value, $Res Function(Images) then) =
      _$ImagesCopyWithImpl<$Res, Images>;
  @useResult
  $Res call({String? image, String? thumb});
}

/// @nodoc
class _$ImagesCopyWithImpl<$Res, $Val extends Images>
    implements $ImagesCopyWith<$Res> {
  _$ImagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Images
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? thumb = freezed,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      thumb: freezed == thumb
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImagesImplCopyWith<$Res> implements $ImagesCopyWith<$Res> {
  factory _$$ImagesImplCopyWith(
          _$ImagesImpl value, $Res Function(_$ImagesImpl) then) =
      __$$ImagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? image, String? thumb});
}

/// @nodoc
class __$$ImagesImplCopyWithImpl<$Res>
    extends _$ImagesCopyWithImpl<$Res, _$ImagesImpl>
    implements _$$ImagesImplCopyWith<$Res> {
  __$$ImagesImplCopyWithImpl(
      _$ImagesImpl _value, $Res Function(_$ImagesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Images
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? thumb = freezed,
  }) {
    return _then(_$ImagesImpl(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      thumb: freezed == thumb
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImagesImpl with DiagnosticableTreeMixin implements _Images {
  _$ImagesImpl({this.image, this.thumb});

  factory _$ImagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImagesImplFromJson(json);

  @override
  final String? image;
  @override
  final String? thumb;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Images(image: $image, thumb: $thumb)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Images'))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('thumb', thumb));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagesImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.thumb, thumb) || other.thumb == thumb));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, image, thumb);

  /// Create a copy of Images
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagesImplCopyWith<_$ImagesImpl> get copyWith =>
      __$$ImagesImplCopyWithImpl<_$ImagesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImagesImplToJson(
      this,
    );
  }
}

abstract class _Images implements Images {
  factory _Images({final String? image, final String? thumb}) = _$ImagesImpl;

  factory _Images.fromJson(Map<String, dynamic> json) = _$ImagesImpl.fromJson;

  @override
  String? get image;
  @override
  String? get thumb;

  /// Create a copy of Images
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImagesImplCopyWith<_$ImagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
