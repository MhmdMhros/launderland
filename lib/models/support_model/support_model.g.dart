// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupportModelImpl _$$SupportModelImplFromJson(Map<String, dynamic> json) =>
    _$SupportModelImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      message: json['message'] as String,
      mobile_number: json['mobile_number'] as String,
    );

Map<String, dynamic> _$$SupportModelImplToJson(_$SupportModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'message': instance.message,
      'mobile_number': instance.mobile_number,
    };
