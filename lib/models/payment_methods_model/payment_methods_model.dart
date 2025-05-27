// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:launder_land/models/products_model.dart';

part 'payment_methods_model.freezed.dart';
part 'payment_methods_model.g.dart';

@freezed
class PaymentMethodsModel with _$PaymentMethodsModel {
  factory PaymentMethodsModel({
    int? id,
    String? title,
    String? slug,
    String? meta,
    int? enabled,
    String? type,
    TitleTranslations? title_translations,
    String? image,
  }) = _PaymentMethodsModel;

  factory PaymentMethodsModel.fromJson(Map<String, dynamic> json) => _$PaymentMethodsModelFromJson(json);
}
