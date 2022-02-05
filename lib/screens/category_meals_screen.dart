import 'package:flutter/material.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
    );
  }
}
