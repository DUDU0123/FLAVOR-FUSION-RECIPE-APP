import 'package:fpdart/fpdart.dart';

import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/core/usecase/usecase.dart';
import 'package:recipe_app/features/home/domain/entity/recipe_entity.dart';
import 'package:recipe_app/features/home/domain/repo/recipe_repo/recipe_repository.dart';

class GetAllRecipeUsecase implements Usecase <List<RecipeEntity>,Null>{
  final RecipeRepository recipeRepository;
  GetAllRecipeUsecase({
    required this.recipeRepository,
  });
  @override
  Future<Either<Failure, List<RecipeEntity>>> call({required params}) async{
    return await recipeRepository.getAllRecipes();
  }
  
}
