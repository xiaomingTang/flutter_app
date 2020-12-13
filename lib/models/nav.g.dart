// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nav.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Nav _$NavFromJson(Map<String, dynamic> json) {
  return Nav()
    ..id = json['id'] as num
    ..name = json['name'] as String
    ..link = json['link'] as String
    ..picture = json['picture'] as String
    ..navigation = json['navigation'] as String
    ..isVr = json['is_vr'] as bool
    ..navParams = json['nav_params'] as String
    ..iconUri = json['icon_uri'] as String;
}

Map<String, dynamic> _$NavToJson(Nav instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'link': instance.link,
      'picture': instance.picture,
      'navigation': instance.navigation,
      'is_vr': instance.isVr,
      'nav_params': instance.navParams,
      'icon_uri': instance.iconUri
    };
