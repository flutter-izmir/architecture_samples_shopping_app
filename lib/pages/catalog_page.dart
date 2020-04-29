import 'package:architecture_samples_shopping_app/models/item_model.dart';
import 'package:architecture_samples_shopping_app/pages/cart_page.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatefulWidget {
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final List<Item> catalog = Item.catalog;

  List<Item> saved = List<Item>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog"),
        elevation: 0,
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push<List<Item>>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(
                        items: saved,
                      ),
                    ),
                  ).then((List<Item> items) {
                    setState(() {
                      saved = items;
                    });
                  });
                },
              ),
              Positioned(
                left: 5,
                top: 5,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.red[700],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text("${saved.length}"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: catalog.length,
        itemBuilder: (context, index) {
          final item = catalog[index];
          final alreadySaved = saved.contains(item);
          return ListTile(
            title: Text(
              item.name,
              style: TextStyle(color: Colors.blue[700]),
            ),
            subtitle: Text("${item.price} \$"),
            trailing: IconButton(
              color: alreadySaved ? Colors.blue[700] : null,
              icon: Icon(alreadySaved
                  ? Icons.remove_shopping_cart
                  : Icons.add_shopping_cart),
              onPressed: () {
                setState(() {
                  if (alreadySaved) {
                    saved.remove(item);
                  } else {
                    saved.add(item);
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}
