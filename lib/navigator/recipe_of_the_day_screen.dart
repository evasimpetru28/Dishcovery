import 'dart:math';
import 'package:flutter/material.dart';

import '../models/recipe_model.dart';

class RecipeOfTheDayScreen extends StatefulWidget {
  const RecipeOfTheDayScreen({Key? key}) : super(key: key);

  @override
  _RecipeOfTheDayScreenState createState() => _RecipeOfTheDayScreenState();
}

class _RecipeOfTheDayScreenState extends State<RecipeOfTheDayScreen> {
  final List<RecipeModel> recipes = [
    RecipeModel(
      name: 'Alfredo pasta',
      ingredients: 'Pasta, tomato sauce',
      time: '30 min',
      steps: 'Boil pasta, cook sauce',
      image: 'assets/images/alfredo-pasta.jpg',
      cuisine: 'Italian',
      description: '',
    ),
    RecipeModel(
      name: 'Pizza',
      ingredients: 'Dough, cheese, tomato sauce',
      time: '20 min',
      steps: 'Bake pizza',
      image: 'assets/images/pizza.jpg',
      cuisine: 'Italian',
      description: '',
    ),
  ];

  RecipeModel getRandomRecipe() {
    Random random = Random();
    int index = random.nextInt(recipes.length);
    return recipes[index];
  }

  @override
  Widget build(BuildContext context) {
    RecipeModel randomRecipe = getRandomRecipe();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            randomRecipe.image,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),

          Text(
            randomRecipe.name,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          Text(
            'Ingredients: ${randomRecipe.ingredients}',
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          Text(
            'Time: ${randomRecipe.time}',
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Steps: ${randomRecipe.steps}',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              setState(() {
                randomRecipe = getRandomRecipe();
              });
            },
            child: const Text('Show Another Recipe'),
          ),
        ],
      ),
    );
  }
}
