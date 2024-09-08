import 'package:flutter/foundation.dart';
import 'package:ice_cream_cart/product_store/data/product_data.dart';
import 'package:ice_cream_cart/product_store/model/icecream.dart';

double _salesTaxRate = 0.18;
double _shippingCostPerItem = 10;

class AppStateModel extends ChangeNotifier {
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<Icecreams> _availableProducts = [];

  final _productsInCart = <int, int>{};

  Map<int, int> get productsInCart {
    return Map.from(_productsInCart);
  }

  Icecreams getProductById(int id) {
    return _availableProducts.firstWhere((element) => element.id == id);
  }

  List<Icecreams> getProducts() {
    return _availableProducts;
  }

  int get totalCartQuantity {
    return _productsInCart.values.fold(0, (sum, val) => sum + val);
  }

  double get subtotalCost {
    return _productsInCart.keys
        .map((id) => _availableProducts[id].price! * _productsInCart[id]!)
        .fold(0, (sum, val) => sum + val);
  }

  double get shippingCost {
    return _shippingCostPerItem *
        _productsInCart.values.fold(0.0, (sum, val) => sum + val);
  }

  double get tax {
    return subtotalCost * _salesTaxRate;
  }

  double get totalCost {
    return subtotalCost + shippingCost + tax;
  }

  void addProductToCart(int productId) {
    if (!_productsInCart.containsKey(productId)) {
      _productsInCart[productId] = 1;
    } else {
      _productsInCart[productId] = _productsInCart[productId]! + 1;
    }
    notifyListeners();
  }

  void removeProductFromCart(int productId) {
    if (!_productsInCart.containsKey(productId)) {
      if (_productsInCart[productId] == 1) {
        _productsInCart.remove(productId);
      } else {
        _productsInCart[productId] = _productsInCart[productId]! - 1;
      }
    }
    notifyListeners();
  }

  void clearCart() {
    _productsInCart.clear();
    notifyListeners();
  }

  List<Icecreams> search(String query) {
    return _availableProducts
        .where(
          (product) =>
              product.flavour!.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  Future<void> loadProducts() async {
    _availableProducts = await ProductData.loadAllIcecreams();
    notifyListeners();
  }
}
