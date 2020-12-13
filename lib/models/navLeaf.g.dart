// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navLeaf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavLeaf _$NavLeafFromJson(Map<String, dynamic> json) {
  return NavLeaf()
    ..id = json['id'] as num
    ..name = json['name'] as String
    ..link = json['link'] as String
    ..picture = json['picture'] as String
    ..navigation = json['navigation'] as String
    ..tp = json['tp'] as num
    ..section = json['section'] as String
    ..isVr = json['is_vr'] as bool
    ..canAccess = json['can_access'] as bool
    ..isContainer = json['is_container'] as bool
    ..useSection = json['use_section'] as bool;
}

Map<String, dynamic> _$NavLeafToJson(NavLeaf instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'link': instance.link,
      'picture': instance.picture,
      'navigation': instance.navigation,
      'tp': instance.tp,
      'section': instance.section,
      'is_vr': instance.isVr,
      'can_access': instance.canAccess,
      'is_container': instance.isContainer,
      'use_section': instance.useSection
    };
