import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'main_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset('assets/img_splash.png'),
          const Text(
            'EYE DOC',
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black,fontStyle: FontStyle.italic),
          )
        ],
      ),
      backgroundColor: Color.fromARGB(246, 120, 121, 120),
      nextScreen: MainPage(),
      splashIconSize: 250,
      duration: 3000,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.leftToRight,
      animationDuration: const Duration(seconds: 1),
    );
  }
}