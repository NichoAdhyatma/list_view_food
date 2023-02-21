import 'package:flutter/material.dart';
import 'package:list_view_food/pages/detail_page.dart';
import 'package:list_view_food/pages/home_list.dart';
import 'package:list_view_food/providers/food_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const ListViewApp());

class ListViewApp extends StatelessWidget {
  const ListViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ListFoods(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        home: const ListWidget(),
        routes: {
          DetailFood.routeName: (context) => const DetailFood(),
        },
      ),
    );
  }
}
