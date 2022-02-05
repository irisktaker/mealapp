import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String imageUrl;

  const MealItem(
    this.imageUrl, {
    Key? key,
  }) : super(key: key);

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      onDoubleTap: () {},
      onLongPress: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: Image.network(imageUrl),
        ),
      ),
    );
  }
}
