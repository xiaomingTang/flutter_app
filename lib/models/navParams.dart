import 'package:json_annotation/json_annotation.dart';

part 'navParams.g.dart';

@JsonSerializable()
class NavParams {
    NavParams();

    @JsonKey(name: 'car_brand_id') int carBrandId;
    @JsonKey(name: 'adm_id') int admId;
    
    factory NavParams.fromJson(Map<String,dynamic> json) => _$NavParamsFromJson(json);
    Map<String, dynamic> toJson() => _$NavParamsToJson(this);
}
