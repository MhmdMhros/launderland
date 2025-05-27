import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:launder_land/models/paymob_meta_model/paymob_meta_model.dart';
import 'package:launder_land/screens/payment/payment_webview.dart';
import 'package:launder_land/utils/operations.dart';
import 'package:launder_land/widgets/custom_text_field.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class AddMoneyScreen extends StatefulWidget {
  const AddMoneyScreen({super.key, required this.walletBalance});
  final int walletBalance;

  @override
  State<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
  final formKey = GlobalKey<FormState>();
  final FocusNode amountFocusNode = FocusNode();
  final TextEditingController amountController = TextEditingController();

  void addAmount() {
    if (formKey.currentState?.validate() == true) {
      formKey.currentState?.save();
      Operations().deposit(amount: amountController.text, context: context).then(
        (walletDeposit) {
          if (walletDeposit != null) {
            final int amount = walletDeposit.amount!;
            Operations()
                .paymob(
                    paymentId: walletDeposit.id.toString(),
                    paymobMeta: PaymobMetaModel(
                      amount_cents: amount * 100,
                      currency: 'EGP',
                      delivery_needed: 'false',
                      merchant_order_id: walletDeposit.id,
                      type: 'Charge',
                      items: [
                        Items(
                          amount_cents: amount * 100,
                          description: 'Wallet Recharge - $amount',
                          name: 'Wallet Recharge - $amount',
                          quantity: '1',
                        )
                      ],
                    ).toJson())
                .then(
              (url) {
                log(url);
                if (mounted) {
                  pushScreenWithoutNavBar(context, PaymentWebview(url: url));
                }
              },
            );
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text('Add Money'.tr(), style: const TextStyle(color: Colors.black)),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Available Balance',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/ewallet.png', width: 24, height: 24),
                      const SizedBox(width: 8),
                      Text('EGP ${widget.walletBalance.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: addAmount,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                        0xFF21295A,
                      ),
                    ),
                    child: const Text('Add Money', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: formKey,
              child: CustomTextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.singleLineFormatter
                ],
                validator: (value) {
                  if (value!.isEmpty || value == '0') {
                    return 'Please enter a valid amount';
                  } else {
                    return null;
                  }
                },
                label: 'Enter Amount',
                focusNode: amountFocusNode,
                controller: amountController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
