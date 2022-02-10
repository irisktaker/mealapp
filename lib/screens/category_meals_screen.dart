import 'package:flutter/material.dart';
import '/models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meals_screen';

  final List<Meal> _availableMeals;

  CategoryMealsScreen(this._availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal> displayedMeals = [];

  // load first
  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryId = routeArg['id'];

    categoryTitle = routeArg['title'];

    displayedMeals = widget._availableMeals
        .where(
          (e) => e.categories.contains(categoryId),
        )
        .toList();

    super.didChangeDependencies();
  }

  // loading when the page load
  // helps with faster loading for these codes
  // @override
  // void initState() {
  //   super.initState();
  // }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (ctx, i) {
          return MealItem(
            id: displayedMeals[i].id,
            title: displayedMeals[i].title,
            imageUrl: displayedMeals[i].imageUrl,
            duration: displayedMeals[i].duration,
            complexity: displayedMeals[i].complexity,
            affordability: displayedMeals[i].affordability,
            removeItem: _removeMeal,
          );
        },
      ),
    );
  }
}
