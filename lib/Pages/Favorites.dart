import 'package:flutter/material.dart';
import 'package:meals_app/Util/SideDrawer.dart';
import 'package:meals_app/Util/favouritesList.dart';

import '../Util/OverlappingContainer.dart';
import 'MealDetails.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Favorites",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: SideDrawer(),
      body: (favoritesList.isEmpty)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Uh oh ... nothing here!",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                SizedBox(height: 20),
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
                            MealDetails(favoritesList[index].id),
                      ),
                    ).whenComplete(() {
                      setState(() {});
                    });
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
                          child: Hero(
                            tag: favoritesList[index].id,
                            child: Image.network(
                              favoritesList[index].imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      OverlappingContainer(favoritesList, index)
                    ],
                  ),
                );
              },
              itemCount: favoritesList.length,
            ),
    );
  }
}
