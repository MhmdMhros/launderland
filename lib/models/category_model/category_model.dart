import 'package:launder_land/models/banner_model/banner_model.dart';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  factory CategoryModel({
    int? id,
    String? slug,
    String? title,
    TitleTranslations? titleTranslations,
    Meta? meta,
    int? sortOrder,
    MediaUrls? mediaUrls,
  }) = _CategoryModel;
  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson({
        'id': json['id'],
        'slug': json['slug'],
        'title': json['title'],
        'titleTranslations': json['title_translations'],
        'meta': json['meta'],
        'sortOrder': json['sort_order'],
        'mediaUrls': json['mediaurls'],
      });
}
