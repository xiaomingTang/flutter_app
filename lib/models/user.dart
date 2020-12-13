import 'package:json_annotation/json_annotation.dart';
import 'token.dart';
import "shop.dart";
part 'user.g.dart';

@JsonSerializable()
class User {
    User();

    String address;
    @JsonKey(name: 'assembler_id') int assemblerId;
    @JsonKey(name: 'company_code') String companyCode;
    num layout;
    num level;
    @JsonKey(name: 'manufacturer_id') int manufacturerId;
    String mobile;
    String name;
    num ratio;
    num role;
    @JsonKey(name: 'shop_id') int shopId;
    @JsonKey(name: 'upper_agent') String upperAgent;
    String username;
    num id;
    @JsonKey(name: 'is_exp') bool isExp;
    @JsonKey(name: 'is_single_user') bool isSingleUser;
    Shop shop;
    @JsonKey(name: 'shop_address') String shopAddress;
    @JsonKey(name: 'user_token') Token userToken;
    
    factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
    Map<String, dynamic> toJson() => _$UserToJson(this);
}
