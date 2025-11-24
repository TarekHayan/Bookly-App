import '../widgets/splash_screen_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String id = "SplashScreen";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashScreenBody());
  }
}
