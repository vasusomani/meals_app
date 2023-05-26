import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: focusedMeal.id,
              child: SizedBox(
                height: Height * 0.35,
                child: Image.network(
                  focusedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: Text(
                        "Ingredients",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: Colors.deepOrangeAccent.shade100),
                      ),
                    ),
                    ...({...focusedMeal.ingredients}.map((e) => Text(
                          "•  $e\n",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(height: 0.7),
                          softWrap: true,
                          textAlign: TextAlign.start,
                        ))),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 20),
                      child: Text(
                        "Steps",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: Colors.deepOrangeAccent.shade100),
                      ),
                    ),
                    ...({...focusedMeal.steps}.map((e) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "•  ",
                            ),
                            Expanded(
                              child: Text(
                                "$e\n",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(height: 0.9),
                                textAlign: TextAlign.start,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ))),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
