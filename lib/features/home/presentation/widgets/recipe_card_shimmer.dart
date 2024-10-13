import 'package:flutter/material.dart';
import 'package:recipe_app/core/common_widgets/shimmer_widget.dart';
import 'package:recipe_app/core/constants/height_width.dart';
import 'package:recipe_app/core/constants/navigator_key.dart';

Widget buildShimmer({double? height}) {
  return ShimmerWidget.rectangular(
    height:height?? screenHeight(context: navigatorKey.currentContext!) / 2,
    shapeBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );
}