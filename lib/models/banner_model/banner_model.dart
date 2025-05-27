import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

@freezed
class BannerModel with _$BannerModel {
  factory BannerModel({
    int? id,
    String? title,
    TitleTranslations? titleTranslations,
    Meta? meta,
    int? sortOrder,
    MediaUrls? mediaUrls,
  }) = _BannerModel;

  factory BannerModel.fromJson(Map<String, dynamic> json) => _$BannerModelFromJson({
        'id': json['id'],
        'title': json['title'],
        'titleTranslations': json['title_translations'],
        'meta': json['meta'],
        'sortOrder': json['sort_order'],
        'mediaUrls': json['mediaurls'],
      });
}

@freezed
class TitleTranslations with _$TitleTranslations {
  factory TitleTranslations({
    String? en,
  }) = _TitleTranslations;

  factory TitleTranslations.fromJson(Map<String, dynamic> json) => _$TitleTranslationsFromJson(json);
}

@freezed
class Meta with _$Meta {
  factory Meta({
    String? scope,
    String? number,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
class MediaUrls with _$MediaUrls {
  factory MediaUrls({
    List<Images>? images,
  }) = _MediaUrls;

  factory MediaUrls.fromJson(Map<String, dynamic> json) => _$MediaUrlsFromJson(json);
}

@freezed
class Images with _$Images {
  factory Images({
    String? image,
    String? thumb,
  }) = _Images;

  factory Images.fromJson(Map<String, dynamic> json) =>
      _$ImagesFromJson({'image': json['default'], 'thumb': json['thumb']});
}
