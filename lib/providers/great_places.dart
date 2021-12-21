import 'dart:io';

import 'package:flutter/material.dart';
import '/helpers/db_helper.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  addPlace(String title, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        image: pickedImage,
        title: title,
        location: null);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('places');

    _items = dataList
        .map(
          (item) => Place(
            id: item['id'].toString(),
            title: item['title'].toString(),
            location: null,
            image: File(
              item['image'].toString(),
            ),
          ),
        )
        .toList();
    notifyListeners();
  }
}
