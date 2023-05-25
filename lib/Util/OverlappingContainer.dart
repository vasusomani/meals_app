import 'package:flutter/material.dart';

import 'Structures/Meals.dart';

class OverlappingContainer extends StatelessWidget {
  OverlappingContainer(this.focusedMeals, this.index);
  List<Meal> focusedMeals;
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10))),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              focusedMeals[index].title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(Icons.watch_later_outlined),
                    Text("  ${focusedMeals[index].duration} min")
                  ],
                ),
                SizedBox(width: 15),
                Row(
                  children: [
                    Icon(Icons.work),
                    Text("  ${focusedMeals[index].complexity.name}")
                  ],
                ),
                SizedBox(width: 15),
                Row(
                  children: [
                    Icon(Icons.attach_money_rounded),
                    Text(" ${focusedMeals[index].affordability.name}")
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
