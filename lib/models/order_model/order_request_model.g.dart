// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderRequestModelImpl _$$OrderRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderRequestModelImpl(
      address_id: (json['address_id'] as num?)?.toInt(),
      payment_method_id: (json['payment_method_id'] as num?)?.toInt(),
      payment_method_slug: json['payment_method_slug'] as String?,
      coupon_code: json['coupon_code'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] as String?,
      notes: json['notes'] as String?,
      order_type: json['order_type'] as String?,
      wallet_balance: (json['wallet_balance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$OrderRequestModelImplToJson(
        _$OrderRequestModelImpl instance) =>
    <String, dynamic>{
      'address_id': instance.address_id,
      'payment_method_id': instance.payment_method_id,
      'payment_method_slug': instance.payment_method_slug,
      'coupon_code': instance.coupon_code,
      'products': instance.products,
      'meta': instance.meta,
      'notes': instance.notes,
      'order_type': instance.order_type,
      'wallet_balance': instance.wallet_balance,
    };

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: (json['id'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      addons: (json['addons'] as List<dynamic>?)
          ?.map((e) => Addon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'addons': instance.addons,
    };

_$AddonImpl _$$AddonImplFromJson(Map<String, dynamic> json) => _$AddonImpl(
      choice_id: (json['choice_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AddonImplToJson(_$AddonImpl instance) =>
    <String, dynamic>{
      'choice_id': instance.choice_id,
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      location_pickup: AddressModel.fromJson(
          json['location_pickup'] as Map<String, dynamic>),
      location_drop:
          AddressModel.fromJson(json['location_drop'] as Map<String, dynamic>),
      time_pickup: json['time_pickup'] as String,
      time_drop: json['time_drop'] as String,
      time_pickup_slot: json['time_pickup_slot'] as String,
      time_drop_slot: json['time_drop_slot'] as String,
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'location_pickup': instance.location_pickup,
      'location_drop': instance.location_drop,
      'time_pickup': instance.time_pickup,
      'time_drop': instance.time_drop,
      'time_pickup_slot': instance.time_pickup_slot,
      'time_drop_slot': instance.time_drop_slot,
    };
