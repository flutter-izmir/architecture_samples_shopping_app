import 'package:architecture_samples_shopping_app/models/item_model.dart';
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class Cart = CartStore with _$Cart;

abstract class CartStore with Store {
  @observable
  ObservableList<Item> cart = ObservableList();

  @computed
  String get getTotal => cart.fold(0.0, (total, currentItem) => total + currentItem.price).toString() + "\$";

  @action
  removeItem(Item items) {
    try {
      cart.remove(items);
    } catch (e) {
      print(e);
    }
  }

  @action
  addItem(Item item) async {
    try {
      cart.add(item);
    } catch (e) {
      print(e);
    }
  }

   
}
