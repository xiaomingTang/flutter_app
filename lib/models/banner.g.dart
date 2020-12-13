// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) {
  return Banner()
    ..desc = json['desc'] as String
    ..name = json['name'] as String
    ..category = json['category'] as num
    ..id = json['id'] as num
    ..picture = json['picture'] as String
    ..link = json['link'] as String;
}

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'desc': instance.desc,
      'name': instance.name,
      'category': instance.category,
      'id': instance.id,
      'picture': instance.picture,
      'link': instance.link
    };
