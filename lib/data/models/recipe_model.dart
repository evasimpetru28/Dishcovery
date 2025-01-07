import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RecipeModel {
  final String name;
  final String ingredients;
  final String time;
  final String steps;
  final String image;
  final String cuisine;
  final String description;

  RecipeModel(this.name, this.ingredients, this.time, this.steps, this.image,
      this.cuisine, this.description);

factory RecipeModel.fromJson(Map<String, dynamic> json) =>
    _$RecipeModelFromJson(json);

Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}

RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) => RecipeModel(
  json['name'] as String,
  json['ingredients'] as String,
  json['time'] as String,
  json['steps'] as String,
  json['image'] as String,
  json['cuisine'] as String,
  json['description'] as String,
);

Map<String, dynamic> _$ErrorModelToJson(RecipeModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ingredients': instance.ingredients,
      'time': instance.time,
      'steps': instance.steps,
      'image': instance.image,
      'cuisine': instance.cuisine,
      'description': instance.description,
    };
