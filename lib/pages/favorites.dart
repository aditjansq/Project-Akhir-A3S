import 'package:flutter/material.dart';

class FavoriteCatsProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _favoriteCats = [];

  // Get the list of favorite cats
  List<Map<String, dynamic>> get favoriteCats => _favoriteCats;

  // Add a cat to the favorites
  void addToFavorites(Map<String, dynamic> cat) {
    if (!_favoriteCats.any((favoriteCat) => favoriteCat['name'] == cat['name'])) {
      _favoriteCats.add(cat);
      notifyListeners();
    }
  }

  // Remove a cat from the favorite
  void removeFromFavorites(String catName) {
    _favoriteCats.removeWhere((cat) => cat['name'] == catName);
    notifyListeners();
  }
}
