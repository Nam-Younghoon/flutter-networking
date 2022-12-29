import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:my_app2/models/api_response.dart';
import 'package:my_app2/models/kakao_request.dart';
import 'package:my_app2/models/user_error.dart';
import 'package:my_app2/repo/kakao_login.dart';
import 'package:my_app2/repo/api_status.dart';

class KakaoViewModel extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  ApiResponse? _apiResponse;
  ApiResponse? get apiResponse => _apiResponse;

  late UserError _userError;
  UserError get userError => _userError;

  KakaoViewModel();

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  postUser(KakaoRequest loginAccount) async {
    setLoading(true);
    var response = await KakaoLoginServices.loginWithKakao(loginAccount);
    if(response is Success) {
      print('success');
      _apiResponse = response.response as ApiResponse;
      print(_apiResponse?.code.toString());
    } else if (response is Failure) {
      print('fail');
      UserError userError = UserError(code: response.code, message: response.errResponse);
      print(userError.toJson());
      setUserError(userError);
    }
    setLoading(false);
  }
}