import 'package:json_annotation/json_annotation.dart';

part 'nav.g.dart';

@JsonSerializable()
class Nav {
    Nav();

    num id;
    String name;
    String link;
    String picture;
    String navigation;
    @JsonKey(name: 'is_vr') bool isVr;
    @JsonKey(name: 'nav_params') String navParams;
    @JsonKey(name: 'icon_uri') String iconUri;
    
    factory Nav.fromJson(Map<String,dynamic> json) => _$NavFromJson(json);
    Map<String, dynamic> toJson() => _$NavToJson(this);
}
