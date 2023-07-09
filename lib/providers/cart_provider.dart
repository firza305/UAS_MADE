import 'package:flutter/foundation.dart';

import '../models/product.dart';

class CartProvider with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }

  get totalPrice => null;

  void addItem(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _items = [];
    notifyListeners();
  }
}
