import 'package:bookly_app/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../../home/ui/views/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});
  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    intitSlidingAnimation();
    navigatorToHome();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset("assets/images/Logo.png"),
        const SizedBox(height: 4),
        AnimatedBuilder(
          animation: slidingAnimation,
          builder: (BuildContext context, _) {
            return SlideTransition(
              position: slidingAnimation,
              child: const Text('Read Free Books', textAlign: TextAlign.center),
            );
          },
        ),
      ],
    );
  }

  void intitSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 5),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void navigatorToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      // Get.to(const HomePage(), transition: Transition.fade);
      context.go(AppRouter.homePage);
    });
  }
}
