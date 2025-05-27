// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BannerModelImpl _$$BannerModelImplFromJson(Map<String, dynamic> json) =>
    _$BannerModelImpl(
      id: (json['id'] as num?)?.toInt(),
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

Map<String, dynamic> _$$BannerModelImplToJson(_$BannerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'titleTranslations': instance.titleTranslations,
      'meta': instance.meta,
      'sortOrder': instance.sortOrder,
      'mediaUrls': instance.mediaUrls,
    };

_$TitleTranslationsImpl _$$TitleTranslationsImplFromJson(
        Map<String, dynamic> json) =>
    _$TitleTranslationsImpl(
      en: json['en'] as String?,
    );

Map<String, dynamic> _$$TitleTranslationsImplToJson(
        _$TitleTranslationsImpl instance) =>
    <String, dynamic>{
      'en': instance.en,
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      scope: json['scope'] as String?,
      number: json['number'] as String?,
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'scope': instance.scope,
      'number': instance.number,
    };

_$MediaUrlsImpl _$$MediaUrlsImplFromJson(Map<String, dynamic> json) =>
    _$MediaUrlsImpl(
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MediaUrlsImplToJson(_$MediaUrlsImpl instance) =>
    <String, dynamic>{
      'images': instance.images,
    };

_$ImagesImpl _$$ImagesImplFromJson(Map<String, dynamic> json) => _$ImagesImpl(
      image: json['image'] as String?,
      thumb: json['thumb'] as String?,
    );

Map<String, dynamic> _$$ImagesImplToJson(_$ImagesImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'thumb': instance.thumb,
    };
