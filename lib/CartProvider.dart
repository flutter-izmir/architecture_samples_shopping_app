import 'package:flutter/material.dart';
import 'models/item_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Item> catalog = Item.catalog;

  List<Item> _saved = List<Item>();
  double _totalPrice = 0;

  List<Item> get saved => _saved;
  double get totalPrice => _totalPrice;

  void addItem(Item item) {
    saved.add(item);
    _totalPrice += item.price;
    notifyListeners();
  }

  void removeItem(Item item) {
    saved.remove(item);
    _totalPrice -= item.price;
    notifyListeners();
  }
}
