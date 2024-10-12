  import 'package:flutter/material.dart';
import 'package:recipe_app/core/common_widgets/text_widget_common.dart';
import 'package:recipe_app/core/constants/colors.dart';

Widget buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        TextWidgetCommon(
          text: text,
          textColor: kGrey,
        ),
      ],
    );
  }
