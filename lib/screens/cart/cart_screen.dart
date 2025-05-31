import 'package:flutter/material.dart';
import 'package:flutter_cart/model/cart_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:launder_land/Providers/cart_provider/cart_provider.dart';
import 'package:launder_land/Providers/order_provider/order_provider.dart';
import 'package:launder_land/screens/cart/choose_address_screen.dart';
import 'package:launder_land/utils/operations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  double standardDeliveryFee = 25.0; // Default from design
  double expressDeliveryFee = 0; // To be calculated if selected
  double sosDeliveryFee = 0; // To be calculated if selected
  int walletBalance = 0;
  String selectedDelivery = 'Standard Delivery (within 48 hours)';
  TextEditingController notesController = TextEditingController();

  void getWalletBalance() async {
    Operations().getWalletBalance().then((balance) {
      if (mounted) {
        setState(() {
          walletBalance = balance!;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initDeliveryFees();
    getWalletBalance();
  }

  void initDeliveryFees() async {
    Future.delayed(Duration.zero, () {
      ref.read(orderProvider.notifier).setOrderType('NORMAL');
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      standardDeliveryFee = prefs.getInt('standardDeliveryFee')?.toDouble() ?? 0;
      expressDeliveryFee = prefs.getDouble('expressDeliveryFee') ?? 0;
      sosDeliveryFee = prefs.getDouble('sosDeliveryFee') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<CartModel> cart = ref.watch(cartNotifierProvider).getCartItems;
    final double total = ref.watch(cartNotifierProvider).getTotalAmount;

    // Delivery fee logic (simplified based on design)
    double getDeliveryFee() {
      switch (selectedDelivery) {
        case 'Standard Delivery (within 48 hours)':
          return standardDeliveryFee;
        case 'Express Delivery (within 24 hours)':
          return standardDeliveryFee * 1.5;
        case 'SOS Delivery (within 3 hours)':
          return standardDeliveryFee; // Double the delivery fee for SOS
        default:
          return standardDeliveryFee;
      }
    }

    double getAmountToPay() {
      double amount = total;
      if (selectedDelivery == 'SOS Delivery (within 3 hours)') {
        amount = total * 2; // Double the total amount for SOS delivery
      }
      return amount + getDeliveryFee();
    }

    Future<void> setOrder() async {
      ref.read(orderProvider.notifier).setProducts(cart);
      ref.read(orderProvider.notifier).setNotes(notesController.text);

      showModalBottomSheet(
        showDragHandle: true,
        isScrollControlled: true,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          minHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        context: context,
        builder: (context) {
          return ChooseAddressScreen(
            amountToPay: getAmountToPay(),
            carts: cart,
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Your Basket',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cart Items
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cart.length,
              itemBuilder: (context, index) {
                int count = ref
                    .watch(cartNotifierProvider)
                    .getCartItems
                    .firstWhere((element) => element.productId == cart[index].productId.toString(),
                        orElse: () => CartModel(productId: '', productName: '', variants: [], productDetails: ''))
                    .quantity;

                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.network(cart[index].productImages![0], width: 50, height: 50),
                  title: Text(
                    cart[index].productName,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text('EGP ${cart[index].variants[0].price}'),
                  trailing: Column(
                    children: [
                      Text('EGP ${count * cart[index].variants[0].price}', style: TextStyle(fontSize: 12)),
                      SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 105,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black.withOpacity(0.5),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (count > 1) {
                                    // Decrement quantity
                                    ref.read(cartNotifierProvider.notifier).updateQuantity(
                                          cart[index].productId.toString(),
                                          [
                                            ProductVariant(
                                              price: cart[index].variants[0].price.toDouble(),
                                            ),
                                          ],
                                          count - 1,
                                        );
                                  } else {
                                    // Remove item completely
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('Remove Item'),
                                        content: Text('Are you sure you want to remove this item from your cart?'),
                                        actions: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center, // Center the buttons horizontally
                                              children: [
                                                Container(
                                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                                  height: MediaQuery.sizeOf(context).height * 0.05,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF222a59), // Background color of the button
                                                    borderRadius: BorderRadius.circular(30), // Rounded corners
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () => Navigator.pop(context),
                                                    child: Text('Cancel'),
                                                  ),
                                                ),
                                                const SizedBox(width: 16), // Add space between buttons
                                                Container(
                                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                                  height: MediaQuery.sizeOf(context).height * 0.05,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFF00BE78), // Background color of the button
                                                    borderRadius: BorderRadius.circular(30), // Rounded corners
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      ref
                                                          .read(cartNotifierProvider.notifier)
                                                          .removeFromCartWithProductId(
                                                            cart[index].productId.toString(),
                                                          );
                                                    },
                                                    child: Text(
                                                      'Remove',
                                                      style: const TextStyle(
                                                          color: Colors.white), // Text color for the Remove button
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                                icon: count > 1
                                    ? SvgPicture.asset(
                                        'assets/icons/minus_ic.svg',
                                      )
                                    : Icon(Icons.delete_outline, size: 14, color: Colors.red),
                              ),
                              Text(
                                count.toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  ref.read(cartNotifierProvider.notifier).updateQuantity(
                                        cart[index].productId.toString(),
                                        [
                                          ProductVariant(
                                            price: cart[index].variants[0].price.toDouble(),
                                          ),
                                        ],
                                        count + 1,
                                      );
                                },
                                icon: SvgPicture.asset(
                                  'assets/icons/plus_ic.svg',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            // Additional Instructions
            TextField(
              controller: notesController,
              decoration: InputDecoration(
                  hintText: 'Additional Instructions',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
            ),
            Text('Ex. Wash White Clothes Separately', style: TextStyle(fontWeight: FontWeight.bold)),

            SizedBox(height: 20),
            // Delivery Options
            Text(
              'Delivery Options',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color(0xFF00BE78),
              ),
            ),
            Divider(
              height: 24,
            ),

            InkWell(
              onTap: () {
                setState(() {
                  selectedDelivery = 'Standard Delivery (within 48 hours)';
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Standard  Delivery (within 48 hours) ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF21295A),
                    ),
                  ),
                  selectedDelivery == 'Standard Delivery (within 48 hours)'
                      ? SvgPicture.asset('assets/icons/checked_radio.svg')
                      : Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05), // shadow color
                                blurRadius: 8,
                                spreadRadius: 0.1,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: SvgPicture.asset('assets/icons/unchecked_radio.svg'),
                        ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedDelivery = 'Express Delivery (within 24 hours)';
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Express Delivery (within 24 hours)',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF21295A),
                    ),
                  ),
                  selectedDelivery == 'Express Delivery (within 24 hours)'
                      ? SvgPicture.asset('assets/icons/checked_radio.svg')
                      : Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05), // shadow color
                                blurRadius: 8,
                                spreadRadius: 0.1,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: SvgPicture.asset('assets/icons/unchecked_radio.svg'),
                        ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  selectedDelivery = 'SOS Delivery (within 3 hours)';
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SOS Delivery (within 3 hours)',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF21295A),
                    ),
                  ),
                  selectedDelivery == 'SOS Delivery (within 3 hours)'
                      ? SvgPicture.asset('assets/icons/checked_radio.svg')
                      : Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05), // shadow color
                                blurRadius: 8,
                                spreadRadius: 0.1,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: SvgPicture.asset('assets/icons/unchecked_radio.svg'),
                        ),
                ],
              ),
            ),

            SizedBox(height: 20),
            // Payment Summary
            Text(
              'Payment Summary',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color(0xFF00BE78),
              ),
            ),
            Divider(
              height: 24,
            ),
            ListTile(
              dense: true,
              title: Text(
                'Cart Total',
                style: TextStyle(fontSize: 12),
              ),
              trailing: Text(
                'EGP ${total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 12),
              ),
            ),
            ListTile(
              dense: true,
              title: Text(
                'Delivery Fee',
                style: TextStyle(fontSize: 12),
              ),
              trailing: Text(
                'EGP ${getDeliveryFee().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 12),
              ),
            ),
            ListTile(
              dense: true,
              title: Text('Amount To Pay', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              trailing: Text('EGP ${getAmountToPay().toStringAsFixed(2)}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            ),
            SizedBox(height: 20),
            // Checkout Button
            Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 1,
                      blurRadius: 8, // حجم الظل
                      offset: const Offset(4, 8), // تحريك الظل
                    ),
                  ],
                  borderRadius: BorderRadius.circular(18),
                ),
                child: ElevatedButton(
                  onPressed: cart.isNotEmpty ? setOrder : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF00BE78),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    fixedSize: Size(329, 55),
                  ),
                  child: Text('Checkout', style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
