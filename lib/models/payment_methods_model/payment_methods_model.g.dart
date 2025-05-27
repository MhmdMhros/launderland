// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_methods_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentMethodsModelImpl _$$PaymentMethodsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentMethodsModelImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      meta: json['meta'] as String?,
      enabled: (json['enabled'] as num?)?.toInt(),
      type: json['type'] as String?,
      title_translations: json['title_translations'] == null
          ? null
          : TitleTranslations.fromJson(
              json['title_translations'] as Map<String, dynamic>),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$PaymentMethodsModelImplToJson(
        _$PaymentMethodsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'meta': instance.meta,
      'enabled': instance.enabled,
      'type': instance.type,
      'title_translations': instance.title_translations,
      'image': instance.image,
    };
