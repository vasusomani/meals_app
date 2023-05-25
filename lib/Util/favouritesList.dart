import 'package:flutter/material.dart';
import 'package:meals_app/Util/data.dart';
import 'Structures/Meals.dart';

List<Meal> favoritesList = [];

List<Meal> addToFavorites(String id) {
  Meal focusedMeal = Meals.firstWhere((element) => element.id == id);
  if (favoritesList.contains(focusedMeal)) {
    favoritesList.remove(focusedMeal);
  } else {
    favoritesList.add(focusedMeal);
  }
  return favoritesList;
}

bool isFavorite(Meal focusedMeal) {
  if (favoritesList.contains(focusedMeal)) {
    return true;
  } else {
    return false;
  }
}
