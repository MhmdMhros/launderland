// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:launder_land/models/address_model/address_model.dart';

part 'order_request_model.freezed.dart';
part 'order_request_model.g.dart';

@unfreezed
class OrderRequestModel with _$OrderRequestModel {
  factory OrderRequestModel({
    int? address_id,
    int? payment_method_id,
    String? payment_method_slug,
    String? coupon_code,
    List<Product>? products,
    String? meta,
    String? notes,
    String? order_type,
    double? wallet_balance,
  }) = _OrderRequestModel;

  factory OrderRequestModel.fromJson(Map<String, dynamic> json) => _$OrderRequestModelFromJson(json);
}

@unfreezed
class Product with _$Product {
  factory Product({
    int? id,
    int? quantity,
    List<Addon>? addons,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@unfreezed
class Addon with _$Addon {
  factory Addon({
    int? choice_id,
  }) = _Addon;

  factory Addon.fromJson(Map<String, dynamic> json) => _$AddonFromJson(json);
}

@unfreezed
class Meta with _$Meta {
  factory Meta({
    required AddressModel location_pickup,
    required AddressModel location_drop,
    required String time_pickup,
    required String time_drop,
    required String time_pickup_slot,
    required String time_drop_slot,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}