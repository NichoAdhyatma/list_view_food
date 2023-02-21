import 'package:flutter/material.dart';
import 'package:list_view_food/providers/food_provider.dart';
import 'package:provider/provider.dart';

class DetailFood extends StatelessWidget {
  const DetailFood({super.key});
  static const routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final String foodId = ModalRoute.of(context)!.settings.arguments as String;

    final foodProv = Provider.of<ListFoods>(context);
    final foodItem = Provider.of<ListFoods>(context).getFoodById(foodId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Indonesian Food",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(foodItem.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              foodItem.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              foodItem.description,
              style: TextStyle(color: Colors.grey[600], fontSize: 22),
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "⭐ ${foodItem.rate}",
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    foodProv.setFavorite(foodId);
                  },
                  icon: foodItem.isFavorite
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                        )
                      : const Icon(
                          Icons.favorite_outline,
                          color: Colors.redAccent,
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
