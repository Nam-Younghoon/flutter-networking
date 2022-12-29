// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kakao_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KakaoRequest _$KakaoRequestFromJson(Map<String, dynamic> json) => KakaoRequest(
      authId: json['authId'] as String,
      name: json['name'] as String,
      profileUrl: json['profileUrl'] as String,
      mail: json['mail'] as String?,
      gender: json['gender'] as String,
      birth: json['birth'] as String,
      phone: json['phone'] as String,
      pushToken: json['pushToken'] as String,
      pin: json['pin'] as String?,
      appVersion: json['appVersion'] as String,
    );

Map<String, dynamic> _$KakaoRequestToJson(KakaoRequest instance) =>
    <String, dynamic>{
      'authId': instance.authId,
      'name': instance.name,
      'profileUrl': instance.profileUrl,
      'mail': instance.mail,
      'gender': instance.gender,
      'birth': instance.birth,
      'phone': instance.phone,
      'pushToken': instance.pushToken,
      'pin': instance.pin,
      'appVersion': instance.appVersion,
    };
