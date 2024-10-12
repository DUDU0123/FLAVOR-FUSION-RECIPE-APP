import 'package:flutter/material.dart';
import 'package:recipe_app/core/common_widgets/text_widget_common.dart';
import 'package:recipe_app/core/constants/colors.dart';
import 'package:recipe_app/core/constants/height_width.dart';
import 'package:recipe_app/features/home/domain/entity/recipe_entity.dart';
import 'package:recipe_app/features/description/presentation/widgets/recipe_detail_small_widgets.dart';

class RecipeDetailShowPage extends StatelessWidget {
  const RecipeDetailShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RecipeEntity recipe =
        ModalRoute.of(context)?.settings.arguments as RecipeEntity;

    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            recipe.image!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: kWhite,
              );
            },
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: TextWidgetCommon(
                    text: recipe.name!,
                    textColor: kBlack,
                    fontWeight: FontWeight.bold,
                  ),
                  background: Image.network(
                    recipe.image!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: kWhite,
                      );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildInfoRow(recipe: recipe),
                      kHeight15,
                      buildTagsSection(recipe: recipe),
                      kHeight15,
                      buildIngredientsSection(recipe: recipe),
                      kHeight15,
                      buildInstructionsSection(recipe: recipe),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
