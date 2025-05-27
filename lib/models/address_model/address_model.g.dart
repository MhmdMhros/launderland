// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      formatted_address: json['formatted_address'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      user_id: (json['user_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'formatted_address': instance.formatted_address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'user_id': instance.user_id,
    };
