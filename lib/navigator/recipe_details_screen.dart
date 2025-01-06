import 'package:flutter/material.dart';

import '../models/recipe_model.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeDetailsScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            recipe.image,
            fit: BoxFit.cover,
          ),
        ),
         Positioned(
            top: 50,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD6B38B),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black, size: 25),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        Positioned(
          bottom: 0,
          top: 300,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Text(
                  recipe.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  recipe.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Text(
                  'Ingredients: ${recipe.ingredients}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  'Time: ${recipe.time}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Text(
                  'Steps: ${recipe.steps}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
