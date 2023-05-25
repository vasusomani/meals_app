import 'package:flutter/material.dart';
import 'package:meals_app/Pages/Favorites.dart';
import 'package:meals_app/Pages/MealsList.dart';
import 'package:meals_app/Util/bottomNav.dart';
import 'package:meals_app/Util/favouritesList.dart';

import '../Util/Structures/Meals.dart';
import '../Util/data.dart';

class MealDetails extends StatefulWidget {
  MealDetails(this.id, {super.key});
  String id;

  @override
  State<MealDetails> createState() => _MealDetailsState(id);
}

class _MealDetailsState extends State<MealDetails> {
  _MealDetailsState(this.id);
  String id;
  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    Meal focusedMeal = Meals.firstWhere((element) => element.id == widget.id);
    bool favourite = isFavorite(focusedMeal);
    return Scaffold(
      appBar: AppBar(
        title: Text(focusedMeal.title),
        actions: [
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.white,
                    content: favourite
                        ? const Text("Removed from favorites!")
                        : const Text("Added to favorites!"),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                        label: "View Favorites",
                        textColor: Colors.red,
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNav(mainIndex: 1),
                            ))),
                  ),
                );
                setState(() {
                  addToFavorites(id);
                });
              },
              icon: (favourite)
                  ? const Icon(Icons.star)
                  : const Icon(
                      Icons.star_border,
                      color: Colors.white,
                    ))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: Height * 0.35,
            child: Image.network(
              focusedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 20),
            child: Text(
              "Ingredients",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.deepOrangeAccent.shade100),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Text(
                    focusedMeal.ingredients[index],
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  );
                },
                itemCount: focusedMeal.ingredients.length,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              "Steps",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.deepOrangeAccent.shade100),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Text(
                    focusedMeal.steps[index],
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  );
                },
                itemCount: focusedMeal.steps.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
