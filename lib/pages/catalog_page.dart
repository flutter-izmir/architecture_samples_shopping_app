import 'package:architecture_samples_shopping_app/models/item_model.dart';
import 'package:architecture_samples_shopping_app/pages/cart_page.dart';
import 'package:architecture_samples_shopping_app/stores/cart/cart_store.dart';
import 'package:architecture_samples_shopping_app/stores/catalog/catalog_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class CatalogPage extends StatefulWidget {
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final _catalogStore = Catalog();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _catalogStore.loadCatalog();
  }

  @override
  Widget build(BuildContext context) {
    final _cartStore = Provider.of<Cart>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Catalog"),
          elevation: 0,
          actions: <Widget>[
            Observer(builder: (_) {
              return Stack(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(),
                        ),
                      );
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
                          child: Text("${_cartStore.cart.length}"),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            })
          ],
        ),
        body: Observer(
            name: "teset",
            builder: (BuildContext context) {
              return _catalogStore.loading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: _catalogStore.items.length,
                      itemBuilder: (context, index) {
                        Item item = _catalogStore.items[index];
                        return Observer(
                          builder: (BuildContext context) {
                            bool alreadyAdded = _cartStore.cart
                                .contains(_catalogStore.items[index]);
                            return ListTile(
                              title: Text(
                                item.name,
                                style: TextStyle(color: Colors.blue[700]),
                              ),
                              subtitle: Text("${item.price} \$"),
                              trailing: IconButton(
                                color: alreadyAdded ? Colors.blue[700] : null,
                                icon: Icon(
                                  alreadyAdded
                                      ? Icons.remove_shopping_cart
                                      : Icons.add_shopping_cart,
                                ),
                                onPressed: () {
                                  if (alreadyAdded) {
                                    _cartStore.removeItem(item);
                                  } else {
                                    _cartStore.addItem(item);
                                  }
                                },
                              ),
                            );
                          },
                        );
                      },
                    );
            }));
  }
}
