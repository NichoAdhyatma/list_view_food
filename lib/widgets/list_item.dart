import 'package:flutter/material.dart';
import 'package:list_view_food/pages/detail_page.dart';
import 'package:list_view_food/providers/food_provider.dart';
import 'package:provider/provider.dart';

class ListItem extends StatefulWidget {
  const ListItem(
    this.id,
    this.title,
    this.description,
    this.rate,
    this.imageUrl, {
    super.key,
  });

  final String title;
  final String description;
  final double rate;
  final String imageUrl;
  final String id;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool isInit = true;
  bool isFav = false;
  @override
  void didChangeDependencies() {
    if (isInit) {
      var item = Provider.of<ListFoods>(context).getFoodById(widget.id);
      isFav = item.isFavorite;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final foods = Provider.of<ListFoods>(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailFood.routeName,
          arguments: widget.id,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.imageUrl),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text("⭐ ${widget.rate}"),
                  TextButton(
                    onPressed: () {
                      foods.setFavorite(widget.id);
                      setState(() {
                        isFav = !isFav;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          isFav
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: Colors.redAccent,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Text(
                          "Add to Favorite",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
