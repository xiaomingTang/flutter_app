// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) {
  return Token()
    ..clientIp = json['client_ip'] as String
    ..deviceId = json['device_id'] as String
    ..mob = json['mob'] as String
    ..token = json['token'] as String
    ..isBoss = json['is_boss'] as bool
    ..nickName = json['nick_name'] as String;
}

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'client_ip': instance.clientIp,
      'device_id': instance.deviceId,
      'mob': instance.mob,
      'token': instance.token,
      'is_boss': instance.isBoss,
      'nick_name': instance.nickName
    };
