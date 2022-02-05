import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meals_screen';

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    final categoryTitle = routeArg['title'];

    final categoryMeals =
        DUMMY_MEALS.where((e) => e.categories.contains(categoryId)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, i) {
          return MealItem(
            title: categoryMeals[i].title,
            imageUrl: categoryMeals[i].imageUrl,
            duration: categoryMeals[i].duration,
            complexity: categoryMeals[i].complexity,
            affordability: categoryMeals[i].affordability,
          );
        },
      ),
    );
  }
}
