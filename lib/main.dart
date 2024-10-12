import 'package:flutter/material.dart';
import 'package:recipe_app/core/service_locator/service_locator.dart';
import 'package:recipe_app/features/root_widget_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(
    const RootWidgetPage(),
  );
}
