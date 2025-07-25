// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faqs_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FaqsModel _$FaqsModelFromJson(Map<String, dynamic> json) {
  return _FaqsModel.fromJson(json);
}

/// @nodoc
mixin _$FaqsModel {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get shortDescription => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this FaqsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqsModelCopyWith<FaqsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqsModelCopyWith<$Res> {
  factory $FaqsModelCopyWith(FaqsModel value, $Res Function(FaqsModel) then) =
      _$FaqsModelCopyWithImpl<$Res, FaqsModel>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? shortDescription,
      String? description,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$FaqsModelCopyWithImpl<$Res, $Val extends FaqsModel>
    implements $FaqsModelCopyWith<$Res> {
  _$FaqsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? shortDescription = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      shortDescription: freezed == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaqsModelImplCopyWith<$Res>
    implements $FaqsModelCopyWith<$Res> {
  factory _$$FaqsModelImplCopyWith(
          _$FaqsModelImpl value, $Res Function(_$FaqsModelImpl) then) =
      __$$FaqsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? shortDescription,
      String? description,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$FaqsModelImplCopyWithImpl<$Res>
    extends _$FaqsModelCopyWithImpl<$Res, _$FaqsModelImpl>
    implements _$$FaqsModelImplCopyWith<$Res> {
  __$$FaqsModelImplCopyWithImpl(
      _$FaqsModelImpl _value, $Res Function(_$FaqsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FaqsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? shortDescription = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$FaqsModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      shortDescription: freezed == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqsModelImpl with DiagnosticableTreeMixin implements _FaqsModel {
  _$FaqsModelImpl(
      {this.id,
      this.title,
      this.shortDescription,
      this.description,
      this.createdAt,
      this.updatedAt});

  factory _$FaqsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqsModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? shortDescription;
  @override
  final String? description;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FaqsModel(id: $id, title: $title, shortDescription: $shortDescription, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FaqsModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('shortDescription', shortDescription))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, shortDescription,
      description, createdAt, updatedAt);

  /// Create a copy of FaqsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqsModelImplCopyWith<_$FaqsModelImpl> get copyWith =>
      __$$FaqsModelImplCopyWithImpl<_$FaqsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqsModelImplToJson(
      this,
    );
  }
}

abstract class _FaqsModel implements FaqsModel {
  factory _FaqsModel(
      {final int? id,
      final String? title,
      final String? shortDescription,
      final String? description,
      final String? createdAt,
      final String? updatedAt}) = _$FaqsModelImpl;

  factory _FaqsModel.fromJson(Map<String, dynamic> json) =
      _$FaqsModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get shortDescription;
  @override
  String? get description;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of FaqsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqsModelImplCopyWith<_$FaqsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
