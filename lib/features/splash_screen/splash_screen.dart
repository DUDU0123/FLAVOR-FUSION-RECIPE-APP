import 'package:flutter/material.dart';
import 'package:recipe_app/config/routes/routes_name.dart';
import 'package:recipe_app/core/constants/navigator_key.dart';

class RecipeSplashIntro extends StatefulWidget {
  const RecipeSplashIntro({super.key});

  @override
  State<RecipeSplashIntro> createState() => _RecipeSplashIntroState();
}

class _RecipeSplashIntroState extends State<RecipeSplashIntro> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          AppRouteName.recipeHomePage,
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 50, end: 200), // Initial size to final size
          duration: const Duration(seconds: 2), // Animation duration
          builder: (context, double size, child) {
            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/playstore.png'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
