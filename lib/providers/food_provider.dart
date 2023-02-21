import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:list_view_food/models/food_model.dart';

class ListFoods extends ChangeNotifier {
  final List<FoodModel> _foods = [
    FoodModel(
      id: "1",
      title: "Sate Ayam Madura",
      description: faker.lorem.sentences(10).toString(),
      rate: 4.7,
      imageUrl: "images/sate.jpg",
    ),
    FoodModel(
      id: "2",
      title: "Pempek Palembang",
      description: faker.lorem.sentences(10).toString(),
      rate: 4.8,
      imageUrl: "images/pempek.jpeg",
    ),
    FoodModel(
      id: "3",
      title: "Soto Daging",
      description: faker.lorem.sentences(10).toString(),
      rate: 5,
      imageUrl: "images/soto.jpeg",
    ),
    FoodModel(
      id: "4",
      title: "Rujak Cingur",
      description: faker.lorem.sentences(10).toString(),
      imageUrl: "images/rujak.jpeg",
      rate: 5,
    ),
    FoodModel(
      id: "5",
      title: "Rawon Daging",
      description: faker.lorem.sentences(10).toString(),
      imageUrl: "images/rawon.jpeg",
      rate: 5,
    ),
  ];

  List<FoodModel> get foods => _foods;

  FoodModel getFoodById(String id) {
    return _foods.firstWhere((element) => element.id == id);
  }

  void setFavorite(String id) {
    var el = _foods.firstWhere((element) => element.id == id);
    el.isFavorite = !el.isFavorite;
    notifyListeners();
  }
}
