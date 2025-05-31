// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faqs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FaqsModelImpl _$$FaqsModelImplFromJson(Map<String, dynamic> json) =>
    _$FaqsModelImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      shortDescription: json['shortDescription'] as String?,
      description: json['description'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$FaqsModelImplToJson(_$FaqsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'shortDescription': instance.shortDescription,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
