import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:my_app2/models/kakao_request.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
        Scaffold(
          body: Center(
            child: Stack(
              children: [
                Lottie.asset(
                    'assets/intro.json',
                    controller: _controller,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                    onLoaded: (composition) {
                      _controller
                        ..duration = composition.duration
                        ..forward();
                    }
                ),
                Container(
                  alignment: const Alignment(0.0,1.0),
                  padding: const EdgeInsets.only(
                    bottom: 40,
                    left: 20,
                    right: 20
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 80, 88, 102),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                        )
                      ),
                      onPressed: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
                            ),
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget> [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 24, right: 24, top: 30, bottom: 20),
                                      child: const Text(
                                        "크립토택스를 시작하려면\n권한이 필요해요",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 20, fontFamily: "FontBold", letterSpacing: -0.2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 8, right: 24, top: 12, bottom: 12),
                                    child: ListTile(
                                      leading: const Icon(Icons.notifications, size: 30, color: Colors.black,),
                                      title: const Text(
                                        '알림',
                                        style: TextStyle(
                                            fontFamily: 'FontBold',
                                            fontSize: 16,
                                            letterSpacing: -0.02
                                        ),
                                      ),
                                      subtitle: Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        child: const Text(
                                          '세금에 대한 주요 일정이나 중요한 안내사항을 안내받을 수 있어요.',
                                          style: TextStyle(
                                              fontFamily: 'FontRegular',
                                              fontSize: 14,
                                              letterSpacing: -0.02
                                          ),
                                        ),
                                      )
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 8, right: 24, top: 12, bottom: 12),
                                    child: ListTile(
                                        leading: const Icon(Icons.camera, size: 30, color: Colors.black, ),
                                        title: const Text(
                                          '카메라',
                                          style: TextStyle(
                                              fontFamily: 'FontBold',
                                              fontSize: 16,
                                              letterSpacing: -0.02
                                          ),
                                        ),
                                        subtitle: Container(
                                          margin: const EdgeInsets.only(top: 8),
                                          child: const Text(
                                            'QR코드로 로그인을 하거나 세금 관련 증빙 자료 촬영을 할 수 있어요.',
                                            style: TextStyle(
                                                fontFamily: 'FontRegular',
                                                fontSize: 14,
                                                letterSpacing: -0.02
                                            ),
                                          ),
                                        )
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 8, right: 24, top: 12, bottom: 12),
                                    child: ListTile(
                                        leading: const Icon(Icons.call, size: 30, color: Colors.black,),
                                        title: const Text(
                                          '전화',
                                          style: TextStyle(
                                              fontFamily: 'FontBold',
                                              fontSize: 16,
                                              letterSpacing: -0.02
                                          ),
                                        ),
                                        subtitle: Container(
                                          margin: const EdgeInsets.only(top: 8),
                                          child: const Text(
                                            '본인확인이 필요한 경우에만 휴대폰 번호로 본인 인증을 진행해요.',
                                            style: TextStyle(
                                                fontFamily: 'FontRegular',
                                                fontSize: 14,
                                                letterSpacing: -0.02
                                            ),
                                          ),
                                        )
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        bottom: 40,
                                        top: 40,
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 80.0,
                                      child: IconButton(
                                        onPressed: () {
                                          checkKakaoInstalled();
                                        },
                                        icon: SvgPicture.asset('images/ic_kakao.svg',),

                                      )
                                    ),
                                  )
                                ],
                              );
                          });
                      },
                      child: const Text('시작할게요', style: TextStyle(fontSize: 17, letterSpacing: -0.2, fontFamily: 'FontMedium'),),
                    )
                  )
                )
              ],
            )
          ),
        ),
    );
  }
}

Future<void> checkKakaoInstalled() async {
  if(await isKakaoTalkInstalled()) {
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
    } catch(error) {
      print('카카오톡으로 로그인 실패 $error');
    }
  } else {
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
      User user = await UserApi.instance.me();
      // KakaoRequest(authId: user.id.toString(), name: user.kakaoAccount?.name ?? user.kakaoAccount?.profile?.nickname ?? "", profileUrl: user.kakaoAccount?.profile?.profileImageUrl ?? "",
      //     gender: gender, birth: birth, phone: phone, pushToken: pushToken, appVersion: appVersion)
      print(user.toJson());
    } catch(error) {
      print('카카오계정으로 로그인 실패 $error');
    }
  }
}

