import 'package:flutter/material.dart';
import 'package:recipe_app/config/routes/routes_name.dart';
import 'package:recipe_app/core/common_widgets/text_widget_common.dart';
import 'package:recipe_app/core/constants/colors.dart';
import 'package:recipe_app/core/constants/height_width.dart';
import 'package:recipe_app/core/constants/navigator_key.dart';
import 'package:recipe_app/features/home/domain/entity/recipe_entity.dart';
import 'package:recipe_app/features/home/presentation/widgets/build_info_item.dart';

class RecipeInfoShowWidget extends StatelessWidget {
  const RecipeInfoShowWidget({
    super.key,
    required this.recipe,
  });

  final RecipeEntity? recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextWidgetCommon(
                  text: recipe!.name!,
                  textColor: kBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: kAmber),
                  TextWidgetCommon(
                    text: recipe!.rating!.toStringAsFixed(1),
                    textColor: kBlack,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  TextWidgetCommon(
                    text: ' (${recipe!.reviewCount})',
                    textColor: kBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ],
              ),
            ],
          ),
          kHeight10,
          // Meal Type and Cuisine
          Wrap(
            spacing: 8,
            children: [
              ...recipe!.mealType!.map(
                  (type) => Chip(label: TextWidgetCommon(text: type))),
              Chip(label: TextWidgetCommon(text: recipe!.cuisine!)),
            ],
          ),
          kHeight10,
          // Time and Calories
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildInfoItem(Icons.timer,
                  '${recipe!.prepTimeMinutes! + recipe!.cookTimeMinutes!} min'),
              buildInfoItem(Icons.local_fire_department,
                  '${recipe!.caloriesPerServing} cal'),
              buildInfoItem(
                  Icons.restaurant, '${recipe!.servings!} servings'),
            ],
          ),
          kHeight15,
          // Ingredients
          const TextWidgetCommon(
            text: 'Ingredients:',
            textColor: kBlack,
          ),
          kHeight10,
          Wrap(
            spacing: 8,
            children: recipe!.ingredients!
                .take(5)
                .map((ingredient) => Chip(
                      label: TextWidgetCommon(text: ingredient),
                      backgroundColor: Colors.green.shade100,
                    ))
                .toList(),
          ),
          if (recipe!.ingredients!.length > 5)
            TextWidgetCommon(
              text: '+ ${recipe!.ingredients!.length - 5} more',
              textColor: kBlack,
            ),
          kHeight15,
          // View Recipe Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                navigatorKey.currentState?.pushNamed(
                  AppRouteName.recipeDetailPage,
                  arguments: recipe,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kGreen,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const TextWidgetCommon(
                text: 'View Recipe',
                textColor: kWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
