import 'package:meta/meta.dart' show required;

class Item {
  const Item({@required this.id, @required this.name, @required this.price});
  final int id;
  final String name;
  final double price;

  static const catalog = <Item>[
    Item(id: 1, name: "Egg", price: 5.0),
    Item(id: 2, name: "Milk", price: 2.0),
    Item(id: 3, name: "Bread", price: 3.0),
    Item(id: 4, name: "Orange Juice", price: 4.0),
    Item(id: 5, name: "Fruit", price: 8.0),
    Item(id: 6, name: "Cheese", price: 15.5),
    Item(id: 7, name: "Garlic", price: 2.0),
    Item(id: 8, name: "Chicken Breast", price: 12.5),
    Item(id: 9, name: "Ice Cream", price: 5.5),
    Item(id: 10, name: "Coffee", price: 20.0),
    Item(id: 11, name: "Tea", price: 4.0),
    Item(id: 12, name: "Pizza", price: 12.5),
    Item(id: 13, name: "Bean", price: 8.0),
    Item(id: 14, name: "Black Carrot Fermented Juice", price: 4.5),
    Item(id: 15, name: "Butter", price: 10.5),
    Item(id: 16, name: "Salt", price: 2.5),
    Item(id: 17, name: "Pepper", price: 1.5),
    Item(id: 18, name: "Olive Oil", price: 20.0),
  ];
}
