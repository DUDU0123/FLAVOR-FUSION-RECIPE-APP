import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/colors.dart';
import 'package:recipe_app/core/constants/height_width.dart';
import 'package:recipe_app/features/home/domain/entity/recipe_entity.dart';
import 'package:recipe_app/features/home/presentation/widgets/recipe_card_shimmer.dart';
import 'package:recipe_app/features/home/presentation/widgets/recipe_info_show_widget.dart';

class RecipeCard extends StatelessWidget {
  final RecipeEntity? recipe;
  const RecipeCard({super.key, required this.recipe});
  @override
  Widget build(BuildContext context) {
    if (recipe == null) {
      return zeroMeasuredWidget;
    }
    return Container(
      decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: kGrey,
              offset: Offset(1, 1),
              blurRadius: 1,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: kGrey,
              offset: Offset(-1, -1),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            child: Image.network(
              recipe!.image!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return buildShimmer(height: 150);
              },
            ),
          ),
          RecipeInfoShowWidget(recipe: recipe),
        ],
      ),
    );
  }
}

