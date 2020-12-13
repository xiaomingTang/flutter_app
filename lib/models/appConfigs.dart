import 'package:json_annotation/json_annotation.dart';

part 'appConfigs.g.dart';

@JsonSerializable()
class AppConfigs {
    AppConfigs();

    String darkMode;
    
    factory AppConfigs.fromJson(Map<String,dynamic> json) => _$AppConfigsFromJson(json);
    Map<String, dynamic> toJson() => _$AppConfigsToJson(this);
}
