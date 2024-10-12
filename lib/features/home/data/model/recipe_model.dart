import 'package:recipe_app/features/home/domain/entity/recipe_entity.dart';

class RecipeModel extends RecipeEntity {
  const RecipeModel({
    super.caloriesPerServing,
    super.cookTimeMinutes,
    super.cuisine,
    super.difficulty,
    super.id,
    super.image,
    super.ingredients,
    super.instructions,
    super.mealType,
    super.name,
    super.prepTimeMinutes,
    super.rating,
    super.reviewCount,
    super.servings,
    super.tags,
    super.userId,
  });


    // Factory method to create an instance from JSON
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      name: json['name'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
      prepTimeMinutes: json['prepTimeMinutes'],
      cookTimeMinutes: json['cookTimeMinutes'],
      servings: json['servings'],
      difficulty: json['difficulty'],
      cuisine: json['cuisine'],
      caloriesPerServing: json['caloriesPerServing'].toDouble(),
      tags: List<String>.from(json['tags']),
      userId: json['userId'],
      image: json['image'],
      rating: json['rating'].toDouble(),
      reviewCount: json['reviewCount'],
      mealType: List<String>.from(json['mealType']),
    );
  }

  // Method to convert the Recipe object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'ingredients': ingredients,
      'instructions': instructions,
      'prepTimeMinutes': prepTimeMinutes,
      'cookTimeMinutes': cookTimeMinutes,
      'servings': servings,
      'difficulty': difficulty,
      'cuisine': cuisine,
      'caloriesPerServing': caloriesPerServing,
      'tags': tags,
      'userId': userId,
      'image': image,
      'rating': rating,
      'reviewCount': reviewCount,
      'mealType': mealType,
    };
  }
}
