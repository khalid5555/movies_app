import 'package:NewsMovie/app/core/shared/utils/app_images.dart';
import 'package:NewsMovie/app/core/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/shared/utils/app_colors.dart';
import '../../core/shared/widgets/app_text.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  late Animation<double> _scaleAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1300));
    _animation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ))
          ..addListener(() {
            setState(() {});
          });
    _scaleAnimation = Tween<double>(
      begin: 0.5, // Start with 50% scale
      end: 1.0, // End with 100% scale
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.forward().then((value) {
      return Get.off(
        () => const HomeScreen(),
        transition: Transition.size,
        duration: const Duration(milliseconds: 100),
        curve: Curves.bounceOut,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBG,
        body: Stack(
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return FractionalTranslation(
                  translation: _animation.value,
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        child: child,
                      );
                    },
                    child: child,
                  ),
                );
              },
              child: Center(
                child: Image.asset(
                  AppImages.newsLogo,
                  fit: BoxFit.contain,
                  width: 350,
                  height: 350,
                ),
              ),
            ),
            // const Spacer(),
            Positioned(
              bottom: AppConst().getScreenSize().height * .02,
              left: 0,
              right: 0,
              child: const AnimatedSize(
                duration: Duration(milliseconds: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    App_Text(
                      data: 'By : ',
                      size: 14,
                      color: AppColors.kbiColor,
                    ),
                    App_Text(
                      data: 'Khalid Gamal',
                      size: 11,
                      color: AppColors.kPr2Color,
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(height: AppConst().getScreenSize().height * .01),
          ],
        ));
  }
}
