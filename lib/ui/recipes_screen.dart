import 'package:flutter/material.dart';

import '../data/models/recipe_model.dart';

class RecipesScreen extends StatelessWidget {
  RecipesScreen({Key? key}) : super(key: key);

  final List<RecipeModel> recipes = [
    RecipeModel(
      'Alfredo Pasta',
      'Pasta, tomato sauce',
      '30 min',
      'Boil pasta, cook sauce',
      'assets/images/alfredo-pasta.jpg',
      'Italian',
      'A creamy, rich Italian pasta dish made with a smooth Alfredo sauce and perfectly cooked pasta.',
    ),
    RecipeModel(
      'Pizza',
      'Dough, cheese, tomato sauce',
      '20 min',
      'Bake pizza',
      'assets/images/pizza.jpg',
      'Italian',
      'A classic pizza topped with tomato sauce, cheese, and optional toppings of your choice, baked to perfection.',
    ),
    RecipeModel(
      'Caesar Salad',
      'Lettuce, croutons, dressing',
      '10 min',
      'Mix all ingredients',
      'assets/images/caesar-salad.jpeg',
      'Salad',
      'A crisp salad with fresh romaine lettuce, crunchy croutons, and a tangy Caesar dressing.',
    ),
    RecipeModel(
      'Tacos',
      'Tortilla, beef, salsa',
      '25 min',
      'Cook beef, assemble tacos',
      'assets/images/tacos.jpg',
      'Mexican',
      'A flavorful Mexican dish with seasoned beef, wrapped in a soft tortilla, topped with salsa, cheese, and fresh vegetables.',
    ),
    RecipeModel(
      'Sushi Roll',
      'Rice, seaweed, fish',
      '45 min',
      'Roll seaweed, rice, and fish together',
      'assets/images/sushi-roll.jpeg',
      'Japanese',
      'Fresh sushi rolls made with seasoned rice, nori (seaweed), and your choice of fresh fish and vegetables.',
    ),
    RecipeModel(
      'Butter Chicken',
      'Chicken, cream, spices',
      '40 min',
      'Cook chicken, mix with creamy tomato sauce',
      'assets/images/butter-chicken.jpeg',
      'Indian',
      'A rich and creamy curry made with tender chicken pieces simmered in a flavorful tomato-based sauce with spices.',
    ),
    RecipeModel(
      'Beef Stroganoff',
      'Beef, mushrooms, sour cream',
      '35 min',
      'Cook beef with mushrooms, mix in sour cream sauce',
      'assets/images/beef-stroganoff.jpeg',
      'Russian',
      'A savory Russian dish with tender beef and mushrooms in a rich sour cream sauce, served over noodles or rice.',
    ),
    RecipeModel(
      'Pad Thai',
      'Noodles, shrimp, peanuts, tamarind',
      '30 min',
      'Stir-fry noodles with shrimp and sauce',
      'assets/images/pad-thai.jpeg',
      'Thai',
      'A stir-fried Thai noodle dish with shrimp, peanuts, and tamarind, giving it a perfect balance of sweet, sour, and salty flavors.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipes"),
        backgroundColor: const Color(0xFFD6B38B),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Image.asset(
                recipe.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                recipe.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${recipe.time} | ${recipe.cuisine}',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Show detailed recipe info on tap
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(recipe.name),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(recipe.image, fit: BoxFit.cover),
                        const SizedBox(height: 10),
                        Text('Ingredients: ${recipe.ingredients}'),
                        const SizedBox(height: 5),
                        Text('Time: ${recipe.time}'),
                        const SizedBox(height: 5),
                        Text('Steps: ${recipe.steps}'),
                        const SizedBox(height: 10), // Add space before description
                        Text(
                          'Description: ${recipe.description}',
                          style: TextStyle(fontStyle: FontStyle.italic), // Optional: style the description text
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
