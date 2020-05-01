part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class LoadCart extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddCart extends CartEvent {
  AddCart({@required this.item});
  final Item item;

  @override
  List<Object> get props => [item];
}

class RemoveCart extends CartEvent {
  RemoveCart({@required this.item});
  final Item item;

  @override
  List<Object> get props => [item];
}
