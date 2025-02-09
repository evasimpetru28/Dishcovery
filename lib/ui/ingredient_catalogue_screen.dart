import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IngredientCatalogueScreen extends StatefulWidget {
  const IngredientCatalogueScreen({Key? key}) : super(key: key);

  @override
  _IngredientCatalogueScreenState createState() =>
      _IngredientCatalogueScreenState();
}

class _IngredientCatalogueScreenState extends State<IngredientCatalogueScreen> {
  // List of ingredients
  final List<String> ingredientNames = [
    'Tomato',
    'Cheese',
    'Pasta',
    'Lettuce',
    'Chicken',
    'Bread',
    'Milk',
    'Beef',
    'Eggs',
    'Flour',
  ];

  // Map to track whether an ingredient is selected
  Map<String, bool> ingredientStates = {};

  @override
  void initState() {
    super.initState();
    _loadIngredientStates();
  }

  // Load saved ingredient states from local storage
  Future<void> _loadIngredientStates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      for (var ingredient in ingredientNames) {
        ingredientStates[ingredient] = prefs.getBool(ingredient) ?? false;
      }
    });
  }

  // Save the state of an ingredient to local storage
  Future<void> _saveIngredientState(String ingredient, bool hasIngredient) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(ingredient, hasIngredient);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ingredient Catalog"),
        backgroundColor: const Color(0xFFD6B38B),
      ),
      body: ListView.builder(
        itemCount: ingredientNames.length,
        itemBuilder: (context, index) {
          final ingredient = ingredientNames[index];
          final hasIngredient = ingredientStates[ingredient] ?? false;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                ingredient,
                style: const TextStyle(fontSize: 18),
              ),
              trailing: Checkbox(
                value: hasIngredient,
                onChanged: (bool? value) {
                  setState(() {
                    ingredientStates[ingredient] = value!;
                  });
                  _saveIngredientState(ingredient, value!);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
