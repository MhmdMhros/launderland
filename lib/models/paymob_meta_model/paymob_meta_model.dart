// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paymob_meta_model.freezed.dart';
part 'paymob_meta_model.g.dart';

@unfreezed
class PaymobMetaModel with _$PaymobMetaModel {
  factory PaymobMetaModel({
    int? merchant_order_id,
    String? type,
    String? delivery_needed,
    int? amount_cents,
    String? currency,
    List<Items>? items,
  }) = _PaymobMetaModel;

  factory PaymobMetaModel.fromJson(Map<String, dynamic> json) => _$PaymobMetaModelFromJson(json);
}

@unfreezed
class Items with _$Items {
  factory Items({
    String? name,
    int? amount_cents,
    String? description,
    String? quantity,
  }) = _Items;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
}
