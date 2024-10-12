import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/height_width.dart';
import 'package:recipe_app/features/home/presentation/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:recipe_app/features/home/presentation/widgets/recipe_card.dart';
import 'package:recipe_app/features/home/presentation/widgets/recipe_card_shimmer.dart';

Widget recipeCardListview({
  required RecipeState state,
}) {
  return ListView.separated(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    itemBuilder: (context, index) {
      if (state is RecipeLoadedState) {
        return RecipeCard(
          recipe: state.recipeList[index],
        );
        
      } else{
        return buildShimmer();
      } 
    },
    itemCount: (state is RecipeLoadedState) ? state.recipeList.length : 10,
    separatorBuilder: (context, index) => kHeight10,
  );
}
