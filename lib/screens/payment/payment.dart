import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:launder_land/Providers/cart_provider/cart_provider.dart';
import 'dart:developer' as dev show log;
import 'package:launder_land/Providers/order_provider/order_provider.dart';
import 'package:launder_land/models/payment_methods_model/payment_methods_model.dart';
import 'package:launder_land/models/paymob_meta_model/paymob_meta_model.dart';
import 'package:launder_land/screens/cart/order_placed_screen.dart';
import 'package:launder_land/screens/payment/payment_webview.dart';
import 'package:launder_land/screens/profile/wallet/wallet_screen.dart';
import 'package:launder_land/utils/operations.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class PaymentPage extends ConsumerStatefulWidget {
  const PaymentPage({super.key, required this.amountToPay, this.isAddMoney = false, required this.carts});

  final double amountToPay;
  final bool isAddMoney;
  final List<CartModel> carts;

  @override
  ConsumerState<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends ConsumerState<PaymentPage> {
  List<PaymentMethodsModel>? paymentMethods;
  PaymentMethodsModel? selectedPaymentMethod;

  TextEditingController couponController = TextEditingController();
  String errorMessage = '';
  String validationMessage = '';
  Color messageColor = Colors.transparent;
  int walletBalance = 0;
  bool useWalletCredit = false;

  void getWalletBalance() async {
    Operations().getWalletBalance().then((balance) {
      if (mounted) {
        setState(() {
          walletBalance = balance!;
        });
      }
    });
  }

  void getPaymentMethods() async {
    await Operations().getPaymentMethods().then(
      (value) {
        setState(() {
          ref.read(orderProvider.notifier).setPaymentMethod(value!.first);
          paymentMethods = value;
          paymentMethods!.remove(paymentMethods!.firstWhere(
            (element) => element.slug == 'wallet',
          ));
          selectedPaymentMethod = paymentMethods!.first;
        });
      },
    );
  }

  void validateCouponCode(String code) {
    if (code == "DISCOUNT2025") {
      setState(() {
        validationMessage = "Coupon code is valid!";
        messageColor = Colors.green;
      });
    } else {
      setState(() {
        validationMessage = "Invalid coupon code!";
        errorMessage = "Invalid coupon code!";
        messageColor = Colors.red;
      });
    }
  }

  void handleAddMoney() {
    pushScreen(
      context,
      screen: const WalletScreen(),
      withNavBar: false,
    );
  }

  @override
  void initState() {
    super.initState();
    getPaymentMethods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Payment Options'.tr(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (paymentMethods != null && paymentMethods!.isNotEmpty)
              ...paymentMethods!.map(
                (e) {
                  return _buildPaymentOption(
                      e,
                      e.slug == 'cod' ? 'assets/icons/pngMoney.png' : 'assets/icons/pngCreditCard.png',
                      selectedPaymentMethod == e);
                },
              ),
            const SizedBox(height: 5),
            _buildWalletOption(),
            const SizedBox(height: 16),
            _buildCouponSection(),
            const SizedBox(height: 16),
            _buildPaymentSummary(),
            const SizedBox(height: 16),
            _buildConfirmButton(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(PaymentMethodsModel paymentMethod, String image, bool isSelected) {
    final isSelectedMethod = selectedPaymentMethod == paymentMethod;

    return InkWell(
      onTap: () {
        setState(() {
          selectedPaymentMethod = paymentMethod;
          ref.read(orderProvider.notifier).setPaymentMethod(paymentMethod);
        });
      },
      child: ListTile(
        tileColor: Colors.white,
        leading: Image.asset(
          image,
        ),
        title: Text(
          paymentMethod.title!,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        trailing: Container(
          decoration: !isSelectedMethod
              ? BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ],
                )
              : null,
          child: SvgPicture.asset(
            isSelectedMethod ? 'assets/icons/checked_radio.svg' : 'assets/icons/unchecked_radio.svg',
          ),
        ),
      ),
    );
  }

  Widget _buildWalletOption() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                Image.asset(
                  'assets/icons/pngWallet.png',
                ),
                SizedBox(
                  width: 20,
                ),
                // Text
                const Text(
                  'Use Wallet Credit',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            // Switch
            Switch(
              value: useWalletCredit,
              onChanged: (value) {
                setState(() {
                  useWalletCredit = value;
                });
              },
              activeColor: const Color(0xFF00BE78),
              inactiveTrackColor: Colors.grey[300],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white, // يمكنك تخصيص لون الخلفية هنا
            borderRadius: BorderRadius.circular(12), // إضافة زوايا دائرية
            border: Border.all(
              color: Colors.grey, // لون الحدود
              width: 1.5, // سمك الحدود
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Available Balance',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'EGP ${walletBalance.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  Container(
                    width: 90, // تحديد العرض
                    height: 25, // تحديد الارتفاع
                    decoration: BoxDecoration(
                      color: const Color(0xFF21295A), // تحديد اللون الخلفي
                      borderRadius: BorderRadius.circular(12), // تحديد الزوايا الدائرية
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextButton(
                        onPressed: handleAddMoney,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // إزالة الحشوة الافتراضية
                        ),
                        child: const Text(
                          'ADD MONEY',
                          style: TextStyle(
                            fontSize: 12, // تغيير حجم النص إذا لزم الأمر
                            color: Colors.white, // تحديد لون النص
                            fontWeight: FontWeight.w400, // تحديد وزن الخط
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _buildCouponSection() {
    return TextField(
      controller: couponController,
      decoration: InputDecoration(
        hintText: 'Coupon Code',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: TextButton(
            onPressed: () {
              // ضع هنا الكود لتطبيق القسيمة
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size(0, 0),
            ),
            child: const Text(
              'Apply',
              style: TextStyle(color: Color(0xFF21295A)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment Summary',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF21295A),
          ),
        ),
        const SizedBox(height: 8),
        _buildSummaryRow('Cart Total', 'EGP ${cartTotal.toStringAsFixed(2)}', Colors.black),
        _buildSummaryRow('Discount', 'EGP ${discountTotal.toStringAsFixed(2)}', Colors.orange),
        _buildSummaryRow('Delivery Fee', 'EGP ${deliveryFee.toStringAsFixed(2)}', Colors.black),
        _buildSummaryRow('Value Added Tax 14%', 'EGP ${tax.toStringAsFixed(2)}', Colors.black),
        _buildSummaryRow('Total', 'EGP ${total.toStringAsFixed(2)}', Colors.black, isBold: true),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value, Color color, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: color,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: color,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  double get cartTotal => widget.carts.fold(
        0.0,
        (sum, cart) => sum + cart.variants.fold(0.0, (variantSum, v) => variantSum + v.price) * cart.quantity,
      );

  double get discountTotal => widget.carts.fold(
        0.0,
        (sum, cart) => sum + cart.discount * cart.quantity,
      );

  double get deliveryFee => 25.0;
  double get tax => (cartTotal - discountTotal) * 0.14;

  double get total => cartTotal - discountTotal + deliveryFee + tax;

  Widget _buildConfirmButton() {
    return Center(
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
          onPressed: () {
            dev.log('${ref.watch(orderProvider)}');
            Operations().postOrder(ref.watch(orderProvider).toJson(), context).then(
              (value) {
                dev.log('$value');
                if (value != null) {
                  if (selectedPaymentMethod!.slug == 'cod') {
                    if (context.mounted) {
                      ref.read(cartNotifierProvider.notifier).clearCart();
                      ref.read(orderProvider.notifier).clearOrder();
                      if (mounted) {
                        // pushReplacementWithoutNavBar(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const OrderPlacedScreen()));

                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          backgroundColor: Colors.white,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.4, // Set height to 35% of the screen
                              width: double.infinity,
                              child: const OrderPlacedScreen(), // Place your OrderPlacedScreen here
                            );
                          },
                        );
                      }
                    }
                  } else if (selectedPaymentMethod!.slug == 'paymob') {
                    Operations()
                        .paymob(
                            paymentId: value.order!.payment!.id.toString(),
                            paymobMeta: PaymobMetaModel(
                              amount_cents: widget.amountToPay.toInt() * 100,
                              currency: 'EGP',
                              delivery_needed: 'false',
                              merchant_order_id: value.order!.payment!.id,
                              type: 'Charge',
                              items: [
                                Items(
                                  amount_cents: widget.amountToPay.toInt() * 100,
                                  description: 'Wallet Recharge - ${widget.amountToPay.toInt()}',
                                  name: 'Wallet Recharge - ${widget.amountToPay.toInt()}',
                                  quantity: '1',
                                )
                              ],
                            ).toJson())
                        .then(
                      (url) {
                        dev.log(url);
                        if (mounted) {
                          pushScreenWithoutNavBar(context, PaymentWebview(url: url));
                        }
                      },
                    );
                  }
                } else {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error placing order')));
                  }
                }
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF00BE78),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            padding: EdgeInsets.symmetric(vertical: 16),
            fixedSize: Size(329, 55),
          ),
          child: const Text('Confirm Order', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
