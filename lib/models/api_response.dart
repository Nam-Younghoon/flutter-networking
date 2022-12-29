
import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse {

  @JsonKey(name: 'reason')
  String reason;
  @JsonKey(name: 'code')
  String code;
  @JsonKey(name: 'more')
  Object more;

  ApiResponse(this.reason, this.code, this.more);

  factory ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}