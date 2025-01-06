import 'package:dishcovery/navigator/recipe_details_screen.dart';
import 'package:flutter/material.dart';

import '../models/recipe_model.dart';

List<RecipeModel> sampleRecipes = [
  RecipeModel(
    name: 'Spaghetti Carbonara',
    cuisine: 'Italian',
    description:
        'A classic Italian pasta dish with eggs, cheese, pancetta, and pepper.',
    image: 'assets/images/carbonara.jpeg',
    ingredients: '',
    time: '',
    steps: '',
  ),
  RecipeModel(
    name: 'Butter Chicken',
    cuisine: 'Indian',
    description: 'A rich and creamy chicken curry from India.',
    image: 'assets/images/butter-chicken.jpg',
    ingredients: '',
    time: '',
    steps: '',
  ),
  RecipeModel(
    name: 'Tacos',
    cuisine: 'Mexican',
    description: 'A traditional Mexican dish with various fillings.',
    image: 'assets/images/tacos.jpg',
    ingredients: '',
    time: '',
    steps: '',
  ),
];

class RecipesScreen extends StatefulWidget {
  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  TextEditingController searchController = TextEditingController();
  String selectedCuisine = 'All';

  List<RecipeModel> recipes = sampleRecipes;
  List<RecipeModel> filteredRecipes = [];

  @override
  void initState() {
    super.initState();
    filteredRecipes = recipes;
  }

  void filterRecipes() {
    setState(() {
      filteredRecipes = recipes.where((recipe) {
        bool matchesName = recipe.name
            .toLowerCase()
            .contains(searchController.text.toLowerCase());
        bool matchesCuisine =
            selectedCuisine == 'All' || recipe.cuisine == selectedCuisine;
        return matchesName && matchesCuisine;
      }).toList();
    });
  }

  void clearText() {
    searchController.clear();
    filterRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchController,
              onChanged: (_) => filterRecipes(),
              decoration: InputDecoration(
                labelText: 'Search by recipe name',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: clearText,
                      )
                    : null,
                border: const OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: selectedCuisine,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCuisine = newValue!;
                  filterRecipes();
                });
              },
              items: ['All', 'Italian', 'Indian', 'Mexican']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = filteredRecipes[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.asset(
                        recipe.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(recipe.name),
                      subtitle:
                          Text('${recipe.cuisine} - ${recipe.description}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RecipeDetailsScreen(recipe: recipe),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
