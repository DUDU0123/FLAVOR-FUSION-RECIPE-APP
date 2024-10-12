import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/features/home/data/data_sources/recipe_data/recipe_data.dart';
import 'package:recipe_app/features/home/data/repo/recipe_repo/recipe_repository_impl.dart';
import 'package:recipe_app/features/home/domain/repo/recipe_repo/recipe_repository.dart';
import 'package:recipe_app/features/home/domain/usecase/get_all_recipe_usecase.dart';
import 'package:recipe_app/features/home/presentation/bloc/recipe_bloc/recipe_bloc.dart';

GetIt serviceLocator = GetIt.instance;
void initDependencies() {
  serviceLocator.registerFactory<Dio>(() => Dio());
  initRecipeFetchDependencies();
}

void initRecipeFetchDependencies() {
  serviceLocator
    ..registerFactory<RecipeData>(
      () => RecipeDataImpl(dio: serviceLocator<Dio>()),
    )
    ..registerFactory<RecipeRepository>(
      () => RecipeRepositoryImpl(
        recipeData: serviceLocator<RecipeData>(),
      ),
    )
    ..registerFactory<GetAllRecipeUsecase>(
      () => GetAllRecipeUsecase(
        recipeRepository: serviceLocator<RecipeRepository>(),
      ),
    )
    ..registerLazySingleton(
      () => RecipeBloc(
        getAllRecipeUsecase: serviceLocator<GetAllRecipeUsecase>(),
      ),
    );
}
