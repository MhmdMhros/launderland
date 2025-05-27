import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_model.freezed.dart';
part 'register_model.g.dart';

@unfreezed
class RegisterModel with _$RegisterModel {
  factory RegisterModel({
    String? name,
    String? email,
    // ignore: non_constant_identifier_names
    String? mobile_number,
    String? password,
    String? role,
  }) = _RegisterModel;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);
}
