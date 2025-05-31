// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: (json['id'] as num?)?.toInt(),
      slug: json['slug'] as String?,
      title: json['title'] as String?,
      titleTranslations: json['titleTranslations'] == null
          ? null
          : TitleTranslations.fromJson(
              json['titleTranslations'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      sortOrder: (json['sortOrder'] as num?)?.toInt(),
      mediaUrls: json['mediaUrls'] == null
          ? null
          : MediaUrls.fromJson(json['mediaUrls'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'title': instance.title,
      'titleTranslations': instance.titleTranslations,
      'meta': instance.meta,
      'sortOrder': instance.sortOrder,
      'mediaUrls': instance.mediaUrls,
    };
