// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@unfreezed
class AddressModel with _$AddressModel {
  factory AddressModel({
    int? id,
    String? title,
    String? formatted_address,
    double? longitude,
    double? latitude,
    int? user_id,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);
}