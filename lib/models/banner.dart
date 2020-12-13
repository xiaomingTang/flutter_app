import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class Banner {
    Banner();

    String desc;
    String name;
    num category;
    num id;
    String picture;
    String link;
    
    factory Banner.fromJson(Map<String,dynamic> json) => _$BannerFromJson(json);
    Map<String, dynamic> toJson() => _$BannerToJson(this);
}
