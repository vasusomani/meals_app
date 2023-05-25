import 'package:flutter/material.dart';
import 'package:meals_app/Pages/Categories.dart';
import 'package:meals_app/Pages/Favorites.dart';
import 'package:meals_app/Util/SideDrawer.dart';

class BottomNav extends StatefulWidget {
  BottomNav({super.key, this.mainIndex = 0});
  int mainIndex;
  @override
  State<BottomNav> createState() => _BottomNavState(mainIndex);
}

class _BottomNavState extends State<BottomNav> {
  _BottomNavState(this.mainIndex);
  int mainIndex;
  @override
  Widget build(BuildContext context) {
    Widget currentPage =
        mainIndex == 1 ? const Favorites() : const Categories();
    return Scaffold(
        body: currentPage,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: mainIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted_outlined),
                label: "Categories",
                activeIcon: Icon(Icons.format_list_bulleted_outlined)),
            BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: "Favorites",
                activeIcon: Icon(
                  Icons.star,
                  color: Colors.blue,
                ))
          ],
          onTap: (value) {
            setState(() {
              mainIndex = value;
            });
          },
        ));
  }
}
