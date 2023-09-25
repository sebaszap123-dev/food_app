import 'package:flutter/material.dart';
import 'package:food_app/src/data/models/models.dart';

class CardFood extends StatelessWidget {
  const CardFood({super.key, required this.food});
  final Food food;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        FadeInImage.assetNetwork(
          placeholder: 'assets/loading.gif',
          image: food.image,
          width: size.width,
          height: size.height * 0.25,
        ),
        Text(
          food.name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          joinText('\$', "${food.price}"),
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }

  String joinText(String text, String text2) {
    return text + text2;
  }
}
