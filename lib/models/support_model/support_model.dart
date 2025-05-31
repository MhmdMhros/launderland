// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'support_model.freezed.dart';
part 'support_model.g.dart';

@unfreezed
class SupportModel with _$SupportModel {
  factory SupportModel({
    required String name,
    required String email,
    required String message,
    required String mobile_number,
  }) = _SupportModel;

  factory SupportModel.fromJson(Map<String, dynamic> json) => _$SupportModelFromJson(json);
}
