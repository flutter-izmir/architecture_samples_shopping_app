import 'dart:async';

import 'package:architecture_samples_shopping_app/models/item_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  @override
  CartState get initialState => CartLoading();

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    final currentState = state;
    if (event is LoadCart) {
      yield CartLoading();
      try {
        await Future.delayed(Duration(seconds: 1));
        yield CartLoaded(cart: []);
      } catch (_) {
        yield CartError();
      }
    }
    if (event is AddCart) {
      if (currentState is CartLoaded) {
        try {
          yield CartLoaded(cart: List.from(currentState.cart)..add(event.item));
        } catch (_) {
          yield CartError();
        }
      }
    }
    if (event is RemoveCart) {
      if (currentState is CartLoaded) {
        try {
          yield CartLoaded(
              cart: List.from(
                  currentState.cart.where((item) => item.id != event.item.id)));
        } catch (_) {
          yield CartError();
        }
      }
    }
  }
}
