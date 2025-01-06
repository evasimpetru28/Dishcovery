class RecipeModel {
  final String name;
  final String ingredients;
  final String time;
  final String steps;
  final String image;
  final String cuisine;
  final String description;

  RecipeModel({
    required this.name,
    required this.ingredients,
    required this.time,
    required this.steps,
    required this.image,
    required this.cuisine,
    required this.description,
  });
}