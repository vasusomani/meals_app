import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Providers/FiltersProvider.dart';
import 'package:meals_app/Util/data.dart';
import 'package:meals_app/Util/filtereing.dart';
import '../Util/OverlappingContainer.dart';
import '../Util/Structures/Meals.dart';
import 'MealDetails.dart';

class MealsList extends ConsumerWidget {
  MealsList(this.id, {super.key});
  String id;

  List<Meal> get focusedMeals {
    List<Meal> focusedMeals = [];
    for (Meal element in Meals) {
      if (element.categories.contains(id)) {
        focusedMeals.add(element);
      }
    }
    return focusedMeals;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List filtersList = ref.watch(filtersListProvider);
    final List<Meal> filteredMeals = mealsFiltering(focusedMeals, filtersList);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          availableCategories.firstWhere((element) => element.id == id).title,
        ),
      ),
      body: (filteredMeals.isEmpty)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Uh oh ... nothing here!",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                const SizedBox(height: 20),
                Text("Try selecting a different category!",
                    style: Theme.of(context).textTheme.headline6),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MealDetails(filteredMeals[index].id)));
                  },
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        height: 220,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            filteredMeals[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      OverlappingContainer(filteredMeals, index)
                    ],
                  ),
                );
              },
              itemCount: filteredMeals.length,
            ),
    );
  }
}
