import 'package:flutter/material.dart';
import 'package:meals_app/Pages/FiltersPage.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          DrawerHeader(
              decoration:
                  BoxDecoration(color: Colors.red.shade800.withOpacity(0.7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.fastfood_rounded,
                    size: 50,
                  ),
                  const SizedBox(width: 15),
                  Text("Cooking Up!",
                      style: Theme.of(context).textTheme.headlineSmall)
                ],
              )),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  const Icon(
                    Icons.restaurant,
                    size: 25,
                  ),
                  const SizedBox(width: 25),
                  Text(
                    "Meals",
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push<List<bool>>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FiltersPage(),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  const Icon(
                    Icons.settings,
                    size: 25,
                  ),
                  const SizedBox(width: 25),
                  Text(
                    "Filters",
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
