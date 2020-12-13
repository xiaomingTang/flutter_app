// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeData _$HomeDataFromJson(Map<String, dynamic> json) {
  return HomeData()
    ..banners = (json['banners'] as List)
        ?.map((e) =>
            e == null ? null : Banner.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..navs = (json['navs'] as List)
        ?.map((e) => e == null ? null : Nav.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..baseUrl = json['base_url'] as String;
}

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'banners': instance.banners,
      'navs': instance.navs,
      'base_url': instance.baseUrl
    };
