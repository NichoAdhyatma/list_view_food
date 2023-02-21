import 'package:flutter/material.dart';
import 'package:list_view_food/providers/food_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/list_item.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final listFood = Provider.of<ListFoods>(context).foods;
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
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) => ListItem(
          listFood[index].id,
          listFood[index].title,
          listFood[index].description,
          listFood[index].rate,
          listFood[index].imageUrl,
        ),
        itemCount: listFood.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          thickness: 1,
          color: Colors.grey[500],
        ),
      ),
    );
  }
}
