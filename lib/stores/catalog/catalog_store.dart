import 'package:architecture_samples_shopping_app/models/item_model.dart';
import 'package:mobx/mobx.dart';

part 'catalog_store.g.dart';

class Catalog = CatalogStore with _$Catalog;

abstract class CatalogStore with Store {
  @observable
  ObservableList<Item> items = ObservableList();

  @observable
  bool loading = false;

  @action
  loadCatalog() async {
    try {
      loading = true;
      await Future.delayed(Duration(seconds: 1));
      final items = Item.catalog;
      this.items.addAll(items);
      loading = false;
    } catch (e) {
      print(e);
    }
  }
}
