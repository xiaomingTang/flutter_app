// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) {
  return Shop()
    ..city = json['city'] as String
    ..contactor = json['contactor'] as String
    ..content = json['content'] as String
    ..dist = json['dist'] as String
    ..features = json['features'] as List
    ..loc = json['loc'] as List
    ..mobile = json['mobile'] as String
    ..name = json['name'] as String
    ..province = json['province'] as String
    ..rating = json['rating'] as num
    ..state = json['state'] as num
    ..street = json['street'] as String
    ..id = json['id'] as num
    ..advGroupId = json['adv_group_id'] as int
    ..brokerId = json['broker_id'] as int
    ..featureNeeded = json['feature_needed'] as int
    ..managerId = json['manager_id'] as int
    ..lastNotifyTime = json['last_notify_time'] as String
    ..servicePhone = json['service_phone'] as String
    ..wxShareDesc = json['wx_share_desc'] as String
    ..wxShareTitle = json['wx_share_title'] as String
    ..carBrandIds =
        (json['car_brand_ids'] as List)?.map((e) => e as int)?.toList()
    ..carDecorateVendorIds = (json['car_decorate_vendor_ids'] as List)
        ?.map((e) => e as int)
        ?.toList()
    ..notFeatures =
        (json['not_features'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'city': instance.city,
      'contactor': instance.contactor,
      'content': instance.content,
      'dist': instance.dist,
      'features': instance.features,
      'loc': instance.loc,
      'mobile': instance.mobile,
      'name': instance.name,
      'province': instance.province,
      'rating': instance.rating,
      'state': instance.state,
      'street': instance.street,
      'id': instance.id,
      'adv_group_id': instance.advGroupId,
      'broker_id': instance.brokerId,
      'feature_needed': instance.featureNeeded,
      'manager_id': instance.managerId,
      'last_notify_time': instance.lastNotifyTime,
      'service_phone': instance.servicePhone,
      'wx_share_desc': instance.wxShareDesc,
      'wx_share_title': instance.wxShareTitle,
      'car_brand_ids': instance.carBrandIds,
      'car_decorate_vendor_ids': instance.carDecorateVendorIds,
      'not_features': instance.notFeatures
    };
