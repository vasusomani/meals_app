import 'package:flutter/material.dart';
import 'package:meals_app/Pages/MealsList.dart';
import 'package:meals_app/Util/SideDrawer.dart';
import 'package:meals_app/Util/data.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    List<bool> filtersList = [false, false, false, false];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Categories",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: SideDrawer(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            mainAxisExtent: 120),
        padding: const EdgeInsets.all(20),
        itemCount: availableCategories.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MealsList(availableCategories[index].id))),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: availableCategories[index].color,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                availableCategories[index].title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
