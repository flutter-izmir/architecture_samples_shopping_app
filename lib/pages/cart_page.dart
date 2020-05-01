import 'package:architecture_samples_shopping_app/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("My Cart"),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartLoaded) {
            final cart = state.cart;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return ListTile(
                        title: Text(item.name),
                        trailing: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () =>
                              BlocProvider.of<CartBloc>(context).add(
                            RemoveCart(item: item),
                          ),
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
                      "${state.totalPrice}",
                      style: TextStyle(fontSize: 40.0, color: Colors.blue[900]),
                    ),
                  ),
                )
              ],
            );
          }
          if (state is CartError) {
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
