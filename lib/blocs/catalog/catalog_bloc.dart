import 'dart:async';

import 'package:architecture_samples_shopping_app/models/item_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  @override
  CatalogState get initialState => CatalogLoading();

  @override
  Stream<CatalogState> mapEventToState(
    CatalogEvent event,
  ) async* {
    if (event is LoadCatalog) {
      yield CatalogLoading();
      try {
        await Future.delayed(Duration(seconds: 1));
        final items = Item.catalog;
        yield CatalogReady(items: items);
      } catch (_) {
        yield CatalogError();
      }
    }
  }
}
