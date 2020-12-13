import 'package:json_annotation/json_annotation.dart';

part 'navLeaf.g.dart';

@JsonSerializable()
class NavLeaf {
    NavLeaf();

    num id;
    String name;
    String link;
    String picture;
    String navigation;
    num tp;
    String section;
    @JsonKey(name: 'is_vr') bool isVr;
    @JsonKey(name: 'can_access') bool canAccess;
    @JsonKey(name: 'is_container') bool isContainer;
    @JsonKey(name: 'use_section') bool useSection;
    
    factory NavLeaf.fromJson(Map<String,dynamic> json) => _$NavLeafFromJson(json);
    Map<String, dynamic> toJson() => _$NavLeafToJson(this);
}
