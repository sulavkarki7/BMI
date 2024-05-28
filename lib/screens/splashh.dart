import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:bmiapp/screens/input_page.dart';
import 'package:flutter/material.dart';

class Splashh extends StatefulWidget {
  const Splashh({super.key});

  @override
  State<Splashh> createState() => _SplashState();
}

class _SplashState extends State<Splashh> {
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF1D1E33),
          Color(0xFF111328),
        ],
      ),
      childWidget: SizedBox(
        height: 50,
        child: Image.asset("images/wait3.png"),
      ),
      duration: const Duration(milliseconds: 6000),
      animationDuration: const Duration(milliseconds: 3500),
      onAnimationEnd: () => debugPrint("On Scale End"),
      nextScreen: InputPage(),
    );
  }
}
