// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymob_meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymobMetaModelImpl _$$PaymobMetaModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymobMetaModelImpl(
      merchant_order_id: (json['merchant_order_id'] as num?)?.toInt(),
      type: json['type'] as String?,
      delivery_needed: json['delivery_needed'] as String?,
      amount_cents: (json['amount_cents'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaymobMetaModelImplToJson(
        _$PaymobMetaModelImpl instance) =>
    <String, dynamic>{
      'merchant_order_id': instance.merchant_order_id,
      'type': instance.type,
      'delivery_needed': instance.delivery_needed,
      'amount_cents': instance.amount_cents,
      'currency': instance.currency,
      'items': instance.items,
    };

_$ItemsImpl _$$ItemsImplFromJson(Map<String, dynamic> json) => _$ItemsImpl(
      name: json['name'] as String?,
      amount_cents: (json['amount_cents'] as num?)?.toInt(),
      description: json['description'] as String?,
      quantity: json['quantity'] as String?,
    );

Map<String, dynamic> _$$ItemsImplToJson(_$ItemsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount_cents': instance.amount_cents,
      'description': instance.description,
      'quantity': instance.quantity,
    };
