import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app2/models/init_response.dart';
import 'package:my_app2/models/kakao_request.dart';
import 'package:my_app2/view/splash.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:my_app2/viewModel/kakao_login_viewmodel.dart';
import 'package:my_app2/viewModel/webview_init_viewmodel.dart';
import 'package:provider/provider.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();

  KakaoSdk.init(
    nativeAppKey: '-'
  );

  runApp(
    const MaterialApp(
      title: 'First Start',
      home: SplashScreen(),
    )
  );
}

class TestApp extends StatefulWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InitViewModel()),
        ChangeNotifierProvider(create: (_) => KakaoViewModel()),
      ],
      child: MaterialApp(
        title: 'MVVM TEST APP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const MyApp(),
      ),
    );
  }
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late Future<InitRes> futureInit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // futureInit = fetchInit();
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    InitViewModel initViewModel = context.watch<InitViewModel>();

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                )
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(initViewModel.initRes?.more?.init?.webView?.regiInfo ?? "")
    );

    return MaterialApp(
      title: "Flutter layout Demo",
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter layout Demo'),
          ),
          body: ListView(
            children: [
              Image.asset(
                'images/lake.jpeg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection,
              textSection,
            ],
          )),
    );
  }

  InkWell _buildButtonColumn(Color color, IconData icon, String label) {
    var kakaoViewModel = Provider.of<KakaoViewModel>(context);
    return InkWell(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            )
          ],
        ),
        onTap: () {
          KakaoRequest kakaoRequest = KakaoRequest(authId: "authId", name: "name", profileUrl: "profileUrl", gender: "gender", birth: "birth", phone: "phone", pushToken: "pushToken", appVersion: "appVersion", mail: "", pin: "");
          kakaoViewModel.postUser(kakaoRequest);
        },
    );
  }

}

// Future<InitRes> fetchInit() async {
//   final response = await http.get(Uri.parse(''));
//
//   if(response.statusCode == 200) {
//     return InitRes.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Fail to get response from server');
//   }
// }
