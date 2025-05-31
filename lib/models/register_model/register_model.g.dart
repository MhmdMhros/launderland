// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterModelImpl _$$RegisterModelImplFromJson(Map<String, dynamic> json) =>
    _$RegisterModelImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobile_number: json['mobile_number'] as String?,
      password: json['password'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$RegisterModelImplToJson(_$RegisterModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'mobile_number': instance.mobile_number,
      'password': instance.password,
      'role': instance.role,
    };
