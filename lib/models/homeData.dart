import 'package:json_annotation/json_annotation.dart';
import 'banner.dart';
import  'nav.dart';
part 'homeData.g.dart';

@JsonSerializable()
class HomeData {
    HomeData();

    @JsonKey(name: 'banners') List<Banner> banners;
    @JsonKey(name: 'navs') List<Nav> navs;
    @JsonKey(name: 'base_url') String baseUrl;
    
    factory HomeData.fromJson(Map<String,dynamic> json) => _$HomeDataFromJson(json);
    Map<String, dynamic> toJson() => _$HomeDataToJson(this);
}
