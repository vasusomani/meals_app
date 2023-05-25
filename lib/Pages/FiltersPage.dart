import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Providers/FiltersProvider.dart';
import 'MealsList.dart';

class FiltersPage extends ConsumerStatefulWidget {
  const FiltersPage({Key? key}) : super(key: key);

  @override
  ConsumerState<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends ConsumerState<FiltersPage> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVeg = false;
  bool isVegan = false;
  @override
  Widget build(BuildContext context) {
    List<bool> filtersList = ref.read(filtersListProvider);

    return WillPopScope(
      onWillPop: () async {
        ref.read(filtersListProvider.notifier).changeFilters(filtersList);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Your Filters"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SwitchListTile(
                  contentPadding: const EdgeInsets.all(15),
                  value: filtersList[0],
                  tileColor: Colors.white10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onChanged: (value) {
                    setState(() {
                      filtersList[0] = value;
                    });
                  },
                  title: Text(
                    "Gluten-free",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  subtitle: const Text("Only includes gluten free meals."),
                ),
                SwitchListTile(
                  contentPadding: const EdgeInsets.all(15),
                  value: filtersList[1],
                  tileColor: Colors.white10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onChanged: (value) {
                    setState(() {
                      filtersList[1] = value;
                    });
                  },
                  title: Text(
                    "Lactose-free",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  subtitle: const Text("Only includes lactose free meals."),
                ),
                SwitchListTile(
                  contentPadding: const EdgeInsets.all(15),
                  value: filtersList[2],
                  tileColor: Colors.white10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onChanged: (value) {
                    setState(() {
                      filtersList[2] = value;
                    });
                  },
                  title: Text(
                    "Vegetarian",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  subtitle: const Text("Only includes vegetarian meals."),
                ),
                SwitchListTile(
                  contentPadding: const EdgeInsets.all(15),
                  value: filtersList[3],
                  tileColor: Colors.white10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onChanged: (value) {
                    setState(() {
                      filtersList[3] = value;
                    });
                  },
                  title: Text(
                    "Vegan",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  subtitle: const Text("Only includes vegan meals."),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
