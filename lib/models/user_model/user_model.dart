import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    String? token,
    User? user,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
class User with _$User {
  factory User({
    int? id,
    String? name,
    String? email,
    String? mobileNumber,
    int? mobileVerified,
    int? isVerified,
    int? active,
    String? language,
    int? balance,
    Wallet? wallet,
    bool? isFollowing,
    bool? isBlocked,
    int? ratings,
    int? ratingsCount,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson({
        'id': json['id'],
        'name': json['name'],
        'email': json['email'],
        'mobileNumber': json['mobile_number'],
        'mobileVerified': json['mobile_verified'],
        'isVerified': json['is_verified'],
        'active': json['active'],
        'language': json['language'],
        'balance': json['balance'],
        'wallet': json['wallet'],
        'isFollowing': json['is_following'],
        'isBlocked': json['is_blocked'],
        'ratings': json['ratings'],
        'ratingsCount': json['ratings_count'],
      });
}

@freezed
class Wallet with _$Wallet {
  factory Wallet({
    int? id,
    int? userId,
    int? balance,
    String? createdAt,
    String? updatedAt,
  }) = _Wallet;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
}
