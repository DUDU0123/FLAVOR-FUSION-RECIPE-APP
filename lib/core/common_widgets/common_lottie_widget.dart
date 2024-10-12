import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget commonLottie() {
  return LottieBuilder.network(
    'https://lottie.host/03bed843-1c34-4fba-aa24-90390915f084/c1Nz75WJj2.json',
    errorBuilder: (context, error, stackTrace) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}
