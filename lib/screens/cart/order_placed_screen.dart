import 'package:flutter/material.dart';
import 'package:launder_land/screens/orders/orders_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize:
            MainAxisSize.min, // Ensures the modal takes only the needed height
        children: [
          Image.asset(
            'assets/icons/receipt.png',
            width: 120,
            height: 120,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 24),
          const Text(
            'ORDER PLACED SUCCESSFULLY!',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF222A59),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Your Order Was Successfully Placed',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 40),
          FilledButton(
            onPressed: () {
              pushReplacementWithNavBar(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrdersScreen(),
                ),
              );
            },
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF00BE78),
              foregroundColor: Colors.white,
              minimumSize: const Size(343, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: const Text(
              'Confirm',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
