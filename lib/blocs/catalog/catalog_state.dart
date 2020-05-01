part of 'catalog_bloc.dart';

abstract class CatalogState extends Equatable {
  const CatalogState();
}

class CatalogLoading extends CatalogState {
  @override
  List<Object> get props => [];
}

class CatalogReady extends CatalogState {
  CatalogReady({@required this.items});
  final List<Item> items;

  @override
  List<Object> get props => [items];
}

class CatalogError extends CatalogState {
  @override
  List<Object> get props => [];
}
