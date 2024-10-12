import 'package:fpdart/fpdart.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/features/home/domain/entity/recipe_entity.dart';

abstract interface class RecipeRepository{
  Future<Either<Failure, List<RecipeEntity>>> getAllRecipes();
}