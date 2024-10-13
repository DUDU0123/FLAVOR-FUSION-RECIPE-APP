import 'package:flutter/material.dart';
import 'package:recipe_app/core/common_widgets/text_widget_common.dart';
import 'package:recipe_app/core/constants/colors.dart';
import 'package:recipe_app/core/constants/navigator_key.dart';

class MessageShowhelper {
 static void showDialogBox({
    required String dialogTitle,
    required String dialogContent,
    required String actionButtonName,
    required void Function()? buttonActionMethod,
  }) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        title: TextWidgetCommon(
          text: dialogTitle,
          fontSize: 18,
        ),
        content: TextWidgetCommon(
          fontSize: 16,
          text: dialogContent,
        ),
        actions: [
          commonTextButton(
            buttonActionMethod: () {
              navigatorKey.currentState?.pop();
            },
            buttonText: 'Cancel',
          ),
          commonTextButton(
            buttonActionMethod: buttonActionMethod,
            buttonText: actionButtonName,
          ),
        ],
      ),
    );
  }

 static void showSnackbar({
    required String snackBarContent,
  }) {
    ScaffoldMessenger.of(navigatorKey.currentContext!)..hideCurrentSnackBar()..showSnackBar(
      SnackBar(
        content: TextWidgetCommon(
          text: snackBarContent,textColor: kWhite,
          fontSize: 16,
        ),
        backgroundColor: kBlack,
        duration: const Duration(seconds: 2,),
      ),
    );
  }
}
Widget commonTextButton({
  required String buttonText,
  required void Function()? buttonActionMethod,
}) {
  return TextButton(
    onPressed: buttonActionMethod,
    child: TextWidgetCommon(
      fontSize: 18,
      text: buttonText,
    ),
  );
}