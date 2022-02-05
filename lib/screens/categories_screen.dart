import 'package:flutter/material.dart';
import '../widgets/category_item.dart';

import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          // mainAxisExtent: 100,
        ),
        padding: const EdgeInsets.all(16),
        children: DUMMY_CATEGORIES
            .map((data) => CategoryItem(data.id, data.title, data.color))
            .toList(),
      ),
    );
  }
}
