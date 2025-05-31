import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'faqs_model.freezed.dart';
part 'faqs_model.g.dart';

@freezed
class FaqsModel with _$FaqsModel {
  factory FaqsModel({
    int? id,
    String? title,
    String? shortDescription,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) = _FaqsModel;

  factory FaqsModel.fromJson(Map<String, dynamic> json) => _$FaqsModelFromJson(json);
}
