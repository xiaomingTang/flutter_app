// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..address = json['address'] as String
    ..assemblerId = json['assembler_id'] as int
    ..companyCode = json['company_code'] as String
    ..layout = json['layout'] as num
    ..level = json['level'] as num
    ..manufacturerId = json['manufacturer_id'] as int
    ..mobile = json['mobile'] as String
    ..name = json['name'] as String
    ..ratio = json['ratio'] as num
    ..role = json['role'] as num
    ..shopId = json['shop_id'] as int
    ..upperAgent = json['upper_agent'] as String
    ..username = json['username'] as String
    ..id = json['id'] as num
    ..isExp = json['is_exp'] as bool
    ..isSingleUser = json['is_single_user'] as bool
    ..shop = json['shop'] == null
        ? null
        : Shop.fromJson(json['shop'] as Map<String, dynamic>)
    ..shopAddress = json['shop_address'] as String
    ..userToken = json['user_token'] == null
        ? null
        : Token.fromJson(json['user_token'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'address': instance.address,
      'assembler_id': instance.assemblerId,
      'company_code': instance.companyCode,
      'layout': instance.layout,
      'level': instance.level,
      'manufacturer_id': instance.manufacturerId,
      'mobile': instance.mobile,
      'name': instance.name,
      'ratio': instance.ratio,
      'role': instance.role,
      'shop_id': instance.shopId,
      'upper_agent': instance.upperAgent,
      'username': instance.username,
      'id': instance.id,
      'is_exp': instance.isExp,
      'is_single_user': instance.isSingleUser,
      'shop': instance.shop,
      'shop_address': instance.shopAddress,
      'user_token': instance.userToken
    };
