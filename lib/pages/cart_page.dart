import 'package:architecture_samples_shopping_app/stores/cart/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  CartPage();

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final _cartStore = Provider.of<Cart>(context);

    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("My Cart"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Observer(builder: (_) {
              return ListView.builder(
                itemCount: _cartStore.cart.length,
                itemBuilder: (context, index) {
                  final item = _cartStore.cart[index];
                  return ListTile(
                    title: Text(item.name),
                    trailing: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _cartStore.removeItem(item);
                      },
                    ),
                  );
                },
              );
            }),
          ),
          Divider(
            color: Colors.pink[700],
            thickness: 5,
          ),
          Observer(builder: (_) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 100,
                child: Text(
                  "Total: ${_cartStore.getTotal}",
                  style: TextStyle(fontSize: 40.0, color: Colors.blue[900]),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
