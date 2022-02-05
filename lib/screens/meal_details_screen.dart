import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = 'meal_details_screen';

  const MealDetailsScreen({Key? key}) : super(key: key);

  Container buildSectionTitle(BuildContext context, String txt) => Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          txt,
          style: Theme.of(context).textTheme.caption,
        ),
      );

  Widget buildContainer(Widget child) => Container(
        width: 300,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, i) => Card(
                  color: Theme.of(context).canvasColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    child: Text(selectedMeal.ingredients[i]),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, i) => Column(
                  children: [
                    ListTile(
                      minLeadingWidth: 10,
                      leading: Container(
                        width: 25,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(12.5),
                        ),
                        child: Text(
                          '${i + 1}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      title: Text(
                        selectedMeal.steps[i],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
