import 'package:json_annotation/json_annotation.dart';

part 'webTree.g.dart';

@JsonSerializable()
class WebTree {
    WebTree();

    num id;
    bool isContainer;
    num parentId;
    String name;
    String brief;
    String picture;
    String link;
    List tags;
    String section;
    num userLevel;
    num state;
    @JsonKey(name: 'children') List<WebTree> children;
    
    factory WebTree.fromJson(Map<String,dynamic> json) => _$WebTreeFromJson(json);
    Map<String, dynamic> toJson() => _$WebTreeToJson(this);
}
