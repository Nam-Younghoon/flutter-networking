// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitRes _$InitResFromJson(Map<String, dynamic> json) => InitRes(
      json['reason'] as String,
      json['code'] as String,
      InitMore.fromJson(json['more'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InitResToJson(InitRes instance) => <String, dynamic>{
      'reason': instance.reason,
      'code': instance.code,
      'more': instance.more,
    };

InitMore _$InitMoreFromJson(Map<String, dynamic> json) => InitMore(
      WebViewRes.fromJson(json['init'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InitMoreToJson(InitMore instance) => <String, dynamic>{
      'init': instance.init,
    };

WebViewRes _$WebViewResFromJson(Map<String, dynamic> json) => WebViewRes(
      WebView.fromJson(json['webview'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WebViewResToJson(WebViewRes instance) =>
    <String, dynamic>{
      'webview': instance.webView,
    };

WebView _$WebViewFromJson(Map<String, dynamic> json) => WebView(
      json['notice'] as String,
      json['exchangeRequest'] as String,
      json['terms'] as String,
      json['faq'] as String,
      json['knowTax'] as String,
      json['userOut'] as String,
      json['cusService'] as String,
      json['assetsGrade'] as String,
      json['invite'] as String? ?? '',
      json['regiInfo'] as String,
    );

Map<String, dynamic> _$WebViewToJson(WebView instance) => <String, dynamic>{
      'notice': instance.notice,
      'exchangeRequest': instance.exchangeRequest,
      'terms': instance.terms,
      'faq': instance.faq,
      'knowTax': instance.knowTax,
      'userOut': instance.userOut,
      'cusService': instance.cusService,
      'assetsGrade': instance.assetsGrade,
      'invite': instance.invite,
      'regiInfo': instance.regiInfo,
    };
