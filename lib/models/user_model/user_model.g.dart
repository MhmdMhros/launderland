// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      mobileVerified: (json['mobileVerified'] as num?)?.toInt(),
      isVerified: (json['isVerified'] as num?)?.toInt(),
      active: (json['active'] as num?)?.toInt(),
      language: json['language'] as String?,
      balance: (json['balance'] as num?)?.toInt(),
      wallet: json['wallet'] == null
          ? null
          : Wallet.fromJson(json['wallet'] as Map<String, dynamic>),
      isFollowing: json['isFollowing'] as bool?,
      isBlocked: json['isBlocked'] as bool?,
      ratings: (json['ratings'] as num?)?.toInt(),
      ratingsCount: (json['ratingsCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'mobileVerified': instance.mobileVerified,
      'isVerified': instance.isVerified,
      'active': instance.active,
      'language': instance.language,
      'balance': instance.balance,
      'wallet': instance.wallet,
      'isFollowing': instance.isFollowing,
      'isBlocked': instance.isBlocked,
      'ratings': instance.ratings,
      'ratingsCount': instance.ratingsCount,
    };

_$WalletImpl _$$WalletImplFromJson(Map<String, dynamic> json) => _$WalletImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      balance: (json['balance'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$WalletImplToJson(_$WalletImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'balance': instance.balance,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
