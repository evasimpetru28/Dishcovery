import 'package:dishcovery/ui/ingredient_catalogue_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/home_screen.dart';
import 'ui/recipe_of_the_day_screen.dart';
import 'ui/recipes_screen.dart';
import 'ui/splash_screen.dart';

Map<int, Color> _myCustomColor = {
  50: const Color(0x1affd6b38b),
  100: const Color(0x33ffd6b38b),
  200: const Color(0x66ffd6b38b),
  300: const Color(0x99ffd6b38b),
  400: const Color(0xccffd6b38b),
  500: const Color(0xffffd6b38b),
  600: const Color(0xe5ffd6b38b),
  700: const Color(0xb3ffd6b38b),
  800: const Color(0x80ffd6b38b),
  900: const Color(0x4dffd6b38b),
};

Future<void> main() async {
  // setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black.withOpacity(0),
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      title: 'Dishcovery',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFD6B38B, _myCustomColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomePage(),
        '/recipes': (context) => RecipesScreen(),
        '/ingredient-catalog': (context) => const IngredientCatalogueScreen(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _pages = [
    const HomeScreen(),
    const RecipeOfTheDayScreen(),
    RecipesScreen(),
    const IngredientCatalogueScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: "Home",
            backgroundColor: Color(0xFFD6B38B),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: "Recipe of the Day",
            backgroundColor: Color(0xFFD6B38B),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_list),
            label: "Recipes",
            backgroundColor: Color(0xFFD6B38B),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: "Ingredient Catalogue",
            backgroundColor: Color(0xFFD6B38B),
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
      ),
    );
  }
}
