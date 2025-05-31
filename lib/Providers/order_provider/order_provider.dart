import 'dart:convert';
import 'dart:developer';

import 'package:flutter_cart/model/cart_model.dart';
import 'package:launder_land/models/order_model/order_request_model.dart';
import 'package:launder_land/models/payment_methods_model/payment_methods_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_provider.g.dart';

@Riverpod(keepAlive: true)
class Order extends _$Order {
  @override
  OrderRequestModel build() {
    return OrderRequestModel(
      coupon_code: '',
      products: [], // Initialize with an empty list to avoid null
      address_id: null,
      payment_method_id: null,
      payment_method_slug: null,
      notes: null,
      order_type: 'NORMAL',
      wallet_balance: null,
      meta: null,
    );
  }

  void setAddressId(int addressId) {
    state = state.copyWith(address_id: addressId);
  }

  void setPaymentMethod(PaymentMethodsModel paymentMethod) {
    state = state.copyWith(
      payment_method_id: paymentMethod.id,
      payment_method_slug: paymentMethod.slug,
    );
  }

  void setNotes(String notes) {
    state = state.copyWith(notes: notes);
  }

  void setOrderType(String orderType) {
    state = state.copyWith(order_type: orderType);
  }

  void setWalletBalance(double walletBalance) {
    state = state.copyWith(wallet_balance: walletBalance);
  }

  void setProducts(List<CartModel> products) {
    final List<Product> orderProducts = [];
    for (CartModel product in products) {
      try {
        final int productId = int.parse(product.productId);
        orderProducts.add(
          Product(
            id: productId,
            quantity: product.quantity,
            addons: [], // Adjust if addons are needed
          ),
        );
      } catch (e) {
        // Log the error and skip invalid products
        log('Error parsing product ID ${product.productId}: $e');
      }
    }
    state = state.copyWith(products: orderProducts);
  }

  void clearOrder() {
    state = OrderRequestModel(
      coupon_code: '',
      products: [],
      address_id: null,
      payment_method_id: null,
      payment_method_slug: null,
      notes: null,
      order_type: null,
      wallet_balance: null,
      meta: null,
    );
  }

  void setMeta(Meta meta) {
    state = state.copyWith(meta: JsonEncoder().convert(meta));
  }

  // Add a method to validate the order before submission
  String? validateOrder() {
    if (state.address_id == null) {
      return 'Address ID is required';
    }
    if (state.payment_method_id == null || state.payment_method_slug == null) {
      return 'Payment method is required';
    }
    if (state.products == null || state.products!.isEmpty) {
      return 'At least one product is required';
    }
    return null; // Return null if validation passes
  }

  void setTotalAmount(double amountToPay) {}
}
