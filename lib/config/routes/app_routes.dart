import 'package:flutter/material.dart';
import 'package:recipe_app/config/routes/routes_name.dart';
import 'package:recipe_app/features/home/presentation/pages/home_page.dart';
import 'package:recipe_app/features/description/presentation/pages/recipe_detail_show_page.dart';
import 'package:recipe_app/features/splash_screen/splash_screen.dart';

class AppRoutes{
  static Map<String, Widget Function(BuildContext)> routes  ={
    AppRouteName.recipeHomePage: (context)=> const RecipeHomePage(),
    AppRouteName.recipeDetailPage: (context)=> const RecipeDetailShowPage(),
    AppRouteName.recipeIntroPage: (context)=> const RecipeSplashIntro(),
  };
}