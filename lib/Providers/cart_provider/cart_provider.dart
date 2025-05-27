import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:launder_land/models/products_model.dart';

final cartNotifierProvider = ChangeNotifierProvider<CartNotifier>((ref) {
  return CartNotifier();
});

class CartNotifier extends ChangeNotifier {
  final FlutterCart _flutterCart = FlutterCart();

  void addToCart(Product product) {
    final existingItemIndex = _flutterCart.cartItemsList.indexWhere(
      (item) => item.productId == product.vendorProducts![0].id.toString(),
    );

    if (existingItemIndex != -1) {
      incrementQuantity(product);
    } else {
      _flutterCart.addToCart(
        cartModel: CartModel(
          productId: product.vendorProducts![0].id.toString(),
          productName: product.title!,
          variants: [
            ProductVariant(
              price: product.price!.toDouble(),
              // Only include parameters that ProductVariant actually accepts
              // Typically just 'price' is required
            ),
          ],
          productImages: [product.mediaUrls!.images![0].image!],
          productDetails: product.categories![0].title!,
          productMeta: product.toJson(),
        ),
      );
    }
    notifyListeners();
  }

  void incrementQuantity(Product product) {
    final productId = product.vendorProducts![0].id.toString();
    final item = _flutterCart.cartItemsList.firstWhere(
      (item) => item.productId == productId,
      orElse: () => CartModel(
        productId: '',
        productName: '',
        variants: [],
        productDetails: '',
      ),
    );

    if (item.productId.isNotEmpty) {
      _flutterCart.updateQuantity(productId, item.variants, item.quantity + 1);
      notifyListeners();
    }
  }

  void decrementQuantity(Product product) {
    final productId = product.vendorProducts![0].id.toString();
    final item = _flutterCart.cartItemsList.firstWhere(
      (item) => item.productId == productId,
      orElse: () => CartModel(
        productId: '',
        productName: '',
        variants: [],
        productDetails: '',
      ),
    );

    if (item.productId.isNotEmpty && item.quantity > 1) {
      _flutterCart.updateQuantity(productId, item.variants, item.quantity - 1);
      notifyListeners();
    }
  }

  void removeFromCartWithProduct(Product product) {
    final productId = product.vendorProducts![0].id.toString();
    final item = _flutterCart.cartItemsList.firstWhere(
      (item) => item.productId == productId,
      orElse: () => CartModel(
        productId: '',
        productName: '',
        variants: [],
        productDetails: '',
      ),
    );

    if (item.productId.isNotEmpty) {
      _flutterCart.removeItem(productId, item.variants);
      notifyListeners();
    }
  }

  void removeFromCartWithProductId(String productId) {
    final item = _flutterCart.cartItemsList.firstWhere(
      (item) => item.productId == productId,
      orElse: () => CartModel(
        productId: '',
        productName: '',
        variants: [],
        productDetails: '',
      ),
    );

    if (item.productId.isNotEmpty) {
      _flutterCart.removeItem(productId, item.variants);
      notifyListeners();
    }
  }

  void updateQuantity(
      String productId, List<ProductVariant> variants, int newQuantity) {
    _flutterCart.updateQuantity(productId, variants, newQuantity);
    notifyListeners();
  }

  void clearCart() {
    _flutterCart.clearCart();
    notifyListeners();
  }

  // Getters
  int get getCartCount => _flutterCart.cartLength;
  List<CartModel> get getCartItems => _flutterCart.cartItemsList;
  double get getTotalAmount => _flutterCart.total;
  double get subtotal => _flutterCart.subtotal;

  bool isProductInCart(String productId) {
    return _flutterCart.cartItemsList
        .any((item) => item.productId == productId);
  }

  int getProductQuantity(String productId) {
    final item = _flutterCart.cartItemsList.firstWhere(
      (item) => item.productId == productId,
      orElse: () => CartModel(
        productId: '',
        productName: '',
        variants: [],
        productDetails: '',
      ),
    );
    return item.productId.isNotEmpty ? item.quantity : 0;
  }

  void deleteProduct(String string) {}

  void removeItem(String string) {}
}
