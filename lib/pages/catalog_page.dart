import 'package:architecture_samples_shopping_app/blocs/cart/cart_bloc.dart';
import 'package:architecture_samples_shopping_app/blocs/catalog/catalog_bloc.dart';
import 'package:architecture_samples_shopping_app/models/item_model.dart';
import 'package:architecture_samples_shopping_app/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogPage extends StatefulWidget {
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog"),
        elevation: 0,
        actions: <Widget>[
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
                return CircularProgressIndicator();
              }
              if (state is CartLoaded) {
                return Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.push<List<Item>>(
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
                            child: Text("${state.cart.length}"),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return Text("An error occurred");
            },
          ),
        ],
      ),
      body: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) {
          if (state is CatalogLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CatalogReady) {
            final catalog = state.items;
            return ListView.builder(
              itemCount: catalog.length,
              itemBuilder: (context, index) {
                final item = catalog[index];
                return ListTile(
                  title: Text(
                    item.name,
                    style: TextStyle(color: Colors.blue[700]),
                  ),
                  subtitle: Text("${item.price} \$"),
                  trailing: _AddButton(item: item),
                );
              },
            );
          }
          if (state is CatalogError) {
            return Center(
              child: Text("An error occurred"),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  _AddButton({@required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return CircularProgressIndicator();
        }
        if (state is CartLoaded) {
          final alreadyAdded = state.cart.contains(item);
          return IconButton(
            color: alreadyAdded ? Colors.blue[700] : null,
            icon: Icon(
              alreadyAdded
                  ? Icons.remove_shopping_cart
                  : Icons.add_shopping_cart,
            ),
            onPressed: alreadyAdded
                ? () => BlocProvider.of<CartBloc>(context)
                    .add(RemoveCart(item: item))
                : () =>
                    BlocProvider.of<CartBloc>(context).add(AddCart(item: item)),
          );
        }
        return Text("Something went wrong");
      },
    );
  }
}
