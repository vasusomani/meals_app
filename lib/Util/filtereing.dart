import 'package:flutter/material.dart';
import 'Structures/Meals.dart';

List<Meal> mealsFiltering(List<Meal> focusedMeals, List<dynamic> filtersList) {
  List<Meal> filteredMeals = focusedMeals.where((element) {
    if (filtersList[0]) {
      if (!element.isGlutenFree) {
        return false;
      }
    }
    if (filtersList[1]) {
      if (!element.isLactoseFree) {
        return false;
      }
    }
    if (filtersList[2]) {
      if (!element.isVegetarian) {
        return false;
      }
    }
    if (filtersList[3]) {
      if (!element.isVegan) {
        return false;
      }
    }
    return true;
  }).toList();
  return filteredMeals;
}
