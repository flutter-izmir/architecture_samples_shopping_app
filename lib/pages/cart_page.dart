import 'package:architecture_samples_shopping_app/models/item_model.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  CartPage({@required this.items});

  final List<Item> items;

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Item> get items => widget.items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("My Cart"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, items);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        items.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Divider(
            color: Colors.pink[700],
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 100,
              child: Text(
                "Total: ${calculateTotal(items)}",
                style: TextStyle(fontSize: 40.0, color: Colors.blue[900]),
              ),
            ),
          )
        ],
      ),
    );
  }

  double calculateTotal(List<Item> items) {
    return items
        .map((item) => item.price)
        .fold(0.0, (price1, price2) => price1 + price2);
  }
}
