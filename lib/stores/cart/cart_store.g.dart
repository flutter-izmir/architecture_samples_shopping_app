// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Cart on CartStore, Store {
  Computed<String> _$getTotalComputed;

  @override
  String get getTotal =>
      (_$getTotalComputed ??= Computed<String>(() => super.getTotal)).value;

  final _$cartAtom = Atom(name: 'CartStore.cart');

  @override
  ObservableList<Item> get cart {
    _$cartAtom.context.enforceReadPolicy(_$cartAtom);
    _$cartAtom.reportObserved();
    return super.cart;
  }

  @override
  set cart(ObservableList<Item> value) {
    _$cartAtom.context.conditionallyRunInAction(() {
      super.cart = value;
      _$cartAtom.reportChanged();
    }, _$cartAtom, name: '${_$cartAtom.name}_set');
  }

  final _$addItemAsyncAction = AsyncAction('addItem');

  @override
  Future addItem(Item item) {
    return _$addItemAsyncAction.run(() => super.addItem(item));
  }

  final _$CartStoreActionController = ActionController(name: 'CartStore');

  @override
  dynamic removeItem(Item items) {
    final _$actionInfo = _$CartStoreActionController.startAction();
    try {
      return super.removeItem(items);
    } finally {
      _$CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'cart: ${cart.toString()},getTotal: ${getTotal.toString()}';
    return '{$string}';
  }
}
