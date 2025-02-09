import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              // App logo or header image
              Image.asset(
                'assets/images/logo-dishcovery.png', // Replace with a suitable image
                height: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              // Welcome text
              const Text(
                'Welcome to Dishcovery!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6B4226),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Discover new recipes, organize your ingredients, and get inspired for your next meal!',
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Featured Recipes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6B4226),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _buildFeaturedRecipeCard(
                imagePath: 'assets/images/alfredo-pasta.jpg',
                recipeName: 'Creamy Alfredo Pasta',
                description: 'A quick and delicious Italian dish.',
              ),
              _buildFeaturedRecipeCard(
                imagePath: 'assets/images/salad.jpeg',
                recipeName: 'Healthy Green Salad',
                description: 'A light and refreshing salad for any meal.',
              ),
              _buildFeaturedRecipeCard(
                imagePath: 'assets/images/pizza.jpg',
                recipeName: 'Cheesy Margherita Pizza',
                description: 'Classic pizza with a gooey cheese topping.',
              ),
              const SizedBox(height: 30),
              // Fun facts or tips
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Cooking Tip of the Day',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6B4226),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD6B38B).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Add a pinch of salt to your boiling water when cooking pasta. It enhances flavor and prevents sticking!',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to build featured recipe cards
  Widget _buildFeaturedRecipeCard({
    required String imagePath,
    required String recipeName,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                imagePath,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipeName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6B4226),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
