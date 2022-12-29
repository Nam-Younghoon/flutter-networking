import 'package:json_annotation/json_annotation.dart';

part 'kakao_request.g.dart';

@JsonSerializable()
class KakaoRequest{
  @JsonKey(name: 'authId')
  String authId;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'profileUrl')
  String profileUrl;
  @JsonKey(name: 'mail', defaultValue: null)
  String? mail;
  @JsonKey(name: 'gender')
  String gender;
  @JsonKey(name: 'birth')
  String birth;
  @JsonKey(name: 'phone')
  String phone;
  @JsonKey(name: 'pushToken')
  String pushToken;
  @JsonKey(name: 'pin', defaultValue: null)
  String? pin;
  @JsonKey(name: 'appVersion')
  String appVersion;

  KakaoRequest({required this.authId, required this.name, required this.profileUrl, this.mail,
  required this.gender, required this.birth, required this.phone, required this.pushToken, this.pin, required this.appVersion});

  factory KakaoRequest.fromJson(Map<String, dynamic> json) => _$KakaoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$KakaoRequestToJson(this);

}