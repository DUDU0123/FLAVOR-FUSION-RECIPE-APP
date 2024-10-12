  import 'package:flutter/material.dart';
import 'package:recipe_app/core/common_widgets/text_widget_common.dart';
import 'package:recipe_app/core/constants/colors.dart';
import 'package:recipe_app/core/constants/height_width.dart';
import 'package:recipe_app/features/home/domain/entity/recipe_entity.dart';

Widget buildInfoRow({required RecipeEntity recipe}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInfoItem(Icons.timer,
            '${recipe.prepTimeMinutes! + recipe.cookTimeMinutes!} min'),
        _buildInfoItem(
            Icons.local_fire_department, '${recipe.caloriesPerServing} cal'),
        _buildInfoItem(Icons.restaurant, '${recipe.servings} servings'),
        _buildInfoItem(Icons.star,
            '${recipe.rating!.toStringAsFixed(1)} (${recipe.reviewCount})'),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: Colors.green),
        kHeight5,
        TextWidgetCommon(
          text: text,
          fontSize: 12,
        ),
      ],
    );
  }

  Widget buildTagsSection({required RecipeEntity recipe}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidgetCommon(
            text: 'Tags', fontSize: 18, fontWeight: FontWeight.bold),
        kHeight10,
        Wrap(
          spacing: 8,
          children: [
            ...recipe.tags!
                .map((tag) => Chip(label: TextWidgetCommon(text: tag))),
            Chip(label: TextWidgetCommon(text: recipe.cuisine!)),
            Chip(label: TextWidgetCommon(text: recipe.difficulty!)),
            ...recipe.mealType!
                .map((type) => Chip(label: TextWidgetCommon(text: type))),
          ],
        ),
      ],
    );
  }

  Widget buildIngredientsSection({required RecipeEntity recipe}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidgetCommon(
            text: 'Ingredients', fontSize: 18, fontWeight: FontWeight.bold,),
        kHeight10,
        ...recipe.ingredients!.map((ingredient) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  const Icon(Icons.fiber_manual_record, size: 12),
                  kWidth10,
                  Expanded(child: TextWidgetCommon(text: ingredient)),
                ],
              ),
            )),
      ],
    );
  }

  Widget buildInstructionsSection({required RecipeEntity recipe}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidgetCommon(
            text: 'Instructions', fontSize: 18, fontWeight: FontWeight.bold),
        kHeight10,
        ...recipe.instructions!.asMap().entries.map((entry) {
          int idx = entry.key;
          String instruction = entry.value;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.green,
                  child: TextWidgetCommon(
                    text: '${idx + 1}',
                    textColor: kWhite,
                    fontSize: 12,
                  ),
                ),
                kWidth10,
                Expanded(child: TextWidgetCommon(text: instruction)),
              ],
            ),
          );
        }),
      ],
    );
  }