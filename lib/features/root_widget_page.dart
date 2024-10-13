import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/config/routes/app_routes.dart';
import 'package:recipe_app/config/routes/routes_name.dart';
import 'package:recipe_app/core/constants/navigator_key.dart';
import 'package:recipe_app/core/network/connection_checker.dart';
import 'package:recipe_app/core/service_locator/service_locator.dart';
import 'package:recipe_app/features/home/presentation/bloc/recipe_bloc/recipe_bloc.dart';

class RootWidgetPage extends StatefulWidget {
  const RootWidgetPage({super.key});

  @override
  State<RootWidgetPage> createState() => _RootWidgetPageState();
}

class _RootWidgetPageState extends State<RootWidgetPage> {
  @override
  void initState() {
    super.initState();
    ConnectionChecker.listenForConnectionChanges();
  }
  @override
  void dispose() {
    ConnectionChecker.cancelConnectionSubscription();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<RecipeBloc>()..add(GetAllRecipesEvent()),)
      ],

      child: MaterialApp(
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
            }
          )
        ),
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouteName.recipeIntroPage,
        routes: AppRoutes.routes,
      ),
    );
  }
}
