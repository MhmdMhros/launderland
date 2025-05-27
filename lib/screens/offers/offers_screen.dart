import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:launder_land/utils/operations.dart';
import 'package:launder_land/widgets/loading.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  List? offers;

  void getOffers() async {
    Operations().getOffers().then((value) {
      if (mounted) setState(() => offers = value);
    });
  }

  @override
  void initState() {
    super.initState();
    getOffers();
  }

  @override
  Widget build(BuildContext context) {
    return offers == null
        ? const Scaffold(body: Loading(image: 'assets/images/empty_orders.png'))
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                'offers'.tr(),
                style: const TextStyle(color: Color(0xFF222a59)),
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'tap_to_copy'.tr(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: const Color(0xFF222a59)),
                  ),
                ),
              ],
              titleSpacing: 20,
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Color(0xFF222a59)),
              elevation: 0,
            ),
            body: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 56),
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              child: offers!.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(child: SizedBox.shrink()),
                        Image.asset(
                          'assets/images/empty_offers.png',
                          height: 110,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'no currently offers available'.tr(),
                          style: const TextStyle(color: Color(0xFF222a59)), 
                        ),
                        const Expanded(child: SizedBox.shrink())
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
          );
  }
}