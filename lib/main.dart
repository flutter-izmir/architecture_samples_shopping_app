import 'package:architecture_samples_shopping_app/pages/catalog_page.dart';
import 'package:architecture_samples_shopping_app/stores/cart/cart_store.dart';
import 'package:architecture_samples_shopping_app/stores/catalog/catalog_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _catalogStore = Catalog();
  @override
  Widget build(BuildContext context) {
    return Provider<Cart>(
      create: (context) => Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CatalogPage(),
      ),
    );
  }
}
