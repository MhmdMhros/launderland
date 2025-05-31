// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'support_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SupportModel _$SupportModelFromJson(Map<String, dynamic> json) {
  return _SupportModel.fromJson(json);
}

/// @nodoc
mixin _$SupportModel {
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  set email(String value) => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  set message(String value) => throw _privateConstructorUsedError;
  String get mobile_number => throw _privateConstructorUsedError;
  set mobile_number(String value) => throw _privateConstructorUsedError;

  /// Serializes this SupportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SupportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupportModelCopyWith<SupportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportModelCopyWith<$Res> {
  factory $SupportModelCopyWith(
          SupportModel value, $Res Function(SupportModel) then) =
      _$SupportModelCopyWithImpl<$Res, SupportModel>;
  @useResult
  $Res call({String name, String email, String message, String mobile_number});
}

/// @nodoc
class _$SupportModelCopyWithImpl<$Res, $Val extends SupportModel>
    implements $SupportModelCopyWith<$Res> {
  _$SupportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? message = null,
    Object? mobile_number = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      mobile_number: null == mobile_number
          ? _value.mobile_number
          : mobile_number // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SupportModelImplCopyWith<$Res>
    implements $SupportModelCopyWith<$Res> {
  factory _$$SupportModelImplCopyWith(
          _$SupportModelImpl value, $Res Function(_$SupportModelImpl) then) =
      __$$SupportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String email, String message, String mobile_number});
}

/// @nodoc
class __$$SupportModelImplCopyWithImpl<$Res>
    extends _$SupportModelCopyWithImpl<$Res, _$SupportModelImpl>
    implements _$$SupportModelImplCopyWith<$Res> {
  __$$SupportModelImplCopyWithImpl(
      _$SupportModelImpl _value, $Res Function(_$SupportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SupportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? message = null,
    Object? mobile_number = null,
  }) {
    return _then(_$SupportModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      mobile_number: null == mobile_number
          ? _value.mobile_number
          : mobile_number // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SupportModelImpl with DiagnosticableTreeMixin implements _SupportModel {
  _$SupportModelImpl(
      {required this.name,
      required this.email,
      required this.message,
      required this.mobile_number});

  factory _$SupportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupportModelImplFromJson(json);

  @override
  String name;
  @override
  String email;
  @override
  String message;
  @override
  String mobile_number;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SupportModel(name: $name, email: $email, message: $message, mobile_number: $mobile_number)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SupportModel'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('mobile_number', mobile_number));
  }

  /// Create a copy of SupportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupportModelImplCopyWith<_$SupportModelImpl> get copyWith =>
      __$$SupportModelImplCopyWithImpl<_$SupportModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupportModelImplToJson(
      this,
    );
  }
}

abstract class _SupportModel implements SupportModel {
  factory _SupportModel(
      {required String name,
      required String email,
      required String message,
      required String mobile_number}) = _$SupportModelImpl;

  factory _SupportModel.fromJson(Map<String, dynamic> json) =
      _$SupportModelImpl.fromJson;

  @override
  String get name;
  set name(String value);
  @override
  String get email;
  set email(String value);
  @override
  String get message;
  set message(String value);
  @override
  String get mobile_number;
  set mobile_number(String value);

  /// Create a copy of SupportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupportModelImplCopyWith<_$SupportModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
