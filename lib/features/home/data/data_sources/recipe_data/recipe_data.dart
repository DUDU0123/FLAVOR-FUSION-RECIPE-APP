import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:recipe_app/core/endpoints/endpoints.dart';
import 'package:recipe_app/core/exception/exception.dart';

import 'package:recipe_app/features/home/data/model/recipe_model.dart';

abstract interface class RecipeData {
  /// method for fetching all recipes from api and return Future<List<RecipeModel>>
  Future<List<RecipeModel>> getAllRecipes();
}

class RecipeDataImpl implements RecipeData {
  final Dio dio;
  RecipeDataImpl({
    required this.dio,
  });
  @override
  Future<List<RecipeModel>> getAllRecipes() async {
    ReceivePort receivePort = ReceivePort();
    try {
      await Isolate.spawn(fetchAndParseRecipe, receivePort.sendPort);
      final response = await receivePort.first;
      if (response is String) {
        throw ServerException(message: response);
      }
      return response as List<RecipeModel>;
    } catch (e) {
      throw ServerException(message: "Something went wrong");
    }finally{
      receivePort.close();
    }
  }
  // Isolate for fetching recipe details list
  void fetchAndParseRecipe(SendPort sendPort) async {
    try {
      final response = await dio.get(Endpoints.recipeEndpointUrl);
      if (response.statusCode == 200 && response.data != null) {
        if (response.data['recipes'] != null) {
          List reciepesList = response.data['recipes'];
          final recipeList = reciepesList
              .map((recipe) => RecipeModel.fromJson(recipe))
              .toList();
          return sendPort.send(recipeList);
        } else {
          return sendPort.send("No recipes found");
        }
      } else {
        return sendPort.send("No recipes found");
      }
    } catch (e) {
      return sendPort.send("Error: ${e.toString()}");
    }
  }
}
