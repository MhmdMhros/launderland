import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:launder_land/Providers/cart_provider/cart_provider.dart';
import 'package:launder_land/screens/cart/cart_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CartBottomSheet extends ConsumerStatefulWidget {
  const CartBottomSheet({super.key, this.hasBottomNav = false});
  final bool hasBottomNav;

  @override
  ConsumerState<CartBottomSheet> createState() => _CartBottomSheetState();
}

class _CartBottomSheetState extends ConsumerState<CartBottomSheet> {
  @override
  Widget build(BuildContext context) {
    int count = ref.watch(cartNotifierProvider).getCartCount;
    double total = ref.watch(cartNotifierProvider).getTotalAmount;

    void onPressed() {
      pushScreenWithoutNavBar(context, CartScreen());
    }

    return count == 0
        ? SizedBox.shrink()
        : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00BE78),
              minimumSize: const Size(329, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            ),
            child: Text(
              "Proceed to Basket EGP $total",
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          );
  }
}
