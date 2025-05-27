// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:launder_land/models/banner_model/banner_model.dart';

part 'wallet_deposit_model.freezed.dart';
part 'wallet_deposit_model.g.dart';

@freezed
class WalletDepositModel with _$WalletDepositModel {
  factory WalletDepositModel({
    int? id,
    int? payable_id,
    int? payer_id,
    int? amount,
    String? status,
    PaymentMethod? payment_method,
  }) = _WalletDepositModel;
  factory WalletDepositModel.fromJson(Map<String, dynamic> json) => _$WalletDepositModelFromJson(json);
}

@freezed
class PaymentMethod with _$PaymentMethod {
  factory PaymentMethod({
    int? id,
    String? slug,
    String? title,
    TitleTranslations? title_translations,
    String? meta,
    int? enabled,
    String? type,
  }) = _PaymentMethod;
  factory PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);
}
