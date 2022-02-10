import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/dummy_data.dart';
import '/screens/filters_screen.dart';
import '/screens/meal_details_screen.dart';
import '/screens/tabs_screen.dart';
import '/screens/category_meals_screen.dart';
import 'models/meal.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> _filtersData) {
    setState(() {
      _filters = _filtersData;

      _availableMeals = DUMMY_MEALS.where(
        (element) {
          if (_filters['gluten'] as bool && !element.isGlutenFree) {
            return false;
          }
          if (_filters['lactose'] as bool && !element.isLactoseFree) {
            return false;
          }
          if (_filters['vegan'] as bool && !element.isVegan) {
            return false;
          }
          if (_filters['vegetarian'] as bool && !element.isVegetarian) {
            return false;
          }

          // _filters['gluten'] as bool && !element.isGlutenFree ? false : null;
          // _filters['lactose'] as bool && !element.isLactoseFree ? false : null;
          // _filters['vegan'] as bool && !element.isVegan ? false : null;
          // _filters['vegetarian'] as bool && !element.isVegetarian
          //     ? false
          //     : null;

          return true;
        },
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        // primarySwatch: Colors.pink,
        colorScheme: const ColorScheme.light(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              caption: const TextStyle(
                fontSize: 24,
                fontFamily: "RobotoCondensed",
                // color: Colors.black,
              ),
            ),
      ),
      routes: {
        '/': (context) => const TabsScreen(),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (context) => const MealDetailsScreen(),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
