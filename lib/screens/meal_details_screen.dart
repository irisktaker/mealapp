import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = 'meal_details_screen';

  const MealDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeMealDetail =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(routeMealDetail),
      ),
    );
  }
}
