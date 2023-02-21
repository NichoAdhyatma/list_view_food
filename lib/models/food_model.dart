class FoodModel {
  String id;
  String title;
  String description;
  String imageUrl;
  double rate;
  bool isFavorite = false;

  FoodModel({
    this.id = "",
    this.title = "",
    this.description = "",
    this.rate = 0.0,
    this.imageUrl = "",
  });
}
