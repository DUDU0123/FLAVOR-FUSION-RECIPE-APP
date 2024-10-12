import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/home/domain/entity/recipe_entity.dart';
import 'package:recipe_app/features/home/domain/usecase/get_all_recipe_usecase.dart';
part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final GetAllRecipeUsecase _getAllRecipeUsecase;
  RecipeBloc({
    required GetAllRecipeUsecase getAllRecipeUsecase,
  }) : _getAllRecipeUsecase = getAllRecipeUsecase, super(RecipeInitial()) {
    on<GetAllRecipesEvent>(getAllRecipesEvent);
  }

  FutureOr<void> getAllRecipesEvent(GetAllRecipesEvent event, Emitter<RecipeState> emit) async{
    emit(RecipeLoadingState());
    try {
      final res = await _getAllRecipeUsecase(params: null);
      res.fold((failure) {
        emit(RecipeErrorState(message: failure.message));
      }, (recipeList) {
        emit(RecipeLoadedState(recipeList: recipeList));
      },);
    } catch (e) {
      emit(RecipeErrorState(message: e.toString()));
    }
  }
}
