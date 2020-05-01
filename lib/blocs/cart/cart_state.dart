part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  CartLoaded({@required this.cart});
  final List<Item> cart;

  double get totalPrice =>
      cart.fold(0.0, (total, currentItem) => total + currentItem.price);

  @override
  List<Object> get props => [cart];
}

class CartError extends CartState {
  @override
  List<Object> get props => [];
}
