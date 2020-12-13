// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webTree.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebTree _$WebTreeFromJson(Map<String, dynamic> json) {
  return WebTree()
    ..id = json['id'] as num
    ..isContainer = json['isContainer'] as bool
    ..parentId = json['parentId'] as num
    ..name = json['name'] as String
    ..brief = json['brief'] as String
    ..picture = json['picture'] as String
    ..link = json['link'] as String
    ..tags = json['tags'] as List
    ..section = json['section'] as String
    ..userLevel = json['userLevel'] as num
    ..state = json['state'] as num
    ..children = (json['children'] as List)
        ?.map((e) =>
            e == null ? null : WebTree.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$WebTreeToJson(WebTree instance) => <String, dynamic>{
      'id': instance.id,
      'isContainer': instance.isContainer,
      'parentId': instance.parentId,
      'name': instance.name,
      'brief': instance.brief,
      'picture': instance.picture,
      'link': instance.link,
      'tags': instance.tags,
      'section': instance.section,
      'userLevel': instance.userLevel,
      'state': instance.state,
      'children': instance.children
    };
