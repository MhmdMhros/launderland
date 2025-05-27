// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_deposit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletDepositModelImpl _$$WalletDepositModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletDepositModelImpl(
      id: (json['id'] as num?)?.toInt(),
      payable_id: (json['payable_id'] as num?)?.toInt(),
      payer_id: (json['payer_id'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      status: json['status'] as String?,
      payment_method: json['payment_method'] == null
          ? null
          : PaymentMethod.fromJson(
              json['payment_method'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WalletDepositModelImplToJson(
        _$WalletDepositModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payable_id': instance.payable_id,
      'payer_id': instance.payer_id,
      'amount': instance.amount,
      'status': instance.status,
      'payment_method': instance.payment_method,
    };

_$PaymentMethodImpl _$$PaymentMethodImplFromJson(Map<String, dynamic> json) =>
    _$PaymentMethodImpl(
      id: (json['id'] as num?)?.toInt(),
      slug: json['slug'] as String?,
      title: json['title'] as String?,
      title_translations: json['title_translations'] == null
          ? null
          : TitleTranslations.fromJson(
              json['title_translations'] as Map<String, dynamic>),
      meta: json['meta'] as String?,
      enabled: (json['enabled'] as num?)?.toInt(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$PaymentMethodImplToJson(_$PaymentMethodImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'title': instance.title,
      'title_translations': instance.title_translations,
      'meta': instance.meta,
      'enabled': instance.enabled,
      'type': instance.type,
    };
