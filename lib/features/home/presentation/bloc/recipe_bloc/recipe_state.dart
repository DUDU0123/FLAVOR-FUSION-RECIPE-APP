part of 'recipe_bloc.dart';

sealed class RecipeState extends Equatable {
  const RecipeState();
  
  @override
  List<Object> get props => [];
}

final class RecipeInitial extends RecipeState {}
class RecipeLoadingState extends RecipeState{}
class RecipeLoadedState extends RecipeState {
  final List<RecipeEntity> recipeList;
  const RecipeLoadedState({
    required this.recipeList,
  });
  @override
  List<Object> get props => [recipeList,];
}
class RecipeErrorState extends RecipeState {
  final String message;
  const RecipeErrorState({
    required this.message,
  });
}
