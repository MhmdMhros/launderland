import 'package:flutter/material.dart';

class OrderPlacedDialog extends StatelessWidget {
  const OrderPlacedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success Image
            Image.asset(
              'assets/images/order_placed.png',
              width: 150,
            ),
            const SizedBox(height: 20),
            // Success Message
            const Text(
              'Order Placed',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your order has been placed successfully!\nGo to My Orders to check the status.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Navigation Button
            FilledButton(
              onPressed: () {
                Navigator.pop(context, 'navigate_to_orders'); // Return a result
              },
              style: FilledButton.styleFrom(
                fixedSize: const Size(200, 50),
                backgroundColor: const Color(0xFF222a59),
              ),
              child: const Text('Go to My Orders'),
            ),
          ],
        ),
      ),
    );
  }
}