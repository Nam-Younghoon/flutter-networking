import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_app2/models/init_response.dart';
import 'package:my_app2/repo/api_status.dart';

class WebViewServices {
  static Future<Object> commonInit() async {
    try {
      var response = await http.get(Uri.parse('https://m5pw6cm813.execute-api.ap-northeast-2.amazonaws.com/dev1/common/init'));
      if(response.statusCode == 200) {
        return Success(response.statusCode, InitRes.fromJson(jsonDecode(response.body)));
      }
      return Failure(502, 'Invalid Response');
    } on HttpException {
      return Failure(401, 'No Internet Connection');
    } on SocketException {
      return Failure(401, 'No Internet Connection');
    } on FormatException {
      return Failure(403, 'Invalid Format');
    } on TimeoutException {
      return Failure(502, 'Timeout Exception, Bad GateWay');
    } catch (e) {
      return Failure(444, 'Unknown Error');
    }
  }
}

