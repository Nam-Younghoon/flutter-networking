import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_app2/view/intro.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
    
    Future.delayed(
      const Duration(seconds: 3),
        () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Intro()), (route) => false)
    );
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
      home: Scaffold(
        body: Container(
          alignment: const Alignment(0.0, 0.0),
          height: double.infinity,
          width: double.infinity,
          child:
            Lottie.asset(
              'assets/splash.json',
              controller: _controller,
              fit: BoxFit.fill,
              onLoaded: (composition) {
                _controller
                  ..duration = composition.duration
                  ..forward();
              }
            ),
        ),
      ),
    );
  }
}
