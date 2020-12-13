import 'package:json_annotation/json_annotation.dart';

part 'shop.g.dart';

@JsonSerializable()
class Shop {
    Shop();

    String city;
    String contactor;
    String content;
    String dist;
    List features;
    List loc;
    String mobile;
    String name;
    String province;
    num rating;
    num state;
    String street;
    num id;
    @JsonKey(name: 'adv_group_id') int advGroupId;
    @JsonKey(name: 'broker_id') int brokerId;
    @JsonKey(name: 'feature_needed') int featureNeeded;
    @JsonKey(name: 'manager_id') int managerId;
    @JsonKey(name: 'last_notify_time') String lastNotifyTime;
    @JsonKey(name: 'service_phone') String servicePhone;
    @JsonKey(name: 'wx_share_desc') String wxShareDesc;
    @JsonKey(name: 'wx_share_title') String wxShareTitle;
    @JsonKey(name: 'car_brand_ids') List<int> carBrandIds;
    @JsonKey(name: 'car_decorate_vendor_ids') List<int> carDecorateVendorIds;
    @JsonKey(name: 'not_features') List<String> notFeatures;
    
    factory Shop.fromJson(Map<String,dynamic> json) => _$ShopFromJson(json);
    Map<String, dynamic> toJson() => _$ShopToJson(this);
}
