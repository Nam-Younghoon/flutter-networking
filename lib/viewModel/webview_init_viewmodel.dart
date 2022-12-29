import 'package:flutter/material.dart';
import 'package:my_app2/models/init_response.dart';
import 'package:my_app2/models/user_error.dart';
import 'package:my_app2/repo/api_status.dart';
import 'package:my_app2/repo/webview_init.dart';

class InitViewModel extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  InitRes? _initRes;
  InitRes? get initRes => _initRes;

  late UserError _userError;
  UserError get userError => _userError;

  InitViewModel() {
    getData();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getData() async {
    setLoading(true);
    var response = await WebViewServices.commonInit();
    if(response is Success) {
      print('success');
      _initRes = response.response as InitRes;
    } else if (response is Failure) {
      print('fail');
      UserError userError = UserError(code: response.code, message: response.errResponse);
      setUserError(userError);
    }
    setLoading(false);
  }
}