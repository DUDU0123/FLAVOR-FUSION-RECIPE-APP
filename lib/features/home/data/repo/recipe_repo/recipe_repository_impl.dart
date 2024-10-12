import 'package:fpdart/fpdart.dart';
import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/core/exception/exception.dart';
import 'package:recipe_app/features/home/data/data_sources/recipe_data/recipe_data.dart';
import 'package:recipe_app/features/home/domain/entity/recipe_entity.dart';
import 'package:recipe_app/features/home/domain/repo/recipe_repo/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeData recipeData;
  RecipeRepositoryImpl({
    required this.recipeData,
  });
  @override
  Future<Either<Failure, List<RecipeEntity>>> getAllRecipes() async {
    try {
      final recipeList = await recipeData.getAllRecipes();
      return right(recipeList);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
