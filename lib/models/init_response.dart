import 'package:json_annotation/json_annotation.dart';

part 'init_response.g.dart';

@JsonSerializable()
class InitRes {
  InitRes(this.reason, this.code, this.more);

  @JsonKey(name: 'reason')
  String reason;
  @JsonKey(name: 'code')
  String code;
  @JsonKey(name: 'more')
  InitMore more;

  factory InitRes.fromJson(Map<String, dynamic> json) => _$InitResFromJson(json);

  Map<String, dynamic> toJson() => _$InitResToJson(this);

}

@JsonSerializable()
class InitMore {
  InitMore(this.init);

  @JsonKey(name: 'init')
  WebViewRes init;

  factory InitMore.fromJson(Map<String, dynamic> json) => _$InitMoreFromJson(json);

  Map<String, dynamic> toJson() => _$InitMoreToJson(this);
}

@JsonSerializable()
class WebViewRes {
  WebViewRes(this.webView);

  @JsonKey(name: 'webview')
  WebView webView;

  factory WebViewRes.fromJson(Map<String, dynamic> json) => _$WebViewResFromJson(json);

  Map<String, dynamic> toJson() => _$WebViewResToJson(this);
}

@JsonSerializable()
class WebView {
  WebView(this.notice, this.exchangeRequest, this.terms, this.faq, this.knowTax, this.userOut, this.cusService,
      this.assetsGrade, this.invite, this.regiInfo);

  @JsonKey(name: 'notice')
  String notice;
  @JsonKey(name: 'exchangeRequest')
  String exchangeRequest;
  @JsonKey(name: 'terms')
  String terms;
  @JsonKey(name: 'faq')
  String faq;
  @JsonKey(name: 'knowTax')
  String knowTax;
  @JsonKey(name: 'userOut')
  String userOut;
  @JsonKey(name: 'cusService')
  String cusService;
  @JsonKey(name: 'assetsGrade')
  String assetsGrade;
  @JsonKey(name: 'invite', defaultValue: '')
  String invite;
  @JsonKey(name: 'regiInfo')
  String regiInfo;

  factory WebView.fromJson(Map<String, dynamic> json) => _$WebViewFromJson(json);

  Map<String, dynamic> toJson() => _$WebViewToJson(this);
}