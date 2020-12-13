import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {
    Token();

    @JsonKey(name: 'client_ip') String clientIp;
    @JsonKey(name: 'device_id') String deviceId;
    String mob;
    String token;
    @JsonKey(name: 'is_boss') bool isBoss;
    @JsonKey(name: 'nick_name') String nickName;
    
    factory Token.fromJson(Map<String,dynamic> json) => _$TokenFromJson(json);
    Map<String, dynamic> toJson() => _$TokenToJson(this);
}
